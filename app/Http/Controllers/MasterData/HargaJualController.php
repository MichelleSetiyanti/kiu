<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class HargaJualController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.masterdata.harga-jual.index');
    }

    public function list(){
        $harga_juals = DB::table('harga_juals')
            ->where('id','!=','0')
            ->get();
        return datatables()::of($harga_juals)
            ->addColumn('action', function ($harga_juals) {
                $count = DB::table('penjualans')
                    ->where('kode_harga_juals',$harga_juals->kode)
                    ->count();

                $class = "";

                if($count > 0){
                    $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_datadetil('.$harga_juals->id.')"><i class="feather icon-eye" data-toggle="tooltip" title="Detil Harga"></i></span>
                    <span class="fonticon-wrap" onclick="f_edit('.$harga_juals->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$harga_juals->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
                  </div>
                ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function listdetail(Request $request){
        $harga_juals = DB::table('harga_jual_details')
            ->join('barang_juals','harga_jual_details.id_barang_juals','=','barang_juals.id')
            ->select('harga_jual_details.*','barang_juals.nama as namabarang','barang_juals.kode as kodebarang')
            ->where('harga_jual_details.id_harga_juals','=',$request->id)
            ->orderBy('barang_juals.kode','ASC')
            ->get();
        return datatables()::of($harga_juals)
            ->addColumn('action', function ($harga_juals) {

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_editharga('.$harga_juals->id.')"><i class="feather icon-edit" data-toggle="tooltip"></i></span>
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
            $idharga = DB::table('harga_juals')->insertGetId([
                'kode' => $data['kode'],
                'keterangan' => $data['keterangan'],
                'aktif' => $data['aktif'],
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $barangs = DB::table('barang_juals')->orderBy('kode','asc')->get();

            foreach($barangs as $barang){
                DB::table('harga_jual_details')->insert([
                    'id_harga_juals' => $idharga,
                    'id_barang_juals' => $barang->id,
                    'harga' => $barang->harga,
                    'aktif' => "Active",
                    "created_at" =>  \Carbon\Carbon::now(),
                    "updated_at" => \Carbon\Carbon::now()
                ]);
            }

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

            DB::table('harga_juals')->where('id',$data['id'])->update([
                'keterangan' => $data['keterangan'],
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

    public function update_harga(Request $request){

        DB::beginTransaction();
        try{

            DB::table('harga_jual_details')->where('id',$request->id)->update([
                'harga' => $request->harga,
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
        $harga_juals = DB::table('harga_juals')->where('id',$request->id)->get();

        if ($harga_juals->count()){
            return 'ada|'. $harga_juals[0]->kode . "|" . $harga_juals[0]->keterangan . "|" . $harga_juals[0]->aktif ;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('harga_juals')->where('id',$request->id)->delete();

            DB::table('harga_jual_details')->where('id_harga_juals',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
