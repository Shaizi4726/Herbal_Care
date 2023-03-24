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
      $table->charset = 'utf8mb4';
      $table->collation = 'utf8mb4_unicode_ci';
      
      $table->id();
      $table->unsignedBigInteger('plu')->unique();
      $table->string('name', 100);
      $table->string('slug', 100)->unique();
      $table->string('sci_name', 100)->nullable();
      $table->longText('other_name')->nullable();
      $table->longText('benefits')->nullable();
      $table->longText('description')->nullable();
      $table->longText('precautions')->nullable();
      $table->string('photo')->nullable();
      $table->set('promotion', ['popular', 'new', 'trending'])->nullable();
      $table->enum('status', ['active', 'inactive'])->default('active');
      $table->float('minprice');
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