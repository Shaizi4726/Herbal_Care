<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\User;
use Validator;
use Illuminate\Http\Request;
use Exception;
use Log;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Contracts\Mail\Factory as MailFactory;
use Illuminate\Contracts\Mail\Mailable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Markdown;
use Illuminate\Support\Facades\Lang;

class AuthController extends Controller
{

 public function requestOtp(Request $request)
 {
        $otp = rand(100000,999999);
        Log::info("otp = ".$otp);
        $user = User::where('email','=', $request->email)->update(['otp' => $otp]);

        if($user){
        // send otp in the email
        $message = (new MailMessage)
        ->subject(Lang::get('Email Verification'))
        ->line(Lang::get('You are receiving this email to verify for your account.'))
        ->line(Lang::get('Your OTP is:', [$otp]))
        ->line(Lang::get('This email verification otp will expire in :count minutes.', ['count' => config('auth.passwords.'.config('auth.defaults.passwords').'.expire')]))
        ->line(Lang::get('If you didn’t create the account, you can safely delete this email.'));

        if ($message instanceof Mailable)
          return $message->send($this->mailer);
    }
       
        else{
            return response(["status" => 401, 'message' => 'Invalid']);
        }
    }


    public function verifyOtp(Request $request){
    
        $user  = User::where([['email','=',$request->email],['otp','=',$request->otp]])->first();
        if($user){
            auth()->login($user, true);
            User::where('email','=',$request->email)->update(['otp' => null]);
            $accessToken = auth()->user()->createToken('authToken')->accessToken;

            return response(["status" => 200, "message" => "Success", 'user' => auth()->user(), 'access_token' => $accessToken]);
        }
        else{
            return response(["status" => 401, 'message' => 'Invalid']);
        }
    }
}