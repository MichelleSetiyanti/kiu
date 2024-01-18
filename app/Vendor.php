<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    protected $table = 'vendor';

    protected $fillable = [
        'kode',
        'nama',
        'addAct',
        'editAct',
        'deleteAct'
    ];

    public function transaksiTimbangan(){
        return $this->hasMany('App\TransaksiTimbangan');
    }
    
    public function muatanDetil(){
        return $this->hasMany('App\MuatanDetil');
    }
}
