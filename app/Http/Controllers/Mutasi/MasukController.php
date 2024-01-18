<?php

namespace App\Http\Controllers\Mutasi;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class MasukController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $produks = DB::table('barangs')
      ->select('barangs.*')
      ->where('barangs.aktif','Active')
      ->orderBy('kode', 'asc')->get();

    return view('apps.mutasi.masuk.index',[ 'produks' => $produks ]);
  }

  public function list(Request $request){
    $mutasi_masuk_barangs = DB::table('mutasi_masuk_barangs')
      ->join('users','mutasi_masuk_barangs.id_users','=','users.id')
      ->join('barangs','mutasi_masuk_barangs.id_barangs','=','barangs.id')
      ->select('mutasi_masuk_barangs.*','users.name as namauser','barangs.nama as namabarang')
      ->where(DB::raw('MONTH(mutasi_masuk_barangs.created_at)'), substr($request->tanggal,0,2))
      ->where(DB::raw('YEAR(mutasi_masuk_barangs.created_at)'), substr($request->tanggal,-4))
      ->orderBy('id', 'desc')
      ->get();
    return datatables()::of($mutasi_masuk_barangs)
      ->addColumn('action', function ($mutasi_masuk_barangs) {

        $class = "";

        if(Auth::user()->status != "Supervisor" && Auth::user()->status != "Super Admin" && Auth::user()->status != "Owner"){
          $class = "hidden";
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap '.$class.'" onclick="f_edit('.$mutasi_masuk_barangs->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$mutasi_masuk_barangs->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function store(Request $request){
    $datenow = date("Y/m");

    $querypemasukan = DB::table('mutasi_masuk_barangs')->where('kode','like','MTSM/'.$datenow.'/%')->orderBy('id','desc');

    if ($querypemasukan->exists()) {
      $mutasi_masuk_barangs = $querypemasukan->first();
      $pecah = explode('/',$mutasi_masuk_barangs->kode);

      $kodeterakhir = $pecah[3];
    }else{
      $kodeterakhir = 0;
    }

    $kode = "MTSM/".$datenow.'/'.str_pad($kodeterakhir+1, 4, "0", STR_PAD_LEFT);

    parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

    DB::beginTransaction();

    try{
      DB::table('mutasi_masuk_barangs')->insert([
        'id_users' => Auth::User()->id,
        'id_barangs' => $data['produks'],
        'kode' => $kode,
        'keterangan' => $data['keterangan'],
        'qty' => $request->qty,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      // update stok barang
      $barang = DB::table('barangs')->where('id',$data['produks'])->first();

      $stoklama = $barang->gudang;

      $stokbaru = $stoklama + $request->qty;

      DB::table('barangs')->where('id',$data['produks'])->update([
        'gudang' => $stokbaru,
        "updated_at" => \Carbon\Carbon::now()
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

      // baca data pembelian sebelumnya
      $datalama = DB::table('mutasi_masuk_barangs')->where('id',$data['id'])->first();

      $totalbelilama = $datalama->qty;

      $penambahanstok = $request->qty - $totalbelilama;

      DB::table('mutasi_masuk_barangs')->where('id',$data['id'])->update([
        'keterangan' => $data['keterangan'],
        'qty' => $request->qty,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      // update stok barang
      $barang = DB::table('barangs')->where('id',$datalama->id_barangs)->first();

      $stoklama = $barang->gudang;

      $stokbaru = $stoklama + $penambahanstok;

      DB::table('barangs')->where('id',$datalama->id_barangs)->update([
        'gudang' => $stokbaru,
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
    $mutasi_masuk_barangs = DB::table('mutasi_masuk_barangs')->where('id',$request->id)->get();

    if ($mutasi_masuk_barangs->count()){
      return 'ada|'. $mutasi_masuk_barangs[0]->keterangan . "|" . $mutasi_masuk_barangs[0]->qty . "|" . $mutasi_masuk_barangs[0]->id_barangs . "|" . $mutasi_masuk_barangs[0]->kode;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{

      // baca data pembelian sebelumnya
      $datalama = DB::table('mutasi_masuk_barangs')->where('id',$request->id)->first();

      // update stok barang
      $barang = DB::table('barangs')->where('id',$datalama->id_barangs)->first();

      $stoklama = $barang->gudang;

      $stokbaru = $stoklama - $datalama->qty;

      DB::table('barangs')->where('id',$datalama->id_barangs)->update([
        'gudang' => $stokbaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::table('mutasi_masuk_barangs')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

  public function getstok(Request $request) {
      $barang = DB::table('barangs')->where('id', $request->param)->first();

      return $barang->gudang.' '.$barang->satuan;
  }

}
