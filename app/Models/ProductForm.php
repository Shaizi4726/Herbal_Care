<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductForm extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'product_forms';

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['product_id', 'form_id'];
}
