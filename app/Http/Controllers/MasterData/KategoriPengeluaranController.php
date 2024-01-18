<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class KategoriPengeluaranController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.masterdata.kategori-pengeluaran.index');
  }

  public function list(){
    $kategori_pengeluarans = DB::table('kategori_pengeluarans')
      ->orderBy('nama', 'asc')
      ->where('id','!=','0')
      ->get();
    return datatables()::of($kategori_pengeluarans)
      ->addColumn('action', function ($kategori_pengeluarans) {
        $pengeluarans = DB::table('pengeluarans')
          ->where('id_kategori_pengeluarans',$kategori_pengeluarans->id)
          ->count();

        $class = "";

        if($pengeluarans > 0){
          $class = "hidden";
        }

        return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$kategori_pengeluarans->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$kategori_pengeluarans->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
                  </div>
                ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function store(Request $request){

    parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

    DB::beginTransaction();

    try{
      DB::table('kategori_pengeluarans')->insert([
        'nama' => $data['nama'],
        'aktif' => $data['aktif'],
        "created_at" =>  \Carbon\Carbon::now(),
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

      DB::table('kategori_pengeluarans')->where('id',$data['id'])->update([
        'nama' => $data['nama'],
        'aktif' => $data['aktif'],
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
    $kategori_pengeluarans = DB::table('kategori_pengeluarans')->where('id',$request->id)->get();

    if ($kategori_pengeluarans->count()){
      return 'ada|'. $kategori_pengeluarans[0]->nama;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{
      DB::table('kategori_pengeluarans')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
