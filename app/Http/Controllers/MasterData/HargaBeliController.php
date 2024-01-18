<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class HargaBeliController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.masterdata.harga-beli.index');
    }

    public function list(){
        $harga_belis = DB::table('harga_belis')
            ->where('id','!=','0')
            ->get();
        return datatables()::of($harga_belis)
            ->addColumn('action', function ($harga_belis) {
                $count = DB::table('penampungs')
                    ->where('kode_harga_umum',$harga_belis->kode)
                    ->orWhere('kode_harga_logam', $harga_belis->kode)
                    ->count();

                $class = "";

                if($count > 0){
                    $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_datadetil('.$harga_belis->id.')"><i class="feather icon-eye" data-toggle="tooltip" title="Detil Harga"></i></span>
                    <span class="fonticon-wrap" onclick="f_edit('.$harga_belis->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$harga_belis->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
                  </div>
                ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function listdetail(Request $request){
        $harga_belis = DB::table('harga_beli_details')
            ->join('barang_belis','harga_beli_details.id_barang_belis','=','barang_belis.id')
            ->select('harga_beli_details.*','barang_belis.nama as namabarang','barang_belis.kode as kodebarang')
            ->where('harga_beli_details.id_harga_belis','=',$request->id)
            ->orderBy('barang_belis.kode','ASC')
            ->get();
        return datatables()::of($harga_belis)
            ->addColumn('action', function ($harga_belis) {

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_editharga('.$harga_belis->id.')"><i class="feather icon-edit" data-toggle="tooltip"></i></span>
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
            $idharga = DB::table('harga_belis')->insertGetId([
                'kategori' => $data['kategori'],
                'kode' => $data['kode'],
                'keterangan' => $data['keterangan'],
                'aktif' => $data['aktif'],
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            if($data['kategori'] == "Umum"){
                $barangs = DB::table('barang_belis')->where('id_kategori','!=','5')->get();

                foreach($barangs as $barang){
                    DB::table('harga_beli_details')->insert([
                        'id_harga_belis' => $idharga,
                        'id_barang_belis' => $barang->id,
                        'harga' => $barang->harga,
                        'aktif' => "Active",
                        "created_at" =>  \Carbon\Carbon::now(),
                        "updated_at" => \Carbon\Carbon::now()
                    ]);
                }
            }else{
                $barangs = DB::table('barang_belis')->where('id_kategori','=','5')->get();

                foreach($barangs as $barang){
                    DB::table('harga_beli_details')->insert([
                        'id_harga_belis' => $idharga,
                        'id_barang_belis' => $barang->id,
                        'harga' => $barang->harga,
                        'aktif' => "Active",
                        "created_at" =>  \Carbon\Carbon::now(),
                        "updated_at" => \Carbon\Carbon::now()
                    ]);
                }
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

            DB::table('harga_belis')->where('id',$data['id'])->update([
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

            DB::table('harga_beli_details')->where('id',$request->id)->update([
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
        $harga_belis = DB::table('harga_belis')->where('id',$request->id)->get();

        if ($harga_belis->count()){
            return 'ada|'. $harga_belis[0]->kode . "|" . $harga_belis[0]->kategori . "|" . $harga_belis[0]->keterangan . "|" . $harga_belis[0]->aktif ;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('harga_belis')->where('id',$request->id)->delete();

            DB::table('harga_beli_details')->where('id_harga_belis',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
