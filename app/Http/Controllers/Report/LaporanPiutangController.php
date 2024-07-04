<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LaporanPiutangController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index()
  {
    $clients = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->get();

    return view('apps.report.laporan-piutang', ['clients' => $clients]);
  }

  public function list(Request $request)
  {
    $tidaklunas = DB::table('konsumens')
      ->where(
        function ($query) use ($request) {
          if ($request->client != "All") {
            $query->where('id', '=', $request->client);
          }
        }
      )->where(
        function ($query) use ($request) {
          if ($request->pelunasan == "Belum Lunas") {
            $query->where('piutang', '!=', 0);
          }
        }
      )
      ->orderBy('nama', 'asc')
      ->get();

    $lunas = DB::table('konsumens')
      ->where(function ($query) use ($request) {
        if ($request->pelunasan == "lunas") {
          $query->where('piutang', '=', 0);
        }
      })
      ->where(
        function ($query) use ($request) {
          if ($request->client != "All") {
            $query->where('id', '=', $request->client);
          }
        }
      )
      ->orderBy('nama', 'asc')
      ->get();

    $nonpajak = DB::table('penjualans')
      ->where('pajak', '<=', 0)
      ->get();

    $pajak = DB::table('penjualans')
      ->where('pajak', '>', 0)
      ->get();

    return view('apps.report.laporan-piutang-detil', [
      'konsumens' => $tidaklunas,
      'request' => $request,
      'lunas' => $lunas,
      'pajaks' => $pajak,
      'nonpajaks' => $nonpajak,
    ]);
  }
}
