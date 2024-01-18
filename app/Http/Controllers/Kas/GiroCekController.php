<?php

namespace App\Http\Controllers\Kas;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class GiroCekController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $konsumens = DB::table('konsumens')
        ->orderBy('nama', 'asc')
        ->where('aktif','=','Active')
        ->get();

    return view('apps.kas.giro-cek.index',[ 'konsumens' => $konsumens ]);
  }

  public function list(Request $request){
    $giros = DB::table('giros')
      ->join('konsumens','giros.id_konsumens','=','konsumens.id')
      ->select('giros.*','konsumens.nama as namakonsumen')
      ->where(DB::raw('MONTH(giros.tanggal)'), substr($request->tanggal,0,2))
      ->where(DB::raw('YEAR(giros.tanggal)'), substr($request->tanggal,-4))
      ->orderBy('giros.id', 'desc')
      ->get();
    return datatables()::of($giros)
      ->addColumn('action', function ($giros) {

        $class = "";

        if(Auth::user()->status != "Supervisor" && Auth::user()->status != "Super Admin" && Auth::user()->status != "Owner"){
          $class = "hidden";
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_edit('.$giros->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap" onclick="f_delete('.$giros->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
      DB::table('giros')->insert([
        'id_users' => Auth::User()->id,
        'id_konsumens' => $data['konsumen'],
        'jenis' => $data['jenis'],
        'kode' => $data['kode'],
        'keterangan' => $data['keterangan'],
        'nominal' => $request->nominal,
        'tanggal' => $request->tanggal,
        'tanggal_cair' => $request->tanggalcair,
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

      DB::table('giros')->where('id',$data['id'])->update([
        'id_users' => Auth::User()->id,
        'id_konsumens' => $data['konsumen'],
        'jenis' => $data['jenis'],
        'kode' => $data['kode'],
        'keterangan' => $data['keterangan'],
        'nominal' => $request->nominal,
        'tanggal' => $request->tanggal,
        'tanggal_cair' => $request->tanggalcair,
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
    $giros = DB::table('giros')->where('id',$request->id)->get();

    if ($giros->count()){
      return 'ada|'. $giros[0]->keterangan . "|" . $giros[0]->nominal . "|" . $giros[0]->tanggal . "|" . $giros[0]->kode . "|" . $giros[0]->id_konsumens . "|" . $giros[0]->tanggal_cair . "|" . $giros[0]->jenis;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{

      DB::table('giros')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
