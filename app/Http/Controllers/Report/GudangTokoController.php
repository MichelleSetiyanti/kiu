<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class GudangTokoController extends Controller
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

        return view('apps.report.gudang-toko',[ 'produks' => $produks ]);
    }

    public function list(Request $request){
        $mutasi_gudang_tokos = DB::table('mutasi_gudang_tokos')
          ->join('users','mutasi_gudang_tokos.id_users','=','users.id')
          ->join('barangs','mutasi_gudang_tokos.id_barangs','=','barangs.id')
          ->select('mutasi_gudang_tokos.*','users.name as namauser','barangs.nama as namabarang')
          ->where(function($query) use ($request)
          {

              if ($request->produks != "All") {
                  $query->where('mutasi_gudang_tokos.id_barangs', '=' , $request->produks);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
                  $createdatmulai = $request->tanggalmulai.' 00:00:00';
                  $createdatselesai = $request->tanggalmulai.' 23:59:59';
                  $query->whereBetween('mutasi_gudang_tokos.created_at', [$createdatmulai, $createdatselesai]);
              }

              if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
                  $createdatmulai = $request->tanggalselesai.' 00:00:00';
                  $createdatselesai = $request->tanggalselesai.' 23:59:59';
                  $query->whereBetween('mutasi_gudang_tokos.created_at', [$createdatmulai, $createdatselesai]);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
                  $createdatmulai = $request->tanggalmulai.' 00:00:00';
                  $createdatselesai = $request->tanggalselesai.' 23:59:59';
                  $query->whereBetween('mutasi_gudang_tokos.created_at', [$createdatmulai, $createdatselesai]);
              }

              $query->where('mutasi_gudang_tokos.id','!=','0');

          })
          ->orderBy('id', 'desc')
          ->get();
        return datatables()::of($mutasi_gudang_tokos)
          ->addIndexColumn()
          ->make(true);
    }

}
