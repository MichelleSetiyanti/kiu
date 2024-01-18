<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class BarangJualController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $kategoris = DB::table('kategori_barangs')->where('aktif','Active')->orderBy('nama', 'asc')->get();

        $barangpembelians = DB::table('barang_belis')->where('aktif','Active')->orderBy('kode', 'asc')->get();

        return view('apps.masterdata.barang-jual.index',[ 'kategoris' => $kategoris, 'barangpembelians' => $barangpembelians ]);
    }

    public function list(){
        $barang_juals = DB::table('barang_juals')
            ->join('kategori_barangs','barang_juals.id_kategori','=','kategori_barangs.id')
            ->select('barang_juals.*','kategori_barangs.nama as namakategori')
            ->orderBy('barang_juals.kode', 'asc')
            ->where('barang_juals.id','!=','0')
            ->get();
        return datatables()::of($barang_juals)
            ->addColumn('action', function ($barang_juals) {
                $count = DB::table('harga_jual_details')
                    ->where('id_barang_juals',$barang_juals->id)
                    ->count();

                $class = "";

                if($count > 0){
                    $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                  <span class="fonticon-wrap" onclick="f_datadetil('.$barang_juals->id.')"><i class="feather icon-eye" data-toggle="tooltip" title="Resep Barang"></i></span>
                    <span class="fonticon-wrap" onclick="f_edit('.$barang_juals->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$barang_juals->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
                  </div>
                ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function listdetail(Request $request){
        $details = DB::table('barang_jual_details')
            ->join('barang_belis','barang_jual_details.id_barang_belis','=','barang_belis.id')
            ->select('barang_jual_details.*','barang_belis.nama as namabarang','barang_belis.kode as kodebarang')
            ->where('barang_jual_details.id_barang_juals','=',$request->id)
            ->orderBy('barang_belis.kode','ASC')
            ->get();
        return datatables()::of($details)
            ->addColumn('action', function ($details) {

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_editresep('.$details->id.')"><i class="feather icon-edit" data-toggle="tooltip"></i></span>
                    <span class="fonticon-wrap" onclick="f_deleteresep('.$details->id.')"><i class="feather icon-trash" data-toggle="tooltip"></i></span>
                  </div>
                ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function store_resep(Request $request){

        DB::beginTransaction();

        try{
            DB::table('barang_jual_details')->insert([
                'id_barang_juals' => $request->idbarangjual,
                'id_barang_belis' => $request->barangs,
                'persentase' => $request->persentase,
                'aktif' => "Active",
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

    public function update_resep(Request $request){

        DB::beginTransaction();
        try{

            DB::table('barang_jual_details')->where('id',$request->id_temp)->update([
                'id_barang_belis' => $request->barangs,
                'persentase' => $request->persentase,
                "updated_at" => \Carbon\Carbon::now()
            ]);

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }

    public function requestdata_resep(Request $request){
        $barang_juals = DB::table('barang_jual_details')->where('id',$request->id_temp)->get();

        if ($barang_juals->count()){
            return 'ada|'. $barang_juals[0]->id_barang_belis . "|" . $barang_juals[0]->persentase . "|" . $barang_juals[0]->aktif ;
        }else{
            return 'gak ada|';
        }
    }

    public function drop_resep(Request $request){
        DB::beginTransaction();

        try{
            DB::table('barang_jual_details')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }

    public function store(Request $request){

        parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

        DB::beginTransaction();

        try{
            $idbarang = DB::table('barang_juals')->insertGetId([
                'id_kategori' => $data['kategori'],
                'nama' => $data['nama'],
                'harga' => $data['harga'],
                'kode' => $data['kode'],
                'keterangan' => $data['keterangan'],
                'satuan' => $data['satuan'],
                'aktif' => $data['aktif'],
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $hargajuals = DB::table('harga_juals')->orderBy('id','asc')->get();

            foreach($hargajuals as $hargajual){
              DB::table('harga_jual_details')->insert([
                'id_harga_juals' => $hargajual->id,
                'id_barang_juals' => $idbarang,
                'harga' => $data['harga'],
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

            DB::table('barang_juals')->where('id',$data['id'])->update([
                'kode' => $data['kode'],
                'id_kategori' => $data['kategori'],
                'nama' => $data['nama'],
                'harga' => $data['harga'],
                'satuan' => $data['satuan'],
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
        $barang_juals = DB::table('barang_juals')->where('id',$request->id)->get();

        if ($barang_juals->count()){
            return 'ada|'. $barang_juals[0]->nama . "|" . $barang_juals[0]->kode . "|" . $barang_juals[0]->harga . "|" . $barang_juals[0]->keterangan . "|" . $barang_juals[0]->id_kategori. "|" . $barang_juals[0]->aktif. "|" . $barang_juals[0]->satuan ;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('barang_juals')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
