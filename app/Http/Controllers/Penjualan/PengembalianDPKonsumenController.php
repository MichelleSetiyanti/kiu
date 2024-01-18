<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PengembalianDPKonsumenController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $konsumens = DB::table('konsumens')->where('aktif','Active')->where('id','!=','0')->orderBy('nama', 'asc')->get();
    $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();

    return view('apps.penjualan.pengembalian-dp-konsumen.index',[ 'konsumens' => $konsumens, 'akuns' => $akuns ]);
  }

  public function list(Request $request){
    $pengembalian_dp_konsumens = DB::table('pengembalian_dp_konsumens')
      ->join('konsumens','pengembalian_dp_konsumens.id_konsumens','=','konsumens.id')
      ->join('akuns','pengembalian_dp_konsumens.kode_akun','=','akuns.kode_akun')
      ->select('pengembalian_dp_konsumens.*','konsumens.nama as namakonsumen','akuns.nama as namaakun')
      ->where(DB::raw('MONTH(pengembalian_dp_konsumens.tanggal)'), substr($request->tanggal,0,2))
      ->where(DB::raw('YEAR(pengembalian_dp_konsumens.tanggal)'), substr($request->tanggal,-4))
      ->orderBy('pengembalian_dp_konsumens.id', 'desc')
      ->get();
    return datatables()::of($pengembalian_dp_konsumens)
      ->addColumn('kolomakun', function ($pengembalian_dp_konsumens) {

        return $pengembalian_dp_konsumens->kode_akun.' - '.$pengembalian_dp_konsumens->namaakun;
      })
      ->addColumn('action', function ($pengembalian_dp_konsumens) {

        $class = "";
        $class2 = "";

        if(Auth::user()->status != "Supervisor" && Auth::user()->status != "Super Admin" && Auth::user()->status != "Owner"){
          $class = "hidden";
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap '.$class2.'" onclick="f_edit('.$pengembalian_dp_konsumens->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap '.$class.' '.$class2.'" onclick="f_delete('.$pengembalian_dp_konsumens->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function store(Request $request){
    $querypengeluaran = DB::table('pengembalian_dp_konsumens')->where('kode','like','PeDP/'.date("Y/m", strtotime($request->tanggal)).'%')->orderBy('id','desc');

    if ($querypengeluaran->exists()) {
      $pengembalian_dp_konsumens = $querypengeluaran->first();
      $pecah = explode('/',$pengembalian_dp_konsumens->kode);

      $kodeterakhir = $pecah[3];
    }else{
      $kodeterakhir = 0;
    }

    $kode = "PeDP/".date("Y/m/", strtotime($request->tanggal)).str_pad($kodeterakhir+1, 4, "0", STR_PAD_LEFT);

    parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

    DB::beginTransaction();

    try{
      DB::table('pengembalian_dp_konsumens')->insert([
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

      $akunutang = "2104";
      $akunkas = $data['akun'];

      $konsumen = DB::table('konsumens')->where('id',$data['konsumen'])->first();

      // create head jurnal
      $idjurnal = DB::table('jurnals')->insertGetId([
        'kode' => 'JO-'.$kode,
        'keterangan' => 'Jurnal Pengembalian DP Konsumen dengan kode '.$kode . '(Konsumen : '.$konsumen->nama.')',
        'tanggal' => $request->tanggal,
        'tipe' => "Otomatis",
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);


      // input jurnal kas
      DB::table('jurnal_detils')->insert([
        'id_jurnals' => $idjurnal,
        'kode_akun' => $akunkas,
        'tipe' => 'K',
        'keterangan' => 'Pengembalian DP Konsumen '.$kode . '(Konsumen : '.$konsumen->nama.')',
        'nominal' => $request->nominal,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $akun = DB::table('akuns')->where('kode_akun',$akunkas)->first();
      $balancelama = $akun->saldo;
      $balancebaru = $balancelama - $request->nominal;

      DB::table('akuns')->where('kode_akun',$akunkas)->update([
        'saldo' => $balancebaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);


      // input jurnal utang
      DB::table('jurnal_detils')->insert([
        'id_jurnals' => $idjurnal,
        'kode_akun' => $akunutang,
        'tipe' => 'D',
        'keterangan' => 'Pengembalian DP Konsumen '.$kode . '(Konsumen : '.$konsumen->nama.')',
        'nominal' => $request->nominal,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $akun = DB::table('akuns')->where('kode_akun',$akunutang)->first();
      $balancelama = $akun->saldo;
      $balancebaru = $balancelama - $request->nominal;

      DB::table('akuns')->where('kode_akun',$akunutang)->update([
        'saldo' => $balancebaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $utangdp = $konsumen->dp;
      $utangdpbaru = $utangdp - $request->nominal;

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

  public function update(Request $request){

    parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

    DB::beginTransaction();
    try{

      $dplama = DB::table('pengembalian_dp_konsumens')->where('id',$data['id'])->first();

      $konsumen = DB::table('konsumens')->where('id',$dplama->id_konsumens)->first();

      $utangdp = $konsumen->dp;
      $utangdpbaru = $utangdp - ($request->nominal - $dplama->nominal);

      DB::table('konsumens')->where('id',$dplama->id_konsumens)->update([
        'dp' => $utangdpbaru,
        "created_at" =>  \Carbon\Carbon::now(),
      ]);

      DB::table('pengembalian_dp_konsumens')->where('id',$data['id'])->update([
        'kode_akun' => $data['akun'],
        'keterangan' => $data['keterangan'],
        'nominal' => $request->nominal,
        'tanggal' => $request->tanggal,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $kode = $dplama->kode;

      // hapus jurnal Pengembalian DP lama
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
        'keterangan' => 'Jurnal Pengembalian DP Konsumen dengan kode '. $kode . '(Konsumen : '.$konsumen->nama.')',
        'tanggal' => $request->tanggal,
        'tipe' => "Otomatis",
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);


      // input jurnal kas
      DB::table('jurnal_detils')->insert([
        'id_jurnals' => $idjurnal,
        'kode_akun' => $akunkas,
        'tipe' => 'K',
        'keterangan' => 'Pengembalian DP Konsumen '. $kode . '(Konsumen : '.$konsumen->nama.')',
        'nominal' => $request->nominal,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $akun = DB::table('akuns')->where('kode_akun',$akunkas)->first();
      $balancelama = $akun->saldo;
      $balancebaru = $balancelama - $request->nominal;

      DB::table('akuns')->where('kode_akun',$akunkas)->update([
        'saldo' => $balancebaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);


      // input jurnal utang
      DB::table('jurnal_detils')->insert([
        'id_jurnals' => $idjurnal,
        'kode_akun' => $akunutang,
        'tipe' => 'D',
        'keterangan' => 'Pengembalian DP Konsumen '. $kode . '(Konsumen : '.$konsumen->nama.')',
        'nominal' => $request->nominal,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $akun = DB::table('akuns')->where('kode_akun',$akunutang)->first();
      $balancelama = $akun->saldo;
      $balancebaru = $balancelama - $request->nominal;

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
    $pengembalian_dp_konsumens = DB::table('pengembalian_dp_konsumens')->where('id',$request->id)->get();

    if ($pengembalian_dp_konsumens->count()){
      return 'ada|'. $pengembalian_dp_konsumens[0]->keterangan . "|" . $pengembalian_dp_konsumens[0]->nominal . "|" . $pengembalian_dp_konsumens[0]->id_konsumens . "|" . $pengembalian_dp_konsumens[0]->tanggal . "|" . $pengembalian_dp_konsumens[0]->kode . "|" . $pengembalian_dp_konsumens[0]->kode_akun;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{
      $dplama = DB::table('pengembalian_dp_konsumens')->where('id',$request->id)->first();

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
      $utangdpbaru = $utangdp + $dplama->nominal;

      DB::table('konsumens')->where('id',$dplama->id_konsumens)->update([
        'dp' => $utangdpbaru,
        "created_at" =>  \Carbon\Carbon::now(),
      ]);

      DB::table('pengembalian_dp_konsumens')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
