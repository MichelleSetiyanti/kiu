<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class FreelancerController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $bidangs = DB::table('bidang_freelancers')->where('aktif','Active')->orderBy('nama', 'asc')->get();

    return view('apps.masterdata.freelancer.index',[ 'bidangs' => $bidangs ]);
  }

  public function list(){
    $freelancers = DB::table('freelancers')
      ->join('bidang_freelancers','freelancers.id_bidang_freelancers','=','bidang_freelancers.id')
      ->select('freelancers.*','bidang_freelancers.nama as namabidang')
      ->orderBy('freelancers.nama', 'asc')
      ->where('freelancers.id','!=','0')
      ->get();
    return datatables()::of($freelancers)
      ->addColumn('action', function ($freelancers) {
        $class = DB::table('pembayaran_freelancers')
          ->where('id_freelancers',$freelancers->id)
          ->count();

        $class = "";

        if($class > 0){
          $class = "hidden";
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_edit('.$freelancers->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$freelancers->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
      DB::table('freelancers')->insert([
        'id_bidang_freelancers' => $data['bidang'],
        'nama' => $data['nama'],
        'jk' => $data['jk'],
        'bank' => $data['bank'],
        'norek' => $data['norek'],
        'nik' => $data['nik'],
        'nohp' => $data['nohp'],
        'email' => $data['email'],
        'alamat' => $data['alamat'],
        'tempatlahir' => $data['tempatlahir'],
        'tanggallahir' => $request->tanggallahir,
        'tanggalmulai' => $request->tanggalmulai,
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

      DB::table('freelancers')->where('id',$data['id'])->update([
        'id_bidang_freelancers' => $data['bidang'],
        'nama' => $data['nama'],
        'jk' => $data['jk'],
        'bank' => $data['bank'],
        'norek' => $data['norek'],
        'nik' => $data['nik'],
        'nohp' => $data['nohp'],
        'email' => $data['email'],
        'alamat' => $data['alamat'],
        'tempatlahir' => $data['tempatlahir'],
        'tanggallahir' => $request->tanggallahir,
        'tanggalmulai' => $request->tanggalmulai,
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
    $freelancers = DB::table('freelancers')->where('id',$request->id)->get();

    if ($freelancers->count()){
      return 'ada|'. $freelancers[0]->nama . "|" . $freelancers[0]->jk . "|" . $freelancers[0]->nohp . "|" . $freelancers[0]->email . "|" . $freelancers[0]->aktif. "|" . $freelancers[0]->alamat. "|" . $freelancers[0]->tempatlahir. "|" . $freelancers[0]->tanggallahir. "|" . $freelancers[0]->tanggalmulai. "|" . $freelancers[0]->id_bidang_freelancers. "|" . $freelancers[0]->nik. "|" . $freelancers[0]->bank. "|" . $freelancers[0]->norek ;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{
      DB::table('freelancers')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
