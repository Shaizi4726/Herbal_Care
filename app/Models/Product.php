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
    
    protected $fillable=['title','scientific','slug','summary','benafit','description','cat_id','child_cat_id','price','brand_id','discount','status','photo','stock','is_featured','condition'];

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
        return $this->hasMany(Wishlist::class)->whereNotNull('cart_id');
    }

    public function brand(){
        return $this->hasOne(Brand::class,'id','brand_id');
    }

    public function images(){
        return $this->hasMany(Image::class);
    }
    // public function groups(){
    //     return $this->has(Product::class);
    // }
    

}
