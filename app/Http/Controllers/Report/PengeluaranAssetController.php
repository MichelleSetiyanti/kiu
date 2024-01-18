<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PengeluaranAssetController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

    public function index_operasional(){
      $kategoripengeluarans = DB::table('kategori_pengeluaran_assets')->where('aktif','Active')->where('id','!=','0')->orderBy('nama', 'asc')->get();
      $akunskas = DB::table('akuns')->where('kategori','Kas & Bank')->orderBy('kode_akun','asc')->get();
      $assets = DB::table('assets')->where('aktif','Active')->where('id','!=','0')->orderBy('nama', 'asc')->get();

      return view('apps.report.pengeluaran-asset',[ 'kategoris' => $kategoripengeluarans, 'assets' => $assets, 'akunskas' => $akunskas]);
    }

    public function list_operasional(Request $request){
      $pengeluarans = DB::table('pengeluaran_assets')
        ->join('kategori_pengeluaran_assets','pengeluaran_assets.id_kategori_pengeluarans','=','kategori_pengeluaran_assets.id')
        ->join('assets','pengeluaran_assets.id_assets','=','assets.id')
        ->select('pengeluaran_assets.*','kategori_pengeluaran_assets.nama as kategoripengeluaran','assets.nama as namaasset')
        ->where(function($query) use ($request)
        {

          if ($request->kategori != "All") {
            $query->where('pengeluaran_assets.id_kategori_pengeluarans', '=' , $request->kategori);
          }

          if ($request->asset != "All") {
            $query->where('pengeluaran_assets.id_assets', '=' , $request->asset);
          }

          if ($request->akunkas != "All") {
            $query->where('pengeluaran_assets.akun_kas', '=' , $request->akunkas);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
            $query->where('pengeluaran_assets.tanggal', '=' , $request->tanggalmulai);
          }

          if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
            $query->where('pengeluaran_assets.tanggal', '=' ,$request->tanggalselesai);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
            $query->whereBetween('pengeluaran_assets.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
          }

          $query->where('pengeluaran_assets.id','!=','0');

        })
        ->orderBy('pengeluaran_assets.id', 'desc')
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
