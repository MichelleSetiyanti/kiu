<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStockMovementsTable extends Migration
{
    public function up()
    {
        Schema::create('stock_movements', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('product_id');
            $table->unsignedBigInteger('store_id')->nullable();
            $table->timestamp('movement_date')->useCurrent();
            $table->enum('type', ['in', 'out'])->default('out');
            $table->integer('quantity');
            $table->integer('before_stock')->nullable();
            $table->integer('after_stock')->nullable();
            $table->string('reference_type')->nullable();
            $table->unsignedBigInteger('reference_id')->nullable();
            $table->text('note')->nullable();
            $table->unsignedBigInteger('created_by')->nullable();
            $table->timestamps();

            $table->index('product_id');
            $table->index(['reference_type','reference_id']);
            $table->index('movement_date');
        });
    }

    public function down()
    {
        Schema::dropIfExists('stock_movements');
    }
}
