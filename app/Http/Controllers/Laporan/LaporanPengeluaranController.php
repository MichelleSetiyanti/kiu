<?php

namespace App\Http\Controllers\Laporan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LaporanPengeluaranController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $inventories = DB::table('inventories')->where('aktif','Active')->orderBy('nama', 'asc')->get();
        $users = DB::table('users')->where('id','!=','0')->orderBy('name', 'asc')->get();
        $karyawans = DB::table('karyawan')->orderBy('nama', 'asc')->get();

        return view('apps.inventory.laporan.pengeluaran',[ 'karyawans' => $karyawans, 'users' => $users, 'inventories' => $inventories]);
    }

    public function list(Request $request){
        $tanggalmulai = $request->tanggalmulai;
        $tanggalselesai = $request->tanggalselesai;
        $user = $request->user;
        $karyawan = $request->karyawan;
        $status = $request->status;

        $select = DB::table('pengeluaran_inventories')
            ->join('users', 'pengeluaran_inventories.id_user', '=', 'users.id')
            ->join('karyawan', 'pengeluaran_inventories.id_karyawan', '=', 'karyawan.id')
            ->select('pengeluaran_inventories.*', 'karyawan.nama as nama_karyawan', 'users.name as nama_user')

            ->where(function($query) use ($tanggalmulai,$tanggalselesai,$user,$karyawan,$status)
            {
                if ($tanggalmulai != "" && $tanggalselesai == "") {
                    $query->where('pengeluaran_inventories.tanggal', '=' , $tanggalmulai);
                }

                if ($tanggalmulai == "" && $tanggalselesai != "") {
                    $query->where('pengeluaran_inventories.tanggal', '=' ,$tanggalselesai);
                }

                if ($tanggalmulai != "" && $tanggalselesai != "") {
                    $query->whereBetween('pengeluaran_inventories.tanggal', [$tanggalmulai, $tanggalselesai]);
                }

                if($user != "All"){
                    $query->where('pengeluaran_inventories.id_user', $user);
                }

                if($karyawan != "All"){
                    $query->where('pengeluaran_inventories.id_karyawan', $karyawan);
                }

                if($status != "All"){
                    $query->where('pengeluaran_inventories.status', $status);
                }

            })

            ->orderBy('id', 'desc')
            ->get();
        return datatables()::of($select)
            ->addColumn('action', function ($detail) {
                return '
              <div class="fonticon-container">
                <span class="fonticon-wrap" onclick="f_datadetil('."'".$detail->id_pengeluaran."'".')"><i class="feather icon-file-text" data-toggle="tooltip" title="Lihat Data Detil"></i></span>
                
              </div>
            ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function list_detail(Request $request){
        $detail = DB::table('pengeluaran_inventories_detail')
            ->join('inventories', 'pengeluaran_inventories_detail.id_inventories', '=', 'inventories.id')
            ->select('pengeluaran_inventories_detail.*', 'inventories.nama as nama_inventories', 'inventories.satuan as satuan_inventories')
            ->where('id_pengeluaran',$request->id)
            ->orderBy('id', 'asc')
            ->get();
        return datatables()::of($detail)
            ->addIndexColumn()
            ->make(true);
    }
}
