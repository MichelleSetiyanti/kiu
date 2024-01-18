<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class TokoGudangController extends Controller
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

    return view('apps.report.toko-gudang',[ 'produks' => $produks ]);
  }

  public function list(Request $request){
    $mutasi_toko_gudangs = DB::table('mutasi_toko_gudangs')
      ->join('users','mutasi_toko_gudangs.id_users','=','users.id')
      ->join('barangs','mutasi_toko_gudangs.id_barangs','=','barangs.id')
      ->select('mutasi_toko_gudangs.*','users.name as namauser','barangs.nama as namabarang')
      ->where(function($query) use ($request)
      {

          if ($request->produks != "All") {
              $query->where('mutasi_toko_gudangs.id_barangs', '=' , $request->produks);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
              $createdatmulai = $request->tanggalmulai.' 00:00:00';
              $createdatselesai = $request->tanggalmulai.' 23:59:59';
              $query->whereBetween('mutasi_toko_gudangs.created_at', [$createdatmulai, $createdatselesai]);
          }

          if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
              $createdatmulai = $request->tanggalselesai.' 00:00:00';
              $createdatselesai = $request->tanggalselesai.' 23:59:59';
              $query->whereBetween('mutasi_toko_gudangs.created_at', [$createdatmulai, $createdatselesai]);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
              $createdatmulai = $request->tanggalmulai.' 00:00:00';
              $createdatselesai = $request->tanggalselesai.' 23:59:59';
              $query->whereBetween('mutasi_toko_gudangs.created_at', [$createdatmulai, $createdatselesai]);
          }

          $query->where('mutasi_toko_gudangs.id','!=','0');

      })
      ->orderBy('id', 'desc')
      ->get();
    return datatables()::of($mutasi_toko_gudangs)
      ->addIndexColumn()
      ->make(true);
  }

}
