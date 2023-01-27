<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class Coupon extends Model
{
    protected $fillable=['product_id','user_id','code','expiry_date','type','value','status'];
    
    protected $expiry = ['expiry_date' => 'datetime',];


    public function products(){
        return $this->belongsTo(Product::class,'id','product_id');
     }
     public function users(){
        return $this->belongsTo(User::class,'id','user_id');
     }
     
    public static function findByCode(){
        return self::where('code',$code)->first();
    }
    //public static coupan_check($code)
    public function discount($total){
        if($this->type=="fixed"){
            return $this->value;
        }
        elseif($this->type=="percent"){
            return ($this->value /100)*$total;
        }
        else{
            return 0;
        }
    }
}
