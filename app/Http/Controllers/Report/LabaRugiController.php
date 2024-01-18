<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LabaRugiController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.report.laba-rugi');
  }

  public function get_data(Request $request){

    $createdatmulai = $request->tanggalmulai.' 00:00:00';
    $createdatselesai = $request->tanggalselesai.' 23:59:59';

    $html = "";

    // SEGMEN PENJUALAN

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
    '<h4> <b> PENDAPATAN OPERASIONAL </b> </h4>'.
    '</div>';

    // penjualan 4101

    $debetpenjualan = 0;
    $kreditpenjualan = 0;
    $totalpenjualan = 0;

    $penjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4101')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$penjualan_d->isEmpty()) {
      $debetpenjualan = $penjualan_d[0]->totalnominal;
    }

    $penjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4101')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$penjualan_k->isEmpty()) {
      $kreditpenjualan = $penjualan_k[0]->totalnominal;
    }

    $totalpenjualan = $kreditpenjualan - $debetpenjualan;

    $html .= '<div class="row">'.
    '<div class="col-md-7 col-sm-7">'.
    'Penjualan'.
    '</div>'.
    '<div class="col-md-5 col-sm-5 text-right">'.
    'Rp. '.number_format($totalpenjualan,2,',','.').
    '</div>'.
    '</div>';


    // retur penjualan 4102

    $debetreturpenjualan = 0;
    $kreditreturpenjualan = 0;
    $totalreturpenjualan = 0;

    $returpenjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4102')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$returpenjualan_d->isEmpty()) {
      $debetreturpenjualan = $returpenjualan_d[0]->totalnominal;
    }

    $returpenjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4102')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$returpenjualan_k->isEmpty()) {
      $kreditreturpenjualan = $returpenjualan_k[0]->totalnominal;
    }

    $totalreturpenjualan = $debetreturpenjualan - $kreditreturpenjualan;

    if($totalreturpenjualan != 0){
      $html .= '<div class="row">'.
        '<div class="col-md-7 col-sm-7">'.
        'Retur Penjualan'.
        '</div>'.
        '<div class="col-md-5 col-sm-5 text-right">'.
        '(Rp. '.number_format($totalreturpenjualan,2,',','.').')'.
        '</div>'.
        '</div>';
    }


    // potongan penjualan 4103

    $debetpotonganpenjualan = 0;
    $kreditpotonganpenjualan = 0;
    $totalpotonganpenjualan = 0;

    $potonganpenjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4103')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$potonganpenjualan_d->isEmpty()) {
      $debetpotonganpenjualan = $potonganpenjualan_d[0]->totalnominal;
    }

    $potonganpenjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4103')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$potonganpenjualan_k->isEmpty()) {
      $kreditpotonganpenjualan = $potonganpenjualan_k[0]->totalnominal;
    }

    $totalpotonganpenjualan = $debetpotonganpenjualan - $kreditpotonganpenjualan;

    if($totalpotonganpenjualan != 0){
      $html .= '<div class="row">'.
        '<div class="col-md-7 col-sm-7">'.
        'Potongan Penjualan'.
        '</div>'.
        '<div class="col-md-5 col-sm-5 text-right">'.
        '(Rp. '.number_format($totalpotonganpenjualan,2,',','.').')'.
        '</div>'.
        '</div>';
    }


    // biaya tambahan penjualan 4104

    $debetbiayatambahanpenjualan = 0;
    $kreditbiayatambahanpenjualan = 0;
    $totalbiayatambahanpenjualan = 0;

    $biayatambahanpenjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4104')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$biayatambahanpenjualan_d->isEmpty()) {
      $debetbiayatambahanpenjualan = $biayatambahanpenjualan_d[0]->totalnominal;
    }

    $biayatambahanpenjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4104')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$biayatambahanpenjualan_k->isEmpty()) {
      $kreditbiayatambahanpenjualan = $biayatambahanpenjualan_k[0]->totalnominal;
    }

    $totalbiayatambahanpenjualan = $kreditbiayatambahanpenjualan - $debetbiayatambahanpenjualan;

    if($totalbiayatambahanpenjualan != 0) {

      $html .= '<div class="row">' .
        '<div class="col-md-7 col-sm-7">' .
        'Biaya Tambahan Penjualan' .
        '</div>' .
        '<div class="col-md-5 col-sm-5 text-right">' .
        'Rp. ' . number_format($totalbiayatambahanpenjualan, 2, ',', '.') .
        '</div>' .
        '</div>';
    }


    // potongan biaya penjualan 4105

    $debetpotonganbiayapenjualan = 0;
    $kreditpotonganbiayapenjualan = 0;
    $totalpotonganbiayapenjualan = 0;

    $potonganbiayapenjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4105')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$potonganbiayapenjualan_d->isEmpty()) {
      $debetpotonganbiayapenjualan = $potonganbiayapenjualan_d[0]->totalnominal;
    }

    $potonganbiayapenjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4105')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$potonganbiayapenjualan_k->isEmpty()) {
      $kreditpotonganbiayapenjualan = $potonganbiayapenjualan_k[0]->totalnominal;
    }

    $totalpotonganbiayapenjualan = $debetpotonganbiayapenjualan - $kreditpotonganbiayapenjualan;

    if($totalpotonganbiayapenjualan != 0){
      $html .= '<div class="row">'.
        '<div class="col-md-7 col-sm-7">'.
        'Potongan Biaya Penjualan'.
        '</div>'.
        '<div class="col-md-5 col-sm-5 text-right">'.
        '(Rp. '.number_format($totalpotonganbiayapenjualan,2,',','.').')'.
        '</div>'.
        '</div>';
    }



    // TOTAL PENDAPATAN OPERASIONAL

    $totalpendapatanoperasional = $totalpenjualan - $totalreturpenjualan - $totalpotonganpenjualan + $totalbiayatambahanpenjualan - $totalpotonganbiayapenjualan;


    $html .= '<div class="row mt-1">'.
    '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
    '<div class="row">'.
    '<h4> <b>Total PENDAPATAN OPERASIONAL <span style="color:red;">(A)</span> </b> </h4>'.
    '</div>'.
    '</div>'.
    '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
    '<b>Rp. '.number_format($totalpendapatanoperasional, 2, ',', '.') .'</b>'.
    '</div>'.
    '</div>';


    // SEGMEN PEMBELIAN

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
      '<h4> <b> HARGA POKOK PENJUALAN & PEMBELIAN </b> </h4>'.
      '</div>';

    // pembelian 5101

    $debetpembelian = 0;
    $kreditpembelian = 0;
    $totalpembelian = 0;

    $pembelian_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5101')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$pembelian_d->isEmpty()) {
      $debetpembelian = $pembelian_d[0]->totalnominal;
    }

    $pembelian_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5101')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$pembelian_k->isEmpty()) {
      $kreditpembelian = $pembelian_k[0]->totalnominal;
    }

    $totalpembelian = $debetpembelian - $kreditpembelian;

    $html .= '<div class="row">'.
      '<div class="col-md-7 col-sm-7">'.
      'Pembelian'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right">'.
      'Rp. '.number_format($totalpembelian,2,',','.').
      '</div>'.
      '</div>';


    // potongan pembelian 5102

    $debetpotonganpembelian = 0;
    $kreditpotonganpembelian = 0;
    $totalpotonganpembelian = 0;

    $potonganpembelian_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5102')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$potonganpembelian_d->isEmpty()) {
      $debetpotonganpembelian = $potonganpembelian_d[0]->totalnominal;
    }

    $potonganpembelian_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5102')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$potonganpembelian_k->isEmpty()) {
      $kreditpotonganpembelian = $potonganpembelian_k[0]->totalnominal;
    }

    $totalpotonganpembelian = $kreditpotonganpembelian - $debetpotonganpembelian;

    if($totalpotonganpembelian != 0) {

      $html .= '<div class="row">' .
        '<div class="col-md-7 col-sm-7">' .
        'Potongan Pembelian' .
        '</div>' .
        '<div class="col-md-5 col-sm-5 text-right">' .
        '(Rp. ' . number_format($totalpotonganpembelian, 2, ',', '.') .')'.
        '</div>' .
        '</div>';
    }


    // biaya tambahan pembelian 5103

    $debetbiayatambahanpembelian = 0;
    $kreditbiayatambahanpembelian = 0;
    $totalbiayatambahanpembelian = 0;

    $biayatambahanpembelian_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5103')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$biayatambahanpembelian_d->isEmpty()) {
      $debetbiayatambahanpembelian = $biayatambahanpembelian_d[0]->totalnominal;
    }

    $biayatambahanpembelian_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5103')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$biayatambahanpembelian_k->isEmpty()) {
      $kreditbiayatambahanpembelian = $biayatambahanpembelian_k[0]->totalnominal;
    }

    $totalbiayatambahanpembelian = $debetbiayatambahanpembelian - $kreditbiayatambahanpembelian;

    if($totalbiayatambahanpembelian != 0){
      $html .= '<div class="row">'.
        '<div class="col-md-7 col-sm-7">'.
        'Biaya Tambahan Pembelian'.
        '</div>'.
        '<div class="col-md-5 col-sm-5 text-right">'.
        'Rp. '.number_format($totalbiayatambahanpembelian,2,',','.').
        '</div>'.
        '</div>';
    }


    // TOTAL PEMBELIAN

    $totalpembelianoperasional = $totalpembelian - $totalpotonganpembelian + $totalbiayatambahanpembelian;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b>Total PEMBELIAN  <span style="color:red;">(B)</span> </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalpembelianoperasional, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';

    // PERSEDIAAN BARANG DAGANG AWAL

    $totalpersediaanawal = 0;

    $barangbelis = DB::table('barang_belis')->get();

    foreach($barangbelis as $barangbeli) {

      $totalstokpembelianawal = DB::table('pembelians')
        ->join('pembelian_details', 'pembelians.id', '=', 'pembelian_details.id_pembelians')
        ->select(DB::raw("SUM(pembelian_details.total_beli) as totalbeli"))
        ->where('pembelians.tanggal', '<', $request->tanggalmulai)
        ->where('pembelians.status', '=', 'Selesai')
        ->where('pembelian_details.id_barang_belis',$barangbeli->id)
        ->get();

      $totalstokpenjualanawal = DB::table('penjualans')
        ->join('penjualan_details', 'penjualans.id', '=', 'penjualan_details.id_penjualans')
        ->join('pemotongan_penjualans', 'penjualan_details.id', '=', 'pemotongan_penjualans.id_penjualan_details')
        ->select(DB::raw("SUM(pemotongan_penjualans.total) as totaljual"))
        ->where('penjualans.tanggal', '<', $request->tanggalmulai)
        ->where('penjualans.status', '=', 'Selesai')
        ->where('pemotongan_penjualans.id_barang_belis',$barangbeli->id)
        ->get();

      $totalstokmutasimasukawal = DB::table('mutasi_masuk_barang_belis')
        ->select(DB::raw("SUM(qty) as totalmutasimasuk"))
        ->where('created_at', '<', $createdatmulai)
        ->where('id_barang_belis',$barangbeli->id)
        ->get();

      $totalstokmutasikeluarawal = DB::table('mutasi_keluar_barang_belis')
        ->select(DB::raw("SUM(qty) as totalmutasikeluar"))
        ->where('created_at', '<', $createdatmulai)
        ->where('id_barang_belis',$barangbeli->id)
        ->get();

      $hitunghargaawal = DB::table('pembelians')
        ->join('pembelian_details', 'pembelians.id', '=', 'pembelian_details.id_pembelians')
        ->select([DB::raw("SUM(pembelian_details.subtotal) as totalnominal"),
          DB::raw("SUM(pembelian_details.total_beli) as totalbeli")])
        ->where('pembelians.tanggal', '<', $request->tanggalmulai)
        ->where('pembelians.status', '=', 'Selesai')
        ->where('pembelian_details.id_barang_belis',$barangbeli->id);

      $stokpembelianawal = $totalstokpembelianawal[0]->totalbeli;
      $stokpenjuaalnawal = $totalstokpenjualanawal[0]->totaljual;
      $stokmutasimasukawal = $totalstokmutasimasukawal[0]->totalmutasimasuk;
      $stokmutasikeluarawal = $totalstokmutasikeluarawal[0]->totalmutasikeluar;

      $hargaawal = 0;

      if($hitunghargaawal->count() > 0){
        $getdata = $hitunghargaawal->first();
        $hargaawal = $getdata->totalnominal / $getdata->totalbeli;
      }

      $persediaanawal = ($stokpembelianawal + $stokmutasimasukawal - $stokpenjuaalnawal - $stokmutasikeluarawal) * $hargaawal;

      $totalpersediaanawal += $persediaanawal;

    }

    $html .= '<div class="row">'.
      '<div class="col-md-7 col-sm-7">'.
      'Persediaan Barang Dagang Awal  <span style="color:red;font-weight:bold;">(C)</span>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-bottom:1px solid black;padding-top:5px;font-size:20px;">'.
      'Rp. '.number_format($totalpersediaanawal,2,',','.').
      '</div>'.
      '</div>';

    $barangtersediauntukdijual = $totalpersediaanawal + $totalpembelianoperasional;

    $html .= '<div class="row" style="font-weight:bold;margin-top:20px;">'.
      '<div class="col-md-7 col-sm-7">'.
      'Barang Tersedia Untuk Dijual  <span style="color:red;">(B + C)</span>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right">'.
      'Rp. '.number_format($barangtersediauntukdijual,2,',','.').
      '</div>'.
      '</div>';


    // PERSEDIAAN BARANG DAGANG AKHIR

    $totalpersediaanakhir = 0;

    $barangbelis = DB::table('barang_belis')->get();

    foreach($barangbelis as $barangbeli) {

      $totalstokpembelianakhir = DB::table('pembelians')
        ->join('pembelian_details', 'pembelians.id', '=', 'pembelian_details.id_pembelians')
        ->select(DB::raw("SUM(pembelian_details.total_beli) as totalbeli"))
        ->where('pembelians.tanggal', '<=', $request->tanggalselesai)
        ->where('pembelians.status', '=', 'Selesai')
        ->where('pembelian_details.id_barang_belis',$barangbeli->id)
        ->get();

      $totalstokpenjualanakhir = DB::table('penjualans')
        ->join('penjualan_details', 'penjualans.id', '=', 'penjualan_details.id_penjualans')
        ->join('pemotongan_penjualans', 'penjualan_details.id', '=', 'pemotongan_penjualans.id_penjualan_details')
        ->select(DB::raw("SUM(pemotongan_penjualans.total) as totaljual"))
        ->where('penjualans.tanggal', '<=', $request->tanggalselesai)
        ->where('penjualans.status', '=', 'Selesai')
        ->where('pemotongan_penjualans.id_barang_belis',$barangbeli->id)
        ->get();

      $totalstokmutasimasukakhir = DB::table('mutasi_masuk_barang_belis')
        ->select(DB::raw("SUM(qty) as totalmutasimasuk"))
        ->where('created_at', '<=', $createdatselesai)
        ->where('id_barang_belis',$barangbeli->id)
        ->get();

      $totalstokmutasikeluarakhir = DB::table('mutasi_keluar_barang_belis')
        ->select(DB::raw("SUM(qty) as totalmutasikeluar"))
        ->where('created_at', '<=', $createdatselesai)
        ->where('id_barang_belis',$barangbeli->id)
        ->get();

      $hitunghargaakhir = DB::table('pembelians')
        ->join('pembelian_details', 'pembelians.id', '=', 'pembelian_details.id_pembelians')
        ->select([DB::raw("SUM(pembelian_details.subtotal) as totalnominal"),
          DB::raw("SUM(pembelian_details.total_beli) as totalbeli")])
        ->where('pembelians.tanggal', '<=', $request->tanggalselesai)
        ->where('pembelians.status', '=', 'Selesai')
        ->where('pembelian_details.id_barang_belis',$barangbeli->id);

      $stokpembelianakhir = $totalstokpembelianakhir[0]->totalbeli;
      $stokpenjuaalnakhir = $totalstokpenjualanakhir[0]->totaljual;
      $stokmutasimasukakhir = $totalstokmutasimasukakhir[0]->totalmutasimasuk;
      $stokmutasikeluarakhir = $totalstokmutasikeluarakhir[0]->totalmutasikeluar;

      $hargaakhir = 0;

      if($hitunghargaakhir->count() > 0){
        $getdata = $hitunghargaakhir->first();
        $hargaakhir = $getdata->totalnominal / $getdata->totalbeli;
      }

      $persediaanakhir = ($stokpembelianakhir + $stokmutasimasukakhir - $stokpenjuaalnakhir - $stokmutasikeluarakhir) * $hargaakhir;

      $totalpersediaanakhir += $persediaanakhir;

    }

    $html .= '<div class="row" style="margin-bottom:20px">'.
      '<div class="col-md-7 col-sm-7">'.
      'Persediaan Barang Dagang Akhir <span style="color:red;font-weight:bold;">(D)</span>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right">'.
      'Rp. '.number_format($totalpersediaanakhir,2,',','.').
      '</div>'.
      '</div>';

    $hargapokokpenjualan = $barangtersediauntukdijual - $totalpersediaanakhir;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b> HARGA POKOK PENJUALAN  <span style="color:red;font-weight:bold;">(B + C - D)</span> </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;font-size:20px;">'.
      '<b>Rp. '.number_format($hargapokokpenjualan, 2, ',', '.') .'</b>'.
      '</div> </div>';

    // LABA KOTOR OPERASIONAL

    $labakotoroperasional = $totalpendapatanoperasional - $hargapokokpenjualan;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b> LABA KOTOR OPERASIONAL  <span style="color:red;font-weight:bold;">(E)</span> </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;font-size:20px;">';

    if($labakotoroperasional > 0){
      $html .= '<b>Rp. '.number_format($labakotoroperasional, 2, ',', '.') .'</b>';
    }else{
      $html .= '<b style="color:red;">Rp. '.number_format($labakotoroperasional, 2, ',', '.') .'</b>';
    }

    $html .= '</div> </div>';


    // SEGMEN PENJUALAN DROPSHIPPER

    $html .= '<div class="row mt-1" style="margin-bottom:5px;margin-top:30px;">'.
    '<h4> <b> PENDAPATAN DROPSHIPPER </b> </h4>'.
    '</div>';

    // penjualan dropshipper 4201

    $debetdropshipper = 0;
    $kreditdropshipper = 0;
    $totaldropshipper = 0;

    $dropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4201')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$dropshipper_d->isEmpty()) {
      $debetdropshipper = $dropshipper_d[0]->totalnominal;
    }

    $dropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4201')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$dropshipper_k->isEmpty()) {
      $kreditdropshipper = $dropshipper_k[0]->totalnominal;
    }

    $totaldropshipper = $kreditdropshipper - $debetdropshipper;

    $html .= '<div class="row">'.
    '<div class="col-md-7 col-sm-7">'.
    'Penjualan Dropshipper'.
    '</div>'.
    '<div class="col-md-5 col-sm-5 text-right">'.
    'Rp. '.number_format($totaldropshipper,2,',','.').
    '</div>'.
    '</div>';


    // beban tambahan dropshipper kontainer 4202

    $debettambahandropshipper = 0;
    $kredittambahandropshipper = 0;
    $totaltambahandropshipper = 0;

    $tambahandropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4202')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$tambahandropshipper_d->isEmpty()) {
      $debettambahandropshipper = $tambahandropshipper_d[0]->totalnominal;
    }

    $tambahandropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4202')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$tambahandropshipper_k->isEmpty()) {
      $kredittambahandropshipper = $tambahandropshipper_k[0]->totalnominal;
    }

    $totaltambahandropshipper = $debettambahandropshipper - $kredittambahandropshipper;

    if($totaltambahandropshipper != 0){
      $html .= '<div class="row">'.
        '<div class="col-md-7 col-sm-7">'.
        'Biaya Tambahan Dropshipper'.
        '</div>'.
        '<div class="col-md-5 col-sm-5 text-right">'.
        '(Rp. '.number_format($totaltambahandropshipper,2,',','.').')'.
        '</div>'.
        '</div>';
    }


    // komisi dropshipper kontainer 4203

    $debetkomisiropshipper = 0;
    $kreditkomisiropshipper = 0;
    $totalkomisidropshipper = 0;

    $komisiropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4203')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$komisiropshipper_d->isEmpty()) {
      $debetkomisiropshipper = $komisiropshipper_d[0]->totalnominal;
    }

    $komisiropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4203')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$komisiropshipper_k->isEmpty()) {
      $kreditkomisiropshipper = $komisiropshipper_k[0]->totalnominal;
    }

    $totalkomisidropshipper = $debetkomisiropshipper - $kreditkomisiropshipper;

    if($totalkomisidropshipper != 0){
      $html .= '<div class="row">'.
        '<div class="col-md-7 col-sm-7">'.
        'Komisi Dropshipper'.
        '</div>'.
        '<div class="col-md-5 col-sm-5 text-right">'.
        '(Rp. '.number_format($totalkomisidropshipper,2,',','.').')'.
        '</div>'.
        '</div>';
    }


    // TOTAL PENDAPATAN DROPSHIPPER

    $totalpendapatandropshipper = $totaldropshipper - $totaltambahandropshipper - $totalkomisidropshipper;

    $html .= '<div class="row mt-1">'.
    '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
    '<div class="row">'.
    '<h4> <b>Total PENDAPATAN DROPSHIPPER <span style="color:red;font-weight:bold;">(F)</span> </b> </h4>'.
    '</div>'.
    '</div>'.
    '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
    '<b>Rp. '.number_format($totalpendapatandropshipper, 2, ',', '.') .'</b>'.
    '</div>'.
    '</div>';


    // SEGMEN PEMBELIAN DROPSHIPPER

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
      '<h4> <b> PEMBELIAN DROPSHIPPER </b> </h4>'.
      '</div>';


    // pembelian dropshipper 5201

    $debetpembeliandropshipper = 0;
    $kreditpembeliandropshipper = 0;
    $totalpembeliandropshipper = 0;

    $pembeliandropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5201')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$pembeliandropshipper_d->isEmpty()) {
      $debetpembeliandropshipper = $pembeliandropshipper_d[0]->totalnominal;
    }

    $pembeliandropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5201')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$pembeliandropshipper_k->isEmpty()) {
      $kreditpembeliandropshipper = $pembeliandropshipper_k[0]->totalnominal;
    }

    $totalpembeliandropshipper = $debetpembeliandropshipper - $kreditpembeliandropshipper;

    $html .= '<div class="row">'.
      '<div class="col-md-7 col-sm-7">'.
      'Pembelian Dropshipper'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right">'.
      'Rp. '.number_format($totalpembeliandropshipper,2,',','.').
      '</div>'.
      '</div>';


    // biaya tambahan pembelian dropshipper 5202

    $debetbiayatambahanpembeliandropshipper = 0;
    $kreditbiayatambahanpembeliandropshipper = 0;
    $totalbiayatambahanpembeliandropshipper = 0;

    $biayatambahanpembeliandropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5202')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$biayatambahanpembeliandropshipper_d->isEmpty()) {
      $debetbiayatambahanpembeliandropshipper = $biayatambahanpembeliandropshipper_d[0]->totalnominal;
    }

    $biayatambahanpembeliandropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5202')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$biayatambahanpembeliandropshipper_k->isEmpty()) {
      $kreditbiayatambahanpembeliandropshipper = $biayatambahanpembeliandropshipper_k[0]->totalnominal;
    }

    $totalbiayatambahanpembeliandropshipper = $debetbiayatambahanpembeliandropshipper - $kreditbiayatambahanpembeliandropshipper;

    if($totalbiayatambahanpembeliandropshipper != 0){
      $html .= '<div class="row">'.
        '<div class="col-md-7 col-sm-7">'.
        'Biaya Tambahan Pembelian Dropshipper'.
        '</div>'.
        '<div class="col-md-5 col-sm-5 text-right">'.
        'Rp. '.number_format($totalbiayatambahanpembeliandropshipper,2,',','.').
        '</div>'.
        '</div>';
    }


    // TOTAL PEMBELIAN DROPSHIPPER

    $totalpembeliandropshipper = $totalpembeliandropshipper + $totalbiayatambahanpembeliandropshipper;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b>Total PEMBELIAN DROPSHIPPER <span style="color:red;font-weight:bold;">(G)</span> </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalpembeliandropshipper, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';


    // LABA KOTOR DROPSHIPPER

    $labakotordropshipper = $totalpendapatandropshipper - $totalpembeliandropshipper;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b> LABA KOTOR DROPSHIPPER <span style="color:red;font-weight:bold;">(F - G)</span> </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;font-size:20px;">';

    if($labakotordropshipper > 0){
      $html .= '<b>Rp. '.number_format($labakotordropshipper, 2, ',', '.') .'</b>';
    }else{
      $html .= '<b style="color:red;">Rp. '.number_format($labakotordropshipper, 2, ',', '.') .'</b>';
    }

    $html .= '</div> </div>';


    // LABA KOTOR USAHA

    $labakotorusaha = $labakotoroperasional + $labakotordropshipper;

    $html .= '<div class="row mt-2">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h3> <b> LABA KOTOR USAHA <span style="color:red;font-weight:bold;">(H = E + F - G)</span> </b> </h3>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;font-size:22px;">';

    if($labakotorusaha > 0){
      $html .= '<b>Rp. '.number_format($labakotorusaha, 2, ',', '.') .'</b>';
    }else{
      $html .= '<b style="color:red;">Rp. '.number_format($labakotorusaha, 2, ',', '.') .'</b>';
    }

    $html .= '</div> </div>';


    // SEGMEN BEBAN OPERASIONAL

    $html .= '<div class="row mt-3" style="margin-bottom:5px;">'.
      '<h4> <b> BEBAN OPERASIONAL </b> </h4>'.
      '</div>';

    // looping beban operasional

    $akunsbeban = DB::table('akuns')->whereIn('kategori',['Beban', 'Beban Penyusutan'])->get();

    $totalbebanoperasional = 0;

    foreach($akunsbeban as $akunbeban){

      $debetbeban = 0;
      $kreditbeban = 0;
      $totalbeban = 0;

      $beban_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunbeban->kode_akun)
        ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$beban_d->isEmpty()) {
        $debetbeban = $beban_d[0]->totalnominal;
      }

      $beban_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunbeban->kode_akun)
        ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$beban_k->isEmpty()) {
        $kreditbeban = $beban_k[0]->totalnominal;
      }

      $totalbeban = $debetbeban - $kreditbeban;

      if($totalbeban != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7">'. $akunbeban->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($totalbeban,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalbebanoperasional += $totalbeban;

    }


    // TOTAL BEBAN OPERASIONAL

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b>Total BEBAN OPERASIONAL <span style="color:red;font-weight:bold;">(I)</span> </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalbebanoperasional, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';


    // TOTAL PENDAPATAN OPERASIONAL

    $totalakhirpendapatanoperasional = $labakotorusaha - $totalbebanoperasional;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h3> <b> Total PENDAPATAN OPERASIONAL <span style="color:red;font-weight:bold;">(H - I)</span> </b> </h3>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;font-size:22px;">';

    if($totalakhirpendapatanoperasional > 0){
      $html .= '<b>Rp. '.number_format($totalakhirpendapatanoperasional, 2, ',', '.') .'</b>';
    }else{
      $html .= '<b style="color:red;">Rp. '.number_format($totalakhirpendapatanoperasional, 2, ',', '.') .'</b>';
    }

    $html .= '</div> </div>';


    // SEGMEN PENDAPATAN DAN BEBAN LAIN LAIN

    $html .= '<div class="row mt-3" style="margin-bottom:5px;">'.
    '<h4> <b> Pendapatan dan Beban Lain-Lain </b> </h4>'.
    '</div>';



    // SEGMEN PENDAPATAN LAIN LAIN

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
      '<h4> <b> PENDAPATAN LAIN-LAIN </b> </h4>'.
      '</div>';


    // looping pendapatan lain lain

    $akunspendapatanlainlain = DB::table('akuns')->where('kategori','Pendapatan Lainnya')->get();

    $totalakhirpendapatanlainlain = 0;

    foreach($akunspendapatanlainlain as $akunpendapatanlainlain){

      $debetpendapatanlainlain = 0;
      $kreditpendapatanlainlain = 0;
      $totalpendapatanlainlain = 0;

      $pendapatan_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunpendapatanlainlain->kode_akun)
        ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$pendapatan_d->isEmpty()) {
        $debetpendapatanlainlain = $pendapatan_d[0]->totalnominal;
      }

      $pendapatan_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunpendapatanlainlain->kode_akun)
        ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$pendapatan_k->isEmpty()) {
        $kreditpendapatanlainlain = $pendapatan_k[0]->totalnominal;
      }

      $totalpendapatanlainlain = $kreditpendapatanlainlain - $debetpendapatanlainlain;

      if($totalpendapatanlainlain != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7">'. $akunpendapatanlainlain->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($totalpendapatanlainlain,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalakhirpendapatanlainlain += $totalpendapatanlainlain;

    }


    // TOTAL PENDAPATAN LAIN LAIN

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b>Total PENDAPATAN LAIN-LAIN <span style="color:red;font-weight:bold;">(J)</span> </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalakhirpendapatanlainlain, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // SEGMEN BEBAN LAIN LAIN

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
      '<h4> <b> BEBAN LAIN-LAIN </b> </h4>'.
      '</div>';

    // looping beban lain lain

    $akunsbebanlainlain = DB::table('akuns')->where('kategori','Beban Lainnya')->get();

    $totalakhirbebanlainlain = 0;

    foreach($akunsbebanlainlain as $akunbebanlainlain){

      $debetbeban = 0;
      $kreditbeban = 0;
      $totalbeban = 0;

      $beban_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunbebanlainlain->kode_akun)
        ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$beban_d->isEmpty()) {
        $debetbeban = $beban_d[0]->totalnominal;
      }

      $beban_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunbebanlainlain->kode_akun)
        ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$beban_k->isEmpty()) {
        $kreditbeban = $beban_k[0]->totalnominal;
      }

      $totalbeban = $debetbeban - $kreditbeban;

      if($totalbeban != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7">'. $akunbebanlainlain->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($totalbeban,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalakhirbebanlainlain += $totalbeban;

    }


    // TOTAL BEBAN LAIN-LAIN

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b>Total BEBAN LAIN-LAIN <span style="color:red;font-weight:bold;">(K)</span> </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalakhirbebanlainlain, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // TOTAL PENDAPATAN LAIN LAIN

    $totalakhirpendapatandanbebanlainlain = $totalakhirpendapatanlainlain - $totalakhirbebanlainlain;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h3> <b> Total PENDAPATAN DAN  <span style="color:red;font-weight:bold;">(J - K)</span> <br /> BEBAN LAIN-LAIN </b> </h3>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;font-size:22px;">';

    if($totalakhirpendapatandanbebanlainlain > 0){
      $html .= '<b>Rp. '.number_format($totalakhirpendapatandanbebanlainlain, 2, ',', '.') .'</b>';
    }else{
      $html .= '<b style="color:red;">Rp. '.number_format($totalakhirpendapatandanbebanlainlain, 2, ',', '.') .'</b>';
    }

    $html .= '</div> </div>';



    // LABA / RUGI BERSIH SEBELUM PAJAK

    $labarugibersihsebelumpajak = $totalakhirpendapatanoperasional + $totalakhirpendapatandanbebanlainlain;

    $html .= '<div class="row mt-3">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h3> <b> LABA/RUGI BERSIH (Sebelum Pajak) <span style="color:red;font-weight:bold;">(H - I + J - K)</span> </b> </h3>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;font-size:22px;">';

    if($labarugibersihsebelumpajak > 0){
      $html .= '<b>Rp. '.number_format($labarugibersihsebelumpajak, 2, ',', '.') .'</b>';
    }else{
      $html .= '<b style="color:red;">Rp. '.number_format($labarugibersihsebelumpajak, 2, ',', '.') .'</b>';
    }

    $html .= '</div> </div>';



    // PAJAK USAHA (PPN KELUARAN - PPN MASUKAN)

    $pajakusaha = 0;

    // pajak keluaran

    $debetpajakkeluaran = 0;
    $kreditpajakkeluaran = 0;
    $totalpajakkeluaran = 0;

    $pajakkeluaran_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','2501')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$pajakkeluaran_d->isEmpty()) {
      $debetpajakkeluaran = $pajakkeluaran_d[0]->totalnominal;
    }

    $pajakkeluaran_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','2501')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$pajakkeluaran_k->isEmpty()) {
      $kreditpajakkeluaran = $pajakkeluaran_k[0]->totalnominal;
    }

    $totalpajakkeluaran = $kreditpajakkeluaran - $debetpajakkeluaran;

    // pajak masukan

    $debetpajakmasukan = 0;
    $kreditpajakmasukan = 0;
    $totalpajakmasukan = 0;

    $pajakmasukan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','2401')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$pajakmasukan_d->isEmpty()) {
      $debetpajakmasukan = $pajakmasukan_d[0]->totalnominal;
    }

    $pajakmasukan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','2401')
      ->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$pajakmasukan_k->isEmpty()) {
      $kreditpajakmasukan = $pajakmasukan_k[0]->totalnominal;
    }

    $totalpajakmasukan = $debetpajakmasukan - $kreditpajakmasukan;


    $pajakusaha = $totalpajakkeluaran - $totalpajakmasukan;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7"> Pajak (PPN Keluaran - PPN Masukan) <span style="color:red;font-weight:bold;">(L)</span> </div>'.
      '<div class="col-md-5 col-sm-5 text-right">'.
      '(Rp. '.number_format($pajakusaha,2,',','.').')'.
      '</div>'.
      '</div>';


    // LABA / RUGI BERSIH SETELAH PAJAK

    $labarugibersihsetelahpajak = $labarugibersihsebelumpajak - $pajakusaha;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h3> <b> LABA/RUGI BERSIH (Setelah Pajak) <span style="color:red;font-weight:bold;">(H - I + J - K - L)</span> </b> </h3>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;font-size:22px;">';

    if($labarugibersihsetelahpajak > 0){
      $html .= '<b>Rp. '.number_format($labarugibersihsetelahpajak, 2, ',', '.') .'</b>';
    }else{
      $html .= '<b style="color:red;">Rp. '.number_format($labarugibersihsetelahpajak, 2, ',', '.') .'</b>';
    }

    $html .= '</div> </div>';

    return $html;

  }

}
