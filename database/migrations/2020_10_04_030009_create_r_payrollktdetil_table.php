<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRPayrollktdetilTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('r_payrollktdetil', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('r_payrollKtId');
            $table->integer('karyawanId');
            $table->double('totalUang');
            $table->double('potonganDP');
            $table->double('potonganBPJS');
            $table->double('potonganBPJSKes');
            $table->double('netTerima');
            $table->double('totalLembur');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r_payrollktdetil');
    }
}
