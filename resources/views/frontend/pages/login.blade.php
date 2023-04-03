<!DOCTYPE html>
  <html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="height=device-height, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

    <title>HerbalCare || Login</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="{{asset('images/favicon.png')}}">

    <!-- HerbalCare StyleSheet -->
    <link href="{{asset('frontend/css/signin-up.css')}}" rel="stylesheet">
  </head>
  <body>
    <section class="shop-signing login-section">
      <div class="signing-img-container">
      </div>
      <div class="signing-form-container">
        <a href="{{route('home')}}"><img src="{{asset('images/logo_green.png')}}" alt="Website Logo" class="signing-web-logo"></a>
        <h1 class="signing-web-title"><a href="{{route('home')}}">HerbalCare</a></h1>
        <h2>Sign In</h2>
        
        @include('frontend.layouts.flash-message')

        <!-- Form -->
        <form class="form" method="post" action="{{route('login.submit')}}" novalidate>
          @csrf
          <div class="form-group">
              <label for="email">Email:<span>*</span></label>
              <input type="email" name="email" id="email" placeholder="Enter Email" value="{{old('email')}}">
              @if ($errors->get('email'))
                <div class="error">
                  @error('email')
                    {{$message}}
                  @enderror
                </div>
              @endif
          </div>
        
          <div class="form-group">
            <label for="password">Password:<span>*</span></label>
            <input type="password" name="password" id="password" placeholder="Enter Password" value="{{old('password')}}">
          </div>

          @if ($errors->get('password'))
            <div class="error">
              @error('password')
                {{$message}}
              @enderror
            </div>
          @endif

          <div class="checkbox type-selection">
            <input type="checkbox" name="remember" id="checkbox-login">
            <label class="checkbox-login" for="checkbox-login">Remember me</label>
          </div>
      
          <div class="form-group submit-btn">
            <button class="btn signing-btn" type="submit">Login</button>
            <p>Don't have an account? <a href="{{route('register.form')}}" class="btn">Register</a></p>
          </div>
          @if (Route::has('password.reset'))
          <p><a class="forgot-pass" href="{{ route('password.reset') }}">
            Forgot password?
          </a></p>
          @endif        
          <p>Goto <a href="{{route('home')}}" class="btn">Homepage</a></p>
        </form>    
      </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script>$(window).on("load",function(){$(".signing-img-container").css("height",$(".shop-signing").outerHeight())});</script>
  </body>
</html>