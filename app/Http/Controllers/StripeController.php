<?php

namespace App\Http\Controllers;
use App\Models\Cart;
use App\Models\Product;
use App\Models\Order;
use DB;
use Helper;
use Stripe;
use Session;

use Illuminate\Http\Request;

class StripeController extends Controller
{
	
    public function stripePyament(Request $req)
    {
		$cart = Cart::where('user_id',auth()->user()->id)->where('order_id',null)->get()->toArray();
        $data = [];
	//	$name=Product::where('id',$item['product_id'])->pluck('title');
    //    dd($name);
    //	print_r($req->all()); die();
		Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
		$amount=0;
	
    	$data['items'] = Stripe\Charge::create([
    			"amount"=>$amount*100,
    			"currency"=>"AED",
    			"source"=>$req->stripeToken,
    			"description"=>"Test payment check"
    	]) ;
	//	dd($token = $req->stripeToken);
        echo "<pre>"; print_r($data); die();
	
    	Session::flash("success","Payment successfully!");

    	return back();
    }
}
