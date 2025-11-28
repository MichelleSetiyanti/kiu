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
      $table = DB::table('bayar_piutangs as b')
          ->join('penjualans as p', 'b.id_penjualans', '=', 'p.id')
          ->join('konsumens as k', 'p.id_konsumens', '=', 'k.id')
          ->join('users as u', 'b.id_users', '=', 'u.id')
          ->select(
              'p.*',
              'k.nama as namakonsumen',
              'u.name as namauser',
              'b.nominal as totalpelunasan',
              'b.created_at as waktupelunasan',
              'b.id as idpelunasan'
          )
          ->where(function($query) use ($request) {

              if ($request->client != "All") {
                  $query->where('p.id_konsumens', $request->client);
              }

              if ($request->akun != "All") {
                  $query->where('b.kode_akun', $request->akun);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
                  $createdatmulai   = $request->tanggalmulai.' 00:00:00';
                  $createdatselesai = $request->tanggalmulai.' 23:59:59';
                  $query->whereBetween('b.created_at', [$createdatmulai, $createdatselesai]);
              }

              if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
                  $createdatmulai   = $request->tanggalselesai.' 00:00:00';
                  $createdatselesai = $request->tanggalselesai.' 23:59:59';
                  $query->whereBetween('b.created_at', [$createdatmulai, $createdatselesai]);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
                  $createdatmulai   = $request->tanggalmulai.' 00:00:00';
                  $createdatselesai = $request->tanggalselesai.' 23:59:59';
                  $query->whereBetween('b.created_at', [$createdatmulai, $createdatselesai]);
              }

              $query->where('b.status', $request->status);
          })
          ->orderBy('b.created_at', 'desc');  

      return datatables()::of($table)
          ->filter(function ($query) use ($request) {
              $search = $request->get('search')['value'] ?? null;

              if ($search) {
                  $query->where(function ($q) use ($search) {
                      $q->where('p.kode_inv', 'like', "%{$search}%") 
                        ->orWhere('k.nama', 'like', "%{$search}%");   
                  });
              }
          })
          ->addIndexColumn()
          ->make(true);
  }

}
