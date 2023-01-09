<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class Cart extends Model
{
<<<<<<< HEAD
    protected $fillable=['user_id','product_id','order_id','form','quantity','amount','t_amount','tax_amount','price','status'];
=======
    protected $fillable=['user_id','plu','product_id','order_id','product_atrr_id','form','quantity','amount','t_amount','tax_amount','price','status'];
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
    
    // public function product(){
    //     return $this->hasOne('App\Models\Product','id','product_id');
    // }
    // public static function getAllProductFromCart(){
    //     return Cart::with('product')->where('user_id',auth()->user()->id)->get();
    // }
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
<<<<<<< HEAD
    public function ProductsAttribute()
    {
        return $this->belongsTo(Product::class, 'product_atrr_id');
=======
    public function productsAttribute()
    {
        return $this->belongsTo(ProductsAttribute::class, 'product_atrr_id');
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
    }
    public function order(){
        return $this->belongsTo(Order::class,'order_id');
    }
    
}
