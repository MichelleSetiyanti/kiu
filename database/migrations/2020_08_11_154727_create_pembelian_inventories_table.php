<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePembelianInventoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pembelian_inventories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('id_pembelian');
            $table->bigInteger('id_user');
            $table->bigInteger('id_user_approve')->nullable();
            $table->bigInteger('id_supplier');
            $table->string('status');
            $table->date('tanggal');
            $table->string('referensi')->nullable();
            $table->string('metode_pembayaran');
            $table->date('jatuh_tempo')->nullable();
            $table->double('biaya_lainnya')->default(0)->nullable();
            $table->string('desc_biaya_lainnya')->nullable();
            $table->double('subtotal');
            $table->double('diskon');
            $table->double('pajak');
            $table->double('grandtotal');
            $table->timestamps();
            $table->unique(['id_pembelian']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pembelian_inventories');
    }
}
