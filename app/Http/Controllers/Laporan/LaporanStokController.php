<?php

namespace App\Http\Controllers\Laporan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LaporanStokController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $inventories = DB::table('inventories')->where('aktif','Active')->orderBy('nama', 'asc')->get();

        return view('apps.inventory.laporan.inventories',[ 'inventories' => $inventories]);
    }

    public function list(Request $request){
        $inventories = $request->inventories;

        $select = DB::table('inventories')
            ->where(function($query) use ($inventories)
            {
                if($inventories != "All"){
                    $query->where('id', $inventories);
                }
            })

            ->orderBy('nama', 'asc')
            ->get();
        return datatables()::of($select)
            ->addIndexColumn()
            ->make(true);
    }
}
