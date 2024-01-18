<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class ClientController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.masterdata.client.index');
  }

  public function list(){
    $clients = DB::table('clients')
      ->orderBy('nama', 'asc')
      ->where('id','!=','0')
      ->get();
    return datatables()::of($clients)
      ->addColumn('action', function ($clients) {
        $pengeluarans = DB::table('pembayaran_freelancers')
          ->where('id_clients',$clients->id)
          ->count();

        $class = "";

        if($pengeluarans > 0){
          $class = "hidden";
        }

        return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$clients->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$clients->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
      DB::table('clients')->insert([
        'nama' => $data['nama'],
        'alamat' => $data['alamat'],
        'no_hp' => $data['nohp'],
        'pic' => $data['pic'],
        'no_hp_pic' => $data['nohppic'],
        'bidang' => $data['bidang'],
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

      DB::table('clients')->where('id',$data['id'])->update([
        'nama' => $data['nama'],
        'alamat' => $data['alamat'],
        'no_hp' => $data['nohp'],
        'pic' => $data['pic'],
        'no_hp_pic' => $data['nohppic'],
        'bidang' => $data['bidang'],
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
    $clients = DB::table('clients')->where('id',$request->id)->get();

    if ($clients->count()){
      return 'ada|'. $clients[0]->nama .'|'. $clients[0]->alamat .'|'. $clients[0]->no_hp .'|'. $clients[0]->pic .'|'. $clients[0]->no_hp_pic .'|'. $clients[0]->bidang;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{
      DB::table('clients')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
