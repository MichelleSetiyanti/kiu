<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class KartuPiutangPenampungController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('penampungs')
      ->orderBy('nama', 'asc')
      ->get();

    return view('apps.report.kartu-piutang-penampung',[ 'clients' => $clients ]);
  }

  public function list_detil(Request $request)
  {
      $createdatmulai = $request->tanggalmulai.' 00:00:00';
      $createdatselesai = $request->tanggalselesai.' 23:59:59';

      $pinjamans = DB::table('pinjaman_penampungs')
        ->where('id_penampungs',$request->penampung)
        ->whereBetween('tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->orderBy('created_at', 'asc')->get();

      $pengembalians = DB::table('pengembalian_pinjaman_penampungs')
        ->where('id_penampungs',$request->penampung)
        ->whereBetween('tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->orderBy('created_at', 'asc')->get();

      $bayarhutangs = DB::table('bayar_hutang_penampungs')
        ->where('id_penampungs',$request->penampung)
        ->whereBetween('created_at', [$createdatmulai, $createdatselesai])
        ->orderBy('created_at', 'asc')->get();

      return view('apps.report.kartu-piutang-penampung-detil',[ 'pinjamans' => $pinjamans, 'pengembalians' => $pengembalians, 'bayarhutangs' => $bayarhutangs, 'request' => $request ]);
  }
}
