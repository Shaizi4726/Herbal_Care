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
    Schema::create('orders', function (Blueprint $table) {
      $table->charset = 'utf8mb4';
      $table->collation = 'utf8mb4_unicode_ci';
      
      $table->id();
      $table->string('order_no')->unique();
      $table->unsignedBigInteger('session_id')->nullable();
      $table->foreign('session_id')->references('id')->on('shopping_sessions')->onDelete('SET NULL');
      $table->unsignedBigInteger('user_id')->nullable();
      $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL');
      $table->string('fname');
      $table->string('lname');
      $table->string('cname');
      $table->unsignedBigInteger('trn_no');
      $table->string('email');
      $table->string('phone');
      $table->longText('address');
      $table->unsignedBigInteger('city_id')->nullable();
      $table->foreign('city_id')->references('id')->on('cities')->onDelete('SET NULL');
      $table->string('post_code')->nullable();
      $table->enum('payment_method', ['cod', 'op'])->default('cod');
      $table->enum('payment_status',['paid', 'unpaid'])->default('unpaid');
      $table->float('subtotal');
      $table->float('tax_amount');
      $table->float('total_amount');
      $table->unsignedBigInteger('coupon_id')->nullable();
      $table->foreign('coupon_id')->references('id')->on('coupons')->onDelete('SET NULL');
      $table->enum('status', ['new', 'process', 'delivered', 'cancel'])->default('new');
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
