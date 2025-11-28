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

    public function list(Request $request)
    {
        $girocek = DB::table('giros as g')
            ->join('konsumens as k', 'g.id_konsumens', '=', 'k.id')
            ->select(
                'g.*',
                'k.nama as namakonsumen'
            )
            ->where(function($query) use ($request) {

                if ($request->konsumen != "All") {
                    $query->where('g.id_konsumens', $request->konsumen);
                }

                if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
                    $query->where('g.tanggal_cair', $request->tanggalmulai);
                }

                if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
                    $query->where('g.tanggal_cair', $request->tanggalselesai);
                }

                if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
                    $query->whereBetween('g.tanggal_cair', [
                        $request->tanggalmulai,
                        $request->tanggalselesai
                    ]);
                }

                $query->where('g.id', '!=', '0');
            })
            ->orderBy('g.id', 'desc'); 

        return datatables()::of($girocek)
            ->filter(function ($query) use ($request) {
                $search = $request->get('search')['value'] ?? null;

                if ($search) {
                    $query->where(function ($q) use ($search) {
                        $q->where('g.nomor_giro', 'like', "%{$search}%")   
                          ->orWhere('k.nama', 'like', "%{$search}%");
                    });
                }
            })
            ->addIndexColumn()
            ->make(true);
    }
}
