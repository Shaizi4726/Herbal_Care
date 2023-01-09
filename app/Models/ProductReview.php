<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class ProductReview extends Model
{
<<<<<<< HEAD
    protected $fillable=['user_id','product_id','rate','review','status'];
=======
    protected $fillable=['user_id','product_id','plu','rate','review','status'];
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800

    public function user_info(){
        return $this->hasOne('App\User','id','user_id');
    }

    public static function getAllReview(){
        return ProductReview::with('user_info')->paginate(10);
    }
    public static function getAllUserReview(){
        return ProductReview::where('user_id',auth()->user()->id)->with('user_info')->paginate(10);
    }
<<<<<<< HEAD
=======
    public static function getPreviousReview($product_id){
        return ProductReview::where(['user_id'=> auth()->user()->id , 'product_id'=>$product_id])->first();
    }
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800

    public function product(){
        return $this->hasOne(Product::class,'id','product_id');
    }

}
