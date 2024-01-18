<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class BarangBeliController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $kategoris = DB::table('kategori_barangs')->where('aktif','Active')->orderBy('nama', 'asc')->get();

        return view('apps.masterdata.barang-beli.index',[ 'kategoris' => $kategoris ]);
    }

    public function list(){
        $barangs = DB::table('barangs')
            ->join('kategori_barangs','barangs.id_kategori','=','kategori_barangs.id')
            ->select('barangs.*','kategori_barangs.nama as namakategori')
            ->orderBy('barangs.kode', 'asc')
            ->where('barangs.id','!=','0')
            ->get();
        return datatables()::of($barangs)
            ->addColumn('action', function ($barangs) {
                $count = DB::table('penjualan_details')
                    ->where('id_barangs',$barangs->id)
                    ->count();

                $class = "";

                if($count > 0){
                    $class = "hidden";
                }

                return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_edit('.$barangs->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$barangs->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
          </div>
        ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function getkode(){
        $tables = DB::table('barangs')->select(DB::raw('max(substr(kode,-4)) as nomor_max'))->where('kode','like','BRG-%')->get();

        $kode = "BRG-".str_pad((int)$tables[0]->nomor_max + 1,4,"0",STR_PAD_LEFT);

        return $kode;
    }

    public function store(Request $request){

        parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

        DB::beginTransaction();

        try{
            $idbarang = DB::table('barangs')->insertGetId([
                'id_kategori' => $data['kategori'],
                'nama' => $data['nama'],
                'harga' => $data['harga'],
                'satuan' => $data['satuan'],
                'kode' => $data['kode'],
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

            DB::table('barangs')->where('id',$data['id'])->update([
                'id_kategori' => $data['kategori'],
                'nama' => $data['nama'],
                'harga' => $data['harga'],
                'keterangan' => $data['keterangan'],
                'satuan' => $data['satuan'],
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
        $barangs = DB::table('barangs')->where('id',$request->id)->get();

        if ($barangs->count()){
            return 'ada|'. $barangs[0]->nama . "|" . $barangs[0]->kode . "|" . $barangs[0]->harga . "|" . $barangs[0]->keterangan . "|" . $barangs[0]->id_kategori. "|" . $barangs[0]->aktif. "|" . $barangs[0]->satuan ;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('barangs')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
