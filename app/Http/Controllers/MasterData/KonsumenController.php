<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class KonsumenController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.masterdata.konsumen.index');
    }

    public function list(){
        $konsumens = DB::table('konsumens')
            ->orderBy('nama', 'asc')
            ->where('id','!=','0')
            ->get();
        return datatables()::of($konsumens)
            ->addColumn('action', function ($konsumens) {
                $count = DB::table('penjualans')
                    ->where('id_konsumens',$konsumens->id)
                    ->count();
                $count = 0;

                $class = "";

                if($count > 0){
                    $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$konsumens->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$konsumens->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
            DB::table('konsumens')->insert([
                'nama' => $data['nama'],
                'kode' => $data['kode'],
                'tipe_konsumen' => $data['tipekonsumen'],
                'nama_group' => $data['namagroup'],
                'contact_person' => $data['contactperson'],
                'no_hp' => $data['nohp'],
                'alamat' => $data['alamat'],
                'termin' => $data['termin'],
                'limit_piutang' => $data['plafon'],
                'npwp' => $data['npwp'],
                'alamat_npwp' => $data['alamatnpwp'],
                'no_rekening' => $data['nomorrekening'],
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

            DB::table('konsumens')->where('id',$data['id'])->update([
                'nama' => $data['nama'],
                'tipe_konsumen' => $data['tipekonsumen'],
                'nama_group' => $data['namagroup'],
                'contact_person' => $data['contactperson'],
                'no_hp' => $data['nohp'],
                'alamat' => $data['alamat'],
                'termin' => $data['termin'],
                'limit_piutang' => $data['plafon'],
                'npwp' => $data['npwp'],
                'alamat_npwp' => $data['alamatnpwp'],
                'no_rekening' => $data['nomorrekening'],
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

    public function getgroup(Request $request){
        $datagroup = DB::table('konsumens')->select('nama_group')->get()->unique('nama_group')->toArray();

        return $datagroup;
    }

    public function getkode(){
      $tables = DB::table('konsumens')->select(DB::raw('max(substr(kode,-4)) as nomor_max'))->where('kode','like','CUST-%')->get();

      $kode = "CUST-".str_pad((int)$tables[0]->nomor_max + 1,4,"0",STR_PAD_LEFT);

      return $kode;
    }

    public function requestdata(Request $request){
        $konsumens = DB::table('konsumens')->where('id',$request->id)->get();

        if ($konsumens->count()){
            return 'ada|'. $konsumens[0]->nama . "|" . $konsumens[0]->kode . "|" . $konsumens[0]->tipe_konsumen . "|" . $konsumens[0]->nama_group . "|" . $konsumens[0]->contact_person . "|" . $konsumens[0]->no_hp . "|" . $konsumens[0]->alamat . "|" . $konsumens[0]->termin . "|" . $konsumens[0]->limit_piutang . "|" . $konsumens[0]->npwp . "|" . $konsumens[0]->alamat_npwp . "|" . $konsumens[0]->no_rekening . "|" . $konsumens[0]->keterangan . "|" . $konsumens[0]->aktif ;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('konsumens')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
