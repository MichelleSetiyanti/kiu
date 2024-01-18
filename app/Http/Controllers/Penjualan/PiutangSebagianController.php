<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PiutangSebagianController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();

        return view('apps.penjualan.piutang-sebagian.index',[ 'akuns' => $akuns ]);
    }

    public function list(Request $request){
        $penjualans = DB::table('penjualans')
            ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
            ->select('penjualans.*','konsumens.nama as namakonsumen')
            ->where('penjualans.pembayaran','=','Credit')
            ->where('penjualans.status','=','Selesai')
            ->where('penjualans.sisa','>','0')
            ->orderBy('created_at','desc')
            ->get();
        return datatables()::of($penjualans)
          ->addColumn('action', function ($penjualans) {

            return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_prosespelunasan(' . $penjualans->id . ',' . $penjualans->sisa . ')"><i class="feather icon-check-circle" data-toggle="tooltip" title="Proses Pelunasan Sebagian"></i></span>
                  </div>
                ';
          })
            ->addIndexColumn()
            ->make(true);
    }

    public function pelunasan(Request $request){

        DB::beginTransaction();

        try{
            $penjualan = DB::table('penjualans')->where('id',$request->id)->first();

            $konsumen = DB::table('konsumens')->where('id',$penjualan->id_konsumens)->first();

            $sisa = $penjualan->sisa;
            $nominalpelunasan = $request->nominal;
            $akunpiutang = $penjualan->kode_akun;
            $akunpembayaran = $request->akun;

            $details = DB::table('jurnals')->select(DB::raw('max(substr(kode,-2)) as nomor_max'))->where('kode','like','JO-PP-'.$penjualan->kode.'-%')->get();

            $nounik = str_pad((int)$details[0]->nomor_max + 1,2,"0",STR_PAD_LEFT);

            // create head jurnal
            $idjurnal = DB::table('jurnals')->insertGetId([
                'kode' => 'JO-PP-'.$penjualan->kode.'-'.$nounik,
                'keterangan' => 'Jurnal Pelunasan Sebagian Piutang Penjualan untuk Kode Transaksi '.$penjualan->kode.' (Konsumen : '.$konsumen->nama.')',
                'tanggal' => \Carbon\Carbon::now(),
                'tipe' => "Otomatis",
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);


            // input jurnal piutang
            DB::table('jurnal_detils')->insert([
                'id_jurnals' => $idjurnal,
                'kode_akun' => $akunpiutang,
                'tipe' => 'K',
                'keterangan' => 'Pelunasan Sebagian Piutang Penjualan '.$penjualan->kode.' (Konsumen : '.$konsumen->nama.')',
                'nominal' => $nominalpelunasan,
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $akun = DB::table('akuns')->where('kode_akun',$akunpiutang)->first();
            $balancelama = $akun->saldo;
            $balancebaru = $balancelama - $nominalpelunasan;

            DB::table('akuns')->where('kode_akun',$akunpiutang)->update([
                'saldo' => $balancebaru,
                "updated_at" => \Carbon\Carbon::now()
            ]);


            // input jurnal kas / bank
            DB::table('jurnal_detils')->insert([
                'id_jurnals' => $idjurnal,
                'kode_akun' => $akunpembayaran,
                'tipe' => 'D',
                'keterangan' => 'Pelunasan Sebagian Piutang Penjualan '.$penjualan->kode.' (Konsumen : '.$konsumen->nama.')',
                'nominal' => $nominalpelunasan,
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $akun = DB::table('akuns')->where('kode_akun',$akunpembayaran)->first();
            $balancelama = $akun->saldo;
            $balancebaru = $balancelama + $nominalpelunasan;

            DB::table('akuns')->where('kode_akun',$akunpembayaran)->update([
                'saldo' => $balancebaru,
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $sisabaru = $sisa - $nominalpelunasan;

            // update sisa piutang
            DB::table('penjualans')->where('id',$request->id)->update([
                'sisa' => $sisabaru,
                "updated_at" => \Carbon\Carbon::now()
            ]);


            // input tabel bayar_piutangs
            DB::table('bayar_piutangs')->insert([
                'id_penjualans' => $request->id,
                'id_users' => Auth::user()->id,
                'nominal' => $nominalpelunasan,
                'kode_akun' => $akunpembayaran,
                "created_at" => \Carbon\Carbon::now(),
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
