<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class RekapPinjamanKaryawan extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.report.rekap-pinjaman-karyawan');
    }

    public function list(){
        $karyawans = DB::table('karyawans')
            ->orderBy('pinjaman', 'desc')
            ->where('id','!=','0')
            ->get();
        return datatables()::of($karyawans)
            ->addIndexColumn()
            ->make(true);
    }
}
