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
      $table->id();
      $table->string('order_number')->unique();
      $table->unsignedBigInteger('user_id')->nullable();
      $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL');
      $table->string('fname');
      $table->string('lname');
      $table->string('cname');
      $table->unsignedBigInteger('trn_number');
      $table->string('email');
      $table->string('phone');
      $table->text('address');
      $table->unsignedBigInteger('city_id')->nullable();
      $table->foreign('city_id')->references('id')->on('cities')->onDelete('SET NULL');
      $table->unsignedBigInteger('state_id')->nullable();
      $table->foreign('state_id')->references('id')->on('states')->onDelete('SET NULL');
      $table->unsignedBigInteger('country_id')->nullable();
      $table->foreign('country_id')->references('id')->on('countries')->onDelete('SET NULL');
      $table->string('post_code')->nullable();
      $table->enum('status', ['new', 'process', 'delivered', 'cancel'])->default('new');
      $table->enum('payment_method', ['cod', 'op'])->default('cod');
      $table->enum('payment_status',['paid', 'unpaid'])->default('unpaid');
      $table->float('sub_total', $scale = 2);
      $table->float('tax_amount', $scale = 2);
      $table->float('total_amount', $scale = 2);
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
    Schema::dropIfExists('orders');
  }
};
