<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class KaryawanController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.masterdata.karyawan.index');
    }

    public function list(){
        $karyawans = DB::table('karyawans')
            ->orderBy('kode', 'asc')
            ->where('id','!=','0')
            ->get();
        return datatables()::of($karyawans)
            ->addColumn('action', function ($karyawans) {
//                $count = DB::table('pinjaman_karyawans')
//                    ->where('id_karyawans',$karyawans->id)
//                    ->count();

                $count = 0;

                $class = "";

                if($count > 0){
                    $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$karyawans->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$karyawans->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
            DB::table('karyawans')->insert([
                'kode' => $data['kode'],
                'nama' => $data['nama'],
                'no_ktp' => $data['noktp'],
                'no_hp' => $data['nohp'],
                'alamat' => $data['alamat'],
                'tanggal_lahir' => $request->tanggal,
                'tempat_lahir' => $data['tempatlahir'],
                'jk' => $data['jk'],
                'status' => $data['status'],
                'agama' => $data['agama'],
                'jabatan' => $data['jabatan'],
                'sopir' => $data['sopir'],
                'no_absen' => $data['noabsen'],
                'sistem_gaji' => $data['sistemgaji'],
                'gaji' => $data['gaji'],
                'pot_bpjs' => $data['potbpjs'],
                'pinjaman' => '0',
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

            DB::table('karyawans')->where('id',$data['id'])->update([
              'kode' => $data['kode'],
              'nama' => $data['nama'],
              'no_ktp' => $data['noktp'],
              'no_hp' => $data['nohp'],
              'alamat' => $data['alamat'],
              'tanggal_lahir' => $request->tanggal,
              'tempat_lahir' => $data['tempatlahir'],
              'jk' => $data['jk'],
              'status' => $data['status'],
              'agama' => $data['agama'],
              'jabatan' => $data['jabatan'],
              'sopir' => $data['sopir'],
              'no_absen' => $data['noabsen'],
              'sistem_gaji' => $data['sistemgaji'],
              'gaji' => $data['gaji'],
              'pot_bpjs' => $data['potbpjs'],
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
        $karyawans = DB::table('karyawans')->where('id',$request->id)->get();

        if ($karyawans->count()){
            return 'ada|'. $karyawans[0]->nama . "|" . $karyawans[0]->kode . "|" . $karyawans[0]->no_hp . "|" . $karyawans[0]->alamat . "|" . $karyawans[0]->keterangan . "|" . $karyawans[0]->tanggal_lahir . "|" . $karyawans[0]->no_absen . "|" . $karyawans[0]->jk . "|" . $karyawans[0]->status . "|" . $karyawans[0]->agama . "|" . $karyawans[0]->sopir . "|" . $karyawans[0]->sistem_gaji . "|" . $karyawans[0]->tempat_lahir . "|" . $karyawans[0]->gaji . "|" . $karyawans[0]->pot_bpjs . "|" . $karyawans[0]->no_ktp . "|" . $karyawans[0]->jabatan . "|" . $karyawans[0]->aktif ;
        }else{
            return 'gak ada|';
        }
    }

    public function getkode(){
      $tables = DB::table('karyawans')->select(DB::raw('max(substr(kode,-4)) as nomor_max'))->where('kode','like','KMJA-%')->get();

      $kode = "KMJA-".str_pad((int)$tables[0]->nomor_max + 1,4,"0",STR_PAD_LEFT);

      return $kode;
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('karyawans')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
