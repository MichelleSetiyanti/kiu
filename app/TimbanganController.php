<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;
use \Carbon\Carbon;

use App\Kendaraan;
use App\Muatan;
use App\MuatanDetil;
use App\Vendor;
use App\TransaksiTimbangan;
use App\User;
use App\Pengaturan;

class TimbanganController extends Controller
{

  public function __construct()
  {
    $this->middleware('auth', ['except' => ['processData']]);
  }

  public function index(){
    
    $muatans = Muatan::select('id', 'nama')->orderBy('id', 'DESC')->get();
    $vendors = Vendor::select('id', 'nama')->orderBy('id', 'DESC')->get();
    $kendaraans = Kendaraan::select('id', 'jenis')->orderBy('id', 'DESC')->get();
    return view('apps.timbangan.index',[
      'user_id' => auth()->user()->id,
      'kendaraans' => $kendaraans,
      'muatans' => $muatans,
      'vendors' => $vendors,
      ]
    );
  }
  
  public function processData(Request $req){
    try{
      $muatan = Muatan::find($req->muatan_id);
      $muatanDetil = MuatanDetil::where('muatan_id', $req->muatan_id)
        ->where('vendor_id', $req->vendor_id)
        ->firstOrFail();

      $transaksiTimbangan = TransaksiTimbangan::create([
        'user_id' => $req->user_id,
        'kendaraan_id' => $req->kendaraan_id,
        'vendor_id' => $req->vendor_id,
        'muatan_id' => $req->muatan_id,
        'no_timbang' => $req->no_timbang, 
        'no_kendaraan' => $req->no_kendaraan,
        'harga_satuan' => $muatanDetil->harga,
        'jumlah_batang' => $req->jumlah_batang,
        'berat_masuk' => $req->berat_masuk,
        'berat_keluar' => $req->berat_keluar,
        'berat_bersih' => $req->berat_bersih,
        'subtotal' => $muatanDetil->harga * $req->berat_bersih,
        'grandtotal' => $muatanDetil->harga * $req->berat_bersih,
        'waktu_masuk' => $req->waktu_masuk,
        'waktu_keluar' => $req->waktu_keluar,
        // 'created_at' => $req->created_at,
        // 'updated_at' => $req->updated_at,
        'status' => 'selesai'
      ]);
      
      return response()->json([
          'message' => 'success'
      ], 201);
    }catch (Exception $e){
      return response()->json(['error' => $ex->getMessage()], 500);    
    }
  }

  public function input($id){
    $transaksiTimbangan = TransaksiTimbangan::where('id', $id)->first();
    $kendaraans = Kendaraan::select('id', 'jenis')->orderBy('id', 'DESC')->get();
    $muatans = Muatan::select('id', 'nama')->orderBy('id', 'DESC')->get();
    $vendors = Vendor::select('id', 'nama')->orderBy('id', 'DESC')->get();

    if(!$transaksiTimbangan) return redirect('timbangan/keluarmasuk');
    return view('apps.timbangan.input',[
      'data' => $transaksiTimbangan,
      'kendaraans' => $kendaraans,
      'vendors' => $vendors,
      'muatans' => $muatans,
    ]);
  }

  public function pengecekan(){
    return view('apps.timbangan.validasi');
  }

  public function get($id){
    $tanggal = date('Y/m/d H:i');
    if(env('APP_DEBUG') == false){
      $tanggal = (string) Carbon::createFromFormat('Y/m/d H:i', $tanggal, 'UTC')
      ->setTimezone('Asia/Jakarta');
    }
    $transaksiTimbangan = TransaksiTimbangan::with('muatan', 'vendor', 'kendaraan')->where('id', $id)->first();
   
    $transaksiTimbangan->waktu_masuk =  date_format(date_create($transaksiTimbangan->waktu_masuk), "Y/m/d H:i");
    if(env('APP_DEBUG') == false){
      $transaksiTimbangan->waktu_masuk = (string) Carbon::createFromFormat('Y/m/d H:i', $transaksiTimbangan->waktu_masuk, 'UTC')
      ->setTimezone('Asia/Jakarta');
    }

    $transaksiTimbangan->waktu_keluar =  date_format(date_create($transaksiTimbangan->waktu_keluar), "Y/m/d H:i");
    if(env('APP_DEBUG') == false){
      $transaksiTimbangan->waktu_keluar = (string) Carbon::createFromFormat('Y/m/d H:i', $transaksiTimbangan->waktu_keluar, 'UTC')
      ->setTimezone('Asia/Jakarta');
    }
    return response()->json([
      'tanggal' => $tanggal,
      'data' => $transaksiTimbangan
    ], 200);
  }

  public function laporan(){
    $muatans = Muatan::select('id', 'nama')->orderBy('id', 'DESC')->get();
    $vendors = Vendor::select('id', 'nama')->orderBy('id', 'DESC')->get();
    $users = User::select('id', 'name')->orderBy('id', 'DESC')->where('status', 'Admin Jembatan Timbang')->get();

    return view('apps.timbangan.laporan',[
      'muatans' => $muatans,
      'vendors' => $vendors,
      'users' => $users
    ]);
  }

  public function list($id){
    $transaksiTimbangan = TransaksiTimbangan::with('muatan', 'vendor', 'kendaraan')->where('user_id', $id)->orderByDesc('id')->get();
    return datatables()::of($transaksiTimbangan)
      ->editColumn('no_timbang', function($transaksiTimbangan){
        return '<b style=\'font-size: 10px\'>' . $transaksiTimbangan->no_timbang . '</b>'; 
      })
      ->addColumn('no_urut', function($transaksiTimbangan){
        return '<b style=\'font-size: 10px\'>' . intval(substr($transaksiTimbangan->no_timbang,1,4)) . '</b>';
      })
      ->addColumn('informasi_muatan', function($transaksiTimbangan){
        $nama_vendor = $transaksiTimbangan->vendor == null ? "-" : $transaksiTimbangan->vendor->nama; 
        $nama_muatan = $transaksiTimbangan->muatan == null ? "-" : $transaksiTimbangan->muatan->nama; 
        $no_kendaraan = $transaksiTimbangan->no_kendaraan == null ? "-" : $transaksiTimbangan->no_kendaraan;
        $waktu_masuk = "";
        $waktu_keluar = "";
        if($transaksiTimbangan->waktu_masuk == null)
          $waktu_masuk = "-";
        else{
          $waktu_masuk =  date_format(date_create($transaksiTimbangan->waktu_masuk), "d/m/Y H:i");
          if(env('APP_DEBUG') == false){
            $waktu_masuk = (string) Carbon::createFromFormat('d/m/Y H:i', $waktu_masuk, 'UTC')
            ->setTimezone('Asia/Jakarta');
          }
           
        }
        // $waktu_keluar = $transaksiTimbangan->waktu_keluar == null ? "-" :  date_format(date_create($transaksiTimbangan->waktu_keluar), "d/m/Y H:i");   
        
        if($transaksiTimbangan->waktu_keluar == null)
          $waktu_keluar = "-";
        else{
          $waktu_keluar =  date_format(date_create($transaksiTimbangan->waktu_keluar), "d/m/Y H:i");
          if(env('APP_DEBUG') == false){
            $waktu_keluar = (string) Carbon::createFromFormat('d/m/Y H:i', $waktu_keluar, 'UTC')
            ->setTimezone('Asia/Jakarta');
          }
        }
        return '
          <ul>
            <li>Vendor : ' . $nama_vendor . '</li>
            <li>Muatan : ' . $nama_muatan . '</li>
            <li>No Plat: <b>' . $no_kendaraan . '</b> </li>
            <li>Waktu Masuk: <br> ' . $waktu_masuk . '</li>
            <li>Waktu Keluar: <br> ' . $waktu_keluar . '</li>
          </ul>
        ';
      })
      ->addColumn('beban', function($transaksiTimbangan){
        $berat_masuk = "-";
        $berat_keluar = "-";
        $berat_bersih = "-";

        if($transaksiTimbangan->status == "proses"){
          $berat_masuk = $transaksiTimbangan->berat_masuk;
        }else if($transaksiTimbangan->status != "mulai"){
          $berat_masuk = $transaksiTimbangan->berat_masuk;
          $berat_keluar = $transaksiTimbangan->berat_keluar;
          $berat_bersih = $transaksiTimbangan->berat_bersih;
        }

        return '
        <ul>
          <li>Masuk : <br> ' . $berat_masuk . ' Kg</li>
          <li>Keluar : <br> ' . $berat_keluar . ' Kg</li>
          <li>Netto : <br> ' . $berat_bersih . ' Kg</li>
        </ul>';
      })
      ->addColumn('status', function($transaksiTimbangan){
        return '<b>' . ucfirst($transaksiTimbangan->status) . '</b>';
      })
      ->addColumn('action', function ($transaksiTimbangan) {
        $tombol =  $transaksiTimbangan->status == 'selesai'  || $transaksiTimbangan->status == 'lolos' ? 
                  '<span class="fonticon-wrap" onclick="f_print('.$transaksiTimbangan->id.')"><i class="feather icon-printer" data-toggle="tooltip" title="Print"></i></span>' 
                  : '<span class="fonticon-wrap" onclick="f_edit('.$transaksiTimbangan->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>';
        
        return '
          <div class="fonticon-container">' .
            $tombol .
            '<span class="fonticon-wrap" onclick="f_delete('.$transaksiTimbangan->id.')"><i class="feather icon-x-circle" data-toggle="tooltip" title="Batal"></i></span>' .
          '</div>';
      })
      ->rawColumns(['no_timbang','no_urut', 'status','action','beban','informasi_muatan'])
      ->addIndexColumn()
      ->toJson();
  }

  
  public function listValidasi(){
    $transaksiTimbangan = TransaksiTimbangan::with('muatan', 'vendor', 'kendaraan')->where('status', 'selesai')->orWhere('status', 'lolos')->orderByDesc('id')->get();
    return datatables()::of($transaksiTimbangan)
      ->editColumn('no_timbang', function($transaksiTimbangan){
        return '<b style=\'font-size: 10px\'>' . $transaksiTimbangan->no_timbang . '</b>'; 
      })
      ->addColumn('informasi_muatan', function($transaksiTimbangan){
        $nama_vendor = $transaksiTimbangan->vendor == null ? "-" : $transaksiTimbangan->vendor->nama; 
        $nama_muatan = $transaksiTimbangan->muatan == null ? "-" : $transaksiTimbangan->muatan->nama; 
        $no_kendaraan = $transaksiTimbangan->no_kendaraan == null ? "-" : $transaksiTimbangan->no_kendaraan;
        // $waktu_masuk = $transaksiTimbangan->waktu_masuk == null ? "-" :  date_format(date_create($transaksiTimbangan->waktu_masuk), "d/m/Y H:i");   
        // $waktu_keluar = $transaksiTimbangan->waktu_keluar == null ? "-" :  date_format(date_create($transaksiTimbangan->waktu_keluar), "d/m/Y H:i");   
        $waktu_masuk = "";
        $waktu_keluar = "";
        if($transaksiTimbangan->waktu_masuk == null)
          $waktu_masuk = "-";
        else{
          $waktu_masuk =  date_format(date_create($transaksiTimbangan->waktu_masuk), "d/m/Y H:i");
          if(env('APP_DEBUG') == false){
            $waktu_masuk = (string) Carbon::createFromFormat('d/m/Y H:i', $waktu_masuk, 'UTC')
            ->setTimezone('Asia/Jakarta');
          }
           
        }
        // $waktu_keluar = $transaksiTimbangan->waktu_keluar == null ? "-" :  date_format(date_create($transaksiTimbangan->waktu_keluar), "d/m/Y H:i");   
        
        if($transaksiTimbangan->waktu_keluar == null)
          $waktu_keluar = "-";
        else{
          $waktu_keluar =  date_format(date_create($transaksiTimbangan->waktu_keluar), "d/m/Y H:i");
          if(env('APP_DEBUG') == false){
            $waktu_keluar = (string) Carbon::createFromFormat('d/m/Y H:i', $waktu_keluar, 'UTC')
            ->setTimezone('Asia/Jakarta');
          }
        }

        return '
          <ul>
            <li>Vendor : ' . $nama_vendor . '</li>
            <li>Muatan : ' . $nama_muatan . '</li>
            <li>No Plat: <b>' . $no_kendaraan . '</b> </li>
            <li>Waktu Masuk: <br> ' . $waktu_masuk . '</li>
            <li>Waktu Keluar: <br> ' . $waktu_keluar . '</li>
          </ul>
        ';
      })
      ->addColumn('beban', function($transaksiTimbangan){
        $berat_masuk = "-";
        $berat_keluar = "-";
        $berat_bersih = "-";

        if($transaksiTimbangan->status == "proses"){
          $berat_masuk = $transaksiTimbangan->berat_masuk;
        }else if($transaksiTimbangan->status != "mulai"){
          $berat_masuk = $transaksiTimbangan->berat_masuk;
          $berat_keluar = $transaksiTimbangan->berat_keluar;
          $berat_bersih = $transaksiTimbangan->berat_bersih;
        }

        return '
        <ul>
          <li>Masuk : ' . $berat_masuk . ' Kg</li>
          <li>Keluar : ' . $berat_keluar . ' Kg</li>
          <li>Netto : ' . $berat_bersih . ' Kg</li>
        </ul>';
      })
      ->addColumn('status', function($transaksiTimbangan){
        return '<b>' . ucfirst($transaksiTimbangan->status) . '</b>';
      })
      ->addColumn('action', function ($transaksiTimbangan) {
        $tombol = '<span class="fonticon-wrap" onclick="f_verify('.$transaksiTimbangan->id.')"><i class="feather icon-check-square" data-toggle="tooltip" title="Verifikasi"></i></span>';
        
        return '
          <div class="fonticon-container">' . $tombol . '</div>';
      })
      ->rawColumns(['no_timbang', 'status','action','beban','informasi_muatan'])
      ->addIndexColumn()
      ->toJson();
  }

  public function report_total(Request $req){
    
    $query = TransaksiTimbangan::select(DB::raw('count(*) as jumlah_timbangan, sum(grandtotal) as total_pembayaran, sum(berat_bersih) as total_berat_bersih'));
    
    if($req->has('user_id')){
      $query->where('user_id', $req->input('user_id'));
    }

    if($req->has('vendor_id')){
      $query->where('vendor_id', $req->input('vendor_id'));
    }

    if($req->has('muatan_id')){
      $query->where('muatan_id', $req->input('muatan_id'));
    }

    if($req->has('status')){
      $query->where('status', $req->input('status'));
    }

    if($req->input('tanggal_mulai') && $req->input('tanggal_selesai')){
        $query->whereRaw(
          "(created_at >= ? AND created_at <= ?)", 
          [$req->input('tanggal_mulai')." 00:00:00", $req->input('tanggal_selesai')." 23:59:59"]
        );
    }

    $data = $query->first();

    return response()->json([
      'data' => [
        'tanggal' => \Carbon\Carbon::now()->format('m/d/Y'),
        'jumlah_timbangan' => $data->jumlah_timbangan,
        'total_pembayaran' => $data->total_pembayaran,
        'total_berat_bersih' => $data->total_berat_bersih
      ]
      ], 200);
  }

  public function report(Request $req){
    $query = TransaksiTimbangan::with('muatan', 'vendor','user');

    if($req->has('user_id')){
      $query->where('user_id', $req->input('user_id'));
    }

    if($req->has('vendor_id')){
      $query->where('vendor_id', $req->input('vendor_id'));
    }

    if($req->has('muatan_id')){
      $query->where('muatan_id', $req->input('muatan_id'));
    }

    if($req->has('status')){
      $query->where('status', $req->input('status'));
    }

    if($req->input('tanggal_mulai') && $req->input('tanggal_selesai')){
        $query->whereRaw(
          "(created_at >= ? AND created_at <= ?)", 
          [$req->input('tanggal_mulai')." 00:00:00", $req->input('tanggal_selesai')." 23:59:59"]
        );
    }

    $transaksiTimbangan = $query->orderByDesc('id')->get();
    return datatables()::of($transaksiTimbangan)
      ->addColumn('operator', function($transaksiTimbangan){
        return $transaksiTimbangan->user->name;
      })
      ->editColumn('muatan', function($transaksiTimbangan){
        return $transaksiTimbangan->muatan->nama;
      })
      ->editColumn('vendor', function($transaksiTimbangan){
        return $transaksiTimbangan->vendor->nama;
      })
      ->editColumn('waktu_masuk', function($transaksiTimbangan){
        $waktu_masuk = "";
        if($transaksiTimbangan->waktu_masuk == null)
          $waktu_masuk = "-";
        else{
          $waktu_masuk =  date_format(date_create($transaksiTimbangan->waktu_masuk), "d/m/Y H:i");
          if(env('APP_DEBUG') == false){
            $waktu_masuk = (string) Carbon::createFromFormat('d/m/Y H:i', $waktu_masuk, 'UTC')
            ->setTimezone('Asia/Jakarta');
          }
        }
        return $waktu_masuk;
      })
      ->editColumn('waktu_keluar', function($transaksiTimbangan){
        $waktu_keluar = "";
        if($transaksiTimbangan->waktu_keluar == null)
          $waktu_keluar = "-";
        else{
          $waktu_keluar =  date_format(date_create($transaksiTimbangan->waktu_keluar), "d/m/Y H:i");
          if(env('APP_DEBUG') == false){
            $waktu_keluar = (string) Carbon::createFromFormat('d/m/Y H:i', $waktu_keluar, 'UTC')
            ->setTimezone('Asia/Jakarta');
          }    
        }
        return $waktu_keluar;
      })
      ->addIndexColumn()
      ->toJson();
  }

  public function update(Request $req,$id){
    try{
      $muatanDetil = MuatanDetil::where('muatan_id', $req->muatan_id)
        ->where('vendor_id', $req->vendor_id)
        ->first();

      $transaksiTimbangan = TransaksiTimbangan::find($id);
      $transaksiTimbangan->kendaraan_id = $req->kendaraan_id;
      $transaksiTimbangan->vendor_id = $req->vendor_id;
      $transaksiTimbangan->muatan_id = $req->muatan_id;
      $transaksiTimbangan->harga_satuan = $muatanDetil->harga;
      $transaksiTimbangan->no_kendaraan = $req->no_kendaraan;
      $transaksiTimbangan->jumlah_batang = $req->jumlah_batang;
      $transaksiTimbangan->keterangan = $req->keterangan;
      $transaksiTimbangan->save();
      
      return response()->json(['message' => 'Data Berhasil Diubah'], 200);
    }catch(Exception $e){
      return response()->json(['error' => $ex->getMessage()], 500);
    }
  }

  public function start(Request $req){
    $user_id = $req->user_id;
    if(!$req->user_id) return response()->json(['message' => 'Id User tidak boleh kosong!'], 400);

    $tanggal = \Carbon\Carbon::now()->format('dmY');  
    $transaksiTimbangan = TransaksiTimbangan::select(DB::raw('MAX(CONVERT(SUBSTRING(no_timbang, 2, 4),UNSIGNED)) as no_timbang'))->whereRaw('substring(no_timbang, 6, 8) = \''. $tanggal. '\' and substring(no_timbang, 15, length(no_timbang) - 14) = ' . $user_id)->first();
    $no_timbang = 'T' . str_pad($transaksiTimbangan->no_timbang + 1, 4, '0', STR_PAD_LEFT) . $tanggal . '-' . $user_id;
    

    try{
      $muatan = Muatan::find($req->muatan_id);
      $muatanDetil = MuatanDetil::where('muatan_id', $req->muatan_id)
        ->where('vendor_id', $req->vendor_id)
        ->first();

      $transaksiTimbangan = TransaksiTimbangan::create([
        'user_id' => $user_id,
        'kendaraan_id' => $req->kendaraan_id,
        'vendor_id' => $req->vendor_id,
        'muatan_id' => $req->muatan_id,
        'no_timbang' => $no_timbang, 
        'no_kendaraan' => $req->no_kendaraan,
        'harga_satuan' => $muatanDetil->harga,
        'status' => 'mulai'
      ]);

      return response()->json([
          'message' => 'Memulai timbangan baru',
          'data' => [
              'id' => $transaksiTimbangan->id,
              'no_timbang' => $no_timbang,
              'status' => 'start'
          ]
      ], 201);
    }catch (Exception $e){
      return response()->json(['error' => $ex->getMessage()], 500);    
    }
  }

  public function in(Request $req){
    try{
      $transaksiTimbangan = TransaksiTimbangan::find($req->id);
      $transaksiTimbangan->berat_masuk = $req->berat_masuk;
      $transaksiTimbangan->waktu_masuk = DB::raw('now()');
      $transaksiTimbangan->status = 'proses';

      $transaksiTimbangan->save();
    
      return response()->json([
          'message' => 'Data berhasil disimpan'
      ], 200);
    }catch (Exception $e){
        return response()->json(['error' => $ex->getMessage()], 500);   
    }
  }

  public function out(Request $req, $id){
    try{
      $transaksiTimbangan = TransaksiTimbangan::find($id);
      if($transaksiTimbangan->berat_masuk <= $req->berat_keluar)
        return response()->json(['message' => 'Berat keluar tidak boleh lebih besar atau sama dengan berat masuk!'], 400);
      $transaksiTimbangan->berat_keluar = $req->berat_keluar;
      $transaksiTimbangan->berat_bersih = $transaksiTimbangan->berat_masuk - $req->berat_keluar;
      $transaksiTimbangan->subtotal = $transaksiTimbangan->harga_satuan * $transaksiTimbangan->berat_bersih;
      $transaksiTimbangan->status = "selesai";
      $transaksiTimbangan->grandtotal = $transaksiTimbangan->subtotal;

      
      $transaksiTimbangan->waktu_keluar = DB::raw('now()');
      $transaksiTimbangan->save();
      return response()->json(['message' => 'Timbangan telah selesai'], 200);
      
    }catch(Exception $e){
      return response()->json(['error' => $ex->getMessage()], 500);   
    }
  }

  public function verify(Request $req, $id){
    try{
      $transaksiTimbangan = TransaksiTimbangan::find($id);

      if($transaksiTimbangan->status != 'selesai' && $transaksiTimbangan->status != 'lolos') return response()->json(['message' => 'Verifikasi data hanya dapat dilakukan untuk timbangan yang telah selesai'], 400);
      if($req->harga_potongan > $transaksiTimbangan->subtotal) return response()->json(['message' => 'Potongan tidak dapat lebih besar dari subtotal!'], 400);

      $transaksiTimbangan->status = "lolos";
      $transaksiTimbangan->harga_potongan = $req->harga_potongan;
      $transaksiTimbangan->grandTotal = $transaksiTimbangan->subtotal -  $req->harga_potongan;
      $transaksiTimbangan->save();
      return response()->json(['message' => 'Verifikasi timbangan telah selesai'], 200);
    }catch(Exception $e){
      return response()->json(['error' => $ex->getMessage()], 500);  
    }
  }

  public function cancel($id){
    $transaksiTimbangan = TransaksiTimbangan::where('id', $id)->first();
    if(!$transaksiTimbangan) return response()->json(['message' => 'Transaksi timbang tidak ditemukan'], 400);
    if($transaksiTimbangan->status == 'selesai' || $transaksiTimbangan->status == 'lolos') return response()->json(['message' => 'Timbangan tidak bisa dibatalkan karena sudah selesai'], 400);

    try{
      TransaksiTimbangan::destroy($id);
      return response()->json(['message' => 'Timbangan berhasil dibatalkan'], 200);
    }catch(Exception $e){
      return response()->json(['error' => $ex->getMessage()], 500);
    }
  }
  
}
