<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class DPPenampungController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

    public function index(){
      $penampungs = DB::table('penampungs')->where('aktif','Active')->where('id','!=','0')->orderBy('nama', 'asc')->get();
      $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();

      return view('apps.report.dp-penampung',[ 'clients' => $penampungs, 'akuns' => $akuns]);
    }

    public function list(Request $request){
      $pengeluarans = DB::table('dp_penampungs')
        ->join('penampungs','dp_penampungs.id_penampungs','=','penampungs.id')
        ->join('akuns','dp_penampungs.kode_akun','=','akuns.kode_akun')
        ->select('dp_penampungs.*','penampungs.nama as namapenampung','akuns.nama as namaakun')
        ->where(function($query) use ($request)
        {

          if ($request->client != "All") {
            $query->where('dp_penampungs.id_penampungs', '=' , $request->client);
          }

          if ($request->akun != "All") {
            $query->where('dp_penampungs.kode_akun', '=' , $request->akun);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
            $query->where('dp_penampungs.tanggal', '=' , $request->tanggalmulai);
          }

          if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
            $query->where('dp_penampungs.tanggal', '=' ,$request->tanggalselesai);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
            $query->whereBetween('dp_penampungs.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
          }

          $query->where('dp_penampungs.id','!=','0');

        })
        ->orderBy('dp_penampungs.id', 'desc')
        ->get();
      return datatables()::of($pengeluarans)
        ->addColumn('kolomakun', function ($pengeluarans) {

          $akun = DB::table('akuns')->where('kode_akun',$pengeluarans->kode_akun)->first();

          return $akun->kode_akun.' - '.$akun->nama;
        })
        ->addIndexColumn()
        ->make(true);
    }
}
