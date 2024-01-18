<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class ItemJasaTimbangController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.masterdata.item-jasa-timbang.index');
  }

  public function list(){
    $item_jasa_timbangs = DB::table('item_jasa_timbangs')
      ->orderBy('nama', 'asc')
      ->get();
    return datatables()::of($item_jasa_timbangs)
      ->addColumn('action', function ($item_jasa_timbangs) {

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_edit('.$item_jasa_timbangs->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap" onclick="f_delete('.$item_jasa_timbangs->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
      DB::table('item_jasa_timbangs')->insert([
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

      DB::table('item_jasa_timbangs')->where('id',$data['id'])->update([
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
    $item_jasa_timbangs = DB::table('item_jasa_timbangs')->where('id',$request->id)->get();

    if ($item_jasa_timbangs->count()){
      return 'ada|'. $item_jasa_timbangs[0]->nama . "|" . $item_jasa_timbangs[0]->nominal;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{
      DB::table('item_jasa_timbangs')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
