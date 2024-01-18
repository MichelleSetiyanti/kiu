<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LabaRugiPerdivisiController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.report.lr-perdivisi');
  }

  public function list_detil(Request $request)
  {
    $pembelians = DB::table('pembelians')
      ->join('penampungs','pembelians.id_penampungs','=','penampungs.id')
      ->select('pembelians.*','penampungs.nama as namapenampung')
      ->orderBy('pembelians.id', 'desc')
      ->where(function($query) use ($request)
      {
        $query->where('pembelians.kategori', $request->divisi);
        $query->whereBetween('pembelians.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pembelians.status','=','Selesai');
      })
      ->get();

    $penjualans = DB::table('penjualans')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->select('penjualans.*','konsumens.nama as namakonsumen')
      ->orderBy('penjualans.id', 'desc')
      ->where(function($query) use ($request)
      {
        $query->where('penjualans.kategori', $request->divisi);
        $query->whereBetween('penjualans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('penjualans.status','=','Selesai');
      })
      ->get();

    $pengeluarans = DB::table('pengeluarans')
      ->join('kategori_pengeluarans','pengeluarans.id_kategori_pengeluarans','=','kategori_pengeluarans.id')
      ->select('pengeluarans.*','kategori_pengeluarans.nama as kategoripengeluaran')
      ->where(function($query) use ($request)
      {
        $query->where('pengeluarans.divisi', '=' , $request->divisi);
        $query->whereBetween('pengeluarans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pengeluarans.id','!=','0');
      })
      ->orderBy('pengeluarans.id', 'desc')
      ->get();

    $pemasukans = DB::table('pemasukans')
      ->where(function($query) use ($request)
      {
        $query->where('pemasukans.divisi', '=' , $request->divisi);
        $query->whereBetween('pemasukans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pemasukans.id','!=','0');
      })
      ->orderBy('pemasukans.id', 'asc')
      ->get();

    $akuns = DB::table('akuns')->get();

    return view('apps.report.lr-perdivisi-detil',[ 'pembelians' => $pembelians, 'penjualans' => $penjualans, 'pendapatans' => $pemasukans, 'pengeluarans' => $pengeluarans, 'akuns' => $akuns, 'request' => $request ]);
  }
}
