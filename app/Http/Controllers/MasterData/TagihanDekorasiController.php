<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;


class TagihanDekorasiController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.masterdata.tagihan-dekorasi.index');
    }

    public function list(){
        $tagihans_dekorasi = DB::table('tagihans_dekorasi')
            ->orderBy('nama', 'asc')
            ->get();
        return datatables()::of($tagihans_dekorasi)
            ->addColumn('action', function ($tagihans_dekorasi) {

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap" onclick="f_edit('.$tagihans_dekorasi->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap" onclick="f_delete('.$tagihans_dekorasi->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
            DB::table('tagihans_dekorasi')->insert([
                'nama' => $data['nama'],
                'nominal' => $data['nominal'],
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

            DB::table('tagihans_dekorasi')->where('id',$data['id'])->update([
                'nama' => $data['nama'],
                'nominal' => $data['nominal'],
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
        $tagihans_dekorasi = DB::table('tagihans_dekorasi')->where('id',$request->id)->get();

        if ($tagihans_dekorasi->count()){
            return 'ada|'. $tagihans_dekorasi[0]->nama . "|" . $tagihans_dekorasi[0]->nominal;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('tagihans_dekorasi')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
