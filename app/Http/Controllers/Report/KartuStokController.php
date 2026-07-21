<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KartuStokController extends Controller
{
  /**
   * reference_type values that affect barangs.stok (toko), matching the
   * convention documented in App\Services\StockService. Kartu Stok only
   * shows toko movements, so gudang-only reference types
   * (mutasi_gudang_toko_gudang, mutasi_toko_gudang_gudang,
   * mutasi_masuk_barang, mutasi_keluar_barang) are intentionally excluded.
   */
  const STOK_REFERENCE_TYPES = ['surat_jalan', 'penjualan_manual', 'mutasi_gudang_toko', 'mutasi_toko_gudang'];

  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index()
  {
    $produks = DB::table('barangs')
      ->select('barangs.*')
      ->where('barangs.aktif', 'Active')
      ->orderBy('kode', 'asc')->get();

    return view('apps.report.kartu-stok', ['produks' => $produks]);
  }

  public function list_detil(Request $request)
  {
    $tanggalmulai = $request->tanggalmulai . ' 00:00:00';
    $tanggalselesai = $request->tanggalselesai . ' 23:59:59';

    $barang = DB::table('barangs')
      ->select('barangs.*')
      ->where('barangs.id', $request->produks)
      ->first();

    // LEFT JOIN (not INNER JOIN): some historical rows have a reference_id
    // that doesn't resolve to a real source row (e.g. mutasi_gudang_toko
    // rows saved with reference_id = 0), so an inner join silently drops
    // them from the report. Falls back to stock_movements.note (already a
    // readable label on its own) so the row still appears when the join misses.
    $movements = DB::table('stock_movements as sm')
      ->leftJoin('penjualans as p', function ($join) {
        $join->on('sm.reference_id', '=', 'p.id')
          ->whereIn('sm.reference_type', ['surat_jalan', 'penjualan_manual']);
      })
      ->leftJoin('konsumens as k', 'p.id_konsumens', '=', 'k.id')
      ->leftJoin('mutasi_gudang_tokos as mgt', function ($join) {
        $join->on('sm.reference_id', '=', 'mgt.id')
          ->where('sm.reference_type', '=', 'mutasi_gudang_toko');
      })
      ->leftJoin('mutasi_toko_gudangs as mtg', function ($join) {
        $join->on('sm.reference_id', '=', 'mtg.id')
          ->where('sm.reference_type', '=', 'mutasi_toko_gudang');
      })
      // Historical mutasi_gudang_toko / mutasi_toko_gudang rows carry
      // reference_id = 0 so the join above never matches for them; the
      // kode is recovered from stock_movements.note instead (it's always
      // wrapped in the single pair of parentheses in that note, e.g.
      // "Mutasi Gudang ke Toko (MTGT/2026/07/0422)" — including the
      // "Edit "/"Hapus " variants), so both paths render the same label.
      ->select('sm.*', 'k.nama as nama_customer', DB::raw("
        CASE
          WHEN sm.reference_type IN ('surat_jalan', 'penjualan_manual') AND p.kode_inv IS NOT NULL THEN CONCAT('<b>', p.kode_inv, '</b>')
          WHEN sm.reference_type = 'mutasi_gudang_toko' AND mgt.kode IS NOT NULL THEN CONCAT('<b>', mgt.kode, '</b>')
          WHEN sm.reference_type = 'mutasi_toko_gudang' AND mtg.kode IS NOT NULL THEN CONCAT('<b>', mtg.kode, '</b>')
          WHEN sm.reference_type = 'mutasi_gudang_toko' THEN CONCAT('<b>', SUBSTRING_INDEX(SUBSTRING_INDEX(sm.note, '(', -1), ')', 1), '</b>')
          WHEN sm.reference_type = 'mutasi_toko_gudang' THEN CONCAT('<b>', SUBSTRING_INDEX(SUBSTRING_INDEX(sm.note, '(', -1), ')', 1), '</b>')
          ELSE sm.note
        END as keterangan
      "))
      ->where('sm.product_id', $request->produks)
      ->whereIn('sm.reference_type', self::STOK_REFERENCE_TYPES)
      ->whereBetween('sm.movement_date', [$tanggalmulai, $tanggalselesai])
      ->orderBy('sm.movement_date', 'asc')
      ->orderBy('sm.id', 'asc')
      ->get();

    return view('apps.report.kartu-stok-detil', [
      'movements' => $movements,
      'barang' => $barang,
      'request' => $request,
    ]);
  }
}
