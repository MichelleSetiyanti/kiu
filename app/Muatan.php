<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Muatan extends Model
{
    protected $table = 'muatan';

    protected $fillable = [
        'kode',
        'nama',
        'addAct'
    ];
    
    public function transaksiTimbangan(){
        return $this->hasMany('App\TransaksiTimbangan');
    }

    public function muatanDetil(){
        return $this->hasMany('App\MuatanDetil');
    }
}
