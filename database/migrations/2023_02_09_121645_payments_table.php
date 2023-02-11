<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
  /**
   * Run the migrations.
   *
   * @return void
   */
  public function up()
  {
    Schema::create('payments', function (Blueprint $table) {
      $table->charset = 'utf8mb4';
      $table->collation = 'utf8mb4_unicode_ci';
      
      $table->id();
      $table->unsignedBigInteger('order_id')->nullable();
      $table->foreign('order_id')->references('id')->on('orders')->onDelete('SET NULL');
      $table->enum('payment_method', ['cod', 'op'])->default('cod');
      $table->unsignedBigInteger('account_no')->nullable();
      $table->enum('payment_status',['paid', 'unpaid'])->default('unpaid');
      $table->float('subtotal', $scale = 2);
      $table->float('tax_amount', $scale = 2);
      $table->float('total_amount', $scale = 2);
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
    Schema::dropIfExists('orders');
  }
};
