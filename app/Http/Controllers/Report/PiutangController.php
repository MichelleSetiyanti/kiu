<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PiutangController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->get();

    $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();

    return view('apps.report.pelunasan-piutang',[ 'clients' => $clients, 'akuns' => $akuns ]);
  }

  public function list(Request $request)
  {
    $table = DB::table('bayar_piutangs')
      ->join('penjualans','bayar_piutangs.id_penjualans','=','penjualans.id')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->join('users','bayar_piutangs.id_users','=','users.id')
      ->select('penjualans.*','konsumens.nama as namakonsumen','users.name as namauser','bayar_piutangs.nominal as totalpelunasan','bayar_piutangs.created_at as waktupelunasan','bayar_piutangs.id as idpelunasan')
      ->orderBy('bayar_piutangs.created_at','desc')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('penjualans.id_konsumens', $request->client);
        }

        if($request->akun != "All"){
          $query->where('bayar_piutangs.kode_akun', $request->akun);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $createdatmulai = $request->tanggalmulai.' 00:00:00';
          $createdatselesai = $request->tanggalmulai.' 23:59:59';
          $query->whereBetween('bayar_piutangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $createdatmulai = $request->tanggalselesai.' 00:00:00';
          $createdatselesai = $request->tanggalselesai.' 23:59:59';
          $query->whereBetween('bayar_piutangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $createdatmulai = $request->tanggalmulai.' 00:00:00';
          $createdatselesai = $request->tanggalselesai.' 23:59:59';
          $query->whereBetween('bayar_piutangs.created_at', [$createdatmulai, $createdatselesai]);
        }

        $query->where('bayar_piutangs.status', $request->status);
      })
      ->get();
    return datatables()::of($table)
      ->addIndexColumn()
      ->make(true);
  }

}
