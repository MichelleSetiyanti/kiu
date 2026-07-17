<?php

namespace App\Services;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

/**
 * Central, lock-safe entry point for every mutation of `barangs.stok` /
 * `barangs.gudang`, optionally paired with an audit row in `stock_movements`.
 *
 * Must be called from inside a caller-owned DB::beginTransaction() block —
 * this method does not open or close a transaction itself, so it composes
 * with whatever other inserts/updates the calling controller method is
 * already doing in the same transaction.
 *
 * reference_type / column convention (documented here since stock_movements
 * has no column that records which of the two barangs columns a row refers
 * to):
 *   surat_jalan               -> stok    (always out)
 *   mutasi_gudang_toko        -> stok    (always in)
 *   mutasi_gudang_toko_gudang -> gudang  (always out) [gudang leg of the same transfer]
 *   mutasi_toko_gudang        -> stok    (always out)
 *   mutasi_toko_gudang_gudang -> gudang  (always in)  [gudang leg of the same transfer]
 *   mutasi_masuk_barang       -> gudang
 *   mutasi_keluar_barang      -> gudang
 *   penjualan_manual          -> stok
 */
class StockService
{
    const COLUMN_STORE = 'stok';
    const COLUMN_WAREHOUSE = 'gudang';

    const EPSILON = 0.0001;

    /**
     * @param int        $productId     barangs.id
     * @param string     $column        self::COLUMN_STORE or self::COLUMN_WAREHOUSE
     * @param float      $delta         signed: positive increases stock, negative decreases it
     * @param bool       $allowNegative when false (default), throws instead of letting the
     *                                  column go below zero
     * @param array|null $movement      null = update barangs only, no audit row.
     *                                  Otherwise: ['type' => 'in'|'out', 'reference_type' => string,
     *                                  'reference_id' => int|null, 'note' => string|null,
     *                                  'store_id' => int|null]
     *
     * @return array{before: float, after: float, product: object}
     * @throws \RuntimeException with message 'product_not_found' or 'insufficient_stock'
     */
    public static function adjust(int $productId, string $column, float $delta, bool $allowNegative = false, ?array $movement = null): array
    {
        if (!in_array($column, [self::COLUMN_STORE, self::COLUMN_WAREHOUSE], true)) {
            throw new \InvalidArgumentException("Invalid stock column: {$column}");
        }

        $barang = DB::table('barangs')->where('id', $productId)->lockForUpdate()->first();

        if (!$barang) {
            throw new \RuntimeException('product_not_found');
        }

        $before = (float) $barang->{$column};
        $after = $before + $delta;

        if (!$allowNegative && $after < -self::EPSILON) {
            throw new \RuntimeException('insufficient_stock');
        }

        DB::table('barangs')->where('id', $productId)->update([
            $column => $after,
            'updated_at' => \Carbon\Carbon::now(),
        ]);

        if ($movement !== null) {
            DB::table('stock_movements')->insert([
                'product_id' => $productId,
                'store_id' => $movement['store_id'] ?? null,
                'movement_date' => \Carbon\Carbon::now(),
                'type' => $movement['type'],
                'quantity' => abs($delta),
                'before_stock' => $before,
                'after_stock' => $after,
                'reference_type' => $movement['reference_type'],
                'reference_id' => $movement['reference_id'] ?? null,
                'note' => $movement['note'] ?? null,
                'created_by' => Auth::id(),
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
            ]);
        }

        return [
            'before' => $before,
            'after' => $after,
            'product' => $barang,
        ];
    }

    /**
     * Idempotency guard against duplicate submissions of the same action
     * (double-click, or two requests racing in from the same user at once).
     * Call once at the very top of a controller method, before
     * DB::beginTransaction(), with a key that identifies "this exact
     * action" (e.g. user + product + qty for a create, or the target row
     * id for an edit/delete). If it returns false, the caller should
     * immediately return its generic failure response without touching the
     * database — an identical request is already being processed right now.
     *
     * Deliberately implemented with MySQL's GET_LOCK() rather than
     * Laravel's Cache facade: Cache::add() is only truly atomic on
     * Redis/Memcached/DynamoDB. On the `file` or `database` cache drivers
     * (this app runs CACHE_DRIVER=file) it silently degrades to a
     * non-atomic get-then-put in Illuminate\Cache\Repository::add() —
     * two genuinely concurrent requests can both pass the check. GET_LOCK()
     * is atomic at the database engine level regardless of cache config.
     * The lock is non-blocking by default (fails immediately if another
     * request already holds it) and is auto-released when this request's
     * DB connection closes, so it guards against requests that are
     * genuinely concurrent — not a slower resubmit seconds after the first
     * one already finished and returned.
     */
    public static function acquireRequestLock(string $key, int $waitSeconds = 0): bool
    {
        $lockName = 'stock-lock:' . md5($key);
        $result = DB::selectOne('SELECT GET_LOCK(?, ?) AS acquired', [$lockName, $waitSeconds]);

        return $result && (int) $result->acquired === 1;
    }
}
