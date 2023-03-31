<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Mail;

class MailController extends Controller
{
  public function send_mail($email, $pdf)
  {
    $data["email"] = $email;
    $data["title"] = env('APP_NAME', 'HerbalCare');
    $data["body"] = "Your order has been successfully placed. Thankyou for your order!";

    Mail::send('frontend.order.mail', $data, function($message)use($data, $pdf) {
      $message->to($data["email"])->subject($data["title"]);

      $message->attachData($pdf, 'order_details.pdf');         
    });

    Mail::send('frontend.order.mail', $data, function($message)use($data, $pdf) {
      $message->to("admin@herbalcare.ae")->subject($data["title"]);

      $message->attachData($pdf, 'order_details.pdf');         
    });
  }
}
