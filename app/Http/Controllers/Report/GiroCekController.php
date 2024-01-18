<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class GiroCekController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

    public function index(){
        $konsumens = DB::table('konsumens')
          ->orderBy('nama', 'asc')
          ->where('aktif','=','Active')
          ->get();

      return view('apps.report.giro-cek',[ 'clients' => $konsumens ]);
    }

    public function list(Request $request){
      $girocek = DB::table('giros')
        ->join('konsumens','giros.id_konsumens','=','konsumens.id')
        ->select('giros.*','konsumens.nama as namakonsumen')
        ->where(function($query) use ($request)
        {

          if ($request->konsumen != "All") {
            $query->where('giros.id_konsumens', '=' , $request->konsumen);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
            $query->where('giros.tanggal_cair', '=' , $request->tanggalmulai);
          }

          if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
            $query->where('giros.tanggal_cair', '=' ,$request->tanggalselesai);
          }

          if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
            $query->whereBetween('giros.tanggal_cair', [$request->tanggalmulai, $request->tanggalselesai]);
          }

          $query->where('giros.id','!=','0');

        })
        ->orderBy('giros.id', 'desc')
        ->get();
      return datatables()::of($girocek)
        ->addIndexColumn()
        ->make(true);
    }
}
