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

  public function list(Request $request)
  {
      $barangs = DB::table('barangs')
          ->join('kategori_barangs', 'barangs.id_kategori', '=', 'kategori_barangs.id')
          ->select('barangs.*', 'kategori_barangs.nama as namakategori')
          ->where(function ($query) use ($request) {

              if ($request->kategori != "All") {
                  $query->where('barangs.id_kategori', $request->kategori);
              }

              $query->where('barangs.id', '!=', '0');
          })
          ->orderBy('barangs.kode', 'asc');

      return datatables()::of($barangs)
          ->filter(function ($query) use ($request) {
              $search = $request->get('search')['value'] ?? null;

              if ($search) {
                  $query->where(function ($q) use ($search) {
                      $q->where('barangs.kode', 'like', "%{$search}%")      
                        ->orWhere('barangs.nama', 'like', "%{$search}%")  
                        ->orWhere('kategori_barangs.nama', 'like', "%{$search}%");
                  });
              }
          })
          ->addIndexColumn()
          ->make(true);
  }

}
