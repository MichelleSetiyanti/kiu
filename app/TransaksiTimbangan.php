<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransaksiTimbangan extends Model
{
    protected $table = 'transaksi_timbangan';

    public $timestamps = false;
    protected $fillable = [
        'id',
        'no_timbang',
        'user_id',
        'vendor_id',
        'muatan_id',
        'kendaraan_id',
        'status',
        'jumlah_batang',
        'no_kendaraan',
        'foto',
        'keterangan',
        'berat_masuk',
        'berat_keluar',
        'berat_bersih',
        'harga_satuan',
        'harga_potongan',
        'subtotal',
        'grandtotal',
        'waktu_masuk',
        'waktu_keluar',
        'created_at',
        'updated_at',
    ];

    public function kendaraan(){
        return $this->belongsTo('App\Kendaraan');
    }
    public function user(){
        return $this->belongsTo('App\User');
    }

    public function vendor(){
        return $this->belongsTo('App\Vendor');
    }

    public function muatan(){
        return $this->belongsTo('App\Muatan');
    }
}
