<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransaksiTimbanganTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaksi_timbangan', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('no_timbang')->unique();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('kendaraan_id')->nullable();
            $table->unsignedBigInteger('vendor_id')->nullable();
            $table->unsignedBigInteger('muatan_id')->nullable();
            $table->foreign('kendaraan_id')->references('id')->on('kendaraan');
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('vendor_id')->references('id')->on('vendor');
            $table->foreign('muatan_id')->references('id')->on('muatan');
            $table->enum('status', ['mulai' ,'proses', 'selesai','lolos'])->default('mulai');
            $table->string('no_kendaraan')->nullable();
            $table->integer('jumlah_batang')->default(0);
            $table->text('keterangan')->nullable();
            $table->double('berat_masuk')->default(0);
            $table->double('berat_keluar')->default(0);
            $table->double('berat_bersih')->default(0);
            $table->double('harga_satuan')->default(0);
            $table->double('harga_potongan')->default(0);
            $table->double('subtotal')->default(0);
            $table->double('grandtotal')->default(0);
            $table->timestamp('waktu_masuk')->nullable();
            $table->timestamp('waktu_keluar')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaksi_timbangan');
    }
}
