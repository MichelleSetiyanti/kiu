<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class RekapPinjamanKonsumen extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.report.rekap-pinjaman-konsumen');
    }

    public function list(Request $request)
    {
        $konsumens = DB::table('konsumens as k')
            ->where('k.id', '!=', '0')
            ->orderBy('k.piutang', 'desc'); 

        return datatables()::of($konsumens)
            ->filter(function ($query) use ($request) {
                $search = $request->get('search')['value'] ?? null;

                if ($search) {
                    $query->where(function ($q) use ($search) {
                        $q->where('k.kode', 'like', "%{$search}%") 
                          ->orWhere('k.nama', 'like', "%{$search}%"); 
                    });
                }
            })
            ->addIndexColumn()
            ->make(true);
    }
}
