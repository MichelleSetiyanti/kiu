<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class HutangController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('penampungs')
      ->orderBy('id', 'desc')
      ->get();

    $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();

    return view('apps.report.pelunasan-hutang',[ 'clients' => $clients, 'akuns' => $akuns ]);
  }

  public function list(Request $request)
  {
    $table = DB::table('bayar_hutangs')
      ->join('pembelians','bayar_hutangs.id_pembelians','=','pembelians.id')
      ->join('penampungs','pembelians.id_penampungs','=','penampungs.id')
      ->join('users','bayar_hutangs.id_users','=','users.id')
      ->join('akuns','bayar_hutangs.kode_akun','=','akuns.kode_akun')
      ->select('pembelians.*','penampungs.nama as namapenampung','users.name as namauser','bayar_hutangs.nominal as totalpelunasan','bayar_hutangs.created_at as waktupelunasan','bayar_hutangs.id as idpelunasan','akuns.nama as namaakun','bayar_hutangs.status as statuspelunasan')
      ->orderBy('bayar_hutangs.created_at','desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('pembelians.id_penampungs', $request->client);
        }

        if($request->akun != "All"){
          $query->where('bayar_hutangs.kode_akun', $request->akun);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $createdatmulai = $request->tanggalmulai.' 00:00:00';
          $createdatselesai = $request->tanggalmulai.' 23:59:59';
          $query->whereBetween('bayar_hutangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $createdatmulai = $request->tanggalselesai.' 00:00:00';
          $createdatselesai = $request->tanggalselesai.' 23:59:59';
          $query->whereBetween('bayar_hutangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $createdatmulai = $request->tanggalmulai.' 00:00:00';
          $createdatselesai = $request->tanggalselesai.' 23:59:59';
          $query->whereBetween('bayar_hutangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        $query->where('bayar_hutangs.status', $request->status);

        $query->where('bayar_hutangs.pelunasan_konsumen', 'N');

      })
      ->get();
    return datatables()::of($table)
      ->addIndexColumn()
      ->make(true);
  }

}
