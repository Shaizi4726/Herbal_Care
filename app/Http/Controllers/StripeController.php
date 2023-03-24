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
    try {
      $token = $stripe->tokens->create([
        'card' => [
          'number' => $request->account_no,
          'exp_month' => $request->expiry_month,
          'exp_year' => $request->expiry_year,
          'cvc' => $request->cvv_cvc
        ],
      ]);
      
      $payment = $stripe->charges->create ([
        "amount" => $request->total * 100,
        "currency" => "aed",
        "source" => $token,
        "metadata" => ["name" => $request->account_name, "order_id" => $request->order_id],
        "description" => "Online Payment"
      ]);

      $message = "Your payment was successful";

      return [$payment, $message];
    } catch(\Stripe\Exception\CardException $e) {
      $message = "A payment error occurred: {$e->getError()->message}";
    } catch (\Stripe\Exception\RateLimitException $e) {
      $message = "Too many attempts occured.";
    } catch (\Stripe\Exception\InvalidRequestException $e) {
      $message = "An invalid request occurred.";
    } catch (\Stripe\Exception\AuthenticationException $e) {
      $message = "Unable to Authenticate.";
    } catch (\Stripe\Exception\ApiConnectionException $e) {
      $message = "Connection problem.";
    } catch (\Stripe\Exception\ApiErrorException $e) {
      $message = "Sorry for inconvenience. API error occured.";
    } catch (Exception $e) {
      $message = "Another problem occurred, maybe unrelated to Stripe.";
    }
    
    return [null, $message];
  }
}