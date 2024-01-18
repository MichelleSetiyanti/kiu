<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class SoStockKurangController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $barangs = DB::table('barangs')->where('aktif','Active')->orderBy('nama', 'asc')->get();

    return view('apps.report.so-stock-kurang',[ 'produks' => $barangs ]);
  }

  public function list(Request $request){
    $penjualans = DB::table('penjualan_details')
      ->join('penjualans','penjualan_details.id_penjualans','=','penjualans.id')
      ->join('barangs','penjualan_details.id_barangs','=','barangs.id')
      ->select('penjualan_details.*','penjualans.kode as kodepenjualan','penjualans.tanggal as tanggalpenjualan','barangs.nama as namabarang','barangs.stok as stocktoko','barangs.gudang as stockgudang')
      ->where(function($query) use ($request)
      {

        if($request->produks != "All"){
          $query->where('penjualan_details.id_barangs', $request->produks);
        }

        $query->where('penjualan_details.id_barangs','!=','0');
        $query->where('penjualans.kode_sj','=',NULL);
        $query->whereColumn('barangs.stok', '<', 'penjualan_details.total_jual');

      })
//      ->where('penjualans.kode_sj','=','NULL')
      ->orderBy('penjualans.created_at','desc')
      ->get();
    return datatables()::of($penjualans)
      ->addIndexColumn()
      ->make(true);
  }

}
