<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LabaRugiDropshipperController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.report.laba-rugi-dropshipper');
  }

  public function get_data(Request $request){

    $html = "";

    // SEGMEN PENJUALAN


    // SEGMEN PENJUALAN DROPSHIPPER

    $html .= '<div class="row mt-1" style="margin-bottom:5px;">'.
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
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$dropshipper_d->isEmpty()) {
      $debetdropshipper = $dropshipper_d[0]->totalnominal;
    }

    $dropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4201')
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
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
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$tambahandropshipper_d->isEmpty()) {
      $debettambahandropshipper = $tambahandropshipper_d[0]->totalnominal;
    }

    $tambahandropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4202')
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
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
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$komisiropshipper_d->isEmpty()) {
      $debetkomisiropshipper = $komisiropshipper_d[0]->totalnominal;
    }

    $komisiropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','4203')
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
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
    '<h4> <b>Total PENDAPATAN DROPSHIPPER </b> </h4>'.
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
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$pembeliandropshipper_d->isEmpty()) {
      $debetpembeliandropshipper = $pembeliandropshipper_d[0]->totalnominal;
    }

    $pembeliandropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5201')
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
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
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
      ->where('jurnal_detils.tipe','=','D')
      ->get();

    if(!$biayatambahanpembeliandropshipper_d->isEmpty()) {
      $debetbiayatambahanpembeliandropshipper = $biayatambahanpembeliandropshipper_d[0]->totalnominal;
    }

    $biayatambahanpembeliandropshipper_k = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
      ->where('jurnal_detils.kode_akun','=','5202')
      ->whereBetween(DB::raw('MONTH(jurnals.tanggal)'), [substr($request->tanggalmulai,0,2),substr($request->tanggalselesai,0,2)])
      ->whereBetween(DB::raw('YEAR(jurnals.tanggal)'), [substr($request->tanggalmulai,-4),substr($request->tanggalselesai,-4)])
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
      '<h4> <b>Total PEMBELIAN DROPSHIPPER </b> </h4>'.
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
      '<h4> <b> LABA KOTOR DROPSHIPPER </b> </h4>'.
      '</div>'.
      '</div>'.
      '<div class="col-md-5 col-sm-5 text-right" style="border-top:1px solid black;padding-top:5px;font-size:20px;">';

    if($labakotordropshipper > 0){
      $html .= '<b>Rp. '.number_format($labakotordropshipper, 2, ',', '.') .'</b>';
    }else{
      $html .= '<b style="color:red;">Rp. '.number_format($labakotordropshipper, 2, ',', '.') .'</b>';
    }

    $html .= '</div> </div>';

    return $html;

  }

}
