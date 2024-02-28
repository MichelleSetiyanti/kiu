<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use \Carbon\Carbon;
use File;
use Matrix\Exception;

class PiutangCustomerController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index()
  {
    $akuns = DB::table('akuns')->where('kategori', 'Kas & Bank')->get();

    $konsumens = DB::table('konsumens')
      ->orderBy('kode', 'asc')
      ->where('aktif', '=', 'Active')
      ->get();

    return view('apps.penjualan.piutang-customer.index', ['akuns' => $akuns, 'konsumens' => $konsumens]);
  }

  public function index_list()
  {
    return view('apps.penjualan.piutang-customer.list');
  }

  public function listdatahistory(Request $request)
  {
    $penjualans = DB::table('bayar_piutang_konsumens')
      ->join('konsumens', 'bayar_piutang_konsumens.id_konsumens', '=', 'konsumens.id')
      ->select('bayar_piutang_konsumens.*', 'konsumens.nama as namakonsumen')
      ->orderBy('bayar_piutang_konsumens.created_at', 'desc')
      ->get();

    return datatables()::of($penjualans)
      ->addColumn('action', function ($penjualans) {
        $encrypt = Crypt::encrypt($penjualans->id);

        $class = "";
        $classbayar = "";

        if ($penjualans->status == "Cancel") {
          $class = "hidden";
        }
        if ($penjualans->status == "Paid") {
          $classbayar = "hidden";
        }

        return '
                <div class="fonticon-container">
                  <span class="fonticon-wrap ' . $class . '" onclick="window.open(\'/penjualan/piutang-customer/print-data/' . $encrypt . '\',\'_blank\')"><i class="feather icon-printer" data-toggle="tooltip" title="Cetak Pelunasan"></i></span>
                  <span class="fonticon-wrap ' . $class . '" onclick="f_delete(' . $penjualans->id . ')"><i class="feather icon-x-circle" data-toggle="tooltip" title="Cancel Pelunasan"></i></span></span>
                  <span class="fonticon-wrap ' . $class . $classbayar . '" onclick="f_keterangan(' . $penjualans->id . ')"><i class="feather icon-send" data-toggle="tooltip" title="Proses Pelunasan"></i></span>
                  </div>
              ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function list(Request $request)
  {
    $penjualans = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where('penjualans.pembayaran', '=', 'Credit')
      ->where('penjualans.status', '=', 'Selesai')
      ->where('penjualans.id_konsumens', '=', $request->konsumen)
      ->where('penjualans.kode_inv', '!=', '')
      ->where('penjualans.sisa', '>', '0')
      ->orderBy('created_at', 'desc')
      ->get();

    return datatables()::of($penjualans)
      ->addIndexColumn()
      ->make(true);
  }

  public function pelunasan(Request $request)
  {
    DB::beginTransaction();
    // dd($request->konsumen);
    // dd($request->id);

    try {

      $piutangkonsumen = DB::table('bayar_piutang_konsumens')->where('id', $request->id)->first();

      $stringid = $piutangkonsumen->kodepelunasan;

      if (substr($stringid, -1, 1) == ',') {
        $stringid = substr($stringid, 0, -1);
      }

      $arrayid = explode(',', $stringid);

      $bayarpiutangss = DB::table('bayar_piutangs')->whereIn('id', $arrayid)->get();

      foreach ($bayarpiutangss as $bayarpiutangs) {
        DB::table('bayar_piutangs')->where('id', $bayarpiutangs->id)->update([
          'status' => 'Paid',
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      $keterangan = $request->keterangan;

      DB::table('bayar_piutang_konsumens')->where('id', $request->id)->update([
        'status' => 'Paid',
        'keterangan' => $keterangan,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }

  public function cancel_data(Request $request)
  {
    DB::beginTransaction();

    try {

      $piutangkonsumen = DB::table('bayar_piutang_konsumens')->where('id', $request->id)->first();

      $stringid = $piutangkonsumen->kodepelunasan;

      if (substr($stringid, -1, 1) == ',') {
        $stringid = substr($stringid, 0, -1);
      }

      $arrayid = explode(',', $stringid);

      $bayarpiutangss = DB::table('bayar_piutangs')->whereIn('id', $arrayid)->get();

      foreach ($bayarpiutangss as $bayarpiutangs) {

        $penjualan = DB::table('penjualans')->where('id', $bayarpiutangs->id_penjualans)->first();

        $sisa = $penjualan->sisa;
        $nominalpelunasan = $bayarpiutangs->nominal;

        $sisabaru = $sisa + $nominalpelunasan;

        // update sisa utang
        DB::table('penjualans')->where('id', $bayarpiutangs->id_penjualans)->update([
          'sisa' => $sisabaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);

        DB::table('cancel_bayar_piutangs')->insert([
          'id_penjualans' => $bayarpiutangs->id_penjualans,
          'id_users' => Auth::user()->id,
          'nominal' => $bayarpiutangs->nominal,
          "created_at" => \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        DB::table('bayar_piutangs')->where('id', $bayarpiutangs->id)->update([
          'status' => 'Cancel',
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      $konsumen = DB::table('konsumens')->where('id', $piutangkonsumen->id_konsumens)->first();

      $piutang = $konsumen->piutang;
      $piutangbaru = $piutang + $piutangkonsumen->nominal;

      DB::table('konsumens')->where('id', $piutangkonsumen->id_konsumens)->update([
        'piutang' => $piutangbaru,
        "created_at" => \Carbon\Carbon::now(),
      ]);

      DB::table('bayar_piutang_konsumens')->where('id', $request->id)->update([
        'status' => 'Cancel',
        "updated_at" => \Carbon\Carbon::now()
      ]);

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

    $bayarpiutang = DB::table('bayar_piutang_konsumens')
      ->join('konsumens', 'bayar_piutang_konsumens.id_konsumens', '=', 'konsumens.id')
      ->select('bayar_piutang_konsumens.*', 'konsumens.nama as namakonsumen')
      ->where('bayar_piutang_konsumens.id', $id)
      ->orderBy('bayar_piutang_konsumens.created_at', 'desc')
      ->first();

    $stringid = $bayarpiutang->kodepelunasan;

    if (substr($stringid, -1, 1) == ',') {
      $stringid = substr($stringid, 0, -1);
    }

    $arrayid = explode(',', $stringid);

    $penjualan_details = DB::table('bayar_piutangs')
      ->join('penjualans', 'bayar_piutangs.id_penjualans', '=', 'penjualans.id')
      ->select('penjualans.*', 'bayar_piutangs.nominal as nominalpelunasan')
      ->whereIn('bayar_piutangs.id', $arrayid)
      ->orderBy('bayar_piutangs.created_at', 'asc')->get();

    return view('apps.penjualan.piutang-customer.print', ['bayarpiutang' => $bayarpiutang, 'penjualandetails' => $penjualan_details]);
  }

  public function cetakKuitansi(Request $request)
  {
    DB::beginTransaction();
    try {

      $querypiutang = DB::table('bayar_piutang_konsumens')->where('kode', 'like', 'K-' . date("y-", strtotime("now")) . '%')->orderBy('id', 'desc');

      if ($querypiutang->exists()) {
        $pengembalian_pinjaman_konsumens = $querypiutang->first();
        $pecah = explode('-', $pengembalian_pinjaman_konsumens->kode);

        $kodeterakhir = $pecah[2];
      } else {
        $kodeterakhir = 0;
      }

      $kode = "K-" . date("y-", strtotime("now")) . str_pad($kodeterakhir + 1, 4, "0", STR_PAD_LEFT);

      $datas = $request->datas;

      $konsumen = DB::table('konsumens')->where('id', $request->konsumen)->first();

      $sumtotalpelunasan = 0;
      $kodepelunasan = "";
      $tanggalcetak = \Carbon\Carbon::createFromFormat("Y-m-d", $request->tanggalcetak)->isoFormat('D MMMM Y');

      for ($x = 0; $x < count($datas); $x++) {
        $penjualan = DB::table('penjualans')->where('id', $datas[$x])->first();

        $sisa = $penjualan->sisa;
        // update sisa utang
        DB::table('penjualans')->where('id', $datas[$x])->update([
          'sisa' => '0',
          "updated_at" => \Carbon\Carbon::now()
        ]);

        // input tabel bayar_piutangs
        $idpelunasan = DB::table('bayar_piutangs')->insertGetId([
          'id_penjualans' => $datas[$x],
          'id_users' => Auth::user()->id,
          'nominal' => $sisa,
          'status' => 'Unpaid',
          'pelunasan_konsumen' => 'Y',
          "created_at" => \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $sumtotalpelunasan = $sumtotalpelunasan + $sisa;
        $kodepelunasan = $kodepelunasan . $idpelunasan . ',';
      }

      // dd($penjualan);
      $piutanglama = $konsumen->piutang;
      $piutangbaru = $piutanglama - $sumtotalpelunasan;

      DB::table('konsumens')->where('id', $penjualan->id_konsumens)->update([
        'piutang' => $piutangbaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);
      if ($penjualan->pajak == 0) {
        $idbayarpiutang = DB::table('bayar_piutang_konsumens')->insertGetId([
          'kode' => "-",
          'kodepelunasan' => $kodepelunasan,
          'id_users' => Auth::User()->id,
          'id_konsumens' => $request->konsumen,
          'nominal' => $sumtotalpelunasan,
          'status' => 'Unpaid',
          'tanggal_cetak' => $request->tanggalcetak,
          "created_at" => \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

      } else {

        $idbayarpiutang = DB::table('bayar_piutang_konsumens')->insertGetId([
          'kode' => $kode,
          'kodepelunasan' => $kodepelunasan,
          'id_users' => Auth::User()->id,
          'id_konsumens' => $request->konsumen,
          'nominal' => $sumtotalpelunasan,
          'status' => 'Unpaid',
          'tanggal_cetak' => $request->tanggalcetak,
          "created_at" => \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      DB::commit();

      return Crypt::encrypt($idbayarpiutang);
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
    // $querypiutang = DB::table('bayar_piutang_konsumens')->where('kode', 'like', 'K-' . date("y-", strtotime("now")) . '%')->orderBy('id', 'desc');

    // if ($querypiutang->exists()) {
    //   $pengembalian_pinjaman_konsumens = $querypiutang->first();
    //   $pecah = explode('-', $pengembalian_pinjaman_konsumens->kode);

    //   $kodeterakhir = $pecah[2];
    // } else {
    //   $kodeterakhir = 0;
    // }

    // $kode = "K-" . date("y-", strtotime("now")) . str_pad($kodeterakhir + 1, 4, "0", STR_PAD_LEFT);

    // $datas = $request->datas;

    // $konsumen = DB::table('konsumens')->where('id', $request->konsumen)->first();

    // $sumtotalpelunasan = 0;

    // for ($x = 0; $x < count($datas); $x++) {
    //   $penjualan = DB::table('penjualans')->where('id', $datas[$x])->first();

    //   $sisa = $penjualan->sisa;
    //   $sumtotalpelunasan = $sumtotalpelunasan + $sisa;
    // }

    // return view('apps.penjualan.piutang-customer.print-kwitansi', [
    //   'kode' => $kode,
    //   'id_users' => Auth::User()->id,
    //   'nama' => $konsumen->nama,
    //   'nofaktur' => $request->nofaktur,
    //   'nominal' => $sumtotalpelunasan,
    // ]);
  }
}
