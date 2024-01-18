<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInventoriesDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inventories_detail', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('id_inventories');
            $table->string('no_ref');
            $table->bigInteger('id_detail')->default(0)->nullable();
            $table->string('status');
            $table->integer('jumlah');
            $table->integer('sisa')->default(0)->nullable();
            $table->double('harga');
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
        Schema::dropIfExists('inventories_detail');
    }
}
