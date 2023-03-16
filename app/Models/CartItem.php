<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'cart_items';

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['user_id', 'product_id', 'attr_id', 'form', 'size', 'price', 'quantity', 'subtotal', 'tax', 'discount', 'total', 'coupon_id'];

  /**
   * Get the user that owns the cart item.
   */
  public function user()
  {
    return $this->belongsTo(User::class, 'user_id');
  }

  /**
   * Get the product that owns the cart item.
   */
  public function product()
  {
    return $this->belongsTo(Product::class, 'product_id');
  }

  /**
   * Get the attribute that owns the cart item.
   */
  public function attr()
  {
    return $this->belongsTo(ProductAttribute::class, 'attr_id');
  }

  /**
   * Get the coupon that owns the cart item.
   */
  public function coupon()
  {
    return $this->belongsTo(Coupon::class, 'coupon_id');
  }
}
