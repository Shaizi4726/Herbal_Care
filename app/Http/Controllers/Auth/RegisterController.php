<?php

namespace App\Http\Controllers\Auth;

use App\User;
use Redirect;
use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Session;
use Auth;

class RegisterController extends Controller
{
  /*
  |--------------------------------------------------------------------------
  | Register Controller
  |--------------------------------------------------------------------------
  |
  | This controller handles the registration of new users as well as their
  | validation and creation. By default this controller uses a trait to
  | provide this functionality without requiring any additional code.
  |
  */

  use RegistersUsers;

  /**
   * Where to redirect users after registration.
   *
   * @var string
   */
  protected $redirectTo = 'email/verify';

  /**
   * Create a new controller instance.
   *
   * @return void
  */
  public function __construct()
  {
    $this->middleware('guest');
  }

  /**
   * Validate user register request.
   * create user in database.
   * request email verification.
   *
   * @param  \Illuminate\Http\Request $request
  */

  public function registerSubmit(Request $request){
    $this->validate($request,[
      'cust_type' => 'required|string',
    ]);
    
    if($request['cust_type'] == 'individual') {
      $this->validate($request, [
        'fname' => 'required|alpha|min:2',
        'lname' => 'required|alpha|min:2'
      ]);
    } else {
      $this->validate($request, [
        'cname' => 'required|alpha_dashed',
        'trn_number' => 'required|numeric'
      ]);
    }
    
    $this->validate($request, [
      'email' => 'required|email:strict,dns|unique:users',
      'password' => 'required|confirmed|min:8|regex:/^.*(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^<>\{\}";:.,~!?@#$%^=&*\[\]\(\)¿§«»ω⊙¤°℃℉€¥£¢¡®©0-9_+]).*$/'
    ]);
    
    $user = User::create([
      'fname' => $request->fname,
      'lname' => $request->lname,
      'cname' => $request->cname,
      'trn_number' => $request->trn_number,
      'email' => $request->email,
      'password' => Hash::make($request->password),
      'status' => 'active'
    ]); 
    
    if($user){
      Session::put('user', $request->email);
      Auth::attempt(['email' => $request->email, 'password' => $request->password, 'status'=>'active']);
      event(new Registered($user));
      request()->session()->flash('success','Successfully registered. Verify your Email to Sign In');
      return redirect()->route('verification.notice');
    }

    else{
      request()->session()->flash('error','Please try again!');
      return back();
    }
  }
}