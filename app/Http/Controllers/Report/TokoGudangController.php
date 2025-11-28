<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class TokoGudangController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $produks = DB::table('barangs')
      ->select('barangs.*')
      ->where('barangs.aktif','Active')
      ->orderBy('kode', 'asc')->get();

    return view('apps.report.toko-gudang',[ 'produks' => $produks ]);
  }

  public function list(Request $request)
  {
      $mutasi = DB::table('mutasi_toko_gudangs as m')
          ->join('users as u', 'm.id_users', '=', 'u.id')
          ->join('barangs as b', 'm.id_barangs', '=', 'b.id')
          ->select(
              'm.*',
              'u.name as namauser',
              'b.nama as namabarang',
              'b.kode as kodebarang'
          )
          ->where(function ($query) use ($request) {

              if ($request->produks != "All") {
                  $query->where('m.id_barangs', $request->produks);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai == "") {
                  $query->whereBetween('m.created_at', [
                      $request->tanggalmulai.' 00:00:00',
                      $request->tanggalmulai.' 23:59:59'
                  ]);
              }

              if ($request->tanggalmulai == "" && $request->tanggalselesai != "") {
                  $query->whereBetween('m.created_at', [
                      $request->tanggalselesai.' 00:00:00',
                      $request->tanggalselesai.' 23:59:59'
                  ]);
              }

              if ($request->tanggalmulai != "" && $request->tanggalselesai != "") {
                  $query->whereBetween('m.created_at', [
                      $request->tanggalmulai.' 00:00:00',
                      $request->tanggalselesai.' 23:59:59'
                  ]);
              }

              $query->where('m.id', '!=', '0');
          })
          ->orderBy('m.id', 'desc');

      return datatables()::of($mutasi)
          ->filter(function ($query) use ($request) {
              $search = $request->get('search')['value'] ?? null;

              if ($search) {
                  $query->where(function ($q) use ($search) {
                      $q->where('m.kode', 'like', "%{$search}%")
                        ->orWhere('b.kode', 'like', "%{$search}%")
                        ->orWhere('b.nama', 'like', "%{$search}%");
                  });
              }
          })
          ->addIndexColumn()
          ->make(true);
  }

}
