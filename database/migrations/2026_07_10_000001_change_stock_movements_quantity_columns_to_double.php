<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class ChangeStockMovementsQuantityColumnsToDouble extends Migration
{
    public function up()
    {
        DB::statement('ALTER TABLE stock_movements MODIFY quantity DOUBLE NOT NULL');
        DB::statement('ALTER TABLE stock_movements MODIFY before_stock DOUBLE NULL');
        DB::statement('ALTER TABLE stock_movements MODIFY after_stock DOUBLE NULL');
    }

    public function down()
    {
        DB::statement('ALTER TABLE stock_movements MODIFY quantity INT NOT NULL');
        DB::statement('ALTER TABLE stock_movements MODIFY before_stock INT NULL');
        DB::statement('ALTER TABLE stock_movements MODIFY after_stock INT NULL');
    }
}
