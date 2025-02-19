<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class KategoriBarangController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.masterdata.kategori-barang.index');
    }

    public function list(){
        $kategori_barangs = DB::table('kategori_barangs')
            ->orderBy('nama', 'asc')
            ->where('id','!=','0')
            ->get();
        return datatables()::of($kategori_barangs)
            ->addColumn('action', function ($kategori_barangs) {
                $barangs = DB::table('barangs')
                    ->where('id_kategori',$kategori_barangs->id)
                    ->count();

                $class = "";

                if($barangs > 0){
                    $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$kategori_barangs->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$kategori_barangs->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
            DB::table('kategori_barangs')->insert([
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

            DB::table('kategori_barangs')->where('id',$data['id'])->update([
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
        $kategori_barangs = DB::table('kategori_barangs')->where('id',$request->id)->get();

        if ($kategori_barangs->count()){
            return 'ada|'. $kategori_barangs[0]->kode ."|". $kategori_barangs[0]->nama ."|". $kategori_barangs[0]->keterangan;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('kategori_barangs')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
