<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePembelianInventoriesDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pembelian_inventories_detail', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('id_pembelian');
            $table->bigInteger('id_inventories');
            $table->integer('jumlah');
            $table->double('harga');
            $table->double('diskon');
            $table->double('pajak');
            $table->double('subtotal');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pembelian_inventories_detail');
    }
}
