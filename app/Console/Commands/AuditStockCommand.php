<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

/**
 * Read-only audit: compares barangs.stok/gudang against the stock_movements
 * audit trail since a baseline date.
 *
 * This command CANNOT validate anything before the baseline date — stock
 * movements were only fully instrumented (all mutation code paths routed
 * through StockService, including both legs of gudang<->toko transfers)
 * starting from that rollout. Any drift that existed before the baseline is
 * invisible to this command by design; it only catches NEW drift/gaps
 * introduced after full logging coverage began.
 */
class AuditStockCommand extends Command
{
    protected $signature = 'stock:audit {--from=} {--to=} {--product=}';

    protected $description = 'Read-only: compare barangs.stok/gudang against stock_movements since a baseline date, optionally capped at --to (cannot validate anything before the baseline date).';

    const DEFAULT_BASELINE = '2026-07-10';

    const EPSILON = 0.0001;

    // reference_type -> which barangs column it tracks. Documented here
    // because stock_movements has no column recording this itself (see
    // App\Services\StockService docblock for the same convention table).
    const STOK_REFERENCE_TYPES = ['surat_jalan', 'mutasi_gudang_toko', 'mutasi_toko_gudang', 'penjualan_manual'];
    const GUDANG_REFERENCE_TYPES = ['mutasi_masuk_barang', 'mutasi_keluar_barang', 'mutasi_gudang_toko_gudang', 'mutasi_toko_gudang_gudang'];

    public function handle()
    {
        $from = $this->option('from') ?: self::DEFAULT_BASELINE;

        $to = $this->option('to');
        if ($to !== null && strlen($to) <= 10) {
            // a date-only value like "2026-07-20" should include the whole day
            $to .= ' 23:59:59';
        }

        $this->warn("Audit stok sejak {$from}" . ($to ? " sampai {$to}" : '') . '.');
        $this->line('Batasan: command ini TIDAK bisa memvalidasi kebenaran stok sebelum tanggal baseline — baru sejak tanggal itu semua jalur mutasi stok tercatat lewat StockService.');
        if ($to) {
            $this->line('Karena --to diset ke tanggal lampau, perbandingan ke nilai barangs.stok/gudang SAAT INI dilewati (nilai itu sudah pasti berbeda karena ada mutasi legit setelah tanggal --to) — command ini hanya mengecek rantai before/after di dalam rentang --from s/d --to.');
        }
        $this->line('');

        $productFilter = $this->option('product');

        $productIdsQuery = DB::table('stock_movements')->where('movement_date', '>=', $from);
        if ($to) {
            $productIdsQuery->where('movement_date', '<=', $to);
        }
        if ($productFilter) {
            $productIdsQuery->where('product_id', $productFilter);
        }
        $productIds = $productIdsQuery->distinct()->pluck('product_id');

        if ($productIds->isEmpty()) {
            $this->info('Tidak ada pergerakan stok tercatat pada rentang tersebut.');
            return 0;
        }

        $hasIssue = false;
        $rows = [];

        foreach ($productIds as $productId) {
            $barang = DB::table('barangs')->where('id', $productId)->first();

            if (!$barang) {
                continue;
            }

            $stokResult = $this->auditColumn($productId, self::STOK_REFERENCE_TYPES, (float) $barang->stok, $from, $to);
            $gudangResult = $this->auditColumn($productId, self::GUDANG_REFERENCE_TYPES, (float) $barang->gudang, $from, $to);

            if (in_array($stokResult['status'], ['drift', 'gap'], true) || in_array($gudangResult['status'], ['drift', 'gap'], true)) {
                $hasIssue = true;
            }

            $rows[] = [
                $productId,
                $barang->kode ?? '-',
                $barang->nama ?? '-',
                $stokResult['status'],
                $stokResult['detail'],
                $gudangResult['status'],
                $gudangResult['detail'],
            ];
        }

        $this->table(
            ['Product ID', 'Kode', 'Nama', 'Stok', 'Detail Stok', 'Gudang', 'Detail Gudang'],
            $rows
        );

        if ($hasIssue) {
            $this->line('');
            $this->error('Ditemukan drift/gap. Ini berarti ada mutasi stok yang lewat jalur di luar StockService (bug baru / kode yang belum ke-cover), atau akses DB langsung.');
        }

        return $hasIssue ? 1 : 0;
    }

    private function auditColumn(int $productId, array $referenceTypes, float $currentValue, string $from, ?string $to): array
    {
        $query = DB::table('stock_movements')
            ->where('product_id', $productId)
            ->where('movement_date', '>=', $from)
            ->whereIn('reference_type', $referenceTypes)
            ->orderBy('id');

        if ($to) {
            $query->where('movement_date', '<=', $to);
        }

        $movements = $query->get();

        if ($movements->isEmpty()) {
            return ['status' => 'no_movement', 'detail' => 'Tidak ada pergerakan pada rentang ini'];
        }

        $previous = null;
        foreach ($movements as $movement) {
            if ($previous !== null && abs($movement->before_stock - $previous->after_stock) > self::EPSILON) {
                return [
                    'status' => 'gap',
                    'detail' => "Gap antara movement #{$previous->id} (after={$previous->after_stock}) dan #{$movement->id} (before={$movement->before_stock})",
                ];
            }
            $previous = $movement;
        }

        // Only meaningful to compare against the LIVE barangs value when the
        // window runs through "now" (--to not set) — if --to caps the window
        // in the past, more legitimate movements exist after it and the live
        // value is expected to differ, so that comparison would be a false
        // positive.
        if ($to === null) {
            $expected = (float) $previous->after_stock;
            if (abs($expected - $currentValue) > self::EPSILON) {
                return [
                    'status' => 'drift',
                    'detail' => "Ekspektasi {$expected}, aktual {$currentValue} (selisih " . ($currentValue - $expected) . ")",
                ];
            }
        }

        return ['status' => 'consistent', 'detail' => 'Sesuai dengan log' . ($to ? ' (dalam rentang, tidak dibandingkan ke nilai live)' : '')];
    }
}
