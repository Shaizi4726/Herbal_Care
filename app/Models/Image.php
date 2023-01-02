<?php

namespace App\Models;
use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    // use HasFactory;
    protected $fillable=[
        'image','plu',
        'product_id',
    ];

    public function product(){
        return $this->belongsTo(Product::class,'id','product_id');
     }
}
