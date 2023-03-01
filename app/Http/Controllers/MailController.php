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
    $data["title"] = env('APP_NAME');
    $data["body"] = "This is test mail with pdf attachment";

    Mail::send('frontend.order.mail', $data, function($message)use($data, $pdf) {
      $message->to($data["email"])->subject($data["title"]);

      $message->attachData($pdf, 'order_details.pdf');         
    });

    echo "Order placed successfully.";
  }
}
