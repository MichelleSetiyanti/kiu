<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRPayrollsatpamdetilTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_payrollsatpamdetil', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('r_payrollSatpamId');
            $table->integer('karyawanId');
            $table->double('gaji');
            $table->double('lembur');
            $table->double('dpGaji');
            $table->double('sisaGaji');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_payrollsatpamdetil');
    }
}
