<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class MutasiBarangController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $produks = DB::table('barangs')
      ->select('barangs.*')
      ->where('barangs.aktif','Active')
      ->orderBy('kode', 'asc')->get();

    return view('apps.report.mutasi-barang',[ 'produks' => $produks ]);
  }

  public function list_detil(Request $request)
  {
      $createdatmulai = $request->tanggalmulai.' 00:00:00';
      $createdatselesai = $request->tanggalselesai.' 23:59:59';

      $barang = DB::table('barangs')
        ->select('barangs.*')
        ->where('barangs.id',$request->produks)
        ->first();

      $mutasimasuks = DB::table('mutasi_masuk_barangs')
        ->join('users','mutasi_masuk_barangs.id_users','=','users.id')
        ->select('mutasi_masuk_barangs.*','users.name as namauser')
        ->orderBy('mutasi_masuk_barangs.id', 'asc')
        ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
        {
          $query->where('mutasi_masuk_barangs.id_barangs', '=' , $request->produks);
          $query->whereBetween('mutasi_masuk_barangs.created_at', [$createdatmulai, $createdatselesai]);
        })
        ->get();

      $mutasikeluars = DB::table('mutasi_keluar_barangs')
        ->join('users','mutasi_keluar_barangs.id_users','=','users.id')
        ->select('mutasi_keluar_barangs.*','users.name as namauser')
        ->orderBy('mutasi_keluar_barangs.id', 'asc')
        ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
        {
          $query->where('mutasi_keluar_barangs.id_barangs', '=' , $request->produks);
          $query->whereBetween('mutasi_keluar_barangs.created_at', [$createdatmulai, $createdatselesai]);
        })
        ->get();

      $mutasigudangtokos = DB::table('mutasi_gudang_tokos')
        ->join('users','mutasi_gudang_tokos.id_users','=','users.id')
        ->select('mutasi_gudang_tokos.*','users.name as namauser')
        ->orderBy('mutasi_gudang_tokos.id', 'asc')
        ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
        {
          $query->where('mutasi_gudang_tokos.id_barangs', '=' , $request->produks);
          $query->whereBetween('mutasi_gudang_tokos.created_at', [$createdatmulai, $createdatselesai]);
        })
        ->get();

      $mutasitokogudangs = DB::table('mutasi_toko_gudangs')
        ->join('users','mutasi_toko_gudangs.id_users','=','users.id')
        ->select('mutasi_toko_gudangs.*','users.name as namauser')
        ->orderBy('mutasi_toko_gudangs.id', 'asc')
        ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
        {
          $query->where('mutasi_toko_gudangs.id_barangs', '=' , $request->produks);
          $query->whereBetween('mutasi_toko_gudangs.created_at', [$createdatmulai, $createdatselesai]);
        })
        ->get();

      return view('apps.report.mutasi-barang-detil',[ 'barang' => $barang, 'mutasimasuks' => $mutasimasuks, 'mutasikeluars' => $mutasikeluars, 'mutasigudangtokos' => $mutasigudangtokos, 'mutasitokogudangs' => $mutasitokogudangs, 'request' => $request ]);
  }
}
