<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class DPKonsumenController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $konsumens = DB::table('konsumens')->where('aktif','Active')->where('id','!=','0')->orderBy('nama', 'asc')->get();
        $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();

        return view('apps.penjualan.dp-konsumen.index',[ 'konsumens' => $konsumens, 'akuns' => $akuns ]);
    }

    public function list(Request $request){
        $dp_konsumens = DB::table('dp_konsumens')
            ->join('konsumens','dp_konsumens.id_konsumens','=','konsumens.id')
            ->join('akuns','dp_konsumens.kode_akun','=','akuns.kode_akun')
            ->select('dp_konsumens.*','konsumens.nama as namakonsumen','akuns.nama as namaakun')
            ->where(DB::raw('MONTH(dp_konsumens.tanggal)'), substr($request->tanggal,0,2))
            ->where(DB::raw('YEAR(dp_konsumens.tanggal)'), substr($request->tanggal,-4))
            ->orderBy('dp_konsumens.id', 'desc')
            ->get();
        return datatables()::of($dp_konsumens)
            ->addColumn('kolomakun', function ($dp_konsumens) {

                return $dp_konsumens->kode_akun.' - '.$dp_konsumens->namaakun;
            })
            ->addColumn('action', function ($dp_konsumens) {

                $class = "";
                $class2 = "";

                if(Auth::user()->status == "Staff"){
                    $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap '.$class2.'" onclick="f_edit('.$dp_konsumens->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.' '.$class2.'" onclick="f_delete('.$dp_konsumens->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
                  </div>
                ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function store(Request $request){
        $querypengeluaran = DB::table('dp_konsumens')->where('kode','like','DP/'.date("Y/m", strtotime($request->tanggal)).'%')->orderBy('id','desc');

        if ($querypengeluaran->exists()) {
            $dp_konsumens = $querypengeluaran->first();
            $pecah = explode('/',$dp_konsumens->kode);

            $kodeterakhir = $pecah[3];
        }else{
            $kodeterakhir = 0;
        }

        $kode = "DP/".date("Y/m/", strtotime($request->tanggal)).str_pad($kodeterakhir+1, 4, "0", STR_PAD_LEFT);

        parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

        DB::beginTransaction();

        try{
            DB::table('dp_konsumens')->insert([
                'id_users' => Auth::User()->id,
                'id_konsumens' => $data['konsumen'],
                'kode_akun' => $data['akun'],
                'kode' => $kode,
                'keterangan' => $data['keterangan'],
                'nominal' => $request->nominal,
                'tanggal' => $request->tanggal,
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $konsumen = DB::table('konsumens')->where('id',$data['konsumen'])->first();

            $akunutang = "2104";
            $akunkas = $data['akun'];

            // create head jurnal
            $idjurnal = DB::table('jurnals')->insertGetId([
                'kode' => 'JO-'.$kode,
                'keterangan' => 'Jurnal DP Konsumen dengan kode transaksi '. $kode . '(Konsumen : '.$konsumen->nama.')',
                'tanggal' => $request->tanggal,
                'tipe' => "Otomatis",
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);


            // input jurnal kas
            DB::table('jurnal_detils')->insert([
                'id_jurnals' => $idjurnal,
                'kode_akun' => $akunkas,
                'tipe' => 'D',
                'keterangan' => 'DP Konsumen dengan kode transaksi '. $kode . '(Konsumen : '.$konsumen->nama.')',
                'nominal' => $request->nominal,
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $akun = DB::table('akuns')->where('kode_akun',$akunkas)->first();
            $balancelama = $akun->saldo;
            $balancebaru = $balancelama + $request->nominal;

            DB::table('akuns')->where('kode_akun',$akunkas)->update([
                'saldo' => $balancebaru,
                "updated_at" => \Carbon\Carbon::now()
            ]);


            // input jurnal utang
            DB::table('jurnal_detils')->insert([
                'id_jurnals' => $idjurnal,
                'kode_akun' => $akunutang,
                'tipe' => 'K',
                'keterangan' => 'DP Konsumen dengan kode transaksi '. $kode . '(Konsumen : '.$konsumen->nama.')',
                'nominal' => $request->nominal,
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $akun = DB::table('akuns')->where('kode_akun',$akunutang)->first();
            $balancelama = $akun->saldo;
            $balancebaru = $balancelama + $request->nominal;

            DB::table('akuns')->where('kode_akun',$akunutang)->update([
                'saldo' => $balancebaru,
                "updated_at" => \Carbon\Carbon::now()
              ]);

            $utangdp = $konsumen->dp;
            $utangdpbaru = $utangdp + $request->nominal;

            DB::table('konsumens')->where('id',$data['konsumen'])->update([
              'dp' => $utangdpbaru,
              "created_at" =>  \Carbon\Carbon::now(),
            ]);

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }



    public function getdpkonsumen(Request $request){
        $konsumens = DB::table('konsumens')->where('id',$request->param)->get();

        if ($konsumens->count()){
            return number_format($konsumens[0]->dp,0,',','.');
        }else{
          return '-';
        }
    }

    public function update(Request $request){

        parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

        DB::beginTransaction();
        try{

            $dplama = DB::table('dp_konsumens')->where('id',$data['id'])->first();

            $konsumen = DB::table('konsumens')->where('id',$dplama->id_konsumens)->first();

            $utangdp = $konsumen->dp;
            $utangdpbaru = $utangdp + ($request->nominal - $dplama->nominal);

            DB::table('konsumens')->where('id',$dplama->id_konsumens)->update([
              'dp' => $utangdpbaru,
              "created_at" =>  \Carbon\Carbon::now(),
            ]);

            DB::table('dp_konsumens')->where('id',$data['id'])->update([
                'id_konsumens' => $data['konsumen'],
                'kode_akun' => $data['akun'],
                'keterangan' => $data['keterangan'],
                'nominal' => $request->nominal,
                'tanggal' => $request->tanggal,
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $kode = $data['kode'];

            // hapus jurnal DP lama
            $jurnallama = DB::table('jurnals')->where('kode','JO-'.$kode)->first();

            $detils = DB::table('jurnal_detils')->where('id_jurnals',$jurnallama->id)->get();

            foreach($detils as $detil){
                $akun = DB::table('akuns')->where('kode_akun',$detil->kode_akun)->first();

                $balancelama = $akun->saldo;
                $balancebaru = 0;

                if($akun->saldo_normal == "D"){
                    if($detil->tipe == "D"){
                        $balancebaru = $balancelama - $detil->nominal;
                    }else if($detil->tipe == "K"){
                        $balancebaru = $balancelama + $detil->nominal;
                    }
                }else if($akun->saldo_normal == "K"){
                    if($detil->tipe == "K"){
                        $balancebaru = $balancelama - $detil->nominal;
                    }else if($detil->tipe == "D"){
                        $balancebaru = $balancelama + $detil->nominal;
                    }
                }

                DB::table('akuns')->where('kode_akun',$detil->kode_akun)->update([
                    'saldo' => $balancebaru,
                    "updated_at" => \Carbon\Carbon::now()
                ]);
            }

            // hapus data jurnal
            DB::table('jurnals')->where('id',$jurnallama->id)->delete();
            DB::table('jurnal_detils')->where('id_jurnals',$jurnallama->id)->delete();

            // input ulang jurnal
            $akunutang = "2104";
            $akunkas = $data['akun'];

            // create head jurnal
            $idjurnal = DB::table('jurnals')->insertGetId([
                'kode' => 'JO-'.$kode,
                'keterangan' => 'Jurnal DP Konsumen dengan kode transaksi '. $kode . '(Konsumen : '.$konsumen->nama.')',
                'tanggal' => $request->tanggal,
                'tipe' => "Otomatis",
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);


            // input jurnal kas
            DB::table('jurnal_detils')->insert([
                'id_jurnals' => $idjurnal,
                'kode_akun' => $akunkas,
                'tipe' => 'D',
                'keterangan' => 'DP Konsumen dengan kode transaksi '. $kode . '(Konsumen : '.$konsumen->nama.')',
                'nominal' => $request->nominal,
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $akun = DB::table('akuns')->where('kode_akun',$akunkas)->first();
            $balancelama = $akun->saldo;
            $balancebaru = $balancelama + $request->nominal;

            DB::table('akuns')->where('kode_akun',$akunkas)->update([
                'saldo' => $balancebaru,
                "updated_at" => \Carbon\Carbon::now()
            ]);


            // input jurnal utang
            DB::table('jurnal_detils')->insert([
                'id_jurnals' => $idjurnal,
                'kode_akun' => $akunutang,
                'tipe' => 'K',
                'keterangan' => 'DP Konsumen dengan kode transaksi '. $kode . '(Konsumen : '.$konsumen->nama.')',
                'nominal' => $request->nominal,
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $akun = DB::table('akuns')->where('kode_akun',$akunutang)->first();
            $balancelama = $akun->saldo;
            $balancebaru = $balancelama + $request->nominal;

            DB::table('akuns')->where('kode_akun',$akunutang)->update([
                'saldo' => $balancebaru,
                "updated_at" => \Carbon\Carbon::now()
            ]);

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }

    public function requestdata(Request $request){
        $dp_konsumens = DB::table('dp_konsumens')->where('id',$request->id)->get();

        if ($dp_konsumens->count()){
            return 'ada|'. $dp_konsumens[0]->keterangan . "|" . $dp_konsumens[0]->nominal . "|" . $dp_konsumens[0]->id_konsumens . "|" . $dp_konsumens[0]->tanggal . "|" . $dp_konsumens[0]->kode . "|" . $dp_konsumens[0]->kode_akun;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            $dplama = DB::table('dp_konsumens')->where('id',$request->id)->first();

            // hapus jurnal DP
            $jurnallama = DB::table('jurnals')->where('kode','JO-'.$dplama->kode)->first();

            $detils = DB::table('jurnal_detils')->where('id_jurnals',$jurnallama->id)->get();

            foreach($detils as $detil){
                $akun = DB::table('akuns')->where('kode_akun',$detil->kode_akun)->first();

                $balancelama = $akun->saldo;
                $balancebaru = 0;

                if($akun->saldo_normal == "D"){
                    if($detil->tipe == "D"){
                        $balancebaru = $balancelama - $detil->nominal;
                    }else if($detil->tipe == "K"){
                        $balancebaru = $balancelama + $detil->nominal;
                    }
                }else if($akun->saldo_normal == "K"){
                    if($detil->tipe == "K"){
                        $balancebaru = $balancelama - $detil->nominal;
                    }else if($detil->tipe == "D"){
                        $balancebaru = $balancelama + $detil->nominal;
                    }
                }

                DB::table('akuns')->where('kode_akun',$detil->kode_akun)->update([
                    'saldo' => $balancebaru,
                    "updated_at" => \Carbon\Carbon::now()
                ]);
            }

            // hapus data jurnal
            DB::table('jurnals')->where('id',$jurnallama->id)->delete();
            DB::table('jurnal_detils')->where('id_jurnals',$jurnallama->id)->delete();


            $konsumen = DB::table('konsumens')->where('id',$dplama->id_konsumens)->first();

            $utangdp = $konsumen->dp;
            $utangdpbaru = $utangdp - $dplama->nominal;

            DB::table('konsumens')->where('id',$dplama->id_konsumens)->update([
              'dp' => $utangdpbaru,
              "created_at" =>  \Carbon\Carbon::now(),
            ]);

            DB::table('dp_konsumens')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
