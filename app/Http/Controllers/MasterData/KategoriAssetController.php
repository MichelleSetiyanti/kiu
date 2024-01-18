<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class KategoriAssetController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.masterdata.kategori-asset.index');
    }

    public function list(){
        $kategori_assets = DB::table('kategori_assets')
            ->orderBy('nama', 'asc')
            ->where('id','!=','0')
            ->get();
        return datatables()::of($kategori_assets)
            ->addColumn('action', function ($kategori_assets) {
                $assets = DB::table('assets')
                    ->where('id_kategori',$kategori_assets->id)
                    ->count();

                $class = "";

                if($assets > 0){
                    $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$kategori_assets->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$kategori_assets->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
            DB::table('kategori_assets')->insert([
                'kode' => $data['kode'],
                'nama' => $data['nama'],
                'keterangan' => $data['keterangan'],
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

            DB::table('kategori_assets')->where('id',$data['id'])->update([
                'kode' => $data['kode'],
                'nama' => $data['nama'],
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

    public function requestdata(Request $request){
        $kategori_assets = DB::table('kategori_assets')->where('id',$request->id)->get();

        if ($kategori_assets->count()){
            return 'ada|'. $kategori_assets[0]->kode ."|". $kategori_assets[0]->nama ."|". $kategori_assets[0]->keterangan;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('kategori_assets')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
