<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class MutasiController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index_masuk(){
    $produks = DB::table('barangs')
      ->select('barangs.*')
      ->where('barangs.aktif','Active')
      ->orderBy('kode', 'asc')->get();

    return view('apps.report.mutasi-masuk',[ 'produks' => $produks]);
  }

  public function list_masuk(Request $request)
  {
    $table = DB::table('mutasi_masuk_barangs')
      ->join('users','mutasi_masuk_barangs.id_users','=','users.id')
      ->join('barangs','mutasi_masuk_barangs.id_barangs','=','barangs.id')
      ->select('mutasi_masuk_barangs.*','users.name as namauser','barangs.nama as namabarang')
      ->orderBy('mutasi_masuk_barangs.created_at','desc')
      ->where(function($query) use ($request)
      {

        if($request->produks != "All"){
          $query->where('mutasi_masuk_barangs.id_barangs', $request->produks);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $createdatmulai = $request->tanggalmulai.' 00:00:00';
          $createdatselesai = $request->tanggalmulai.' 23:59:59';
          $query->whereBetween('mutasi_masuk_barangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $createdatmulai = $request->tanggalselesai.' 00:00:00';
          $createdatselesai = $request->tanggalselesai.' 23:59:59';
          $query->whereBetween('mutasi_masuk_barangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $createdatmulai = $request->tanggalmulai.' 00:00:00';
          $createdatselesai = $request->tanggalselesai.' 23:59:59';
          $query->whereBetween('mutasi_masuk_barangs.created_at', [$createdatmulai, $createdatselesai]);
        }

      })
      ->get();
    return datatables()::of($table)
      ->addIndexColumn()
      ->make(true);
  }

  public function index_keluar(){
    $produks = DB::table('barangs')
      ->select('barangs.*')
      ->where('barangs.aktif','Active')
      ->orderBy('kode', 'asc')->get();

    return view('apps.report.mutasi-keluar',[ 'produks' => $produks]);
  }

  public function list_keluar(Request $request)
  {
    $table = DB::table('mutasi_keluar_barangs')
      ->join('users','mutasi_keluar_barangs.id_users','=','users.id')
      ->join('barangs','mutasi_keluar_barangs.id_barangs','=','barangs.id')
      ->select('mutasi_keluar_barangs.*','users.name as namauser','barangs.nama as namabarang')
      ->orderBy('mutasi_keluar_barangs.created_at','desc')
      ->where(function($query) use ($request)
      {

        if($request->produks != "All"){
          $query->where('mutasi_keluar_barangs.id_barangs', $request->produks);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $createdatmulai = $request->tanggalmulai.' 00:00:00';
          $createdatselesai = $request->tanggalmulai.' 23:59:59';
          $query->whereBetween('mutasi_keluar_barangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $createdatmulai = $request->tanggalselesai.' 00:00:00';
          $createdatselesai = $request->tanggalselesai.' 23:59:59';
          $query->whereBetween('mutasi_keluar_barangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $createdatmulai = $request->tanggalmulai.' 00:00:00';
          $createdatselesai = $request->tanggalselesai.' 23:59:59';
          $query->whereBetween('mutasi_keluar_barangs.created_at', [$createdatmulai, $createdatselesai]);
        }

      })
      ->get();
    return datatables()::of($table)
      ->addIndexColumn()
      ->make(true);
  }

}
