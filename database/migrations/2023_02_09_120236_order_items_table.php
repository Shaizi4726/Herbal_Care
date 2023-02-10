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
    Schema::create('order_items', function (Blueprint $table) {
      $table->id();
      $table->unsignedBigInteger('order_id');
      $table->foreign('order_id')->references('id')->on('orders')->onDelete('CASCADE');
      $table->unsignedBigInteger('product_id');
      $table->foreign('product_id')->references('id')->on('products')->onDelete('CASCADE');
      $table->string('form')->nullable();
      $table->string('size');
      $table->float('price', $scale = 2);
      $table->integer('quantity');
      $table->float('amount', $scale = 2);
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
    Schema::dropIfExists('order_items');
  }
};
