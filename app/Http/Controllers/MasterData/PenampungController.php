<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class PenampungController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $hargabeliumums = DB::table('harga_belis')->where('kategori','Umum')->where('aktif','Active')->orderBy('kode', 'asc')->get();
        $hargabelilogams = DB::table('harga_belis')->where('kategori','Logam')->where('aktif','Active')->orderBy('kode', 'asc')->get();

        return view('apps.masterdata.penampung.index',[ 'hargabeliumums' => $hargabeliumums, 'hargabelilogams' => $hargabelilogams ]);
    }

    public function list(){
        $penampungs = DB::table('penampungs')
            ->orderBy('kode', 'asc')
            ->where('id','!=','0')
            ->get();
        return datatables()::of($penampungs)
            ->addColumn('action', function ($penampungs) {
                $count = DB::table('pembelians')
                    ->where('id_penampungs',$penampungs->id)
                    ->count();

                $class = "";

                if($count > 0){
                    $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$penampungs->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$penampungs->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
            DB::table('penampungs')->insert([
                'kode_harga_umum' => $data['hargaumum'],
                'kode_harga_logam' => $data['hargalogam'],
                'kode' => $data['kode'],
                'nama' => $data['nama'],
                'alamat' => $data['alamat'],
                'no_hp' => $data['nohp'],
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

            DB::table('penampungs')->where('id',$data['id'])->update([
                'kode_harga_umum' => $data['hargaumum'],
                'kode_harga_logam' => $data['hargalogam'],
                'kode' => $data['kode'],
                'nama' => $data['nama'],
                'alamat' => $data['alamat'],
                'no_hp' => $data['nohp'],
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
        $penampungs = DB::table('penampungs')->where('id',$request->id)->get();

        if ($penampungs->count()){
            return 'ada|'. $penampungs[0]->nama . "|" . $penampungs[0]->kode . "|" . $penampungs[0]->no_hp . "|" . $penampungs[0]->alamat . "|" . $penampungs[0]->keterangan . "|" . $penampungs[0]->kode_harga_umum . "|" . $penampungs[0]->kode_harga_logam . "|" . $penampungs[0]->aktif ;
        }else{
            return 'gak ada|';
        }
    }

    public function getkode(){
      $tables = DB::table('penampungs')->select(DB::raw('max(substr(kode,-4)) as nomor_max'))->where('kode','like','P-%')->get();

      $kode = "P-".str_pad((int)$tables[0]->nomor_max + 1,4,"0",STR_PAD_LEFT);

      return $kode;
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('penampungs')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
