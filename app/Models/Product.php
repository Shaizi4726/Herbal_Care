<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Cart;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\ProductsAttribute;
use Nicolaslopezj\Searchable\SearchableTrait;
class Product extends Model
{
    
    protected $fillable=['plu','title','scientific','slug','other_name','benafit','description','cat_id','child_cat_id','minprice','brand_id','status','photo','is_featured','promotion'];

    public function cat_info(){
        return $this->hasOne('App\Models\Category','id','cat_id')->orderBy('id','asc');
    }
    public function sub_cat_info(){
        return $this->hasOne('App\Models\Category','id','child_cat_id')->orderBy('id','asc');
    }
    public static function getAllProduct(){
        return Product::with(['cat_info','sub_cat_info'])->orderBy('id','ASC')->paginate(10);
    }
    public function rel_prods(){
        return $this->hasMany('App\Models\Product','cat_id','cat_id')->where('status','active')->orderBy('id','ASC')->limit(8);
    }
    public function getReview(){
        return $this->hasMany('App\Models\ProductReview','product_id','id')->with('user_info')->where('status','active')->orderBy('id','DESC');
    }
    public function attributes(){
        return $this->hasMany(ProductsAttribute::class,'product_id','id');
     }
     public function coupon(){
        return $this->hasMany(Coupon::class,'product_id','id');
     }
     public function productForms(){
        return $this->hasMany(ProductForm::class,'product_id','id');
     }
    public static function getProductBySlug($slug){
        return Product::with(['attributes','cat_info','sub_cat_info','getReview'])->where('slug',$slug)->first();
    }
    public static function countActiveProduct(){
        $data=Product::where('status','active')->count();
        if($data){
            return $data;
        }
        return 0;
    }

    public function carts(){
        return $this->hasMany(Cart::class)->whereNotNull('order_id');
    }

    public function wishlists(){
      return $this->hasMany(Wishlist::class);
    }

    public function brand(){
        return $this->hasOne(Brand::class,'id','brand_id');
    }

    public function images(){
        return $this->hasMany(Image::class,'product_id','id');
     }
    // public function groups(){
    //     return $this->has(Product::class);
    // }
    public function productcategory(){
        return $this->hasMany(ProductCategory::class,'product_id','id');
     }
}
