<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class TrashPenjualanController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->get();

    return view('apps.report.trash-penjualan',[ 'clients' => $clients ]);
  }

  public function list(Request $request)
  {
    $table = DB::table('trash_penjualans')
      ->join('konsumens','trash_penjualans.id_konsumens','=','konsumens.id')
      ->join('users','trash_penjualans.id_users','=','users.id')
      ->select('trash_penjualans.*','konsumens.nama as namakonsumen','users.name as namauser')
      ->orderBy('trash_penjualans.id', 'desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('trash_penjualans.id_konsumens', $request->client);
        }

        if($request->divisi != "All"){
          $query->where('trash_penjualans.kategori', $request->divisi);
        }

        if($request->metodepembayaran != "All"){
          $query->where('trash_penjualans.pembayaran', $request->metodepembayaran);
        }

        if($request->jenis != "All"){
          $query->where('trash_penjualans.tipe_penjualan', $request->jenis);
        }

        if($request->status != "All"){
          if($request->status == "paid"){
            $query->where('trash_penjualans.sisa', '0');
          }else{
            $query->where('trash_penjualans.sisa', '>', '0');
          }
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('trash_penjualans.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('trash_penjualans.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('trash_penjualans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('trash_penjualans.status','=','Selesai');

      })
      ->get();
    return datatables()::of($table)
      ->addColumn('action', function ($table) {
        $encrypt = Crypt::encrypt($table->id);

        return '
          <div class="fonticon-container">
              <span class="fonticon-wrap" onclick="f_datadetil(' . $table->id . ')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Detil Pembelian"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function list_detil(Request $request)
  {
    $table = DB::table('trash_penjualans')
      ->join('konsumens','trash_penjualans.id_konsumens','=','konsumens.id')
      ->select('trash_penjualans.*','konsumens.nama as namakonsumen')
      ->orderBy('trash_penjualans.id', 'desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('trash_penjualans.id_konsumens', $request->client);
        }

        if($request->divisi != "All"){
          $query->where('trash_penjualans.kategori', $request->divisi);
        }

        if($request->metodepembayaran != "All"){
          $query->where('trash_penjualans.pembayaran', $request->metodepembayaran);
        }

        if($request->jenis != "All"){
          $query->where('trash_penjualans.tipe_penjualan', $request->jenis);
        }

        if($request->status != "All"){
          if($request->status == "paid"){
            $query->where('trash_penjualans.sisa', '0');
          }else{
            $query->where('trash_penjualans.sisa', '>', '0');
          }
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('trash_penjualans.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('trash_penjualans.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('trash_penjualans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('trash_penjualans.status','=','Selesai');

      })
      ->get();

    return view('apps.report.penjualan-detil',[ 'trash_penjualans' => $table, 'request' => $request ]);
  }

  public function list_detils(Request $request){
    $penjualans = DB::table('trash_penjualan_details')
      ->join('barang_juals','trash_penjualan_details.id_barang_juals','=','barang_juals.id')
      ->select('trash_penjualan_details.*','barang_juals.nama as namabarang','barang_juals.kode as kodebarang')
      ->where('trash_penjualan_details.id_penjualans',$request->id)
      ->orderBy('trash_penjualan_details.created_at','asc')
      ->get();
    return datatables()::of($penjualans)
      ->addIndexColumn()
      ->make(true);
  }


}
