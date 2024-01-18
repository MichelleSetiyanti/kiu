<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class KeseluruhanJurnalController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.report.keseluruhan-jurnal');
  }

  public function list_detil(Request $request)
  {
    $table = DB::table('jurnals')
      ->orderBy('created_at', 'asc')
      ->where(function($query) use ($request)
      {

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('tanggal', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('tanggal', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        }

      })
      ->get();

    return view('apps.report.keseluruhan-jurnal-detil',[ 'jurnals' => $table, 'request' => $request ]);
  }

}
