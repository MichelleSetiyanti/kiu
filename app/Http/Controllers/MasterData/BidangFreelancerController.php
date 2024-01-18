<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class BidangFreelancerController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.masterdata.bidang-freelancer.index');
  }

  public function list(){
    $bidang_freelancers = DB::table('bidang_freelancers')
      ->orderBy('nama', 'asc')
      ->where('id','!=','0')
      ->get();
    return datatables()::of($bidang_freelancers)
      ->addColumn('action', function ($bidang_freelancers) {
        $freelancers = DB::table('freelancers')
          ->where('id_bidang_freelancers',$bidang_freelancers->id)
          ->count();

        $class = "";

        if($freelancers > 0){
          $class = "hidden";
        }

        return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$bidang_freelancers->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$bidang_freelancers->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
      DB::table('bidang_freelancers')->insert([
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

      DB::table('bidang_freelancers')->where('id',$data['id'])->update([
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
    $bidang_freelancers = DB::table('bidang_freelancers')->where('id',$request->id)->get();

    if ($bidang_freelancers->count()){
      return 'ada|'. $bidang_freelancers[0]->nama;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{
      DB::table('bidang_freelancers')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
