<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class InvoiceController extends Controller
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

    $penjualan = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where('penjualans.kode_inv', '!=', '')
      ->orderBy('created_at', 'desc')
      ->get();

    return view('apps.penjualan.invoice.index', ['konsumens' => $konsumens, 'penjualans' => $penjualan]);
  }

  public function list(Request $request)
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

        $keterangan = str_replace(["\r\n", "\r", "\n"], ' ', $penjualans->keterangan);
        $classedit = "hidden";
        $class = "";

        if ($penjualans->kode_inv != "") {
          $classedit = "";
        }

        if ($penjualans->pembayaran == "Credit") {
          $class = "hidden";


          if ($penjualans->sisa == "0") {
            $classedit = "hidden";
          }
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_datadetil(' . $penjualans->id . ')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Detil Penjualan"></i></span>
            <span class="fonticon-wrap" onclick="f_invoice(' . $penjualans->id . ', \'' . $encrypt . '\', \'' . $keterangan . '\', \'' . $penjualans->kode_inv . '\', \'' . $penjualans->pembayaran . '\' )"><i class="feather icon-printer" data-toggle="tooltip" title="Cetak Invoice"></i></span>
            <span class="fonticon-wrap" onclick="f_invoicesimple(' . $penjualans->id . ', \'' . $encrypt . '\', \'' . $penjualans->kode_inv . '\', \'' . $penjualans->pembayaran . '\' )"><i class="feather icon-inbox" data-toggle="tooltip" title="Cetak Faktur Simple"></i></span>
            <span class="fonticon-wrap ' . $class . '" onclick="f_kwitansi(' . $penjualans->id . ', \'' . $encrypt . '\', \'' . $penjualans->kode_inv . '\', \'' . $penjualans->pembayaran . '\' )"><i class="feather icon-file-text" data-toggle="tooltip" title="Cetak Kwitansi Cash"></i></span>
            <span class="fonticon-wrap ' . $classedit . '" onclick="f_editinvoice(' . $penjualans->id . ', \'' . $encrypt . '\')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data Invoice"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }
  public function store(Request $request)
  {


    DB::beginTransaction();

    try {
      $month = \Carbon\Carbon::now()->format('m');
      $year = \Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggal)->format('Y');

      $penjualanlama = DB::table('penjualans')->where('id', $request->idpenjualan)->first();

      if ($penjualanlama->pajak > 0) {
        // $invoices = DB::table('penjualans')->select('id')->where(DB::raw('YEAR(tanggal_inv)'), $year)->where('kode_inv','like','F-%')->where('pajak','!=','0')->get();

        // $countinvoice = $invoices->count();
        // $countinvoiceFinal = $countinvoice+1;

        // $kodetransaksi = "F-".substr($year,-2)."-".str_pad((int)$countinvoiceFinal,4,"0",STR_PAD_LEFT);
        $invoices = DB::table('penjualans')->select(DB::raw('max(substr(kode_inv,-4)) as nomor_max'))->where(DB::raw('YEAR(tanggal_inv)'), $year)->where('kode_inv', 'like', 'F-%')->get();

        $kode_inv_exists = isset($penjualanlama->kode_inv) ? substr($penjualanlama->kode_inv, -4) : null;
        if ($invoices->isEmpty() || $invoices[0]->nomor_max === null) {
          // Jika tidak ada nilai di database
          $kodetransaksi = "F-" . substr($year, -2) . "-0001";
        } else {
          $nomor_max = (int) $invoices[0]->nomor_max;
          if ((int) $invoices[0]->nomor_max == $kode_inv_exists) {
            $kodetransaksi = $kode_inv_exists;
            $kodetransaksi = "F-" . substr($year, -2) . "-" . str_pad($kodetransaksi, 4, "0", STR_PAD_LEFT);

          } else {
            $kodetransaksi = "F-" . substr($year, -2) . "-" . str_pad((int) $invoices[0]->nomor_max + 1, 4, "0", STR_PAD_LEFT);
          }
        }

      } else {
        $invoices = DB::table('penjualans')
          ->select(DB::raw('max(substr(kode_inv,-4)) as nomor_max'))
          ->where(DB::raw('YEAR(tanggal_inv)'), $year)
          ->where('kode_inv', 'like', 'FTS-%')
          ->get();

        $kode_inv_exists = isset($penjualanlama->kode_inv) ? substr($penjualanlama->kode_inv, -4) : null;

        if ($invoices->isEmpty() || $invoices[0]->nomor_max === null) {
          // Jika tidak ada nilai di database
          $kodetransaksi = "FTS-" . substr($year, -2) . "-0001";
        } else {
          $nomor_max = (int) $invoices[0]->nomor_max;
          if ($nomor_max == (int) $kode_inv_exists) {
            $kodetransaksi = "FTS-" . substr($year, -2) . "-" . str_pad($nomor_max, 4, "0", STR_PAD_LEFT);
          } else {
            $kodetransaksi = "FTS-" . substr($year, -2) . "-" . str_pad($nomor_max + 1, 4, "0", STR_PAD_LEFT);
          }
        }

      }


      if ($request->kodeinvoice != "Baru") {
        $kodetransaksi = $request->kodeinvoice;
      }
      DB::table('penjualans')->where('id', $request->idpenjualan)->update([
        'kode_inv' => $kodetransaksi,
        'tanggal_inv' => $request->tanggal,
        'alamat_inv' => $request->alamat,
        'keterangan' => $request->keterangan,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $penjualanlama = DB::table('penjualans')->where('id', $request->idpenjualan)->first();

      if ($penjualanlama->pembayaran == "Credit") {

        $jatuhtempo = \Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggal)->addDays($request->termin);

        DB::table('penjualans')->where('id', $request->idpenjualan)->update([
          'jatuh_tempo' => $jatuhtempo,
          'termin' => $request->termin,
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $konsumen = DB::table('konsumens')->where('id', $penjualanlama->id_konsumens)->first();

        $piutanglama = $konsumen->piutang;
        $piutangbaru = $piutanglama + $penjualanlama->grandtotal;

        DB::table('konsumens')->where('id', $penjualanlama->id_konsumens)->update([
          'piutang' => $piutangbaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);

      }

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function store_kas(Request $request)
  {


    DB::beginTransaction();

    $penjualanlama = DB::table('penjualans')->where('id', $request->idpenjualan)->first();
    try {
      $month = \Carbon\Carbon::now()->format('m');
      $year = \Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggal)->format('Y');

      $invoices = DB::table('penjualans')->select(DB::raw('max(substr(kode_inv,-4)) as nomor_max'))->where(DB::raw('YEAR(tanggal_inv)'), $year)->where('kode_inv', 'like', 'FCS-%')->get();
      $kode_inv_exists = isset($penjualanlama->kode_inv) ? substr($penjualanlama->kode_inv, -4) : null;

      if ($invoices->isEmpty() || $invoices[0]->nomor_max === null) {
        $kodetransaksi = "FCS-" . substr($year, -2) . "-0001";
      } else {
        $nomor_max = (int) $invoices[0]->nomor_max;
        if ((int) $invoices[0]->nomor_max == $kode_inv_exists) {
          $kodetransaksi = $kode_inv_exists;
          $kodetransaksi = "FCS-" . substr($year, -2) . "-" . str_pad($kodetransaksi, 4, "0", STR_PAD_LEFT);
        } else {
          $kodetransaksi = "FCS-" . substr($year, -2) . "-" . str_pad((int) $invoices[0]->nomor_max + 1, 4, "0", STR_PAD_LEFT);
        }
      }

      if ($request->kodeinvoice != "Baru") {
        $kodetransaksi = $request->kodeinvoice;
      }

      DB::table('penjualans')->where('id', $request->idpenjualan)->update([
        'kode_inv' => $kodetransaksi,
        'tanggal_inv' => $request->tanggal,
        'alamat_inv' => $request->alamat,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $penjualanlama = DB::table('penjualans')->where('id', $request->idpenjualan)->first();

      if ($penjualanlama->pembayaran == "Credit") {

        $jatuhtempo = \Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggal)->addDays($request->termin);

        DB::table('penjualans')->where('id', $request->idpenjualan)->update([
          'jatuh_tempo' => $jatuhtempo,
          'termin' => $request->termin,
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $konsumen = DB::table('konsumens')->where('id', $penjualanlama->id_konsumens)->first();

        $piutanglama = $konsumen->piutang;
        $piutangbaru = $piutanglama + $penjualanlama->grandtotal;

        DB::table('konsumens')->where('id', $penjualanlama->id_konsumens)->update([
          'piutang' => $piutangbaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);

      }

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }
  public function ceklimit(Request $request)
  {
    $penjualanlama = DB::table('penjualans')->where('id', $request->idpenjualan)->first();

    if ($penjualanlama->pembayaran == "Credit") {

      $konsumen = DB::table('konsumens')->where('id', $penjualanlama->id_konsumens)->first();

      $piutanglama = $konsumen->piutang;
      $piutangbaru = $piutanglama + $penjualanlama->grandtotal;

      if ($konsumen->limit_piutang >= $piutangbaru) {
        return 'bisa';
      } else {
        return 'tidak bisa';
      }
    } else {
      return 'bisa';
    }
  }

  public function print($param)
  {
    $id = Crypt::decrypt($param);

    $penjualan = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen', 'konsumens.alamat as alamatkonsumen', 'konsumens.no_hp as nohpkonsumen', 'konsumens.contact_person as cpkonsumen')
      ->where('penjualans.id', '=', $id)
      ->orderBy('created_at', 'desc')
      ->first();

    $penjualandetails = DB::table('penjualan_details')
      ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
      ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang', 'barangs.satuan as satuanbarang')
      ->where('id_penjualans', $id)
      ->orderBy('barangs.nama', 'asc')
      ->get();

    $countpenjualan = DB::table('penjualans')->where('kode_inv', $penjualan->kode_inv)->count();

    if ($countpenjualan > 1) {

      $penjualan = DB::table('penjualans')
        ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
        ->select('penjualans.*', 'konsumens.nama as namakonsumen', 'konsumens.alamat as alamatkonsumen', 'konsumens.no_hp as nohpkonsumen', 'konsumens.contact_person as cpkonsumen', DB::raw("SUM(penjualans.subtotal) as sumsubtotal"), DB::raw("SUM(penjualans.diskon) as sumdiskon"), DB::raw("SUM(penjualans.pajak) as sumpajak"), DB::raw("SUM(penjualans.dp) as sumdp"), DB::raw("SUM(penjualans.grandtotal) as sumgrandtotal"))
        ->where('penjualans.kode_inv', $penjualan->kode_inv)
        ->orderBy('created_at', 'desc')
        ->groupBy('penjualans.kode_inv')
        ->first();

      $penjualanterbaru = DB::table('penjualans')
        ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
        ->select('penjualans.*', 'konsumens.nama as namakonsumen', 'konsumens.alamat as alamatkonsumen', 'konsumens.no_hp as nohpkonsumen', 'konsumens.contact_person as cpkonsumen')
        ->where('penjualans.kode_inv', $penjualan->kode_inv)
        ->orderBy('tanggal_inv', 'desc')
        ->first();

      if ($penjualan->tanggal_inv == $penjualanterbaru->tanggal_inv) {
        $penjualanterbaru = DB::table('penjualans')
          ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
          ->select('penjualans.*', 'konsumens.nama as namakonsumen', 'konsumens.alamat as alamatkonsumen', 'konsumens.no_hp as nohpkonsumen', 'konsumens.contact_person as cpkonsumen')
          ->where('penjualans.kode_inv', $penjualan->kode_inv)
          ->orderBy('created_at', 'desc')
          ->first();
      }


      $penjualandetails = DB::table('penjualan_details')
        ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
        ->join('penjualans', 'penjualan_details.id_penjualans', 'penjualans.id')
        ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang', 'barangs.satuan as satuanbarang', DB::raw("SUM(penjualan_details.total_jual) as totaljual"))
        ->where('penjualans.kode_inv', $penjualan->kode_inv)
        ->orderBy('barangs.nama', 'asc')
        ->groupBy('penjualan_details.id_barangs')
        ->get();

      return view('apps.penjualan.print-banyak', ['penjualan' => $penjualan, 'penjualandetails' => $penjualandetails, 'penjualanterbaru' => $penjualanterbaru]);
    } else {
      return view('apps.penjualan.print', ['penjualan' => $penjualan, 'penjualandetails' => $penjualandetails]);
    }
  }

  public function print_simple($param)
  {
    $id = Crypt::decrypt($param);

    $penjualan = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen', 'konsumens.alamat as alamatkonsumen', 'konsumens.no_hp as nohpkonsumen', 'konsumens.contact_person as cpkonsumen')
      ->where('penjualans.id', '=', $id)
      ->orderBy('created_at', 'desc')
      ->first();

    $penjualandetails = DB::table('penjualan_details')
      ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
      ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang', 'barangs.satuan as satuanbarang')
      ->where('id_penjualans', $id)
      ->orderBy('barangs.nama', 'asc')
      ->get();

    return view('apps.penjualan.print-simple', ['penjualan' => $penjualan, 'penjualandetails' => $penjualandetails]);
  }

  public function print_kwitansi($param)
  {
    $id = Crypt::decrypt($param);

    $penjualan = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen', 'konsumens.alamat as alamatkonsumen', 'konsumens.no_hp as nohpkonsumen', 'konsumens.contact_person as cpkonsumen')
      ->where('penjualans.id', '=', $id)
      ->orderBy('created_at', 'desc')
      ->first();

    $penjualandetails = DB::table('penjualan_details')
      ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
      ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang', 'barangs.satuan as satuanbarang')
      ->where('id_penjualans', $id)
      ->orderBy('barangs.nama', 'asc')
      ->get();

    return view('apps.penjualan.print-kwitansi', ['penjualan' => $penjualan, 'penjualandetails' => $penjualandetails]);
  }
}
