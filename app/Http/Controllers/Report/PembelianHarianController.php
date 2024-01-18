<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PembelianHarianController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index($param){
    $date = \Carbon\Carbon::now()->format('Y-m-d');
    if($param != 'today'){
      $date = $param;
    }

    $pembelians = DB::table('pembelians')->where('tanggal',$date)->orderBy('status','asc')->orderBy('created_at','desc')->get();

    return view('apps.report.pembelian-harian',['date' => $date, 'pembelians' => $pembelians]);
  }

  public function index_masuk($param){
    $date = \Carbon\Carbon::now()->format('Y-m-d');
    if($param != 'today'){
      $date = $param;
    }

    $pembelians = DB::table('pembelians')->where('tanggal',$date)->where('status','Belum Selesai')->orderBy('status','asc')->orderBy('created_at','desc')->get();

    return view('apps.report.pembelian-harian',['date' => $date, 'pembelians' => $pembelians]);
  }

  public function index_hasil_timbang($param){
    $date = \Carbon\Carbon::now()->format('Y-m-d');
    if($param != 'today'){
      $date = $param;
    }

    $pembelians = DB::table('pembelians')->where('tanggal',$date)->where('status','!=','Belum Selesai')->orderBy('status','asc')->orderBy('created_at','desc')->get();

    return view('apps.report.pembelian-harian',['date' => $date, 'pembelians' => $pembelians]);
  }
}
