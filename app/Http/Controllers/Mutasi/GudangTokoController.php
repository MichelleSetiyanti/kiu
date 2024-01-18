<?php

namespace App\Http\Controllers\Mutasi;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class GudangTokoController extends Controller
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

    return view('apps.mutasi.gudang-toko.index',[ 'produks' => $produks ]);
  }

  public function list(Request $request){
    $mutasi_gudang_tokos = DB::table('mutasi_gudang_tokos')
      ->join('users','mutasi_gudang_tokos.id_users','=','users.id')
      ->join('barangs','mutasi_gudang_tokos.id_barangs','=','barangs.id')
      ->select('mutasi_gudang_tokos.*','users.name as namauser','barangs.nama as namabarang')
      ->where(DB::raw('MONTH(mutasi_gudang_tokos.created_at)'), substr($request->tanggal,0,2))
      ->where(DB::raw('YEAR(mutasi_gudang_tokos.created_at)'), substr($request->tanggal,-4))
      ->orderBy('id', 'desc')
      ->get();
    return datatables()::of($mutasi_gudang_tokos)
      ->addColumn('action', function ($mutasi_gudang_tokos) {

        $class = "";

        if(Auth::user()->status != "Supervisor" && Auth::user()->status != "Super Admin" && Auth::user()->status != "Owner"){
          $class = "hidden";
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap '.$class.'" onclick="f_edit('.$mutasi_gudang_tokos->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$mutasi_gudang_tokos->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function store(Request $request){
    $datenow = date("Y/m");

    $querypemasukan = DB::table('mutasi_gudang_tokos')->where('kode','like','MTGT/'.$datenow.'/%')->orderBy('id','desc');

    if ($querypemasukan->exists()) {
      $mutasi_gudang_tokos = $querypemasukan->first();
      $pecah = explode('/',$mutasi_gudang_tokos->kode);

      $kodeterakhir = $pecah[3];
    }else{
      $kodeterakhir = 0;
    }

    $kode = "MTGT/".$datenow.'/'.str_pad($kodeterakhir+1, 4, "0", STR_PAD_LEFT);

    parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

    DB::beginTransaction();

    try{
      DB::table('mutasi_gudang_tokos')->insert([
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

      $stockgudang = $barang->gudang;
      $stocktoko = $barang->stok;

      $stokgudangbaru = $stockgudang - $request->qty;
      $stoktokobaru = $stocktoko + $request->qty;

      DB::table('barangs')->where('id',$data['produks'])->update([
        'stok' => $stoktokobaru,
        'gudang' => $stokgudangbaru,
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
      $datalama = DB::table('mutasi_gudang_tokos')->where('id',$data['id'])->first();

      $totalbelilama = $datalama->qty;

      $penambahanstok = $request->qty - $totalbelilama;

      DB::table('mutasi_gudang_tokos')->where('id',$data['id'])->update([
        'keterangan' => $data['keterangan'],
        'qty' => $request->qty,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      // update stok barang
      $barang = DB::table('barangs')->where('id',$datalama->id_barangs)->first();

      $stockgudang = $barang->gudang;
      $stocktoko = $barang->stok;

      $stokgudangbaru = $stockgudang - $penambahanstok;
      $stoktokobaru = $stocktoko + $penambahanstok;

      DB::table('barangs')->where('id',$datalama->id_barangs)->update([
        'stok' => $stoktokobaru,
        'gudang' => $stokgudangbaru,
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
    $mutasi_gudang_tokos = DB::table('mutasi_gudang_tokos')->where('id',$request->id)->get();

    if ($mutasi_gudang_tokos->count()){
      return 'ada|'. $mutasi_gudang_tokos[0]->keterangan . "|" . $mutasi_gudang_tokos[0]->qty . "|" . $mutasi_gudang_tokos[0]->id_barangs . "|" . $mutasi_gudang_tokos[0]->kode;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{

      // baca data pembelian sebelumnya
      $datalama = DB::table('mutasi_gudang_tokos')->where('id',$request->id)->first();

      // update stok barang
      $barang = DB::table('barangs')->where('id',$datalama->id_barangs)->first();

      $stockgudang = $barang->gudang;
      $stocktoko = $barang->stok;

      $stokgudangbaru = $stockgudang + $datalama->qty;
      $stoktokobaru = $stocktoko - $datalama->qty;

      DB::table('barangs')->where('id',$datalama->id_barangs)->update([
        'stok' => $stoktokobaru,
        'gudang' => $stokgudangbaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::table('mutasi_gudang_tokos')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
