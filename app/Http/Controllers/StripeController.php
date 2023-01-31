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
	    $data['invoice_id'] ='HRD-'.strtoupper(uniqid());
        $data['invoice_description'] = "Order #{$data['invoice_id']} Invoice";
        $data['return_url'] = route('payment.success');
        $data['cancel_url'] = route('payment.cancel');
        
        // $total = 0;
        // foreach($data['items'] as $item) {
        //     $total += $item['price']*$item['qty'];
        // }

        // $data['total'] = $total;
        // if(session('coupon')){
        //     $data['city_discount'] = session('coupon')['value'];
        // }
        Cart::where('user_id', auth()->user()->id)->where('order_id', null)->update(['order_id' => session()->get('id')]);

        // return session()->get('id');
        // $provider = new ExpressCheckout;
  
        // $response = $provider->setExpressCheckout($data);
		Session::flash("success","Payment successfully!");

    //    echo "<pre>"; print_r($response); die();
        return redirect()->back();
    }
	
    	
    	
    
}
