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
      ->orderBy('id', 'desc');
    return datatables()::of($penjualans)
      ->filter(function ($query) use ($request) {
            $search = $request->get('search')['value'] ?? null;

            if ($search) {
                $query->where(function ($q) use ($search) {
                    $q->where('penjualans.kode', 'like', "%{$search}%")
                      ->orWhere('penjualans.kode_sj', 'like', "%{$search}%")
                      ->orWhere('penjualans.kode_inv', 'like', "%{$search}%")
                      ->orWhere('konsumens.nama', 'like', "%{$search}%")
                      ->orWhere('penjualans.keterangan', 'like', "%{$search}%");
                });
            }
        })
      ->addColumn('action', function ($penjualans) {
        $encrypt = \Crypt::encrypt($penjualans->id);

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
          $year  = \Carbon\Carbon::now()->format('Y');

          $penjualanlama = DB::table('penjualans')
              ->where('id', $request->idpenjualan)
              ->lockForUpdate()
              ->first();

          if (! $penjualanlama) {
              DB::rollBack();
              return 'gagal';
          }

          if (!empty($penjualanlama->kode_sj)) {
              DB::rollBack();
              return 'already_processed';
          }

          if ($penjualanlama->pajak > 0) {
              $invoices = DB::table('penjualans')
                  ->select(DB::raw('max(substr(kode_sj, -4)) as nomor_max'))
                  ->where(DB::raw('YEAR(tanggal)'), $year)
                  ->where('kode_sj', 'like', 'S-%')
                  ->get();

              $nomor_max = $invoices->isEmpty() || $invoices[0]->nomor_max === null
                  ? 0
                  : (int) $invoices[0]->nomor_max;

              // Penomoran baru
              $nomor_baru = $nomor_max === 0 ? 1 : $nomor_max + 1;

              // Format nomor transaksi
              $kodetransaksi = "S-" . substr($year, -2) . "-" . str_pad($nomor_baru, 4, "0", STR_PAD_LEFT);
          } else {
              $invoices = DB::table('penjualans')
                  ->select(DB::raw('max(substr(kode_sj, -5)) as nomor_max'))
                  ->where(DB::raw('YEAR(tanggal)'), $year)
                  ->where('kode_sj', 'like', 'SJS-%')
                  ->get();

              $nomor_max = $invoices->isEmpty() || $invoices[0]->nomor_max === null
                  ? 0
                  : (int) $invoices[0]->nomor_max;

              $nomor_baru   = $nomor_max === 0 ? 1 : $nomor_max + 1;
              $kodetransaksi = "SJS-" . substr($year, -2) . "-" . str_pad($nomor_baru, 5, "0", STR_PAD_LEFT);
          }

          // Update penjualan dengan kode_sj baru
          DB::table('penjualans')->where('id', $request->idpenjualan)->update([
              'kode_sj'    => $kodetransaksi,
              'tanggal_sj' => $request->tanggal,
              'alamat_sj'  => $request->alamat,
              'ekspedisi'  => $request->ekspedisi,
              "updated_at" => \Carbon\Carbon::now()
          ]);

          // ===== Proses stok per detil penjualan =====
          $penjualan_details = DB::table('penjualan_details')
              ->where('id_penjualans', $request->idpenjualan)
              ->get();

          foreach ($penjualan_details as $penjualandetail) {

              $barang = DB::table('barangs')
                  ->where('id', $penjualandetail->id_barangs)
                  ->lockForUpdate()   // kunci stok barang
                  ->first();

              if (!$barang) {
                  DB::rollBack();
                  return 'product_not_found';
              }

              $stoklama = (int) $barang->stok;
              $qty      = (int) $penjualandetail->total_jual;
              $stokbaru = $stoklama - $qty;

              if ($stokbaru < 0) {
                  DB::rollBack();
                  return 'insufficient_stock';
              }

              // update stok di table barangs
              DB::table('barangs')->where('id', $penjualandetail->id_barangs)->update([
                  'stok'       => $stokbaru,
                  'updated_at' => \Carbon\Carbon::now()
              ]);

              // insert ke stock_movements untuk stok keluar (type = 'out')
              DB::table('stock_movements')->insert([
                  'product_id'     => $penjualandetail->id_barangs,
                  'store_id'       => $request->store_id ?? null,
                  'movement_date'  => \Carbon\Carbon::now(),
                  'type'           => 'out',
                  'quantity'       => $qty,
                  'before_stock'   => $stoklama,
                  'after_stock'    => $stokbaru,
                  'reference_type' => 'surat_jalan',
                  'reference_id'   => $request->idpenjualan,
                  'note'           => 'Surat Jalan / Penjualan #' . $request->idpenjualan,
                  'created_by'     => Auth::id(),
                  'created_at'     => \Carbon\Carbon::now(),
                  'updated_at'     => \Carbon\Carbon::now(),
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
