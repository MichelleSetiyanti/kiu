<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PengeluaranController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

    public function index_operasional(){
      $kategoripengeluarans = DB::table('kategori_pengeluarans')->where('aktif','Active')->where('id','!=','0')->orderBy('nama', 'asc')->get();
      $akunskas = DB::table('akuns')->where('kategori','Kas & Bank')->orderBy('kode_akun','asc')->get();
      $akunsbeban = DB::table('akuns')->where('kategori','Beban')->orWhere('kategori','Beban Lainnya')->orderBy('kode_akun','asc')->get();

      return view('apps.report.pengeluaran-operasional',[ 'kategoris' => $kategoripengeluarans, 'akunskas' => $akunskas, 'akunsbeban' => $akunsbeban ]);
    }

    public function list_operasional(Request $request){
      $pengeluarans = DB::table('pengeluarans')
        ->join('kategori_pengeluarans','pengeluarans.id_kategori_pengeluarans','=','kategori_pengeluarans.id')
        ->select('pengeluarans.*','kategori_pengeluarans.nama as kategoripengeluaran')
        ->where(function($query) use ($request)
        {

          if ($request->kategori != "All") {
            $query->where('pengeluarans.id_kategori_pengeluarans', '=' , $request->kategori);
          }

          if ($request->divisi != "All") {
            $query->where('pengeluarans.divisi', '=' , $request->divisi);
          }

          if ($request->akunkas != "All") {
            $query->where('pengeluarans.akun_kas', '=' , $request->akunkas);
          }

          if ($request->akunbeban != "All") {
            $query->where('pengeluarans.akun_beban', '=' , $request->akunbeban);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
            $query->where('pengeluarans.tanggal', '=' , $request->tanggalmulai);
          }

          if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
            $query->where('pengeluarans.tanggal', '=' ,$request->tanggalselesai);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
            $query->whereBetween('pengeluarans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
          }

          $query->where('pengeluarans.id','!=','0');

        })
        ->orderBy('pengeluarans.id', 'desc')
        ->get();
      return datatables()::of($pengeluarans)
        ->addColumn('kolomakunkas', function ($pengeluarans) {

          $akun = DB::table('akuns')->where('kode_akun',$pengeluarans->akun_kas)->first();

          return $akun->kode_akun.' - '.$akun->nama;
        })
        ->addColumn('kolomakunbeban', function ($pengeluarans) {

          $akun = DB::table('akuns')->where('kode_akun',$pengeluarans->akun_beban)->first();

          return $akun->kode_akun.' - '.$akun->nama;
        })
        ->addIndexColumn()
        ->make(true);
    }
}
