<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class BulkPayrollController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.report.bulk-payroll');
  }

  public function list(Request $request)
  {

    $payrolls = DB::table('payrolls')
      ->join('users','payrolls.id_users','=','users.id')
      ->select('payrolls.*','users.name as namauser')
      ->where(function($query) use ($request)
      {

        if($request->status != "All"){
          $query->where('payrolls.status', $request->status);
        }

        if($request->jenisgaji != "All"){
          $query->where('payrolls.jenis_gaji', $request->jenisgaji);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('payrolls.tanggal_gaji', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('payrolls.tanggal_gaji', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('payrolls.tanggal_gaji', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('payrolls.id','!=','0');

      })
      ->orderBy('updated_at','desc')
      ->get();
    return datatables()::of($payrolls)
      ->addColumn('action', function ($payrolls) {
        $encrypt = Crypt::encrypt($payrolls->id);

        return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="window.open(\'/payroll/bulk-payroll/view-detil/' . $encrypt . '\',\'_blank\')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Data Detil"></i></span>
                  </div>
                ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function index_details(){
    $karyawans = DB::table('karyawans')->where('id','!=','0')->orderBy('nama', 'asc')->get();

    return view('apps.report.lap-bulk-payroll', [ 'karyawans' => $karyawans]);
  }

  public function list_details(Request $request)
  {

    $payrolls = DB::table('payrolls')
      ->join('payroll_details','payroll_details.id_payrolls','=','payrolls.id')
      ->join('karyawans','payroll_details.id_karyawans','=','karyawans.id')
      ->join('akuns','payroll_details.kode_akun','=','akuns.kode_akun')
      ->join('users','payrolls.id_users','=','users.id')
      ->select('payroll_details.*','karyawans.nama as namakaryawan','akuns.nama as namaakun','payrolls.tanggal_gaji as tanggalgaji')
      ->where(function($query) use ($request)
      {

        if($request->status != "All"){
          $query->where('payrolls.status', $request->status);
        }

        if($request->jenisgaji != "All"){
          $query->where('payrolls.jenis_gaji', $request->jenisgaji);
        }

        if($request->karyawan != "All"){
          $query->where('payroll_details.id_karyawans', $request->karyawan);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('payrolls.tanggal_gaji', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('payrolls.tanggal_gaji', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('payrolls.tanggal_gaji', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('payrolls.id','!=','0');

      })
      ->orderBy('updated_at','desc')
      ->get();
    return datatables()::of($payrolls)
      ->addIndexColumn()
      ->make(true);
  }

  public function list_detil(Request $request)
  {
    $table = DB::table('payrolls')
      ->join('users','payrolls.id_users','=','users.id')
      ->select('payrolls.*','users.name as namauser')
      ->where(function($query) use ($request)
      {

        if($request->status != "All"){
          $query->where('payrolls.status', $request->status);
        }

        if($request->jenisgaji != "All"){
          $query->where('payrolls.jenis_gaji', $request->jenisgaji);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
          $query->where('payrolls.tanggal_gaji', '=' , $request->tanggalmulai);
        }

        if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
          $query->where('payrolls.tanggal_gaji', '=' ,$request->tanggalselesai);
        }

        if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
          $query->whereBetween('payrolls.tanggal_gaji', [$request->tanggalmulai, $request->tanggalselesai]);
        }

        $query->where('payrolls.id','!=','0');

      })
      ->orderBy('updated_at','desc')
      ->get();

    return view('apps.report.bulk-payroll-detil',[ 'payrolls' => $table, 'request' => $request ]);
  }
}
