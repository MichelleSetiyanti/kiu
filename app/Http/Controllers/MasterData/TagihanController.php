<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class TagihanController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.masterdata.tagihan.index');
  }

  public function list(){
    $tagihans = DB::table('tagihans')
      ->orderBy('nama', 'asc')
      ->get();
    return datatables()::of($tagihans)
      ->addColumn('action', function ($tagihans) {

        return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$tagihans->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap" onclick="f_delete('.$tagihans->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
      DB::table('tagihans')->insert([
        'nama' => $data['nama'],
        'nominal' => $data['nominal'],
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

      DB::table('tagihans')->where('id',$data['id'])->update([
        'nama' => $data['nama'],
        'nominal' => $data['nominal'],
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
    $tagihans = DB::table('tagihans')->where('id',$request->id)->get();

    if ($tagihans->count()){
      return 'ada|'. $tagihans[0]->nama . "|" . $tagihans[0]->nominal;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{
      DB::table('tagihans')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
