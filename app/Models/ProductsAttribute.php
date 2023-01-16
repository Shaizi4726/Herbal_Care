<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Cart;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class ProductsAttribute extends Model
{
    protected $fillable=['product_id','plu','sku','form','size','price','discount','stock','is_featured','status'];
    public function product(){
        return $this->belongsTo(Product::class,'id','product_id');
     }
    //  public function productForm(){
    //     return $this->hasMany(ProductForm::class,'id','form_id');
    //  }
     public function carts(){
        return $this->hasMany(Cart::class)->whereNotNull('order_id');
    }

}
