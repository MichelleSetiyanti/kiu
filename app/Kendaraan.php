<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kendaraan extends Model
{
    protected $table = 'kendaraan';

    protected $fillable = [
        'jenis',
        'addAct',
        'editAct',
        'deleteAct'
    ];
    
    public function transaksiTimbangan(){
        return $this->hasMany('App\TransaksiTimbangan');
    }
}
