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
    Schema::create('products', function (Blueprint $table) {
      $table->id();
      $table->unsignedBigInteger('plu')->unique();
      $table->string('title', 100);
      $table->string('slug', 100)->unique();
      $table->string('sci_name', 100)->nullable();
      $table->longText('other_name')->nullable();
      $table->longText('benefits')->nullable();
      $table->longText('description')->nullable();
      $table->longText('precautions')->nullable();
      $table->binary('photo');
      $table->enum('promotion', ['popular', 'new', 'trending'])->default('new');
      $table->enum('status', ['active', 'inactive'])->default('active');
      $table->float('minprice', $scale = 2);
      $table->unsignedBigInteger('coupon_id')->nullable();
      $table->foreign('coupon_id')->references('id')->on('coupons')->onDelete('SET NULL');
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
    Schema::dropIfExists('products');
  }
};