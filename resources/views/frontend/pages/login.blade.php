<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HerbalCare || Login</title>

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="{{asset('images/favicon.png')}}">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;0,900;1,400;1,700&family=Vollkorn:wght@700;900&display=swap" rel="stylesheet">

  <!-- StyleSheet -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

    <!-- HerbalCare StyleSheet -->
    <link href="{{asset('frontend/css/signin-up.css')}}" rel="stylesheet">
</head>
<body>
  <section class="shop-signing">
    <div class="signing-img-container">
      <img src="{{asset('images/login-herbal.jpg')}}" alt="Login Image" id="login-img" class="signing-img logging-img">
    </div>
    <div class="signing-form-container">
      <a href="{{route('home')}}"><img src="{{asset('images/logo_green.png')}}" alt="Website Logo" class="signing-web-logo"></a>
      <h1 class="signing-web-title"><a href="{{route('home')}}">The Herb Room</a></h1>
      <h2>Sign In</h2>
      
      <!-- Form -->
      <form class="form" method="post" action="{{route('login.submit')}}">
        @csrf
        <div class="form-group">
            <label for="email">Email:<span>*</span></label>
            <input type="email" name="email" id="email" placeholder="Enter Email" value="{{old('email')}}" required>
            @error('email')
                <span class="invalid-value">{{$message}}</span>
            @enderror
        </div>
            
      
        <div class="form-group">
          <label for="password">Password:<span>*</span></label>
          <input type="password" name="password" id="password" placeholder="Enter Password" value="{{old('password')}}" required>
          @error('password')
            <span class="invalid-value">{{$message}}</span>
          @enderror
        </div>

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
      </form>    
    </div>
  </section>
</body>
</html>