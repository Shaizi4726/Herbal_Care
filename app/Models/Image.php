<?php

namespace App\Models;
use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    // use HasFactory;
    protected $fillable=[
<<<<<<< HEAD
        'image',
        'product_id',
    ];

    public function products(){
        return $this->belongsTo(Product::class);
    }
=======
        'image','plu',
        'product_id',
    ];

    public function product(){
        return $this->belongsTo(Product::class,'id','product_id');
     }
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
}
