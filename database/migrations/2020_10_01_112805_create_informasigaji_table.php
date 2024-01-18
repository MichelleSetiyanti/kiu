<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreateInformasigajiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('informasigaji', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('bulan');
            $table->integer('tahun');
            $table->integer('hariKerja');
            $table->integer('umr');
            $table->integer('pembagilembur');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('informasigaji');
    }
}
