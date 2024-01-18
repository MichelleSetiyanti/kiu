<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PembelianController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('penampungs')
      ->orderBy('id', 'desc')
      ->get();

    $produks = DB::table('barang_belis')
      ->where('barang_belis.aktif','Active')
      ->orderBy('kode', 'asc')->get();

    return view('apps.report.pembelian',[ 'clients' => $clients, 'produks' => $produks ]);
  }

  public function list(Request $request)
  {
    $table = DB::table('pembelians')
      ->join('penampungs','pembelians.id_penampungs','=','penampungs.id')
      ->select('pembelians.*','penampungs.nama as namapenampung')
      ->orderBy('pembelians.id', 'desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('pembelians.id_penampungs', $request->client);
        }

        if($request->divisi != "All"){
          $query->where('pembelians.kategori', $request->divisi);
        }

        if($request->metodepembayaran != "All"){
          $query->where('pembelians.pembayaran', $request->metodepembayaran);
        }

        if($request->jenis != "All"){
          $query->where('pembelians.tipe_pembelian', $request->jenis);
        }

        if($request->status != "All"){
          if($request->status == "paid"){
            $query->where('pembelians.sisa', '0');
          }else{
            $query->where('pembelians.sisa', '>', '0');
          }
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('pembelians.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('pembelians.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('pembelians.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('pembelians.status','=','Selesai');

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
      ->addColumn('akunpelunasan', function ($table) {

        if($table->pembayaran == "Credit"){

          $pelunasan = DB::table('bayar_hutangs')
            ->join('akuns','bayar_hutangs.kode_akun','akuns.kode_akun')
            ->select('akuns.nama as namaakun','bayar_hutangs.kode_akun as kodeakun')
            ->where('bayar_hutangs.id_pembelians','=',$table->id)
            ->get();

          if($pelunasan->count() > 0){
            return $pelunasan[0]->kodeakun.' - '.$pelunasan[0]->namaakun;
          }else{
            return "-";
          }

        }else{
          $akun = DB::table('akuns')->where('kode_akun','=',$table->kode_akun)->first();

          return $akun->kode_akun.' - '.$akun->nama;
        }

      })
      ->addIndexColumn()
      ->make(true);
  }

  public function list_uangpegangan(Request $request)
  {
    $table = DB::table('pembelians')
      ->join('penampungs','pembelians.id_penampungs','=','penampungs.id')
      ->select('pembelians.*','penampungs.nama as namapenampung')
      ->orderBy('pembelians.id', 'desc')
      ->where(function($query) use ($request)
      {

        $query->where('pembelians.tipe_pembelian', 'Keliling');

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('pembelians.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('pembelians.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('pembelians.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

      })
      ->get();
    return datatables()::of($table)
      ->addIndexColumn()
      ->make(true);
  }

  public function list_detil(Request $request)
  {
      $table = DB::table('pembelians')
      ->join('penampungs','pembelians.id_penampungs','=','penampungs.id')
      ->select('pembelians.*','penampungs.nama as namapenampung')
      ->orderBy('pembelians.id', 'desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('pembelians.id_penampungs', $request->client);
        }

        if($request->divisi != "All"){
          $query->where('pembelians.kategori', $request->divisi);
        }

        if($request->metodepembayaran != "All"){
          $query->where('pembelians.pembayaran', $request->metodepembayaran);
        }

        if($request->jenis != "All"){
          $query->where('pembelians.tipe_pembelian', $request->jenis);
        }

        if($request->status != "All"){
          if($request->status == "paid"){
            $query->where('pembelians.sisa', '0');
          }else{
            $query->where('pembelians.sisa', '>', '0');
          }
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('pembelians.tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('pembelians.tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('pembelians.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('pembelians.status','=','Selesai');

      })
      ->get();

    return view('apps.report.pembelian-detil',[ 'pembelians' => $table, 'request' => $request ]);
  }
}
