<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRAbsensiktdetilTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_absensiktdetil', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('r_absensiKTId');
            $table->integer('karyawanId');
            $table->double('kerja');
            $table->double('sakit');
            $table->double('izin');
            $table->double('tanpaKeterangan');
            $table->double('izinPotongGaji');
            $table->double('cutiDibayar');
            $table->double('totalHariKerja');
            $table->double('jamLembur');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_absensiktdetil');
    }
}
