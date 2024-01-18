<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class NeracaController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.report.neraca');
  }

  public function get_data(Request $request){

    $createdatselesai = $request->tanggal.' 23:59:59';

    $html = "";

    // SEGMEN AKTIVA
    $html .= '<div class="col-md-6 pr-3 pl-3">';

    $html .= '<h1 style="margin-left:-27px;margin-bottom:30px;"> Aktiva </h1>';


    // AKTIVA LANCAR

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
      '<h3> <b> Aktiva Lancar </b> </h3>'.
      '</div>';


    // looping kas & bank


    $html .= '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Kas dan Bank </b> </h4>'.
      '</div>';

    $akunskasbank = DB::table('akuns')->where('kategori','Kas & Bank')->get();

    $totalkasbank = 0;

    foreach($akunskasbank as $akunkasbank){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunkasbank->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunkasbank->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $debet + $akunkasbank->saldo_awal - $kredit;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-3">'. $akunkasbank->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalkasbank += $total;

    }


    // TOTAL KAS & BANK

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Jumlah Kas dan Bank </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalkasbank, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // looping piutang usaha


    $html .= '<div class="row mt-1">'.
      '<h4 style="margin-left:15px;"> <b> Piutang Dagang </b> </h4>'.
      '</div>';

    $akunspiutangusaha = DB::table('akuns')->where('kategori','Piutang Usaha')->get();

    $totalpiutangusaha = 0;

    foreach($akunspiutangusaha as $akunpiutangusaha){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunpiutangusaha->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunpiutangusaha->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $debet + $akunpiutangusaha->saldo_awal - $kredit;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-3">'. $akunpiutangusaha->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalpiutangusaha += $total;

    }


    // TOTAL PIUTANG DAGANG

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Jumlah Piutang Dagang </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalpiutangusaha, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // looping PERSEDIAAN BARANG DAGANG

    $html .= '<div class="row mt-1">'.
      '<h4 style="margin-left:15px;"> <b> Persediaan Barang Dagang </b> </h4>'.
      '</div>';

    $totalpersediaanakhir = 0;

    $kategoribarangs = DB::table('kategori_barangs')->get();

    foreach($kategoribarangs as $kategoribarang){

      $barangbelis = DB::table('barang_belis')->where('id_kategori',$kategoribarang->id)->get();

      $totalpersediaanakhirkategori = 0;

      foreach($barangbelis as $barangbeli) {

        $totalstokpembelianakhir = DB::table('pembelians')
          ->join('pembelian_details', 'pembelians.id', '=', 'pembelian_details.id_pembelians')
          ->select(DB::raw("SUM(pembelian_details.total_beli) as totalbeli"))
          ->where('pembelians.tanggal', '<=',$request->tanggal)
          ->where('pembelians.status', '=', 'Selesai')
          ->where('pembelian_details.id_barang_belis',$barangbeli->id)
          ->get();

        $totalstokpenjualanakhir = DB::table('penjualans')
          ->join('penjualan_details', 'penjualans.id', '=', 'penjualan_details.id_penjualans')
          ->join('pemotongan_penjualans', 'penjualan_details.id', '=', 'pemotongan_penjualans.id_penjualan_details')
          ->select(DB::raw("SUM(pemotongan_penjualans.total) as totaljual"))
          ->where('penjualans.tanggal', '<=',$request->tanggal)
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
          ->where('pembelians.tanggal', '<=',$request->tanggal)
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

        $totalpersediaanakhirkategori += $persediaanakhir;

      }

      if($totalpersediaanakhirkategori != 0){

        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-3"> Persediaan Barang Dagang '. $kategoribarang->nama .' </div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($totalpersediaanakhirkategori,2,',','.').
          '</div>'.
          '</div>';

      }


    }

    // TOTAL PERSEDIAAN BARANG DAGANG

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Jumlah Persediaan Barang Dagang </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalpersediaanakhir, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // looping perlengkapan


    $html .= '<div class="row mt-1">'.
      '<h4 style="margin-left:15px;"> <b> Perlengkapan </b> </h4>'.
      '</div>';

    $akunsperlengkapan = DB::table('akuns')->where('kategori','Perlengkapan')->get();

    $totalperlengkapan = 0;

    foreach($akunsperlengkapan as $akunperlengkapan){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunperlengkapan->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunperlengkapan->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $debet + $akunperlengkapan->saldo_awal - $kredit;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-3">'. $akunperlengkapan->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalperlengkapan += $total;

    }


    // TOTAL PERLENGKAPAN

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Jumlah Perlengkapan </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalperlengkapan, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // looping biaya dibayar dimuka


    $html .= '<div class="row mt-1">'.
      '<h4 style="margin-left:15px;"> <b> Biaya Dibayar Dimuka </b> </h4>'.
      '</div>';

    $akunsbiayadibayardimuka = DB::table('akuns')->where('kategori','Biaya Dibayar Dimuka')->get();

    $totalbiayadibayardimuka = 0;

    foreach($akunsbiayadibayardimuka as $akunbiayadibayardimuka){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunbiayadibayardimuka->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunbiayadibayardimuka->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $debet + $akunbiayadibayardimuka->saldo_awal - $kredit;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-3">'. $akunbiayadibayardimuka->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalbiayadibayardimuka += $total;

    }


    // TOTAL BIAYA DIBAYAR DIMUKA

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Jumlah Biaya Dibayar Dimuka </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalbiayadibayardimuka, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // looping aset lancar


    $html .= '<div class="row mt-1">'.
      '<h4 style="margin-left:15px;"> <b> Aset Lancar </b> </h4>'.
      '</div>';

    $akunsasetlancar = DB::table('akuns')->where('kategori','Aset Lancar')->get();

    $totalasetlancar = 0;

    foreach($akunsasetlancar as $akunasetlancar){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunasetlancar->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunasetlancar->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $debet + $akunasetlancar->saldo_awal - $kredit;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-3">'. $akunasetlancar->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalasetlancar += $total;

    }


    // TOTAL ASET LANCAR

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Jumlah Aset Lancar </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalasetlancar, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';


    // TOTAL AKTIVA LANCAR

    $totalaktivalancar = $totalkasbank + $totalpiutangusaha + $totalpersediaanakhir + $totalperlengkapan + $totalbiayadibayardimuka + $totalasetlancar;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b>Total AKTIVA LANCAR </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalaktivalancar, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';


    // AKTIVA TETAP

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
      '<h3> <b> Aktiva Tetap </b> </h3>'.
      '</div>';


    // looping aset tetap


    $html .= '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Nilai Histori </b> </h4>'.
      '</div>';

    $akunsasettetap = DB::table('akuns')->where('kategori','Aset Tetap')->get();

    $totalasettetap = 0;

    foreach($akunsasettetap as $akunasettetap){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunasettetap->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunasettetap->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $debet + $akunasettetap->saldo_awal - $kredit;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-3">'. $akunasettetap->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalasettetap += $total;

    }


    // TOTAL ASET TETAP

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Jumlah Nilai Histori </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalasettetap, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // looping akumulasi penyusutan


    $html .= '<div class="row mt-1">'.
      '<h4 style="margin-left:15px;"> <b> Akumulasi Penyusutan </b> </h4>'.
      '</div>';

    $akunsakumulasipenyusutan = DB::table('akuns')->where('kategori','Akumulasi Penyusutan')->get();

    $totalakumulasipenyusutan = 0;

    foreach($akunsakumulasipenyusutan as $akunakumulasipenyusutan){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunakumulasipenyusutan->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunakumulasipenyusutan->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $debet - $akunakumulasipenyusutan->saldo_awal - $kredit;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-3">'. $akunakumulasipenyusutan->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalakumulasipenyusutan += $total;

    }


    // TOTAL AKUMULASI PENYUSUTAN

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Jumlah Akumulasi Penyusutan </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;color:red;">'.
      '<b>(Rp. '.number_format($totalakumulasipenyusutan, 2, ',', '.') .')</b>'.
      '</div>'.
      '</div>';


    // TOTAL AKTIVA TETAP

    $totalaktivatetap = $totalasettetap + $totalakumulasipenyusutan;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b>Total AKTIVA TETAP </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalaktivatetap, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';


    // AKTIVA LAINNYA

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
      '<h3> <b> Aktiva Lainnya </b> </h3>'.
      '</div>';


    // looping aset lainnya

    $akunsasetlainnya = DB::table('akuns')->where('kategori','Aset Lainnya')->get();

    $totalasetlainnya = 0;

    foreach($akunsasetlainnya as $akunasetlainnya){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunasetlainnya->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunasetlainnya->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $debet + $akunasetlainnya->saldo_awal - $kredit;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-3">'. $akunasetlainnya->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalasetlainnya += $total;

    }


    // TOTAL AKTIVA LAINNYA

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4> <b>Total AKTIVA LAINNYA </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalasetlainnya, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // TOTAL AKTIVA LANCAR

    $totalakhiraktiva = $totalaktivalancar + $totalaktivatetap + $totalasetlainnya;


    $html .= '<div class="row mt-2">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<h3 style="margin-left:-25px;"> <b>Total AKTIVA </b> </h3>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b style="font-size:20px;">Rp. '.number_format($totalakhiraktiva, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';


    $html .= '</div>';


    // SEGMEN PASIVA & EKUITAS

    $html .= '<div class="col-md-6 pr-3 pl-3">';

    $html .= '<h1 style="margin-left:-35px;margin-bottom:30px;"> Kewajiban dan Ekuitas </h1>';


    // PASIVA

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
      '<h3> <b> Kewajiban </b> </h3>'.
      '</div>';

    // PASIVA LANCAR

    $html .= '<div class="row" style="margin-bottom:5px;margin-top:5px;">'.
      '<h4 style="margin-left:15px;"> <b> Kewajiban Lancar </b> </h4>'.
      '</div>';


    // looping utang usaha


    $html .= '<div class="row">'.
      '<h4 style="margin-left:30px;"> <b> Utang Dagang </b> </h4>'.
      '</div>';

    $akunsutangusaha = DB::table('akuns')->where('kategori','Utang Usaha')->get();

    $totalutangusaha = 0;

    foreach($akunsutangusaha as $akunutangusaha){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunutangusaha->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunutangusaha->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $kredit + $akunutangusaha->saldo_awal - $debet;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-4">'. $akunutangusaha->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalutangusaha += $total;

    }


    // TOTAL UTANG USAHA

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:30px;"> <b> Jumlah Utang Dagang </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalutangusaha, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';


    // looping liabilitas jangka pendek


    $html .= '<div class="row">'.
      '<h4 style="margin-left:30px;"> <b> Kewajiban Lancar Lain </b> </h4>'.
      '</div>';

    $akunsliabilitasjangkapendek = DB::table('akuns')->where('kategori','Liabilitas Jangka Pendek')->get();

    $totalliabilitasjangkapendek = 0;

    foreach($akunsliabilitasjangkapendek as $akunliabilitasjangkapendek){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunliabilitasjangkapendek->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunliabilitasjangkapendek->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $kredit + $akunliabilitasjangkapendek->saldo_awal - $debet;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-4">'. $akunliabilitasjangkapendek->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalliabilitasjangkapendek += $total;

    }


    // TOTAL LIABILITAS JANGKA PENDEK

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:30px;"> <b> Jumlah Kewajiban Lancar Lain </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalliabilitasjangkapendek, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';


    // TOTAL PASIVA LANCAR

    $totalpasivalancar = $totalutangusaha + $totalliabilitasjangkapendek;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b>Total Kewajiban Lancar </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalpasivalancar, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // LIABILITAS JANGKA PANJANG

    $html .= '<div class="row" style="margin-bottom:5px;margin-top:5px;">'.
      '<h4 style="margin-left:15px;"> <b> Kewajiban Jangka Panjang </b> </h4>'.
      '</div>';


    // looping liabilitas jangka panjang

    $akunsliabilitasjangkapanjang = DB::table('akuns')->where('kategori','Liabilitas Jangka Panjang')->get();

    $totalliabilitasjangkapanjang = 0;

    foreach($akunsliabilitasjangkapanjang as $akunliabilitasjangkapanjang){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunliabilitasjangkapanjang->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunliabilitasjangkapanjang->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $kredit + $akunliabilitasjangkapanjang->saldo_awal - $debet;

      if($total != 0){
        $html .= '<div class="row">'.
          '<div class="col-md-7 col-sm-7 pl-4">'. $akunliabilitasjangkapanjang->nama .'</div>'.
          '<div class="col-md-5 col-sm-5 text-right">'.
          'Rp. '.number_format($total,2,',','.').
          '</div>'.
          '</div>';
      }

      $totalliabilitasjangkapanjang += $total;

    }


    // TOTAL LIABILITAS JANGKA PANJANG

    $html .= '<div class="row" style="margin-top:10px;">'.
      '<div class="col-md-7 col-sm-7">'.
      '<div class="row">'.
      '<h4 style="margin-left:15px;"> <b> Jumlah Kewajiban Jangka Panjang </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;">'.
      '<b>Rp. '.number_format($totalliabilitasjangkapanjang, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';



    // TOTAL PASIVA

    $totalakhirpasiva = $totalpasivalancar + $totalliabilitasjangkapanjang;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h3> <b>Total Kewajiban </b> </h3>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalakhirpasiva, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';


    // EKUITAS

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
      '<h3> <b> Ekuitas </b> </h3>'.
      '</div>';


    // looping modal

    $akunsmodal = DB::table('akuns')->where('kategori','Modal')->where('kode_akun','!=','3102')->get();

    $totalmodal = 0;

    foreach($akunsmodal as $akunmodal){

      $debet = 0;
      $kredit = 0;
      $total = 0;

      $query_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunmodal->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$query_d->isEmpty()) {
        $debet = $query_d[0]->totalnominal;
      }

      $query_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunmodal->kode_akun)
        ->where('jurnals.tanggal','<=',$request->tanggal)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$query_k->isEmpty()) {
        $kredit = $query_k[0]->totalnominal;
      }

      $total = $kredit + $akunmodal->saldo_awal - $debet;

      $html .= '<div class="row">'.
        '<div class="col-md-7 col-sm-7">'. $akunmodal->nama .'</div>'.
        '<div class="col-md-5 col-sm-5 text-right">'.
        'Rp. '.number_format($total,2,',','.').
        '</div>'.
        '</div>';

      $totalmodal += $total;

    }


    // laba rugi ditahan

    $debet = 0;
    $kredit = 0;
    $totallabarugiditahan = 0;

    $labarugiberjalan = 0;

    $tanggalmulai = \Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggal)->subYears(1)->format('Y').'-12-31';

    $createdatselesai = $tanggalmulai.' 23:59:59';

    // penjualan 4101

    $debetpenjualan = 0;
    $kreditpenjualan = 0;
    $totalpenjualan = 0;

    $penjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4101')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$penjualan_d->isEmpty()) {
      $debetpenjualan = $penjualan_d[0]->totalnominal;
    }

    $penjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4101')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$penjualan_k->isEmpty()) {
      $kreditpenjualan = $penjualan_k[0]->totalnominal;
    }

    $totalpenjualan = $kreditpenjualan - $debetpenjualan;


    // retur penjualan 4102

    $debetreturpenjualan = 0;
    $kreditreturpenjualan = 0;
    $totalreturpenjualan = 0;

    $returpenjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4102')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$returpenjualan_d->isEmpty()) {
      $debetreturpenjualan = $returpenjualan_d[0]->totalnominal;
    }

    $returpenjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4102')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$returpenjualan_k->isEmpty()) {
      $kreditreturpenjualan = $returpenjualan_k[0]->totalnominal;
    }

    $totalreturpenjualan = $debetreturpenjualan - $kreditreturpenjualan;


    // potongan penjualan 4103

    $debetpotonganpenjualan = 0;
    $kreditpotonganpenjualan = 0;
    $totalpotonganpenjualan = 0;

    $potonganpenjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4103')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$potonganpenjualan_d->isEmpty()) {
      $debetpotonganpenjualan = $potonganpenjualan_d[0]->totalnominal;
    }

    $potonganpenjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4103')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$potonganpenjualan_k->isEmpty()) {
      $kreditpotonganpenjualan = $potonganpenjualan_k[0]->totalnominal;
    }

    $totalpotonganpenjualan = $debetpotonganpenjualan - $kreditpotonganpenjualan;


    // biaya tambahan penjualan 4104

    $debetbiayatambahanpenjualan = 0;
    $kreditbiayatambahanpenjualan = 0;
    $totalbiayatambahanpenjualan = 0;

    $biayatambahanpenjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4104')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$biayatambahanpenjualan_d->isEmpty()) {
      $debetbiayatambahanpenjualan = $biayatambahanpenjualan_d[0]->totalnominal;
    }

    $biayatambahanpenjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4104')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$biayatambahanpenjualan_k->isEmpty()) {
      $kreditbiayatambahanpenjualan = $biayatambahanpenjualan_k[0]->totalnominal;
    }

    $totalbiayatambahanpenjualan = $kreditbiayatambahanpenjualan - $debetbiayatambahanpenjualan;


    // potongan biaya penjualan 4105

    $debetpotonganbiayapenjualan = 0;
    $kreditpotonganbiayapenjualan = 0;
    $totalpotonganbiayapenjualan = 0;

    $potonganbiayapenjualan_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4105')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$potonganbiayapenjualan_d->isEmpty()) {
      $debetpotonganbiayapenjualan = $potonganbiayapenjualan_d[0]->totalnominal;
    }

    $potonganbiayapenjualan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4105')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$potonganbiayapenjualan_k->isEmpty()) {
      $kreditpotonganbiayapenjualan = $potonganbiayapenjualan_k[0]->totalnominal;
    }

    $totalpotonganbiayapenjualan = $debetpotonganbiayapenjualan - $kreditpotonganbiayapenjualan;

    // TOTAL PENDAPATAN OPERASIONAL

    $totalpendapatanoperasional = $totalpenjualan - $totalreturpenjualan - $totalpotonganpenjualan + $totalbiayatambahanpenjualan - $totalpotonganbiayapenjualan;


    // pembelian 5101

    $debetpembelian = 0;
    $kreditpembelian = 0;
    $totalpembelian = 0;

    $pembelian_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5101')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$pembelian_d->isEmpty()) {
      $debetpembelian = $pembelian_d[0]->totalnominal;
    }

    $pembelian_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5101')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$pembelian_k->isEmpty()) {
      $kreditpembelian = $pembelian_k[0]->totalnominal;
    }

    $totalpembelian = $debetpembelian - $kreditpembelian;

    // potongan pembelian 5102

    $debetpotonganpembelian = 0;
    $kreditpotonganpembelian = 0;
    $totalpotonganpembelian = 0;

    $potonganpembelian_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5102')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$potonganpembelian_d->isEmpty()) {
      $debetpotonganpembelian = $potonganpembelian_d[0]->totalnominal;
    }

    $potonganpembelian_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5102')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$potonganpembelian_k->isEmpty()) {
      $kreditpotonganpembelian = $potonganpembelian_k[0]->totalnominal;
    }

    $totalpotonganpembelian = $kreditpotonganpembelian - $debetpotonganpembelian;


    // biaya tambahan pembelian 5103

    $debetbiayatambahanpembelian = 0;
    $kreditbiayatambahanpembelian = 0;
    $totalbiayatambahanpembelian = 0;

    $biayatambahanpembelian_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5103')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$biayatambahanpembelian_d->isEmpty()) {
      $debetbiayatambahanpembelian = $biayatambahanpembelian_d[0]->totalnominal;
    }

    $biayatambahanpembelian_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5103')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$biayatambahanpembelian_k->isEmpty()) {
      $kreditbiayatambahanpembelian = $biayatambahanpembelian_k[0]->totalnominal;
    }

    $totalbiayatambahanpembelian = $debetbiayatambahanpembelian - $kreditbiayatambahanpembelian;


    // TOTAL PEMBELIAN

    $totalpembelianoperasional = $totalpembelian - $totalpotonganpembelian + $totalbiayatambahanpembelian;

    $totalpersediaanawal = 0;

    $barangtersediauntukdijual = $totalpersediaanawal + $totalpembelianoperasional;


    $totalpersediaanakhir = 0;

    $kategoribarangs = DB::table('kategori_barangs')->get();

    foreach($kategoribarangs as $kategoribarang){

      $barangbelis = DB::table('barang_belis')->where('id_kategori',$kategoribarang->id)->get();

      $totalpersediaanakhirkategori = 0;

      foreach($barangbelis as $barangbeli) {

        $totalstokpembelianakhir = DB::table('pembelians')
          ->join('pembelian_details', 'pembelians.id', '=', 'pembelian_details.id_pembelians')
          ->select(DB::raw("SUM(pembelian_details.total_beli) as totalbeli"))
          ->where('pembelians.tanggal', '<=',$tanggalmulai)
          ->where('pembelians.status', '=', 'Selesai')
          ->where('pembelian_details.id_barang_belis',$barangbeli->id)
          ->get();

        $totalstokpenjualanakhir = DB::table('penjualans')
          ->join('penjualan_details', 'penjualans.id', '=', 'penjualan_details.id_penjualans')
          ->join('pemotongan_penjualans', 'penjualan_details.id', '=', 'pemotongan_penjualans.id_penjualan_details')
          ->select(DB::raw("SUM(pemotongan_penjualans.total) as totaljual"))
          ->where('penjualans.tanggal', '<=',$tanggalmulai)
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
          ->where('pembelians.tanggal', '<=',$tanggalmulai)
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

        $totalpersediaanakhirkategori += $persediaanakhir;

      }

    }

    $hargapokokpenjualan = $barangtersediauntukdijual - $totalpersediaanakhir;


    // LABA KOTOR OPERASIONAL

    $labakotoroperasional = $totalpendapatanoperasional - $hargapokokpenjualan;

//    $html .= $totalpersediaanakhir;


    // penjualan dropshipper 4201

    $debetdropshipper = 0;
    $kreditdropshipper = 0;
    $totaldropshipper = 0;

    $dropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4201')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$dropshipper_d->isEmpty()) {
      $debetdropshipper = $dropshipper_d[0]->totalnominal;
    }

    $dropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4201')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$dropshipper_k->isEmpty()) {
      $kreditdropshipper = $dropshipper_k[0]->totalnominal;
    }

    $totaldropshipper = $kreditdropshipper - $debetdropshipper;


    // beban tambahan dropshipper kontainer 4202

    $debettambahandropshipper = 0;
    $kredittambahandropshipper = 0;
    $totaltambahandropshipper = 0;

    $tambahandropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4202')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$tambahandropshipper_d->isEmpty()) {
      $debettambahandropshipper = $tambahandropshipper_d[0]->totalnominal;
    }

    $tambahandropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4202')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$tambahandropshipper_k->isEmpty()) {
      $kredittambahandropshipper = $tambahandropshipper_k[0]->totalnominal;
    }

    $totaltambahandropshipper = $debettambahandropshipper - $kredittambahandropshipper;


    // komisi dropshipper kontainer 4203

    $debetkomisiropshipper = 0;
    $kreditkomisiropshipper = 0;
    $totalkomisidropshipper = 0;

    $komisiropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4203')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$komisiropshipper_d->isEmpty()) {
      $debetkomisiropshipper = $komisiropshipper_d[0]->totalnominal;
    }

    $komisiropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4203')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$komisiropshipper_k->isEmpty()) {
      $kreditkomisiropshipper = $komisiropshipper_k[0]->totalnominal;
    }

    $totalkomisidropshipper = $debetkomisiropshipper - $kreditkomisiropshipper;


    // TOTAL PENDAPATAN DROPSHIPPER

    $totalpendapatandropshipper = $totaldropshipper - $totaltambahandropshipper - $totalkomisidropshipper;


    // pembelian dropshipper 5201

    $debetpembeliandropshipper = 0;
    $kreditpembeliandropshipper = 0;
    $totalpembeliandropshipper = 0;

    $pembeliandropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5201')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$pembeliandropshipper_d->isEmpty()) {
      $debetpembeliandropshipper = $pembeliandropshipper_d[0]->totalnominal;
    }

    $pembeliandropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5201')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$pembeliandropshipper_k->isEmpty()) {
      $kreditpembeliandropshipper = $pembeliandropshipper_k[0]->totalnominal;
    }

    $totalpembeliandropshipper = $debetpembeliandropshipper - $kreditpembeliandropshipper;


    // biaya tambahan pembelian dropshipper 5202

    $debetbiayatambahanpembeliandropshipper = 0;
    $kreditbiayatambahanpembeliandropshipper = 0;
    $totalbiayatambahanpembeliandropshipper = 0;

    $biayatambahanpembeliandropshipper_d = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5202')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$biayatambahanpembeliandropshipper_d->isEmpty()) {
      $debetbiayatambahanpembeliandropshipper = $biayatambahanpembeliandropshipper_d[0]->totalnominal;
    }

    $biayatambahanpembeliandropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5202')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$biayatambahanpembeliandropshipper_k->isEmpty()) {
      $kreditbiayatambahanpembeliandropshipper = $biayatambahanpembeliandropshipper_k[0]->totalnominal;
    }

    $totalbiayatambahanpembeliandropshipper = $debetbiayatambahanpembeliandropshipper - $kreditbiayatambahanpembeliandropshipper;


    // TOTAL PEMBELIAN DROPSHIPPER

    $totalpembeliandropshipper = $totalpembeliandropshipper + $totalbiayatambahanpembeliandropshipper;


    // LABA KOTOR DROPSHIPPER

    $labakotordropshipper = $totalpendapatandropshipper - $totalpembeliandropshipper;


    // LABA KOTOR USAHA

    $labakotorusaha = $labakotoroperasional + $labakotordropshipper;


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
        ->where('jurnals.tanggal','<=',$tanggalmulai)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$beban_d->isEmpty()) {
        $debetbeban = $beban_d[0]->totalnominal;
      }

      $beban_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunbeban->kode_akun)
        ->where('jurnals.tanggal','<=',$tanggalmulai)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$beban_k->isEmpty()) {
        $kreditbeban = $beban_k[0]->totalnominal;
      }

      $totalbeban = $debetbeban - $kreditbeban;

      $totalbebanoperasional += $totalbeban;

    }


    // TOTAL PENDAPATAN OPERASIONAL

    $totalakhirpendapatanoperasional = $labakotorusaha - $totalbebanoperasional;


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
        ->where('jurnals.tanggal','<=',$tanggalmulai)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$pendapatan_d->isEmpty()) {
        $debetpendapatanlainlain = $pendapatan_d[0]->totalnominal;
      }

      $pendapatan_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunpendapatanlainlain->kode_akun)
        ->where('jurnals.tanggal','<=',$tanggalmulai)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$pendapatan_k->isEmpty()) {
        $kreditpendapatanlainlain = $pendapatan_k[0]->totalnominal;
      }

      $totalpendapatanlainlain = $kreditpendapatanlainlain - $debetpendapatanlainlain;

      $totalakhirpendapatanlainlain += $totalpendapatanlainlain;

    }


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
        ->where('jurnals.tanggal','<=',$tanggalmulai)
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$beban_d->isEmpty()) {
        $debetbeban = $beban_d[0]->totalnominal;
      }

      $beban_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=',$akunbebanlainlain->kode_akun)
        ->where('jurnals.tanggal','<=',$tanggalmulai)
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$beban_k->isEmpty()) {
        $kreditbeban = $beban_k[0]->totalnominal;
      }

      $totalbeban = $debetbeban - $kreditbeban;

      $totalakhirbebanlainlain += $totalbeban;

    }


    // TOTAL PENDAPATAN LAIN LAIN

    $totalakhirpendapatandanbebanlainlain = $totalakhirpendapatanlainlain - $totalakhirbebanlainlain;


    // LABA / RUGI BERSIH SEBELUM PAJAK

    $labarugibersihsebelumpajak = $totalakhirpendapatanoperasional + $totalakhirpendapatandanbebanlainlain;


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
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$pajakkeluaran_d->isEmpty()) {
      $debetpajakkeluaran = $pajakkeluaran_d[0]->totalnominal;
    }

    $pajakkeluaran_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','2501')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
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
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$pajakmasukan_d->isEmpty()) {
      $debetpajakmasukan = $pajakmasukan_d[0]->totalnominal;
    }

    $pajakmasukan_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','2401')
      ->where('jurnals.tanggal','<=',$tanggalmulai)
      ->where('jurnal_detils.tipe','=','K')
      ->get();

    if(!$pajakmasukan_k->isEmpty()) {
      $kreditpajakmasukan = $pajakmasukan_k[0]->totalnominal;
    }

    $totalpajakmasukan = $debetpajakmasukan - $kreditpajakmasukan;


    $pajakusaha = $totalpajakkeluaran - $totalpajakmasukan;


    // LABA / RUGI BERSIH SETELAH PAJAK

    $labarugibersihsetelahpajak = $labarugibersihsebelumpajak - $pajakusaha;

    $labarugiberjalan = $labarugibersihsebelumpajak;

    $html .= '<div class="row">'.
      '<div class="col-md-7 col-sm-7"> Laba / Rugi Ditahan </div>'.
      '<div class="col-md-5 col-sm-5 text-right">'.
      'Rp. '.number_format($labarugiberjalan,2,',','.').
      '</div>'.
      '</div>';









    // LABA RUGI BERJALAN

    $labarugiberjalan = 0;

    $tanggalmulai = \Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggal)->format('Y').'-01-01';
    $tanggalselesai = $request->tanggal;

    $createdatmulai = $tanggalmulai.' 00:00:00';
    $createdatselesai = $request->tanggal.' 23:59:59';

      // penjualan 4101

      $debetpenjualan = 0;
      $kreditpenjualan = 0;
      $totalpenjualan = 0;

      $penjualan_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4101')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$penjualan_d->isEmpty()) {
        $debetpenjualan = $penjualan_d[0]->totalnominal;
      }

      $penjualan_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4101')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$penjualan_k->isEmpty()) {
        $kreditpenjualan = $penjualan_k[0]->totalnominal;
      }

      $totalpenjualan = $kreditpenjualan - $debetpenjualan;


      // retur penjualan 4102

      $debetreturpenjualan = 0;
      $kreditreturpenjualan = 0;
      $totalreturpenjualan = 0;

      $returpenjualan_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4102')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$returpenjualan_d->isEmpty()) {
        $debetreturpenjualan = $returpenjualan_d[0]->totalnominal;
      }

      $returpenjualan_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4102')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$returpenjualan_k->isEmpty()) {
        $kreditreturpenjualan = $returpenjualan_k[0]->totalnominal;
      }

      $totalreturpenjualan = $debetreturpenjualan - $kreditreturpenjualan;


      // potongan penjualan 4103

      $debetpotonganpenjualan = 0;
      $kreditpotonganpenjualan = 0;
      $totalpotonganpenjualan = 0;

      $potonganpenjualan_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4103')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$potonganpenjualan_d->isEmpty()) {
        $debetpotonganpenjualan = $potonganpenjualan_d[0]->totalnominal;
      }

      $potonganpenjualan_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4103')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$potonganpenjualan_k->isEmpty()) {
        $kreditpotonganpenjualan = $potonganpenjualan_k[0]->totalnominal;
      }

      $totalpotonganpenjualan = $debetpotonganpenjualan - $kreditpotonganpenjualan;


      // biaya tambahan penjualan 4104

      $debetbiayatambahanpenjualan = 0;
      $kreditbiayatambahanpenjualan = 0;
      $totalbiayatambahanpenjualan = 0;

      $biayatambahanpenjualan_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4104')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$biayatambahanpenjualan_d->isEmpty()) {
        $debetbiayatambahanpenjualan = $biayatambahanpenjualan_d[0]->totalnominal;
      }

      $biayatambahanpenjualan_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4104')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$biayatambahanpenjualan_k->isEmpty()) {
        $kreditbiayatambahanpenjualan = $biayatambahanpenjualan_k[0]->totalnominal;
      }

      $totalbiayatambahanpenjualan = $kreditbiayatambahanpenjualan - $debetbiayatambahanpenjualan;


      // potongan biaya penjualan 4105

      $debetpotonganbiayapenjualan = 0;
      $kreditpotonganbiayapenjualan = 0;
      $totalpotonganbiayapenjualan = 0;

      $potonganbiayapenjualan_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4105')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$potonganbiayapenjualan_d->isEmpty()) {
        $debetpotonganbiayapenjualan = $potonganbiayapenjualan_d[0]->totalnominal;
      }

      $potonganbiayapenjualan_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4105')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$potonganbiayapenjualan_k->isEmpty()) {
        $kreditpotonganbiayapenjualan = $potonganbiayapenjualan_k[0]->totalnominal;
      }

      $totalpotonganbiayapenjualan = $debetpotonganbiayapenjualan - $kreditpotonganbiayapenjualan;

      // TOTAL PENDAPATAN OPERASIONAL

      $totalpendapatanoperasional = $totalpenjualan - $totalreturpenjualan - $totalpotonganpenjualan + $totalbiayatambahanpenjualan - $totalpotonganbiayapenjualan;


      // pembelian 5101

      $debetpembelian = 0;
      $kreditpembelian = 0;
      $totalpembelian = 0;

      $pembelian_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5101')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$pembelian_d->isEmpty()) {
        $debetpembelian = $pembelian_d[0]->totalnominal;
      }

      $pembelian_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5101')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$pembelian_k->isEmpty()) {
        $kreditpembelian = $pembelian_k[0]->totalnominal;
      }

      $totalpembelian = $debetpembelian - $kreditpembelian;


      // potongan pembelian 5102

      $debetpotonganpembelian = 0;
      $kreditpotonganpembelian = 0;
      $totalpotonganpembelian = 0;

      $potonganpembelian_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5102')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$potonganpembelian_d->isEmpty()) {
        $debetpotonganpembelian = $potonganpembelian_d[0]->totalnominal;
      }

      $potonganpembelian_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5102')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$potonganpembelian_k->isEmpty()) {
        $kreditpotonganpembelian = $potonganpembelian_k[0]->totalnominal;
      }

      $totalpotonganpembelian = $kreditpotonganpembelian - $debetpotonganpembelian;


      // biaya tambahan pembelian 5103

      $debetbiayatambahanpembelian = 0;
      $kreditbiayatambahanpembelian = 0;
      $totalbiayatambahanpembelian = 0;

      $biayatambahanpembelian_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5103')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$biayatambahanpembelian_d->isEmpty()) {
        $debetbiayatambahanpembelian = $biayatambahanpembelian_d[0]->totalnominal;
      }

      $biayatambahanpembelian_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5103')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$biayatambahanpembelian_k->isEmpty()) {
        $kreditbiayatambahanpembelian = $biayatambahanpembelian_k[0]->totalnominal;
      }

      $totalbiayatambahanpembelian = $debetbiayatambahanpembelian - $kreditbiayatambahanpembelian;


      // TOTAL PEMBELIAN

      $totalpembelianoperasional = $totalpembelian - $totalpotonganpembelian + $totalbiayatambahanpembelian;

      $totalpersediaanawal = 0;

      $barangtersediauntukdijual = $totalpersediaanawal + $totalpembelianoperasional;



      $totalpersediaanakhir = 0;

      $kategoribarangs = DB::table('kategori_barangs')->get();

      foreach($kategoribarangs as $kategoribarang){

        $barangbelis = DB::table('barang_belis')->where('id_kategori',$kategoribarang->id)->get();

        $totalpersediaanakhirkategori = 0;

        foreach($barangbelis as $barangbeli) {

          $totalstokpembelianakhir = DB::table('pembelians')
            ->join('pembelian_details', 'pembelians.id', '=', 'pembelian_details.id_pembelians')
            ->select(DB::raw("SUM(pembelian_details.total_beli) as totalbeli"))
            ->whereBetween('pembelians.tanggal', [$tanggalmulai,$tanggalselesai])
            ->where('pembelians.status', '=', 'Selesai')
            ->where('pembelian_details.id_barang_belis',$barangbeli->id)
            ->get();

          $totalstokpenjualanakhir = DB::table('penjualans')
            ->join('penjualan_details', 'penjualans.id', '=', 'penjualan_details.id_penjualans')
            ->join('pemotongan_penjualans', 'penjualan_details.id', '=', 'pemotongan_penjualans.id_penjualan_details')
            ->select(DB::raw("SUM(pemotongan_penjualans.total) as totaljual"))
            ->whereBetween('penjualans.tanggal', [$tanggalmulai,$tanggalselesai])
            ->where('penjualans.status', '=', 'Selesai')
            ->where('pemotongan_penjualans.id_barang_belis',$barangbeli->id)
            ->get();

          $totalstokmutasimasukakhir = DB::table('mutasi_masuk_barang_belis')
            ->select(DB::raw("SUM(qty) as totalmutasimasuk"))
            ->whereBetween('created_at', [$createdatmulai,$createdatselesai])
            ->where('id_barang_belis',$barangbeli->id)
            ->get();

          $totalstokmutasikeluarakhir = DB::table('mutasi_keluar_barang_belis')
            ->select(DB::raw("SUM(qty) as totalmutasikeluar"))
            ->whereBetween('created_at', [$createdatmulai,$createdatselesai])
            ->where('id_barang_belis',$barangbeli->id)
            ->get();

          $hitunghargaakhir = DB::table('pembelians')
            ->join('pembelian_details', 'pembelians.id', '=', 'pembelian_details.id_pembelians')
            ->select([DB::raw("SUM(pembelian_details.subtotal) as totalnominal"),
              DB::raw("SUM(pembelian_details.total_beli) as totalbeli")])
            ->whereBetween('pembelians.tanggal', [$tanggalmulai,$tanggalselesai])
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

          $totalpersediaanakhirkategori += $persediaanakhir;

        }

      }



      $hargapokokpenjualan = $barangtersediauntukdijual - $totalpersediaanakhir;


    // LABA KOTOR OPERASIONAL

      $labakotoroperasional = $totalpendapatanoperasional - $hargapokokpenjualan;


      // penjualan dropshipper 4201

      $debetdropshipper = 0;
      $kreditdropshipper = 0;
      $totaldropshipper = 0;

      $dropshipper_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4201')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$dropshipper_d->isEmpty()) {
        $debetdropshipper = $dropshipper_d[0]->totalnominal;
      }

      $dropshipper_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4201')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$dropshipper_k->isEmpty()) {
        $kreditdropshipper = $dropshipper_k[0]->totalnominal;
      }

      $totaldropshipper = $kreditdropshipper - $debetdropshipper;


      // beban tambahan dropshipper kontainer 4202

      $debettambahandropshipper = 0;
      $kredittambahandropshipper = 0;
      $totaltambahandropshipper = 0;

      $tambahandropshipper_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4202')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$tambahandropshipper_d->isEmpty()) {
        $debettambahandropshipper = $tambahandropshipper_d[0]->totalnominal;
      }

      $tambahandropshipper_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4202')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$tambahandropshipper_k->isEmpty()) {
        $kredittambahandropshipper = $tambahandropshipper_k[0]->totalnominal;
      }

      $totaltambahandropshipper = $debettambahandropshipper - $kredittambahandropshipper;


      // komisi dropshipper kontainer 4203

      $debetkomisiropshipper = 0;
      $kreditkomisiropshipper = 0;
      $totalkomisidropshipper = 0;

      $komisiropshipper_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4203')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$komisiropshipper_d->isEmpty()) {
        $debetkomisiropshipper = $komisiropshipper_d[0]->totalnominal;
      }

      $komisiropshipper_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','4203')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$komisiropshipper_k->isEmpty()) {
        $kreditkomisiropshipper = $komisiropshipper_k[0]->totalnominal;
      }

      $totalkomisidropshipper = $debetkomisiropshipper - $kreditkomisiropshipper;


      // TOTAL PENDAPATAN DROPSHIPPER

      $totalpendapatandropshipper = $totaldropshipper - $totaltambahandropshipper - $totalkomisidropshipper;


      // pembelian dropshipper 5201

      $debetpembeliandropshipper = 0;
      $kreditpembeliandropshipper = 0;
      $totalpembeliandropshipper = 0;

      $pembeliandropshipper_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5201')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$pembeliandropshipper_d->isEmpty()) {
        $debetpembeliandropshipper = $pembeliandropshipper_d[0]->totalnominal;
      }

      $pembeliandropshipper_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5201')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$pembeliandropshipper_k->isEmpty()) {
        $kreditpembeliandropshipper = $pembeliandropshipper_k[0]->totalnominal;
      }

      $totalpembeliandropshipper = $debetpembeliandropshipper - $kreditpembeliandropshipper;


      // biaya tambahan pembelian dropshipper 5202

      $debetbiayatambahanpembeliandropshipper = 0;
      $kreditbiayatambahanpembeliandropshipper = 0;
      $totalbiayatambahanpembeliandropshipper = 0;

      $biayatambahanpembeliandropshipper_d = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5202')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$biayatambahanpembeliandropshipper_d->isEmpty()) {
        $debetbiayatambahanpembeliandropshipper = $biayatambahanpembeliandropshipper_d[0]->totalnominal;
      }

      $biayatambahanpembeliandropshipper_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','5202')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$biayatambahanpembeliandropshipper_k->isEmpty()) {
        $kreditbiayatambahanpembeliandropshipper = $biayatambahanpembeliandropshipper_k[0]->totalnominal;
      }

      $totalbiayatambahanpembeliandropshipper = $debetbiayatambahanpembeliandropshipper - $kreditbiayatambahanpembeliandropshipper;


      // TOTAL PEMBELIAN DROPSHIPPER

      $totalpembeliandropshipper = $totalpembeliandropshipper + $totalbiayatambahanpembeliandropshipper;


      // LABA KOTOR DROPSHIPPER

      $labakotordropshipper = $totalpendapatandropshipper - $totalpembeliandropshipper;


      // LABA KOTOR USAHA

      $labakotorusaha = $labakotoroperasional + $labakotordropshipper;


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
          ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
          ->where('jurnal_detils.tipe','=','D')
          ->get();

        if(!$beban_d->isEmpty()) {
          $debetbeban = $beban_d[0]->totalnominal;
        }

        $beban_k = DB::table('jurnal_detils')
          ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
          ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
          ->where('jurnal_detils.kode_akun','=',$akunbeban->kode_akun)
          ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
          ->where('jurnal_detils.tipe','=','K')
          ->get();

        if(!$beban_k->isEmpty()) {
          $kreditbeban = $beban_k[0]->totalnominal;
        }

        $totalbeban = $debetbeban - $kreditbeban;

        $totalbebanoperasional += $totalbeban;

      }


      // TOTAL PENDAPATAN OPERASIONAL

      $totalakhirpendapatanoperasional = $labakotorusaha - $totalbebanoperasional;


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
          ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
          ->where('jurnal_detils.tipe','=','D')
          ->get();

        if(!$pendapatan_d->isEmpty()) {
          $debetpendapatanlainlain = $pendapatan_d[0]->totalnominal;
        }

        $pendapatan_k = DB::table('jurnal_detils')
          ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
          ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
          ->where('jurnal_detils.kode_akun','=',$akunpendapatanlainlain->kode_akun)
          ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
          ->where('jurnal_detils.tipe','=','K')
          ->get();

        if(!$pendapatan_k->isEmpty()) {
          $kreditpendapatanlainlain = $pendapatan_k[0]->totalnominal;
        }

        $totalpendapatanlainlain = $kreditpendapatanlainlain - $debetpendapatanlainlain;

        $totalakhirpendapatanlainlain += $totalpendapatanlainlain;

      }


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
          ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
          ->where('jurnal_detils.tipe','=','D')
          ->get();

        if(!$beban_d->isEmpty()) {
          $debetbeban = $beban_d[0]->totalnominal;
        }

        $beban_k = DB::table('jurnal_detils')
          ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
          ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
          ->where('jurnal_detils.kode_akun','=',$akunbebanlainlain->kode_akun)
          ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
          ->where('jurnal_detils.tipe','=','K')
          ->get();

        if(!$beban_k->isEmpty()) {
          $kreditbeban = $beban_k[0]->totalnominal;
        }

        $totalbeban = $debetbeban - $kreditbeban;

        $totalakhirbebanlainlain += $totalbeban;

      }


      // TOTAL PENDAPATAN LAIN LAIN

      $totalakhirpendapatandanbebanlainlain = $totalakhirpendapatanlainlain - $totalakhirbebanlainlain;


      // LABA / RUGI BERSIH SEBELUM PAJAK

      $labarugibersihsebelumpajak = $totalakhirpendapatanoperasional + $totalakhirpendapatandanbebanlainlain;


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
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$pajakkeluaran_d->isEmpty()) {
        $debetpajakkeluaran = $pajakkeluaran_d[0]->totalnominal;
      }

      $pajakkeluaran_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','2501')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
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
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','D')
        ->get();

      if(!$pajakmasukan_d->isEmpty()) {
        $debetpajakmasukan = $pajakmasukan_d[0]->totalnominal;
      }

      $pajakmasukan_k = DB::table('jurnal_detils')
        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
        ->where('jurnal_detils.kode_akun','=','2401')
        ->whereBetween('jurnals.tanggal', [$tanggalmulai, $tanggalselesai])
        ->where('jurnal_detils.tipe','=','K')
        ->get();

      if(!$pajakmasukan_k->isEmpty()) {
        $kreditpajakmasukan = $pajakmasukan_k[0]->totalnominal;
      }

      $totalpajakmasukan = $debetpajakmasukan - $kreditpajakmasukan;


      $pajakusaha = $totalpajakkeluaran - $totalpajakmasukan;


      // LABA / RUGI BERSIH SETELAH PAJAK

      $labarugibersihsetelahpajak = $labarugibersihsebelumpajak - $pajakusaha;

    $labarugiberjalan = $labarugibersihsebelumpajak;



    $html .= '<div class="row">'.
      '<div class="col-md-7 col-sm-7"> Laba / Rugi Berjalan </div>'.
      '<div class="col-md-5 col-sm-5 text-right">'.
      'Rp. '.number_format($labarugiberjalan,2,',','.').
      '</div>'.
      '</div>';


    // TOTAL EKUITAS

    $totalakhirekuitas = $totalmodal + $totallabarugiditahan + $labarugiberjalan;

    $html .= '<div class="row mt-1">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<div class="row">'.
      '<h3> <b> Total Ekuitas </b> </h3>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b>Rp. '.number_format($totalakhirekuitas, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';




    // TOTAL KEWAJIBAN DAN EKUITAS

    $totalakhirkewajibanekuitas = $totalakhirpasiva + $totalakhirekuitas;


    $html .= '<div class="row mt-2">'.
      '<div class="col-md-7 col-sm-7" style="padding-top:5px;">'.
      '<h3 style="margin-left:-25px;"> <b>Total Kewajiban dan Ekuitas </b> </h3>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;">'.
      '<b style="font-size:20px;">Rp. '.number_format($totalakhirkewajibanekuitas, 2, ',', '.') .'</b>'.
      '</div>'.
      '</div>';

    $html .= '</div>';

    return $html;

  }

}
