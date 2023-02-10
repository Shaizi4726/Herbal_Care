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
    Schema::create('cities', function (Blueprint $table) {
      $table->id();
      $table->string('name', 100)->unique();
      $table->integer('city_code')->unique();
      $table->unsignedBigInteger('state_id');
      $table->foreign('state_id')->references('id')->on('states')->onDelete('CASCADE');
      $table->unsignedBigInteger('country_id');
      $table->foreign('country_id')->references('id')->on('countries')->onDelete('CASCADE');
      $table->integer('shipping')->nullable();
      $table->enum('status', ['active', 'inactive'])->default('inactive');
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
    Schema::dropIfExists('cities');
  }
};
