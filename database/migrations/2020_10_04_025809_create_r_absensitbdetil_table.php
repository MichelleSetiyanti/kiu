<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRAbsensitbdetilTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_absensitbdetil', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('r_absensiSatpamId');
            $table->integer('karyawanId');
            $table->double('hariKerja');
            $table->double('lembur');
            $table->double('lemburLibur');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_absensitbdetil');
    }
}
