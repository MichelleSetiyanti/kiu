<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MuatanDetil extends Model
{
    protected $table = 'muatan_detil';
    protected $fillable = [
        'vendor_id',
        'muatan_id',
        'harga',
        'addAct',
        'editAct',
        'deleteAct'
    ];

    public function muatan(){
        return $this->belongsTo('App\Muatan');
    }

    public function vendor(){
        return $this->belongsTo('App\Vendor');
    }
}
