<?php

namespace App\Http\Controllers\Laporan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LaporanPembelianController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $inventories = DB::table('inventories')->where('aktif','Active')->orderBy('nama', 'asc')->get();
        $users = DB::table('users')->where('id','!=','0')->orderBy('name', 'asc')->get();
        $suppliers = DB::table('suppliers')->orderBy('nama', 'asc')->get();

        return view('apps.inventory.laporan.pembelian',[ 'suppliers' => $suppliers, 'users' => $users, 'inventories' => $inventories]);
    }

    public function list(Request $request){
        $tanggalmulai = $request->tanggalmulai;
        $tanggalselesai = $request->tanggalselesai;
        $user = $request->user;
        $supplier = $request->supplier;
        $status = $request->status;
        $metodepembayaran = $request->metodepembayaran;

        $select = DB::table('pembelian_inventories')
            ->join('users', 'pembelian_inventories.id_user', '=', 'users.id')
            ->join('suppliers', 'pembelian_inventories.id_supplier', '=', 'suppliers.id')
            ->select('pembelian_inventories.*', 'suppliers.nama as nama_supplier', 'users.name as nama_user')

            ->where(function($query) use ($tanggalmulai,$tanggalselesai,$user,$supplier,$status,$metodepembayaran)
            {
                if ($tanggalmulai != "" && $tanggalselesai == "") {
                    $query->where('pembelian_inventories.tanggal', '=' , $tanggalmulai);
                }

                if ($tanggalmulai == "" && $tanggalselesai != "") {
                    $query->where('pembelian_inventories.tanggal', '=' ,$tanggalselesai);
                }

                if ($tanggalmulai != "" && $tanggalselesai != "") {
                    $query->whereBetween('pembelian_inventories.tanggal', [$tanggalmulai, $tanggalselesai]);
                }

                if($user != "All"){
                    $query->where('pembelian_inventories.id_user', $user);
                }

                if($supplier != "All"){
                    $query->where('pembelian_inventories.id_supplier', $supplier);
                }

                if($status != "All"){
                    $query->where('pembelian_inventories.status', $status);
                }

                if($metodepembayaran != "All"){
                    $query->where('pembelian_inventories.metode_pembayaran', $metodepembayaran);
                }

            })

            ->orderBy('id', 'desc')
            ->get();
        return datatables()::of($select)
            ->addColumn('action', function ($detail) {
                return '
              <div class="fonticon-container">
                <span class="fonticon-wrap" onclick="f_datadetil('."'".$detail->id_pembelian."'".')"><i class="feather icon-file-text" data-toggle="tooltip" title="Lihat Data Detil"></i></span>
                
              </div>
            ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function list_detail(Request $request){
        $detail = DB::table('pembelian_inventories_detail')
            ->join('inventories', 'pembelian_inventories_detail.id_inventories', '=', 'inventories.id')
            ->select('pembelian_inventories_detail.*', 'inventories.nama as nama_inventories', 'inventories.satuan as satuan_inventories')
            ->where('id_pembelian',$request->id)
            ->orderBy('id', 'asc')
            ->get();
        return datatables()::of($detail)
        ->addIndexColumn()
        ->make(true);
    }
}
