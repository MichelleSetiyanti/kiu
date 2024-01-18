<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePengeluaranInventoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pengeluaran_inventories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('id_pengeluaran');
            $table->bigInteger('id_user');
            $table->bigInteger('id_user_approve');
            $table->bigInteger('id_karyawan');
            $table->date('tanggal');
            $table->string('status');
            $table->text('keterangan')->nullable();
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
        Schema::dropIfExists('pengeluaran_inventories');
    }
}
