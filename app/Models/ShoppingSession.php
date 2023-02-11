<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShoppingSession extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'shopping_sessions';

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['session', 'user_id'];

  /**
   * Get the cart items for the session.
   */
  public function cart_items()
  {
    return $this->hasMany(CartItem::class, 'session_id');
  }

  /**
   * Get the orders for the session.
   */
  public function orders()
  {
    return $this->hasMany(Order::class, 'session_id');
  }

  /**
   * Get the wishlists for the session.
   */
  public function wishlists()
  {
    return $this->hasMany(Wishlist::class, 'session_id');
  }

  /**
   * Get the user that owns the shopping session.
   */
  public function user()
  {
    return $this->belongsTo(User::class, 'user_id');
  }
}
