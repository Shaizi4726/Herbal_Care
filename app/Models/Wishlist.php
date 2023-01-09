<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class Wishlist extends Model
{
<<<<<<< HEAD
    protected $fillable=['user_id','product_id','cart_id','price','amount','quantity'];
=======
    protected $fillable=['user_id','product_id','plu','cart_id','price','amount','quantity'];
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800

    public function product(){
        return $this->belongsTo(Product::class,'product_id');
    }
}
