<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRAbsensiktTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_absensikt', function (Blueprint $table) {
            $table->increments('id');
            $table->string('judul',100);
            $table->integer('hariKerja');
            $table->dateTime('tanggalAwal');
            $table->dateTime('tanggalAkhir');
            $table->string('status',10);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_absensikt');
    }
}
