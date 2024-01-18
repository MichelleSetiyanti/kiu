<?php

namespace App\Http\Controllers\MasterData;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;


class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        return view('apps.masterdata.user.index');
    }

    public function list(){
        $users = DB::table('users')
            ->whereNotIn('id',[0])
            ->orderBy('id', 'desc')
            ->get();
        return datatables()::of($users)
            ->addColumn('action', function ($users) {
                return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_edit('.$users->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap" onclick="f_delete('.$users->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
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
            DB::table('users')->insert([
                'name' => $data['nama'],
                'username' => $data['username'],
                'status' => $data['status'],
                'password' => Hash::make($data['password']),
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

            DB::table('users')->where('id',$data['id'])->update([
                'name' => $data['nama'],
                'username' => $data['username'],
                'status' => $data['status'],
                'password' => Hash::make($data['password']),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }

    public function updatepassword(Request $request){

        DB::beginTransaction();
        try{
            DB::table('users')->where('id',Auth::User()->id)->update([
                'password' => Hash::make($request['user-password']),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            DB::commit();

          return view('auth.change-password')->with('status','success');
        }catch (Exception $e){
            DB::rollBack();

            return redirect('/change-password')->with('status','failed');
        }
    }

    public function requestdata(Request $request){
        $users = DB::table('users')->where('id',$request->id)->get();

        if ($users->count()){
            return 'ada|'. $users[0]->name . "|" . $users[0]->username . "|" . $users[0]->status;
        }else{
            return 'gak ada|';
        }
    }

    public function drop(Request $request){
        DB::beginTransaction();

        try{
            DB::table('users')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }
}
