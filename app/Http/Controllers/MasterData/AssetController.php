<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class AssetController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $kategoris = DB::table('kategori_assets')->where('aktif','Active')->orderBy('nama', 'asc')->get();

        return view('apps.masterdata.asset.index',[ 'kategoris' => $kategoris ]);
    }

    public function list(){
        $assets = DB::table('assets')
            ->join('kategori_assets','assets.id_kategori','=','kategori_assets.id')
            ->select('assets.*','kategori_assets.nama as namakategori')
            ->orderBy('assets.kode', 'asc')
            ->where('assets.id','!=','0')
            ->get();
        return datatables()::of($assets)
            ->addColumn('action', function ($assets) {
                $count = DB::table('penyusutan_assets')
                    ->where('id_assets',$assets->id)
                    ->count();

                $count2 = DB::table('pengeluaran_assets')
                    ->where('id_assets',$assets->id)
                    ->count();

                $class = "";

                if($count + $count2 > 0){
                    $class = "hidden";
                }

                if($assets->input_jurnal == "Y"){
                  $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$assets->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$assets->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
            $idasset = DB::table('assets')->insertGetId([
                'id_kategori' => $data['kategori'],
                'nama' => $data['nama'],
                'harga' => $data['harga'],
                'kode' => $data['kode'],
                'keterangan' => $data['keterangan'],
                'tanggal_perolehan' => $request->tanggal,
                'no_part' => $data['nopart'],
                'aktif' => $data['aktif'],
                'input_jurnal' => 'N',
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

            DB::table('assets')->where('id',$data['id'])->update([
                'id_kategori' => $data['kategori'],
                'nama' => $data['nama'],
                'harga' => $data['harga'],
                'keterangan' => $data['keterangan'],
                'tanggal_perolehan' => $request->tanggal,
                'no_part' => $data['nopart'],
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
        $assets = DB::table('assets')->where('id',$request->id)->get();

        if ($assets->count()){
            return 'ada|'. $assets[0]->nama . "|" . $assets[0]->kode . "|" . $assets[0]->harga . "|" . $assets[0]->keterangan . "|" . $assets[0]->id_kategori . "|" . $assets[0]->tanggal_perolehan . "|" . $assets[0]->no_part . "|" . $assets[0]->aktif ;
        }else{
            return 'gak ada|';
        }
    }

    public function getkode(){
        $tables = DB::table('assets')->select(DB::raw('max(substr(kode,-4)) as nomor_max'))->where('kode','like','AMJA-%')->get();

        $kode = "AMJA-".str_pad((int)$tables[0]->nomor_max + 1,4,"0",STR_PAD_LEFT);

        return $kode;
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('assets')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
