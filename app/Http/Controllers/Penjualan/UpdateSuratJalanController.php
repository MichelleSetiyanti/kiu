<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class UpdateSuratJalanController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    return view('apps.penjualan.update-surat-jalan.index');
  }

  public function list(Request $request){
    $surat_jalan_kontainers = DB::table('surat_jalan_kontainers')
      ->select('*')
      ->orderBy('id', 'asc')
      ->get();
    return datatables()::of($surat_jalan_kontainers)
      ->addColumn('action', function ($surat_jalan_kontainers) {

        $class = "";

        if($surat_jalan_kontainers->status_pembayaran == "Selesai"){
          $class = "hidden";
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap '.$class.'" onclick="f_update('.$surat_jalan_kontainers->id.')"><i class="feather icon-check-circle" data-toggle="tooltip" title="Selesaikan Pembayaran Surat Jalan"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function update(Request $request){

    DB::beginTransaction();
    try{

      DB::table('surat_jalan_kontainers')->where('id',$request->id)->update([
        'status_pembayaran' => 'Selesai',
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

}
