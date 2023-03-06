<?php

namespace App\Models;
use App\User;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class Coupon extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'coupons';

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['code', 'type', 'value', 'effect'];

  /**
   * Get the products for the coupon.
  */
  public function products()
  {
    return $this->hasMany(Product::class, 'coupon_id');
  }
  
  /**
   * Get the categories for the coupon.
  */
  public function categories()
  {
    return $this->hasMany(Category::class, 'coupon_id');
  }

  /**
   * Get the subcategories for the coupon.
  */
  public function subcat()
  {
    return $this->hasMany(SubCategory::class, 'coupon_id');
  }
  
  /**
   * Get the orders for the coupon.
  */
  public function orders()
  {
    return $this->hasMany(Order::class, 'coupon_id');
  }
  
  /**
   * Get the users for the coupon.
  */
  public function users()
  {
    return $this->hasMany(User::class, 'coupon_id');
  }


}
