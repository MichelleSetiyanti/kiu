<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PiutangJasaTimbangController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();

        return view('apps.penjualan.piutang-jasa-timbang.index',[ 'akuns' => $akuns ]);
    }

    public function list(Request $request){
        $jasa_timbangs = DB::table('jasa_timbangs')
            ->join('konsumens','jasa_timbangs.id_konsumens','=','konsumens.id')
            ->select('jasa_timbangs.*','konsumens.nama as namakonsumen')
            ->where('jasa_timbangs.pembayaran','=','Credit')
            ->where('jasa_timbangs.status','=','Selesai')
            ->where('jasa_timbangs.sisa','>','0')
            ->orderBy('created_at','desc')
            ->get();

        return datatables()::of($jasa_timbangs)
            ->addIndexColumn()
            ->make(true);
    }

    public function pelunasan(Request $request){

        DB::beginTransaction();

        try{
            $datas = $request->datas;

            for($x=0;$x<count($datas);$x++) {
                $penjualan = DB::table('jasa_timbangs')->where('id',$datas[$x])->first();

                $sisa = $penjualan->sisa;
                $akunpiutang = $penjualan->kode_akun;
                $akunpembayaran = $request->akun;

                $konsumen = DB::table('konsumens')->where('id',$penjualan->id_konsumens)->first();


                // create head jurnal
                $idjurnal = DB::table('jurnals')->insertGetId([
                    'kode' => 'JO-PP-'.$penjualan->kode,
                    'keterangan' => 'Jurnal Pelunasan Piutang Jasa Timbang untuk Kode Transaksi '.$penjualan->kode.' (Konsumen : '.$konsumen->nama.')',
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
                    'keterangan' => 'Pelunasan Piutang Jasa Timbang '.$penjualan->kode.' (Konsumen : '.$konsumen->nama.')',
                    'nominal' => $sisa,
                    "created_at" =>  \Carbon\Carbon::now(),
                    "updated_at" => \Carbon\Carbon::now()
                ]);

                $akun = DB::table('akuns')->where('kode_akun',$akunpiutang)->first();
                $balancelama = $akun->saldo;
                $balancebaru = $balancelama - $sisa;

                DB::table('akuns')->where('kode_akun',$akunpiutang)->update([
                    'saldo' => $balancebaru,
                    "updated_at" => \Carbon\Carbon::now()
                ]);


                // input jurnal kas / bank
                DB::table('jurnal_detils')->insert([
                    'id_jurnals' => $idjurnal,
                    'kode_akun' => $akunpembayaran,
                    'tipe' => 'D',
                    'keterangan' => 'Pelunasan Piutang Jasa Timbang '.$penjualan->kode.' (Konsumen : '.$konsumen->nama.')',
                    'nominal' => $sisa,
                    "created_at" =>  \Carbon\Carbon::now(),
                    "updated_at" => \Carbon\Carbon::now()
                ]);

                $akun = DB::table('akuns')->where('kode_akun',$akunpembayaran)->first();
                $balancelama = $akun->saldo;
                $balancebaru = $balancelama + $sisa;

                DB::table('akuns')->where('kode_akun',$akunpembayaran)->update([
                    'saldo' => $balancebaru,
                    "updated_at" => \Carbon\Carbon::now()
                ]);


                // update sisa utang
                DB::table('jasa_timbangs')->where('id',$datas[$x])->update([
                    'sisa' => '0',
                    "updated_at" => \Carbon\Carbon::now()
                ]);


                // input tabel bayar_hutangs
                DB::table('bayar_piutang_jasas')->insert([
                    'id_jasa_timbangs' => $datas[$x],
                    'id_users' => Auth::user()->id,
                    'nominal' => $sisa,
                    'kode_akun' => $akunpembayaran,
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
