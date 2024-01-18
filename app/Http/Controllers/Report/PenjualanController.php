<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PenjualanController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->get();

    return view('apps.report.penjualan',[ 'clients' => $clients ]);
  }

  public function list(Request $request)
  {
    $table = DB::table('penjualans')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->select('penjualans.*','konsumens.nama as namakonsumen')
      ->orderBy('penjualans.id', 'desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('penjualans.id_konsumens', $request->client);
        }

        if($request->divisi != "All"){
          $query->where('penjualans.kategori', $request->divisi);
        }

        if($request->metodepembayaran != "All"){
          $query->where('penjualans.pembayaran', $request->metodepembayaran);
        }

        if($request->jenis != "All"){
          $query->where('penjualans.tipe_penjualan', $request->jenis);
        }

        if($request->pajak != "All"){
            if($request->pajak == "Non-PPN"){
                $query->where('penjualans.pajak', '0');
            }else{
                $query->where('penjualans.pajak', '>', '0');
            }
        }

        if($request->status != "All"){
          if($request->status == "paid"){
            $query->where('penjualans.sisa', '0');
          }else{
            $query->where('penjualans.sisa', '>', '0');
          }
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('penjualans.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('penjualans.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('penjualans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('penjualans.status','=','Selesai');

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
    $table = DB::table('penjualans')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->select('penjualans.*','konsumens.nama as namakonsumen')
      ->orderBy('penjualans.id', 'desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('penjualans.id_konsumens', $request->client);
        }

        if($request->divisi != "All"){
          $query->where('penjualans.kategori', $request->divisi);
        }

        if($request->metodepembayaran != "All"){
          $query->where('penjualans.pembayaran', $request->metodepembayaran);
        }

        if($request->jenis != "All"){
          $query->where('penjualans.tipe_penjualan', $request->jenis);
        }

        if($request->status != "All"){
          if($request->status == "paid"){
            $query->where('penjualans.sisa', '0');
          }else{
            $query->where('penjualans.sisa', '>', '0');
          }
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('penjualans.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('penjualans.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('penjualans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('penjualans.status','=','Selesai');

      })
      ->get();

    return view('apps.report.penjualan-detil',[ 'penjualans' => $table, 'request' => $request ]);
  }

}
