<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Form extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'forms';

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['name', 'slug', 'status'];

  /**
   * The products that belong to the brand.
  */
  public function products()
  {
    return $this->belongsToMany(Product::class, 'product_forms', 'form_id', 'product_id');
  }

  /**
   * Get the product attributes for the form.
   */
  public function prod_attrs()
  {
    return $this->hasMany(ProductAttribute::class, 'form_id');
  }

  /**
   * The model's default values for attributes.
   *
   * @var array
   */
  protected $attributes = [
    'status' => 'active'
  ];
}  
