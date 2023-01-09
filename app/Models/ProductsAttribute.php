<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Cart;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class ProductsAttribute extends Model
{
<<<<<<< HEAD
    protected $fillable=['product_id','sku','form','size','price','discount','stock','is_featured','status'];
    public function product(){
        return $this->belongsTo(Product::class,'id','product_id');
     }
     public function productForm(){
        return $this->hasMany(ProductForm::class,'id','form_id');
     }
=======
    protected $fillable=['product_id','plu','sku','form','size','cat_id','child_cat_id','price','discount','stock','is_featured','status'];
    public function product(){
        return $this->belongsTo(Product::class,'id','product_id');
     }
    //  public function productForm(){
    //     return $this->hasMany(ProductForm::class,'id','form_id');
    //  }
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
     public function carts(){
        return $this->hasMany(Cart::class)->whereNotNull('order_id');
    }

}
