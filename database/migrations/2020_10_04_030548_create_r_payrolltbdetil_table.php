<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRPayrolltbdetilTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_payrolltbdetil', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('r_payrollTbId');
            $table->integer('karyawanId');
            $table->double('gaji');
            $table->double('lembur');
            $table->double('total');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_payrolltbdetil');
    }
}
