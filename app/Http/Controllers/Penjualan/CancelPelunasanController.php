<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class CancelPelunasanController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();

        return view('apps.penjualan.cancel-pelunasan.index',[ 'akuns' => $akuns ]);
    }

    public function list(Request $request){
        $penjualans = DB::table('bayar_piutangs')
            ->join('penjualans','bayar_piutangs.id_penjualans','=','penjualans.id')
            ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
            ->join('users','bayar_piutangs.id_users','=','users.id')
            ->select('penjualans.*','konsumens.nama as namakonsumen','users.name as namauser','bayar_piutangs.nominal as totalpelunasan','bayar_piutangs.created_at as waktupelunasan','bayar_piutangs.id as idpelunasan')
            ->where('bayar_piutangs.status','=','Paid')
            ->orderBy('bayar_piutangs.created_at','desc')
            ->get();
        return datatables()::of($penjualans)
          ->addColumn('action', function ($penjualans) {

            return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_prosespelunasan(' . $penjualans->idpelunasan . ',' . $penjualans->totalpelunasan . ')"><i class="feather icon-x-square" data-toggle="tooltip" title="Proses Pembatalan Piutang"></i></span>
                  </div>
                ';
          })
            ->addIndexColumn()
            ->make(true);
    }

    public function pelunasan(Request $request){

        DB::beginTransaction();

        try{
            $bayarpiutangs = DB::table('bayar_piutangs')->where('id',$request->id)->first();

            $penjualan = DB::table('penjualans')->where('id',$bayarpiutangs->id_penjualans)->first();

            $konsumen = DB::table('konsumens')->where('id',$penjualan->id_konsumens)->first();

            $sisa = $penjualan->sisa;
            $nominalpelunasan = $request->nominal;

            $sisabaru = $sisa + $nominalpelunasan;

            $piutanglama = $konsumen->piutang;
            $piutangbaru = $piutanglama + $nominalpelunasan;

            DB::table('konsumens')->where('id',$penjualan->id_konsumens)->update([
              'piutang' => $piutangbaru,
              "updated_at" => \Carbon\Carbon::now()
            ]);

            // update sisa utang
            DB::table('penjualans')->where('id',$bayarpiutangs->id_penjualans)->update([
                'sisa' => $sisabaru,
                "updated_at" => \Carbon\Carbon::now()
            ]);


            // input tabel bayar_piutangs
            DB::table('cancel_bayar_piutangs')->insert([
                'id_penjualans' => $bayarpiutangs->id_penjualans,
                'id_users' => Auth::user()->id,
                'nominal' => $nominalpelunasan,
                "created_at" => \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            DB::table('bayar_piutangs')->where('id',$request->id)->update([
              'status' => 'Cancel',
              "updated_at" => \Carbon\Carbon::now()
            ]);

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
