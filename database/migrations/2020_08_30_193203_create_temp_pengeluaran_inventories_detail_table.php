<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTempPengeluaranInventoriesDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('temp_pengeluaran_inventories_detail', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('id_pengeluaran');
            $table->bigInteger('id_inventories');
            $table->integer('jumlah');
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
        Schema::dropIfExists('temp_pengeluaran_inventories_detail');
    }
}
