<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;



class Order extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'orders';

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['order_no', 'user_id', 'fname', 'lname', 'cname', 'trn_no', 'email', 'phone', 'address', 'city_id', 'post_code', 'payment_method', 'payment_status', 'subtotal', 'tax_amount', 'shipping', 'total_amount', 'coupon_id', 'status'];
  
  /**
   * Get the payment associated with the order.
   */
  public function payment()
  {
    return $this->hasOne(Payment::class, 'order_id');
  }

  /**
   * Get the order items for the order.
   */
  public function order_items()
  {
    return $this->hasMany(OrderItem::class, 'order_id');
  }

  /**
   * Get the user that owns the order.
   */
  public function user()
  {
    return $this->belongsTo(User::class, 'user_id');
  }
  
  /**
   * Get the city that owns the order.
   */
  public function city()
  {
    return $this->belongsTo(City::class, 'city_id');
  }

  /**
   * Get the coupon that owns the order.
   */
  public function coupon()
  {
    return $this->belongsTo(Coupon::class, 'coupon_id');
  }

  /**
   * The model's default values for attributes.
   *
   * @var array
   */
  protected $attributes = [
    'status' => 'new',
    'payment_method' => 'cod',
    'payment_status' => 'unpaid'
  ];
}

