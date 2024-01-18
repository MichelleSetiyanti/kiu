<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PembelianUmumController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('penampungs')
      ->orderBy('nama', 'asc')
      ->get();

    return view('apps.report.pembelian-umum',[ 'clients' => $clients ]);
  }

  public function list_detil(Request $request)
  {
      $table = DB::table('barang_belis')
        ->where('aktif','Active')
        ->where('id_kategori','!=','5')
        ->orderBy('kode', 'asc')->get();

    return view('apps.report.pembelian-umum-detil',[ 'barangs' => $table, 'request' => $request ]);
  }
}
