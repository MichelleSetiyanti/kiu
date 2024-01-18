<?php

use Illuminate\Database\Seeder;
use App\TransaksiTimbangan;
use App\MuatanDetil;

class FixTimbanganPrice extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $transaksiTimbangan = TransaksiTimbangan::where('status', 'lolos')->whereOr('status', 'selesai')->get();
        foreach($transaksiTimbangan as $tt){
            $muatanDetil = MuatanDetil::where('vendor_id', $tt->vendor_id)
            ->where('muatan_id', $tt->muatan_id)
            ->first();
            $trans = TransaksiTimbangan::find($tt->id);
            $trans->harga_satuan = $muatanDetil->harga;
            $trans->subtotal =  $muatanDetil->harga * $tt->berat_bersih;
            $trans->grandtotal =  $trans->subtotal;
            $trans->save();
        }
    }
}
