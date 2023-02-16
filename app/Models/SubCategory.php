<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'sub_categories';

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['name', 'slug', 'parent_id', 'status'];
  
  /**
   * Get the category that owns the subcategory.
   */
  public function category()
  {
    return $this->belongsTo(Category::class, 'parent_id');
  }

  /**
   * Get the coupon that owns the product.
   */
  public function coupon()
  {
    return $this->belongsTo(Coupon::class, 'coupon_id');
  }

  /**
   * The products that belong to the subcategory.
   */ 
  public function products()
  {
    return $this->belongsToMany(Product::class, 'product_categories', 'subcat_id', 'product_id');
  }  

  public static function getChildByParentID($id){
    return SubCategory::where('parent_id',$id)->orderBy('id','ASC')->pluck('name', 'id');
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
