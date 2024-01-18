<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LabaRugiSupplierDropshipperController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('penampungs')
      ->orderBy('nama', 'asc')
      ->get();

    return view('apps.report.lr-supplier-dropshipper',[ 'clients' => $clients ]);
  }

  public function list_detil(Request $request)
  {
      $table = DB::table('dropshippers')
        ->join('penampungs','dropshippers.id_penampungs','=','penampungs.id')
        ->select('dropshippers.*','penampungs.nama as namapenampung')
        ->whereBetween('dropshippers.tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->orderBy('dropshippers.id_penampungs', 'asc')
        ->orderBy('dropshippers.id', 'asc')
        ->get();

    return view('apps.report.lr-supplier-dropshipper-detil',[ 'tables' => $table, 'request' => $request ]);
  }
}
