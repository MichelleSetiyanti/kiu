<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class SuratJalanController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index()
  {
    $konsumens = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->where('aktif', '=', 'Active')
      ->get();

    return view('apps.penjualan.surat-jalan.index', ['konsumens' => $konsumens]);
  }

  public function list(Request $request)
  {
    $penjualans = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen')
      ->where(function ($query) use ($request) {

        if ($request->client != "All") {
          $query->where('penjualans.id_konsumens', '=', $request->client);
        }

        $query->where('penjualans.tipe_penjualan', '=', 'Manual');
        $query->where('penjualans.status', '=', 'Selesai');
      })
      ->orderBy('id', 'desc')
      ->get();
    return datatables()::of($penjualans)
      ->addColumn('action', function ($penjualans) {
        $encrypt = Crypt::encrypt($penjualans->id);

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_datadetil(' . $penjualans->id . ')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Detil Penjualan"></i></span>
            <span class="fonticon-wrap" onclick="f_suratjalan(' . $penjualans->id . ', \'' . $encrypt . '\', \'' . $penjualans->kode_sj . '\' )"><i class="feather icon-printer" data-toggle="tooltip" title="Cetak Surat Jalan"></i></span>

          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function store(Request $request)
  {


    DB::beginTransaction();

    try {
      $month = \Carbon\Carbon::now()->format('m');
      $year = \Carbon\Carbon::now()->format('Y');
      $penjualanlama = DB::table('penjualans')->where('id', $request->idpenjualan)->first();

      if ($penjualanlama->pajak > 0) {
        $invoices = DB::table('penjualans')->select(DB::raw('max(substr(kode_sj,-4)) as nomor_max'))->where(DB::raw('YEAR(tanggal)'), $year)->where('kode_sj', 'like', 'S-%')->get();

        $kodetransaksi = "S-" . substr($year, -2) . "-" . str_pad((int)$invoices[0]->nomor_max + 1, 4, "0", STR_PAD_LEFT);
      } else {
        $invoices = DB::table('penjualans')->select(DB::raw('max(substr(kode_sj,-4)) as nomor_max'))->where(DB::raw('YEAR(tanggal)'), $year)->where('kode_sj', 'like', 'SJS-%')->get();

        $kodetransaksi = "SJS-" . substr($year, -2) . "-" . str_pad((int)$invoices[0]->nomor_max + 1, 4, "0", STR_PAD_LEFT);
      }

      DB::table('penjualans')->where('id', $request->idpenjualan)->update([
        'kode_sj' => $kodetransaksi,
        'tanggal_sj' => $request->tanggal,
        'alamat_sj' => $request->alamat,
        'ekspedisi' => $request->ekspedisi,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $penjualan_details = DB::table('penjualan_details')->where('id_penjualans', $request->idpenjualan)->get();

      foreach ($penjualan_details as $penjualandetail) {
        $barang = DB::table('barangs')->where('id', $penjualandetail->id_barangs)->first();

        $stoklama = $barang->stok;

        $stokbaru = $stoklama - $penjualandetail->total_jual;

        DB::table('barangs')->where('id', $penjualandetail->id_barangs)->update([
          'stok' => $stokbaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      DB::commit();

      return 'berhasil';
    } catch (Exception $e) {
      DB::rollBack();

      return 'gagal';
    }
  }


  public function print($param)
  {
    $id = Crypt::decrypt($param);

    $penjualan = DB::table('penjualans')
      ->join('konsumens', 'penjualans.id_konsumens', '=', 'konsumens.id')
      ->select('penjualans.*', 'konsumens.nama as namakonsumen', 'konsumens.alamat as alamatkonsumen', 'konsumens.no_hp as nohpkonsumen', 'konsumens.contact_person as cpkonsumen')
      ->where('penjualans.id', '=', $id)
      ->orderBy('created_at', 'desc')
      ->first();

    $penjualandetails = DB::table('penjualan_details')
      ->join('barangs', 'penjualan_details.id_barangs', '=', 'barangs.id')
      ->select('penjualan_details.*', 'barangs.nama as namabarang', 'barangs.kode as kodebarang', 'barangs.satuan as satuanbarang')
      ->where('id_penjualans', $id)
      ->orderBy('barangs.nama', 'asc')
      ->get();

    return view('apps.penjualan.print-surat-jalan', ['penjualan' => $penjualan, 'penjualandetails' => $penjualandetails]);
  }
}
