<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class StockBarangController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $kategoris = DB::table('kategori_barangs')->where('aktif','Active')->orderBy('nama', 'asc')->get();

    return view('apps.report.stok-barang-beli',[ 'kategoris' => $kategoris ]);
  }

  public function list(Request $request){
    $barangs = DB::table('barangs')
      ->join('kategori_barangs','barangs.id_kategori','=','kategori_barangs.id')
      ->select('barangs.*','kategori_barangs.nama as namakategori')
      ->orderBy('barangs.kode', 'asc')
      ->where(function($query) use ($request)
      {

        if($request->kategori != "All"){
          $query->where('barangs.id_kategori', $request->kategori);
        }

        $query->where('barangs.id','!=','0');

      })
      ->get();
    return datatables()::of($barangs)
      ->addIndexColumn()
      ->make(true);
  }

}
