<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductForm extends Model
{
    protected $fillable=['title','slug'];
    public function product(){
        return $this->belongsTo(Product::class,'id','product_id');
     }
     public function attributesForm(){
        return $this->belongsTo(ProductsAttribute::class,'form_id','id');
     }
}
