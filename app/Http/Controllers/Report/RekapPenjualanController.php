<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class RekapPenjualanController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->get();

    return view('apps.report.rekap-penjualan',[ 'clients' => $clients ]);
  }

  public function list_detil(Request $request)
  {
      $table = DB::table('barangs')
        ->where('aktif','Active')
        ->orderBy('kode', 'asc')->get();

    return view('apps.report.rekap-penjualan-detil',[ 'barangs' => $table, 'request' => $request ]);
  }
}
