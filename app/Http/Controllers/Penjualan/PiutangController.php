<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PiutangController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();

        return view('apps.penjualan.piutang.index',[ 'akuns' => $akuns ]);
    }

    public function list(Request $request){
        $penjualans = DB::table('penjualans')
            ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
            ->select('penjualans.*','konsumens.nama as namakonsumen')
            ->where('penjualans.pembayaran','=','Credit')
            ->where('penjualans.status','=','Selesai')
            ->where('penjualans.kode_inv','!=','')
            ->where('penjualans.sisa','>','0')
            ->orderBy('created_at','desc')
            ->get();

        return datatables()::of($penjualans)
            ->addIndexColumn()
            ->make(true);
    }

    public function pelunasan(Request $request){

        DB::beginTransaction();

        try{
            $datas = $request->datas;

            for($x=0;$x<count($datas);$x++) {
                $penjualan = DB::table('penjualans')->where('id',$datas[$x])->first();

                $sisa = $penjualan->sisa;

                $konsumen = DB::table('konsumens')->where('id',$penjualan->id_konsumens)->first();

                $piutanglama = $konsumen->piutang;
                $piutangbaru = $piutanglama - $sisa;

                DB::table('konsumens')->where('id',$penjualan->id_konsumens)->update([
                  'piutang' => $piutangbaru,
                  "updated_at" => \Carbon\Carbon::now()
                ]);

                // update sisa utang
                DB::table('penjualans')->where('id',$datas[$x])->update([
                    'sisa' => '0',
                    "updated_at" => \Carbon\Carbon::now()
                ]);


                // input tabel bayar_hutangs
                DB::table('bayar_piutangs')->insert([
                    'id_penjualans' => $datas[$x],
                    'id_users' => Auth::user()->id,
                    'nominal' => $sisa,
                    "created_at" => \Carbon\Carbon::now(),
                    "updated_at" => \Carbon\Carbon::now()
                ]);
            }

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
