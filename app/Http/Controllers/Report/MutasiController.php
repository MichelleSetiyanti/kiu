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
      $table = DB::table('mutasi_masuk_barangs as m')
          ->join('users as u','m.id_users','=','u.id')
          ->join('barangs as b','m.id_barangs','=','b.id')
          ->select(
              'm.*',
              'u.name as namauser',
              'b.nama as namabarang',
              'b.kode as kodebarang'
          )
          ->where(function($query) use ($request)
          {
              if ($request->produks != "All") {
                  $query->where('m.id_barangs', $request->produks);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
                  $createdatmulai   = $request->tanggalmulai.' 00:00:00';
                  $createdatselesai = $request->tanggalmulai.' 23:59:59';
                  $query->whereBetween('m.created_at', [$createdatmulai, $createdatselesai]);
              }

              if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
                  $createdatmulai   = $request->tanggalselesai.' 00:00:00';
                  $createdatselesai = $request->tanggalselesai.' 23:59:59';
                  $query->whereBetween('m.created_at', [$createdatmulai, $createdatselesai]);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
                  $createdatmulai   = $request->tanggalmulai.' 00:00:00';
                  $createdatselesai = $request->tanggalselesai.' 23:59:59';
                  $query->whereBetween('m.created_at', [$createdatmulai, $createdatselesai]);
              }
          })
          ->orderBy('m.created_at','desc');  

      return datatables()::of($table)
          ->filter(function ($query) use ($request) {
              $search = $request->get('search')['value'] ?? null;

              if ($search) {
                  $query->where(function ($q) use ($search) {
                      $q->where('m.kode', 'like', "%{$search}%")  
                        ->orWhere('b.nama', 'like', "%{$search}%"); 
                  });
              }
          })
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
      $table = DB::table('mutasi_keluar_barangs as m')
          ->join('users as u', 'm.id_users', '=', 'u.id')
          ->join('barangs as b', 'm.id_barangs', '=', 'b.id')
          ->select(
              'm.*',
              'u.name as namauser',
              'b.nama as namabarang',
              'b.kode as kodebarang'
          )
          ->where(function($query) use ($request)
          {
              if ($request->produks != "All") {
                  $query->where('m.id_barangs', $request->produks);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
                  $createdatmulai   = $request->tanggalmulai.' 00:00:00';
                  $createdatselesai = $request->tanggalmulai.' 23:59:59';
                  $query->whereBetween('m.created_at', [$createdatmulai, $createdatselesai]);
              }

              if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
                  $createdatmulai   = $request->tanggalselesai.' 00:00:00';
                  $createdatselesai = $request->tanggalselesai.' 23:59:59';
                  $query->whereBetween('m.created_at', [$createdatmulai, $createdatselesai]);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
                  $createdatmulai   = $request->tanggalmulai.' 00:00:00';
                  $createdatselesai = $request->tanggalselesai.' 23:59:59';
                  $query->whereBetween('m.created_at', [$createdatmulai, $createdatselesai]);
              }
          })
          ->orderBy('m.created_at', 'desc'); 

      return datatables()::of($table)
          ->filter(function ($query) use ($request) {
              $search = $request->get('search')['value'] ?? null;

              if ($search) {
                  $query->where(function ($q) use ($search) {
                      $q->where('m.kode', 'like', "%{$search}%")    
                        ->orWhere('b.nama', 'like', "%{$search}%"); 
                  });
              }
          })
          ->addIndexColumn()
          ->make(true);
  }

}
