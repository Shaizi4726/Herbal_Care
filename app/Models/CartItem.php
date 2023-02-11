<?php

namespace App\Models;

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
  protected $fillable = ['session_id', 'user_id', 'product_id', 'form', 'size', 'price', 'quantity', 'amount'];

  /**
   * Get the shopping session that owns the cart item.
   */
  public function shopping_session()
  {
    return $this->belongsTo(ShoppingSession::class, 'session_id');
  }
  
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
}
