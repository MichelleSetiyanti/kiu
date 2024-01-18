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

    public function list(){
        $konsumens = DB::table('konsumens')
            ->orderBy('piutang', 'desc')
            ->where('id','!=','0')
            ->get();
        return datatables()::of($konsumens)
            ->addIndexColumn()
            ->make(true);
    }
}
