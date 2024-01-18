<?php

namespace App\Http\Controllers\Laporan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LaporanMutasiController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $inventories = DB::table('inventories')->where('aktif','Active')->orderBy('nama', 'asc')->get();
        $users = DB::table('users')->where('id','!=','0')->orderBy('name', 'asc')->get();

        return view('apps.inventory.laporan.mutasi',[ 'users' => $users, 'inventories' => $inventories]);
    }

    public function list(Request $request){
        $tanggalmulai = $request->tanggalmulai;
        $tanggalselesai = $request->tanggalselesai;
        $user = $request->user;
        $inventories = $request->inventories;
        $status = $request->status;

        $select = DB::table('inventories_migrations')
            ->join('inventories', 'inventories_migrations.id_inventories', '=', 'inventories.id')
            ->join('users', 'inventories_migrations.id_user', '=', 'users.id')
            ->select('inventories_migrations.*', 'inventories.nama as nama_inventories', 'inventories.satuan as satuan_inventories', 'users.name as nama_user')

            ->where(function($query) use ($tanggalmulai,$tanggalselesai,$user,$inventories,$status)
            {
                if ($tanggalmulai != "" && $tanggalselesai == "") {
                    $query->where('inventories_migrations.tanggal', '=' , $tanggalmulai);
                }

                if ($tanggalmulai == "" && $tanggalselesai != "") {
                    $query->where('inventories_migrations.tanggal', '=' ,$tanggalselesai);
                }

                if ($tanggalmulai != "" && $tanggalselesai != "") {
                    $query->whereBetween('inventories_migrations.tanggal', [$tanggalmulai, $tanggalselesai]);
                }

                if($user != "All"){
                    $query->where('inventories_migrations.id_user', $user);
                }

                if($inventories != "All"){
                    $query->where('inventories_migrations.id_inventories', $inventories);
                }

                if($status != "All"){
                    $query->where('inventories_migrations.status', $status);
                }

            })

            ->orderBy('id', 'desc')
            ->get();
        return datatables()::of($select)
            ->addIndexColumn()
            ->make(true);
    }

    public function index_inventories(){
        $inventories = DB::table('inventories')->where('aktif','Active')->orderBy('nama', 'asc')->get();

        return view('apps.inventory.laporan.inventoriesdetail',[ 'inventories' => $inventories]);
    }

    public function list_inventories(Request $request){
        $tanggalmulai = $request->tanggalmulai;
        $tanggalselesai = $request->tanggalselesai;
        $user = $request->user;
        $inventories = $request->inventories;
        $status = $request->status;

        $select = DB::table('inventories_detail')
            ->join('inventories', 'inventories_detail.id_inventories', '=', 'inventories.id')
            ->select('inventories_detail.*', 'inventories.nama as nama_inventories', 'inventories.satuan as satuan_inventories')

            ->where(function($query) use ($tanggalmulai,$tanggalselesai,$user,$inventories,$status)
            {
                if ($tanggalmulai != "" && $tanggalselesai == "") {
                    $query->where('inventories_detail.created_at', '=' , $tanggalmulai);
                }

                if ($tanggalmulai == "" && $tanggalselesai != "") {
                    $query->where('inventories_detail.created_at', '=' ,$tanggalselesai);
                }

                if ($tanggalmulai != "" && $tanggalselesai != "") {
                    $query->whereBetween('inventories_detail.created_at', [$tanggalmulai, $tanggalselesai]);
                }

                if($inventories != "All"){
                    $query->where('inventories_detail.id_inventories', $inventories);
                }

                if($status != "All"){
                    $query->where('inventories_detail.status', $status);
                }

            })

            ->orderBy('id', 'asc')
            ->get();
        return datatables()::of($select)
            ->addColumn('tanggal', function ($select) {
                $pecah = explode(" ",$select->created_at);
                return $pecah[0];
            })
            ->addIndexColumn()
            ->make(true);
    }
}
