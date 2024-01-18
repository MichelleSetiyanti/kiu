<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class TrashPembelianController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('penampungs')
      ->orderBy('id', 'desc')
      ->get();

    return view('apps.report.trash-pembelian',[ 'clients' => $clients ]);
  }

  public function list(Request $request)
  {
    $table = DB::table('trash_pembelians')
      ->join('penampungs','trash_pembelians.id_penampungs','=','penampungs.id')
      ->join('users','trash_pembelians.id_users','=','users.id')
      ->select('trash_pembelians.*','penampungs.nama as namapenampung','users.name as namauser')
      ->orderBy('trash_pembelians.id', 'desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('trash_pembelians.id_penampungs', $request->client);
        }

        if($request->divisi != "All"){
          $query->where('trash_pembelians.kategori', $request->divisi);
        }

        if($request->metodepembayaran != "All"){
          $query->where('trash_pembelians.pembayaran', $request->metodepembayaran);
        }

        if($request->jenis != "All"){
          $query->where('trash_pembelians.tipe_pembelian', $request->jenis);
        }

        if($request->status != "All"){
          if($request->status == "paid"){
            $query->where('trash_pembelians.sisa', '0');
          }else{
            $query->where('trash_pembelians.sisa', '>', '0');
          }
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('trash_pembelians.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('trash_pembelians.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('trash_pembelians.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('trash_pembelians.status','=','Selesai');

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

  public function list_uangpegangan(Request $request)
  {
    $table = DB::table('trash_pembelians')
      ->join('penampungs','trash_pembelians.id_penampungs','=','penampungs.id')
      ->select('trash_pembelians.*','penampungs.nama as namapenampung')
      ->orderBy('trash_pembelians.id', 'desc')
      ->where(function($query) use ($request)
      {

        $query->where('trash_pembelians.tipe_pembelian', 'Keliling');

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('trash_pembelians.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('trash_pembelians.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('trash_pembelians.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

      })
      ->get();
    return datatables()::of($table)
      ->addIndexColumn()
      ->make(true);
  }

  public function list_detil(Request $request)
  {
      $table = DB::table('trash_pembelians')
      ->join('penampungs','trash_pembelians.id_penampungs','=','penampungs.id')
      ->select('trash_pembelians.*','penampungs.nama as namapenampung')
      ->orderBy('trash_pembelians.id', 'desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('trash_pembelians.id_penampungs', $request->client);
        }

        if($request->divisi != "All"){
          $query->where('trash_pembelians.kategori', $request->divisi);
        }

        if($request->metodepembayaran != "All"){
          $query->where('trash_pembelians.pembayaran', $request->metodepembayaran);
        }

        if($request->jenis != "All"){
          $query->where('trash_pembelians.tipe_pembelian', $request->jenis);
        }

        if($request->status != "All"){
          if($request->status == "paid"){
            $query->where('trash_pembelians.sisa', '0');
          }else{
            $query->where('trash_pembelians.sisa', '>', '0');
          }
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('trash_pembelians.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('trash_pembelians.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('trash_pembelians.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('trash_pembelians.status','=','Selesai');

      })
      ->get();

    return view('apps.report.pembelian-detil',[ 'trash_pembelians' => $table, 'request' => $request ]);
  }

  public function list_detils(Request $request){
    $pembelians = DB::table('trash_pembelian_details')
      ->join('barang_belis','trash_pembelian_details.id_barang_belis','=','barang_belis.id')
      ->select('trash_pembelian_details.*','barang_belis.nama as namabarang','barang_belis.kode as kodebarang')
      ->where('trash_pembelian_details.id_pembelians',$request->id)
      ->orderBy('trash_pembelian_details.created_at','asc')
      ->get();
    return datatables()::of($pembelians)
      ->addIndexColumn()
      ->make(true);
  }
}
