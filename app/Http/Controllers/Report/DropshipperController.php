<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class DropshipperController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('penampungs')
      ->orderBy('id', 'desc')
      ->get();

    return view('apps.report.dropshipper',[ 'clients' => $clients ]);
  }

  public function list(Request $request)
  {
    $table = DB::table('dropshippers')
      ->join('penampungs','dropshippers.id_penampungs','=','penampungs.id')
      ->select('dropshippers.*','penampungs.nama as namapenampung')
      ->orderBy('dropshippers.id', 'desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('dropshippers.id_penampungs', $request->client);
        }

        if($request->bayarpembelian != "All"){
          $query->where('dropshippers.bayar_pembelian', $request->bayarpembelian);
        }

        if($request->bayarpenjualan != "All"){
          $query->where('dropshippers.bayar_penjualan', $request->bayarpenjualan);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('dropshippers.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('dropshippers.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('dropshippers.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

      })
      ->get();
    return datatables()::of($table)
      ->addColumn('action', function ($table) {
        $encrypt = Crypt::encrypt($table->id);

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_viewdata('.$table->id.')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Rincian Transaksi"></i></span>
            <span class="fonticon-wrap" onclick="f_viewbiaya('.$table->id.')"><i class="feather icon-external-link" data-toggle="tooltip" title="Lihat Daftar Biaya"></i></span>
            <span class="fonticon-wrap" onclick="f_viewdp('.$table->id.')"><i class="feather icon-dollar-sign" data-toggle="tooltip" title="Lihat DP Penampung"></i></span>
          </div>
        ';
      })
      ->addColumn('kolomtotaljual', function ($dropshippers) {
        if($dropshippers->bayar_penjualan == "N"){
          return 'Rp. '.number_format($dropshippers->total_jual,0,',','.').' (Belum Lunas)';
        }else{
          return 'Rp. '.number_format($dropshippers->total_jual,0,',','.').' (Lunas)';
        }
      })
      ->addColumn('kolomtotalbeli', function ($dropshippers) {
        if($dropshippers->bayar_pembelian == "N"){
          return 'Rp. '.number_format($dropshippers->total_beli,0,',','.').' (Belum Lunas)';
        }else{
          return 'Rp. '.number_format($dropshippers->total_beli,0,',','.').' (Lunas)';
        }
      })
      ->addColumn('totaldppenampung', function ($table) {
        $dp_penampungs = DB::table('dp_penampungs')->select(DB::raw('sum(nominal) as total'))->where('id_dropshippers',$table->id)->get();

        return $dp_penampungs[0]->total;
      })
      ->addColumn('totalbiaya', function ($table) {
        $biayas = DB::table('biaya_detail_dropshippers')->select(DB::raw('sum(nominal) as total'))->where('id_dropshippers',$table->id)->get();

        return $biayas[0]->total;
      })
      ->addIndexColumn()
      ->make(true);
  }



  public function list_dp(Request $request){
    $dp_penampungs = DB::table('dp_penampungs')
      ->join('penampungs','dp_penampungs.id_penampungs','=','penampungs.id')
      ->join('akuns','dp_penampungs.kode_akun','=','akuns.kode_akun')
      ->join('dropshippers','dp_penampungs.id_dropshippers','=','dropshippers.id')
      ->select('dp_penampungs.*','penampungs.nama as namapenampung','akuns.nama as namaakun','dropshippers.kode as kodekontainer','dropshippers.no_kontainer as nokontainer')
      ->where('dp_penampungs.id_dropshippers',$request->id)
      ->orderBy('dp_penampungs.id', 'asc')
      ->get();
    return datatables()::of($dp_penampungs)
      ->addColumn('kolomakun', function ($dp_penampungs) {
        return $dp_penampungs->kode_akun.' - '.$dp_penampungs->namaakun;
      })
      ->addIndexColumn()
      ->make(true);
  }

}
