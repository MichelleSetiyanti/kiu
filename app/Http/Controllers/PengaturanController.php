<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pengaturan;
use Illuminate\Support\Facades\Cookie;

class PengaturanController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    
    public function insertOrUpdate(Request $req){
        $pengaturan = Pengaturan::where('parameter', $req->parameter)->first();
        
        try{
            if(!$pengaturan){
                $pengaturan = Pengaturan::create([
                    'parameter' => $req->parameter,
                    'value' => $req->value
                ]);
            }else{
                $pengaturan = Pengaturan::where('parameter', $req->parameter)->update(
                    [
                        'value' => $req->value
                    ]
                );
            }
            return response()->json(['message' => "Pengaturan Berhasil Diubah"], 200);
        }catch(Exception $ex){
            return response()->json(['error' => $ex->getMessage()], 500);
        }
           
    }

    public function lightmode(){
        $duration = time() + 60 * 60 * 24 * 365;
        Cookie::queue('theme', 'light', $duration);

        return back();
    }

    public function darkmode(){
        $duration = time() + 60 * 60 * 24 * 365;
        Cookie::queue('theme', 'dark-layout', $duration);

        return back();
    }
}
