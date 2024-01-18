<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class KartuPiutangKaryawanController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $clients = DB::table('karyawans')
      ->orderBy('nama', 'asc')
      ->get();

    return view('apps.report.kartu-piutang-karyawan',[ 'clients' => $clients ]);
  }

  public function list_detil(Request $request)
  {
      $createdatmulai = $request->tanggalmulai.' 00:00:00';
      $createdatselesai = $request->tanggalselesai.' 23:59:59';

      $pinjamans = DB::table('pinjaman_karyawans')
        ->where('id_karyawans',$request->karyawan)
        ->where('status','Disetujui')
        ->whereBetween('tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->orderBy('tanggal', 'asc')->get();

      $pengembalians = DB::table('pengembalian_pinjaman_karyawans')
        ->where('id_karyawans',$request->karyawan)
        ->whereBetween('tanggal', [$request->tanggalmulai, $request->tanggalselesai])
        ->orderBy('tanggal', 'asc')->get();

      $bayargajis = DB::table('payrolls')
        ->join('payroll_details','payrolls.id','payroll_details.id_payrolls')
        ->select('payrolls.*','payroll_details.pot_pinjaman as potongpinjaman')
        ->where('payroll_details.id_karyawans',$request->karyawan)
        ->where('payroll_details.pot_pinjaman','>','0')
        ->where('payrolls.status','Disetujui')
        ->whereBetween('payrolls.tanggal_gaji', [$request->tanggalmulai, $request->tanggalselesai])
        ->get();

//      $bayarhutangs = DB::table('bayar_hutang_karyawans')
//        ->where('id_karyawans',$request->karyawan)
//        ->whereBetween('created_at', [$createdatmulai, $createdatselesai])
//        ->orderBy('created_at', 'asc')->get();

      return view('apps.report.kartu-piutang-karyawan-detil',[ 'pinjamans' => $pinjamans, 'pengembalians' => $pengembalians, 'bayargajis' => $bayargajis, 'request' => $request ]);
  }
}
