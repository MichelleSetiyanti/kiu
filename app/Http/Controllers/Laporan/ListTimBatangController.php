<?php

namespace App\Http\Controllers\Laporan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;
use Illuminate\Support\Facades\Hash;


class ListTimBatangController extends Controller
{
  public $con;

  public function __construct()
  {
    $this->middleware('auth');
    $this->con = mysqli_connect(env("DB_HOST"),env("DB_USERNAME"),env("DB_PASSWORD"),env("DB_DATABASE"));
  }

  public function index(){
    return view('apps.laporan.listTimBatang.index');
  }

  public function list(){
    $abs = DB::table('r_payrolltb')
      ->orderBy('id', 'desc')
      ->get();
    return datatables()::of($abs)
      ->addColumn('action', function ($abs) {
        return '
            <button class="btn btn-success" onclick=""><i class="fa fa-print" style="padding-right: 5px;" aria-hidden="true"></i>Print</button>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }
}
