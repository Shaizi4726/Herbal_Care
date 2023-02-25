<?php

namespace App\Http\Controllers;
use DB;
use Helper;
use Stripe;
use Session;

use Illuminate\Http\Request;

class StripeController extends Controller
{ 
  public function paymentStripe() {
    return view('paymentstripe');
  }

  public function payment(Request $request) {
    Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

    $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
    $token = $stripe->tokens->create([
      'card' => [
        'number' => $request->account_no,
        'exp_month' => $request->expiry_month,
        'exp_year' => $request->expiry_year,
        'cvc' => $request->cvv_cvc,
      ],
    ]);
    
    $payment = Stripe\Charge::create ([
      "amount" => $request->total * 100,
      "currency" => "aed",
      "source" => $token,
      "description" => "Stripe Payment Test"
    ]);

    return $payment;
  } 
}