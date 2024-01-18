<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class BukuBesarRinciController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $akuns = DB::table('akuns')->where('aktif','=','Active')->get();

    return view('apps.report.bukubesar-rinci', [ 'akuns' => $akuns ]);
  }

  public function list_detil(Request $request)
  {
    $table = DB::table('akuns')
      ->orderBy('kode_akun', 'asc')
      ->where(function($query) use ($request)
      {

        if($request->akun != "All"){
          $query->where('kode_akun', $request->akun);
        }

      })
      ->get();

    return view('apps.report.bukubesar-rinci-detil',[ 'akuns' => $table, 'request' => $request ]);
  }

}
