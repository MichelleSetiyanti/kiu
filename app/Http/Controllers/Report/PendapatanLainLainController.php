<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PendapatanLainLainController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.report.pendapatan-lainlain');
  }

  public function list(Request $request){
    $pemasukans = DB::table('pemasukans')
      ->where(function($query) use ($request)
      {

        if ($request->divisi != "All") {
          $query->where('pemasukans.divisi', '=' , $request->divisi);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('pemasukans.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('pemasukans.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('pemasukans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('pemasukans.id','!=','0');

      })
      ->orderBy('pemasukans.id', 'desc')
      ->get();
    return datatables()::of($pemasukans)
      ->addColumn('kolomakunkas', function ($pemasukans) {

        $akun = DB::table('akuns')->where('kode_akun',$pemasukans->akun_kas)->first();

        return $akun->kode_akun.' - '.$akun->nama;
      })
      ->addColumn('kolomakunpendapatan', function ($pemasukans) {

        $akun = DB::table('akuns')->where('kode_akun',$pemasukans->akun_pendapatan)->first();

        return $akun->kode_akun.' - '.$akun->nama;
      })
      ->addIndexColumn()
      ->make(true);
  }

}
