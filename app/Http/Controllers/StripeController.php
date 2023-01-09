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
	
<<<<<<< HEAD
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
=======
    public function payment(Request $req)
    {
		$cart = Cart::where('user_id',auth()->user()->id)->where('order_id',null)->get()->toArray();
    //    Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        $data = [];
    //    dd($cart);
	//    print_r($req->all()); die();   
		Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
	
    	$data['items'] = Stripe\Charge::create([
    			"amount"=>$req->amount*100,
    			"currency"=>"AED",
    			"source"=>$req->stripeToken,
    			"description"=>$req->last_name,
    	]);
	//	print_r($req->all()); die();   
    //  echo "<pre>"; print_r($data); die();
	    $data['invoice_id'] ='ORD-'.strtoupper(uniqid());
        $data['invoice_description'] = "Order #{$data['invoice_id']} Invoice";
        $data['return_url'] = route('payment.success');
        $data['cancel_url'] = route('payment.cancel');
        
        // $total = 0;
        // foreach($data['items'] as $item) {
        //     $total += $item['price']*$item['qty'];
        // }

        // $data['total'] = $total;
        // if(session('coupon')){
        //     $data['shipping_discount'] = session('coupon')['value'];
        // }
        Cart::where('user_id', auth()->user()->id)->where('order_id', null)->update(['order_id' => session()->get('id')]);

        // return session()->get('id');
        // $provider = new ExpressCheckout;
  
        // $response = $provider->setExpressCheckout($data);
		Session::flash("success","Payment successfully!");

    //    echo "<pre>"; print_r($response); die();
        return redirect()->back();
    }
	
    	
    	
    
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
}
