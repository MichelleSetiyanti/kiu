<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PenjualanManualController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index()
  {
    $konsumens = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->where('aktif', '=', 'Active')
      ->get();

    return view('apps.penjualan.penjualan-manual.index', ['konsumens' => $konsumens]);
  }

  public function store(Request $request)
  {

    parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

    DB::beginTransaction();

    try {
      $month = \Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggal)->format('m');
      $year = \Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggal)->format('Y');
      $invoices = DB::table('penjualans')->select(DB::raw('max(substr(kode,-4)) as nomor_max'))->where(DB::raw('MONTH(tanggal)'), $month)->where(DB::raw('YEAR(tanggal)'), $year)->where('kode', 'like', 'SO%')->get();

      $kodetransaksi = "SO" . substr($year, -2) . $month . "-" . Auth::id() . "-" . str_pad((int)$invoices[0]->nomor_max + 1, 4, "0", STR_PAD_LEFT);

      DB::table('penjualans')->insert([
        'kode' => $kodetransaksi,
        'tipe_penjualan' => 'Manual',
        'kategori' => 'Umum',
        'id_konsumens' => $data['konsumen'],
        'keterangan' => $data['keterangan'],
        'pembayaran' => $data['pembayaran'],
        'status' => 'Belum Selesai',
        "tanggal" =>  $request->tanggal,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function requestdatapenjualan(Request $request)
  {
    $penjualans = DB::table('penjualans')->whereBetween('status', ['Belum Selesai', 'Menunggu Pembayaran'])->where('tipe_penjualan', 'Manual')->orderBy('created_at', 'desc')->get();

    if ($penjualans->count()) {
      $data = "";

      foreach ($penjualans as $penjualan) {
        $encrypt = Crypt::encrypt($penjualan->id);

        $konsumen = DB::table('konsumens')->where('id', $penjualan->id_konsumens)->first();

        if ($penjualan->catatan_nama != "-" and $penjualan->catatan_nama != "") {
          $catatannama = " (" . $penjualan->catatan_nama . ")";
        } else {
          $catatannama = "";
        }

        $data .= '<div class="col-md-6 col-12" onclick="window.open(\'/penjualan/penjualan-manual/detil/' . $encrypt . '\',\'_self\')">' .
          '<div class="card-detail">' .
          '<div class="card-header">' .
          '<h2 class="card-title col-md-12 text-center">' . $konsumen->nama . '</h2>' .
          '</div>' .
          '<div class="card-content">' .
          '<div class="card-body">' .
          '<div class="row">' .
          '<div class="col-md-4 pb-2">' .
          '<img src="' . $request->linkgambar . '" width="80%" style="margin-left:10%;" />' .
          '</div>' .
          '<div class="col-md-8">' .
          '<div class="browser-info">' .
          '<b>No SO :</b> ' . $penjualan->kode . ' <br />' .
          '<b>Tgl SO : </b> ' . \Carbon\Carbon::createFromFormat('Y-m-d', $penjualan->tanggal)->isoFormat('D-M-Y') . ' <br />' .
          '</div>' .
          '</div>' .
          '<div class="col-md-12">' .
          '<textarea class="form-control mb-2" rows="2" placeholder="Keterangan" disabled>' . $penjualan->keterangan . '</textarea>' .
          '<table class="table-detil">' .
          '<thead>' .
          '<tr>' .
          '<th>Kode</th>' .
          '<th>Barang</th>' .
          '<th>Jumlah</th>' .
          '<th>Harga</th>' .
          '<th>Subtotal</th>' .
          '</tr>' .
          '</thead>' .
          '<tbody>';

        $penjualan_details = DB::table('penjualan_details')
          ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
          ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang')
          ->where('penjualan_details.id_penjualans', $penjualan->id)
          ->orderBy('penjualan_details.created_at', 'asc')->get();

        foreach ($penjualan_details as $penjualandetail) {
          $data .= '<tr>' .
            '<td> ' . $penjualandetail->kodebarang . ' </td>' .
            '<td> ' . $penjualandetail->namabarang . ' </td>' .
            '<td> ' . number_format($penjualandetail->total_jual, 0, ',', '.') . ' </td>' .
            '<td> ' . number_format($penjualandetail->harga, 0, ',', '.') . ' </td>' .
            '<td> ' . number_format($penjualandetail->subtotal, 0, ',', '.') . ' </td>' .
            '</tr>';
        }

        $data .= '</tbody>' .
          '</table>' .
          '</div>' .
          '</div>' .
          '</div>' .
          '</div>' .
          '</div>' .
          '</div>';
      }

      return $data;
    } else {
      return 'gak ada';
    }
  }

  public function index_detil($param)
  {
    $id = Crypt::decrypt($param);

    $penjualan = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where('penjualans.id', '=', $id)
      ->orderBy('created_at', 'desc')
      ->first();

    $produks = DB::table('barangs')
      ->orderBy('kode', 'asc')->get();

    if ($penjualan->pembayaran == "Cash") {
      $akuns = DB::table('akuns')->where('kategori', 'Kas & Bank')->get();
    } else {
      $akuns = DB::table('akuns')->where('kategori', 'Piutang Usaha')->get();
    }

    $konsumens = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->where('aktif', '=', 'Active')
      ->get();

    return view('apps.penjualan.penjualan-manual.detil', ['penjualan' => $penjualan, 'produks' => $produks, 'akuns' => $akuns, 'konsumens' => $konsumens]);
  }

  public function update_konsumen(Request $request)
  {

    DB::beginTransaction();

    try {

      DB::table('penjualans')->where('id', $request->idpenjualan)->update([
        'id_konsumens' => $request->konsumen,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function update_tanggal(Request $request)
  {

    DB::beginTransaction();

    try {

      DB::table('penjualans')->where('id', $request->idpenjualan)->update([
        'tanggal' => $request->tanggal,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function historyharga(Request $request)
  {
    $penjualans = DB::table('penjualan_details')
      ->join('penjualans', 'penjualan_details.id_penjualans', '=', 'penjualans.id')
      ->select('penjualan_details.*', 'penjualans.kode as kodepenjualan', 'penjualans.tanggal as tanggalpenjualan')
      ->where('penjualan_details.id_barangs', $request->idbarang)
      ->where('penjualans.id_konsumens', $request->konsumen)
      ->where('penjualans.status', 'Selesai')
      ->orderBy('penjualan_details.created_at', 'desc')
      ->get();
    return datatables()::of($penjualans)
      ->addIndexColumn()
      ->make(true);
  }

  public function listdetil(Request $request)
  {
    $penjualans = DB::table('penjualan_details')
      ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
      ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang')
      ->where('penjualan_details.id_penjualans', $request->id)
      ->orderBy('penjualan_details.created_at', 'asc')
      ->get();
    return datatables()::of($penjualans)
      ->addColumn('action', function ($penjualans) {
        $class = "";
        $class2 = "hidden";

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_edittemp(' . $penjualans->id . ')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap" onclick="f_deletetemp(' . $penjualans->id . ')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function store_detil_invoice(Request $request)
  {

    DB::beginTransaction();

    try {

      $produk = $request->produk;


      $stock = DB::table('barangs')->where('id', $produk)->value('stok');

      $subtotal = $request->totaljual * ($request->harga - $request->diskon - $request->diskonpaket - $request->diskonextra);

      if ($stock >= $request->totaljual) {
        $idtabel = DB::table('penjualan_details')->insertGetId([
          'id_penjualans' => $request->idpenjualan,
          'id_barangs' => $request->produk,
          'catatan' => $request->catatan,
          'harga' => $request->harga,
          'total_jual' => $request->totaljual,
          'diskon' => $request->diskon,
          'diskon_paket' => $request->diskonpaket,
          'diskon_extra' => $request->diskonextra,
          'subtotal' => $subtotal,
          "created_at" =>  \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $barang = DB::table('barangs')->where('id', $produk)->first();
        $stoklama = $barang->stok;
        $stokbaru = $stoklama - $request->totaljual;


        DB::table('barangs')->where('id', $produk)->update([
          'stok' => $stokbaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);

        DB::commit();

        return $idtabel;
      } else {

        return 'stockhabis';

        // DB::table('penjualan_details')->insertGetId([
        //   'id_penjualans' => $request->idpenjualan,
        //   'id_barangs' => $request->produk,
        //   'catatan' => $request->catatan,
        //   'harga' => $request->harga,
        //   'total_jual' => $request->totaljual,
        //   'diskon' => $request->diskon,
        //   'diskon_paket' => $request->diskonpaket,
        //   'diskon_extra' => $request->diskonextra,
        //   'subtotal' => $subtotal,
        //   "created_at" =>  \Carbon\Carbon::now(),
        //   "updated_at" => \Carbon\Carbon::now()
        // ]);

        // DB::commit();

      }
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function store_detil(Request $request)
  {

    DB::beginTransaction();

    try {

      $produk = $request->produk;


      $stock = DB::table('barangs')->where('id', $produk)->value('stok');

      $subtotal = $request->totaljual * ($request->harga - $request->diskon - $request->diskonpaket - $request->diskonextra);

      if ($stock > $request->totaljual) {
        $idtabel = DB::table('penjualan_details')->insertGetId([
          'id_penjualans' => $request->idpenjualan,
          'id_barangs' => $request->produk,
          'catatan' => $request->catatan,
          'harga' => $request->harga,
          'total_jual' => $request->totaljual,
          'diskon' => $request->diskon,
          'diskon_paket' => $request->diskonpaket,
          'diskon_extra' => $request->diskonextra,
          'subtotal' => $subtotal,
          "created_at" =>  \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        DB::commit();

        return $idtabel;
      } else {

        DB::table('penjualan_details')->insertGetId([
          'id_penjualans' => $request->idpenjualan,
          'id_barangs' => $request->produk,
          'catatan' => $request->catatan,
          'harga' => $request->harga,
          'total_jual' => $request->totaljual,
          'diskon' => $request->diskon,
          'diskon_paket' => $request->diskonpaket,
          'diskon_extra' => $request->diskonextra,
          'subtotal' => $subtotal,
          "created_at" =>  \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        DB::commit();

        return 'stockhabis';
      }
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function update_detil_invoice(Request $request)
  {

    DB::beginTransaction();
    try {

      $subtotal = $request->totaljual * ($request->harga - $request->diskon - $request->diskonpaket - $request->diskonextra);

      $penjualan_detil = DB::table('penjualan_details')->where('id', $request->id_temp)->first();
      $totaljuallama = $penjualan_detil->total_jual;
      $idbarang = $penjualan_detil->id_barangs;

      $barang = DB::table('barangs')->where('id', $idbarang)->first();
      $stoklama = $barang->stok;
      $stokbaru = $stoklama + $totaljuallama - $request->totaljual;

      if ($stokbaru < 0) {
        return "stockhabis";
      }

      DB::table('penjualan_details')->where('id', $request->id_temp)->update([
        'catatan' => $request->catatan,
        'harga' => $request->harga,
        'total_jual' => $request->totaljual,
        'diskon' => $request->diskon,
        'diskon_paket' => $request->diskonpaket,
        'diskon_extra' => $request->diskonextra,
        'subtotal' => $subtotal,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::table('barangs')->where('id', $idbarang)->update([
        'stok' => $stokbaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);


      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function update_detil(Request $request)
  {
    DB::beginTransaction();
    try {

      $subtotal = $request->totaljual * ($request->harga - $request->diskon - $request->diskonpaket - $request->diskonextra);

      DB::table('penjualan_details')->where('id', $request->id_temp)->update([
        'catatan' => $request->catatan,
        'harga' => $request->harga,
        'total_jual' => $request->totaljual,
        'diskon' => $request->diskon,
        'diskon_paket' => $request->diskonpaket,
        'diskon_extra' => $request->diskonextra,
        'subtotal' => $subtotal,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function requestdata_detil(Request $request)
  {
    $temp = DB::table('penjualan_details')
      ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
      ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang')
      ->where('penjualan_details.id', $request->id_temp)->get();

    if ($temp->count()) {
      return 'ada|' . $temp[0]->kodebarang . "|" . $temp[0]->namabarang . "|" . $temp[0]->total_jual . "|" . $temp[0]->harga . "|" . $temp[0]->diskon . "|" . $temp[0]->diskon_paket . "|" . $temp[0]->diskon_extra . "|" . $temp[0]->catatan;
    } else {
      return 'gak ada|';
    }
  }

  public function requesttotal_detil(Request $request)
  {
    $temp = DB::table('penjualan_details')->select(DB::raw('sum(subtotal) as nominal_total'))->where('id_penjualans', $request->idpenjualan)->get();

    if ($temp->count()) {
      return 'ada|' . $temp[0]->nominal_total;
    } else {
      return 'gak ada|';
    }
  }

  public function drop_detil_invoice(Request $request)
  {
    DB::beginTransaction();

    try {

      $penjualan_detil = DB::table('penjualan_details')->where('id', $request->id)->first();
      $totaljual = $penjualan_detil->total_jual;
      $idbarang = $penjualan_detil->id_barangs;

      $barang = DB::table('barangs')->where('id', $idbarang)->first();
      $stoklama = $barang->stok;
      $stokbaru = $stoklama + $totaljual;

      DB::table('barangs')->where('id', $idbarang)->update([
        'stok' => $stokbaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::table('penjualan_details')->where('id', $request->id)->delete();

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }
  public function drop_detil(Request $request)
  {
    DB::beginTransaction();

    try {

      DB::table('penjualan_details')->where('id', $request->id)->delete();

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }
  public function proses_detil(Request $request)
  {
    DB::beginTransaction();

    try {

      $sisa = 0;

      if ($request->pembayaran == "Credit") {
        $sisa = $request->totalakhir - $request->downpayment;
      }

      DB::table('penjualans')->where('id', $request->idpenjualan)->update([
        'biaya_tambahan' => $request->biayatambahan,
        'subtotal' => $request->subtotal,
        'diskon' => $request->diskon,
        'pajak' => $request->pajak,
        'grandtotal' => $request->totalakhir,
        'kode_akun' => $request->akunpembayaran,
        'keterangan' => $request->keterangan,
        'status' => $request->action,
        'dp' => $request->downpayment,
        'sisa' => $sisa,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function index_list()
  {
    $konsumens = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->where('aktif', '=', 'Active')
      ->get();

    return view('apps.penjualan.penjualan-manual.list-penjualan', ['konsumens' => $konsumens]);
  }

  public function list_datapenjualan(Request $request)
  {
    $penjualans = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where(function ($query) use ($request) {

        if ($request->client != "All") {
          $query->where('penjualans.id_konsumens', '=', $request->client);
        }

        $query->where('penjualans.tipe_penjualan', '=', 'Manual');
        $query->where('penjualans.status', '=', 'Selesai');
      })
      ->orderBy('updated_at', 'desc')
      ->get();
    return datatables()::of($penjualans)
      ->addColumn('action', function ($penjualans) {
        $encrypt = Crypt::encrypt($penjualans->id);

        $classedit = "";
        $classhapus = "";
        $class2 = "";
        $class3 = "";

        if ($penjualans->kode_inv != "" || $penjualans->kode_sj != "") {
          $classedit = "hidden";
          $classhapus = "hidden";
        }

        if (Auth::user()->status == "Staff" || Auth::user()->status == "Kasir") {
          if ($penjualans->akses_edit == "Y") {
            $classedit = "";
          }
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_datadetil(' . $penjualans->id . ')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Detil Penjualan"></i></span>
            <span class="fonticon-wrap ' . $classedit . '" onclick="window.open(\'/penjualan/penjualan-manual/edit-detil/' . $encrypt . '\',\'_blank\')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Sales Order"></i></span>
            <span class="fonticon-wrap ' . $classhapus . '" onclick="f_delete(' . $penjualans->id . ')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
          </div>
        ';

        //        return '
        //          <div class="fonticon-container">
        //            <span class="fonticon-wrap" onclick="f_datadetil(' . $penjualans->id . ')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Detil Penjualan"></i></span>
        //            <span class="fonticon-wrap" onclick="window.open(\'/penjualan/print-data/' . $encrypt . '\',\'_blank\')"><i class="feather icon-printer" data-toggle="tooltip" title="Cetak Penjualan"></i></span>
        //            <span class="fonticon-wrap" onclick="window.open(\'/penjualan/print-surat-jalan/' . $encrypt . '\',\'_blank\')"><i class="feather icon-file-text" data-toggle="tooltip" title="Cetak Surat Jalan"></i></span>
        //            <span class="fonticon-wrap '.$class3.'" onclick="f_aksesedit(' . $penjualans->id . ')"><i class="feather icon-upload" data-toggle="tooltip" title="Berikan Staff Akses Edit"></i></span>
        //            <span class="fonticon-wrap '.$class2.'" onclick="window.open(\'/penjualan/penjualan-manual/edit-detil/' . $encrypt . '\',\'_blank\')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Sales Order"></i></span>
        //            <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$penjualans->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
        //          </div>
        //        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function drop_penjualan(Request $request)
  {
    DB::beginTransaction();

    try {
      $penjualanlama = DB::table('penjualans')->where('id', $request->id)->first();

      // insert trash penjualan
      $idtrash = DB::table('trash_penjualans')->insertGetId([
        'id_users' => Auth::User()->id,
        'id_konsumens' => $penjualanlama->id_konsumens,
        'tipe_penjualan' => $penjualanlama->tipe_penjualan,
        'kode_akun' => $penjualanlama->kode_akun,
        'kode' => $penjualanlama->kode,
        'kode_sj' => $penjualanlama->kode_sj,
        'kode_inv' => $penjualanlama->kode_inv,
        'kategori' => $penjualanlama->kategori,
        'tanggal' => $penjualanlama->tanggal,
        'pembayaran' => $penjualanlama->pembayaran,
        'jatuh_tempo' => $penjualanlama->jatuh_tempo,
        'keterangan' => $penjualanlama->keterangan,
        'catatan_nama' => $penjualanlama->catatan_nama,
        'biaya_tambahan' => $penjualanlama->biaya_tambahan,
        'subtotal' => $penjualanlama->subtotal,
        'diskon' => $penjualanlama->diskon,
        'pajak' => $penjualanlama->pajak,
        'grandtotal' => $penjualanlama->grandtotal,
        'status' => $penjualanlama->status,
        'sisa' => $penjualanlama->sisa,
        'termin' => $penjualanlama->termin,
        "created_at" => \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now(),
        'akses_edit' => $penjualanlama->akses_edit
      ]);

      // trash jual detil
      $penjualandetils = DB::table('penjualan_details')->where('id_penjualans', $request->id)->get();
      foreach ($penjualandetils as $penjualandetil) {

        $totaljual = $penjualandetil->total_jual;

        if ($penjualanlama->kode_sj != "") {

          $barang = DB::table('barangs')->where('id', $penjualandetil->id_barangs)->first();

          $stoklama = $barang->stok;

          $stokbaru = $stoklama + $totaljual;

          DB::table('barangs')->where('id', $penjualandetil->id_barangs)->update([
            'stok' => $stokbaru,
            "updated_at" => \Carbon\Carbon::now()
          ]);
        }

        // insert trash detil penjualan

        DB::table('trash_penjualan_details')->insert([
          "id_penjualans" => $idtrash,
          'id_barangs' => $penjualandetil->id_barangs,
          'total_jual' => $penjualandetil->total_jual,
          'harga' => $penjualandetil->harga,
          'diskon' => $penjualandetil->diskon,
          'diskon_paket' => $penjualandetil->diskon_paket,
          'diskon_extra' => $penjualandetil->diskon_extra,
          'subtotal' => $penjualandetil->subtotal,
          'catatan' => $penjualandetil->catatan,
          'aktif' => $penjualandetil->aktif,
          "created_at" => \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      // hapus data penjualan
      DB::table('penjualan_details')->where('id_penjualans', $request->id)->delete();
      DB::table('penjualans')->where('id', $request->id)->delete();

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function index_edit_detil($param)
  {
    $id = Crypt::decrypt($param);

    $penjualan = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where('penjualans.id', '=', $id)
      ->orderBy('created_at', 'desc')
      ->first();

    $produks = DB::table('barangs')
      ->orderBy('kode', 'asc')->get();

    if ($penjualan->pembayaran == "Cash") {
      $akuns = DB::table('akuns')->where('kategori', 'Kas & Bank')->get();
    } else {
      $akuns = DB::table('akuns')->where('kategori', 'Piutang Usaha')->get();
    }

    $konsumens = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->where('aktif', '=', 'Active')
      ->get();

    return view('apps.penjualan.penjualan-manual.edit-detil', ['penjualan' => $penjualan, 'produks' => $produks, 'akuns' => $akuns, 'konsumens' => $konsumens]);
  }

  public function proses_edit_detil(Request $request)
  {
    DB::beginTransaction();

    try {

      $sisa = 0;

      if ($request->pembayaran == "Credit") {

        $sisa = $request->totalakhir - $request->downpayment;
      }

      DB::table('penjualans')->where('id', $request->idpenjualan)->update([
        'biaya_tambahan' => $request->biayatambahan,
        'subtotal' => $request->subtotal,
        'diskon' => $request->diskon,
        'pajak' => $request->pajak,
        'grandtotal' => $request->totalakhir,
        'keterangan' => $request->keterangan,
        'dp' => $request->downpayment,
        'akses_edit' => 'N',
        'sisa' => $sisa,
        'kode_akun' => $request->akunpembayaran,
        'status' => $request->action,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function index_edit_invoice($param)
  {
    $id = Crypt::decrypt($param);
    // dd($id);

    $penjualan = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where('penjualans.id', '=', $id)
      ->orderBy('created_at', 'desc')
      ->first();

    $produks = DB::table('barangs')
      ->orderBy('kode', 'asc')->get();

    if ($penjualan->pembayaran == "Cash") {
      $akuns = DB::table('akuns')->where('kategori', 'Kas & Bank')->get();
    } else {
      $akuns = DB::table('akuns')->where('kategori', 'Piutang Usaha')->get();
    }

    $konsumens = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->where('aktif', '=', 'Active')
      ->get();

    // dd($penjualan, $produks, $akuns, $konsumens);
    if ($penjualan->tanggal_sj == null || $penjualan->kode_sj == null) {
      return back()->with('failed', 'Surat jalan belum ada');
    }

    // return view('apps.penjualan.penjualan-manual.edit-detil', ['penjualan' => $penjualan, 'produks' => $produks, 'akuns' => $akuns, 'konsumens' => $konsumens]);
    return view('apps.penjualan.penjualan-manual.edit-invoice', ['penjualan' => $penjualan, 'produks' => $produks, 'akuns' => $akuns, 'konsumens' => $konsumens]);
  }

  public function proses_edit_invoice(Request $request)
  {
    DB::beginTransaction();

    try {

      $sisa = 0;

      if ($request->pembayaran == "Credit") {
        $getpenjualan = DB::table('penjualans')->where('id', $request->idpenjualan)->first();

        $sisalama = $getpenjualan->sisa;
        $grandtotallama = $getpenjualan->grandtotal;

        $terbayarlama = $grandtotallama - $sisalama;

        $sisa = $request->totalakhir - $terbayarlama;
      }

      DB::table('penjualans')->where('id', $request->idpenjualan)->update([
        'biaya_tambahan' => $request->biayatambahan,
        'subtotal' => $request->subtotal,
        'diskon' => $request->diskon,
        'pajak' => $request->pajak,
        'grandtotal' => $request->totalakhir,
        'keterangan' => $request->keterangan,
        'akses_edit' => 'N',
        'sisa' => $sisa,
        'kode_akun' => $request->akunpembayaran,
        'status' => $request->action,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      //      DB::table('penjualan_passwords')->where('id_penjualans',$request->idpenjualan)->delete();

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function print_data($param)
  {
    $id = Crypt::decrypt($param);

    $penjualans = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where('penjualans.id', $id)
      ->orderBy('created_at', 'desc')
      ->first();

    $penjualan_details = DB::table('penjualan_details')
      ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
      ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang')
      ->where('penjualan_details.id_penjualans', $penjualans->id)
      ->orderBy('penjualan_details.created_at', 'asc')->get();

    return view('apps.penjualan.print', ['penjualan' => $penjualans, 'penjualandetails' => $penjualan_details]);
  }

  public function print_surat_jalan($param)
  {
    $id = Crypt::decrypt($param);

    $penjualans = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where('penjualans.id', $id)
      ->orderBy('created_at', 'desc')
      ->first();

    $penjualan_details = DB::table('penjualan_details')
      ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
      ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang')
      ->where('penjualan_details.id_penjualans', $penjualans->id)
      ->orderBy('penjualan_details.created_at', 'asc')->get();

    return view('apps.penjualan.print-surat-jalan', ['penjualan' => $penjualans, 'penjualandetails' => $penjualan_details]);
  }


  public function index_password()
  {
    $penjualan = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where('penjualans.kode_inv', '!=', '')
      ->orderBy('created_at', 'desc')
      ->get();

    return view('apps.penjualan.penjualan-manual.generate-password', ['penjualans' => $penjualan]);
  }

  public function list_password(Request $request)
  {
    $penjualans = DB::table('penjualan_passwords')
      ->join('penjualans', 'penjualan_passwords.id_penjualans', '=', 'penjualans.id')
      ->select('penjualan_passwords.*', 'penjualans.kode_inv as kodepenjualan')
      ->orderBy('created_at', 'desc')
      ->get();
    return datatables()::of($penjualans)
      ->addColumn('action', function ($penjualans) {

        return '
            <div class="fonticon-container">
              <span class="fonticon-wrap" onclick="f_delete(' . $penjualans->id . ')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
            </div>
          ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function store_password(Request $request)
  {

    DB::beginTransaction();

    try {

      DB::table('penjualan_passwords')->where('id_penjualans', $request->idpenjualan)->delete();

      $characters = '23456789ABCDEFGHJKMNPQRSTUVWXYZ';
      $charactersLength = strlen($characters);
      $password = '';
      for ($i = 0; $i < 8; $i++) {
        $password .= $characters[random_int(0, $charactersLength - 1)];
      }

      DB::table('penjualan_passwords')->insert([
        'id_penjualans' => $request->idpenjualan,
        'password' => $password,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function drop_password(Request $request)
  {

    DB::beginTransaction();

    try {
      DB::table('penjualan_passwords')->where('id', $request->id)->delete();

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function cek_password(Request $request)
  {
    $temp = DB::table('penjualan_passwords')->where('id_penjualans', $request->idpenjualan)->where('password', $request->password)->get();

    if ($temp->count()) {
      DB::table('penjualan_passwords')->where('id_penjualans', $request->idpenjualan)->delete();

      return 'ada|';
    } else {
      return 'gak ada|';
    }
  }
}
