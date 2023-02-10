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
    Schema::create('product_attributes', function (Blueprint $table) {
      $table->bigIncrements('id');
      $table->unsignedBigInteger('product_id');
      $table->foreign('product_id')->references('id')->on('products')->onDelete('CASCADE');
      $table->unsignedBigInteger('form_id');
      $table->foreign('form_id')->references('id')->on('forms')->onDelete('CASCADE');
      $table->string('sku')->unique();
      $table->string('size');
      $table->float('price', $scale = 2);
      $table->float('discount', $scale = 2);
      $table->unsignedBigInteger('stock');
      $table->enum('status', ['active', 'inactive'])->default('active');
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
    Schema::dropIfExists('product_attributes');
  }
};
