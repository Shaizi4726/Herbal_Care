<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class Wishlist extends Model
{
    protected $fillable=['id', 'user_id','product_id','plu'];

    public function product(){
      return $this->belongsTo(Product::class,'product_id');
    }
}
