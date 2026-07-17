<?php

namespace App\Http\Controllers\Mutasi;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use App\Services\StockService;
use File;

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

    return view('apps.mutasi.toko-gudang.index',[ 'produks' => $produks ]);
  }

  public function list(Request $request)
  {
      $mutasi = DB::table('mutasi_toko_gudangs as m')
          ->join('users as u','m.id_users','=','u.id')
          ->join('barangs as b','m.id_barangs','=','b.id')
          ->select(
              'm.*',
              'u.name as namauser',
              'b.nama as namabarang',
              'b.kode as kodebarang'
          )
          ->whereMonth('m.created_at', substr($request->tanggal, 0, 2))
          ->whereYear('m.created_at', substr($request->tanggal, -4))
          ->orderBy('m.id', 'desc'); 

      return datatables()::of($mutasi)
          ->filter(function ($query) use ($request) {
              $search = $request->get('search')['value'] ?? null;

              if ($search) {
                  $query->where(function ($q) use ($search) {
                      $q->where('m.kode', 'like', "%{$search}%")     
                        ->orWhere('b.nama', 'like', "%{$search}%");
                  });
              }
          })
          ->addColumn('action', function ($row) {

              $class = "";

              if (
                  Auth::user()->status != "Supervisor" &&
                  Auth::user()->status != "Super Admin" &&
                  Auth::user()->status != "Owner"
              ) {
                  $class = "hidden";
              }

              return '
                <div class="fonticon-container">
                  <span class="fonticon-wrap '.$class.'" onclick="f_edit('.$row->id.')">
                    <i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i>
                  </span>
                  <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$row->id.')">
                    <i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i>
                  </span>
                </div>
              ';
          })
          ->addIndexColumn()
          ->make(true);
  }

  public function store(Request $request){
    $datenow = date("Y/m");

    $querypemasukan = DB::table('mutasi_toko_gudangs')->where('kode','like','MTTG/'.$datenow.'/%')->orderBy('id','desc');

    if ($querypemasukan->exists()) {
      $mutasi_toko_gudangs = $querypemasukan->first();
      $pecah = explode('/',$mutasi_toko_gudangs->kode);

      $kodeterakhir = $pecah[3];
    }else{
      $kodeterakhir = 0;
    }

    $kode = "MTTG/".$datenow.'/'.str_pad($kodeterakhir+1, 4, "0", STR_PAD_LEFT);

    parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

    $lockKey = 'toko-gudang-store:' . Auth::id() . ':' . $data['produks'] . ':' . $request->qty;
    if (!StockService::acquireRequestLock($lockKey)) {
        Log::warning('TokoGudangController::store: duplicate submission ditolak', ['lockKey' => $lockKey]);
        return 'gagal';
    }

    DB::beginTransaction();

    try{
      $idMutasi = DB::table('mutasi_toko_gudangs')->insertGetId([
        'id_users' => Auth::User()->id,
        'id_barangs' => $data['produks'],
        'kode' => $kode,
        'keterangan' => $data['keterangan'],
        'qty' => $request->qty,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $qty = $request->qty;

      try {
          StockService::adjust(
              $data['produks'],
              StockService::COLUMN_WAREHOUSE,
              $qty,
              true,
              [
                  'type'           => 'in',
                  'reference_type' => 'mutasi_toko_gudang_gudang',
                  'reference_id'   => $idMutasi,
                  'note'           => 'Mutasi Toko ke Gudang (' . $kode . ') - tambah gudang',
              ]
          );

          StockService::adjust(
              $data['produks'],
              StockService::COLUMN_STORE,
              -$qty,
              true,
              [
                  'type'           => 'out',
                  'reference_type' => 'mutasi_toko_gudang',
                  'reference_id'   => $idMutasi,
                  'note'           => 'Mutasi Toko ke Gudang (' . $kode . ')',
              ]
          );
      } catch (\RuntimeException $e) {
          DB::rollBack();
          return $e->getMessage();
      }

      DB::commit();

      return 'berhasil';
    }catch (\Throwable $e){
      DB::rollBack();
      Log::error('TokoGudangController::store gagal', ['exception' => $e]);

      return 'gagal';
    }
  }

  public function update(Request $request){

    parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

    $lockKey = 'toko-gudang-update:' . $data['id'];
    if (!StockService::acquireRequestLock($lockKey)) {
        Log::warning('TokoGudangController::update: duplicate submission ditolak', ['lockKey' => $lockKey]);
        return 'gagal';
    }

    DB::beginTransaction();
    try{

      // baca data pembelian sebelumnya
      $datalama = DB::table('mutasi_toko_gudangs')->where('id',$data['id'])->first();

      $totalbelilama = $datalama->qty;

      $penambahanstok = $request->qty - $totalbelilama;

      DB::table('mutasi_toko_gudangs')->where('id',$data['id'])->update([
        'keterangan' => $data['keterangan'],
        'qty' => $request->qty,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      try {
          StockService::adjust(
              $datalama->id_barangs,
              StockService::COLUMN_WAREHOUSE,
              $penambahanstok,
              true,
              [
                  'type'           => $penambahanstok >= 0 ? 'in' : 'out',
                  'reference_type' => 'mutasi_toko_gudang_gudang',
                  'reference_id'   => $datalama->id,
                  'note'           => 'Edit Mutasi Toko ke Gudang (' . $datalama->kode . ') - tambah gudang',
              ]
          );

          StockService::adjust(
              $datalama->id_barangs,
              StockService::COLUMN_STORE,
              -$penambahanstok,
              true,
              [
                  'type'           => $penambahanstok >= 0 ? 'out' : 'in',
                  'reference_type' => 'mutasi_toko_gudang',
                  'reference_id'   => $datalama->id,
                  'note'           => 'Edit Mutasi Toko ke Gudang (' . $datalama->kode . ')',
              ]
          );
      } catch (\RuntimeException $e) {
          DB::rollBack();
          return $e->getMessage();
      }

      DB::commit();

      return 'berhasil';
    }catch (\Throwable $e){
      DB::rollBack();
      Log::error('TokoGudangController::update gagal', ['exception' => $e]);

      return 'gagal';
    }
  }

  public function requestdata(Request $request){
    $mutasi_toko_gudangs = DB::table('mutasi_toko_gudangs')->where('id',$request->id)->get();

    if ($mutasi_toko_gudangs->count()){
      return 'ada|'. $mutasi_toko_gudangs[0]->keterangan . "|" . $mutasi_toko_gudangs[0]->qty . "|" . $mutasi_toko_gudangs[0]->id_barangs . "|" . $mutasi_toko_gudangs[0]->kode;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    $lockKey = 'toko-gudang-drop:' . $request->id;
    if (!StockService::acquireRequestLock($lockKey)) {
        Log::warning('TokoGudangController::drop: duplicate submission ditolak', ['lockKey' => $lockKey]);
        return 'gagal';
    }

    DB::beginTransaction();

    try{

      // baca data pembelian sebelumnya
      $datalama = DB::table('mutasi_toko_gudangs')->where('id',$request->id)->first();

      try {
          StockService::adjust(
              $datalama->id_barangs,
              StockService::COLUMN_WAREHOUSE,
              -$datalama->qty,
              true,
              [
                  'type'           => 'out',
                  'reference_type' => 'mutasi_toko_gudang_gudang',
                  'reference_id'   => $datalama->id,
                  'note'           => 'Hapus Mutasi Toko ke Gudang (' . $datalama->kode . ') - kurang gudang',
              ]
          );

          StockService::adjust(
              $datalama->id_barangs,
              StockService::COLUMN_STORE,
              $datalama->qty,
              true,
              [
                  'type'           => 'in',
                  'reference_type' => 'mutasi_toko_gudang',
                  'reference_id'   => $datalama->id,
                  'note'           => 'Hapus Mutasi Toko ke Gudang (' . $datalama->kode . ')',
              ]
          );
      } catch (\RuntimeException $e) {
          DB::rollBack();
          return $e->getMessage();
      }

      DB::table('mutasi_toko_gudangs')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (\Throwable $e){
      DB::rollBack();
      Log::error('TokoGudangController::drop gagal', ['exception' => $e]);

      return 'gagal';
    }
  }

  public function getstok(Request $request) {
      if (!$request->filled('param') || $request->param === 'kosong') {
          return response()->json([
              'status' => true,
              'stok'   => 0,
              'satuan' => ''
          ]);
      }

      $barang = DB::table('barangs')->where('id', $request->param)->first();

      if (!$barang) {
          return response()->json([
              'status' => false,
              'message' => 'Barang tidak ditemukan'
          ], 404);
      }

      return response()->json([
          'status' => true,
          'stok' => $barang->stok,
          'satuan' => $barang->satuan
      ]);
  }

}
