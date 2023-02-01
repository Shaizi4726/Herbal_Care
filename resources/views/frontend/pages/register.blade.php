<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HerbalCare || Register</title>

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="{{asset('images/favicon.png')}}">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;0,900;1,400;1,700&family=Vollkorn:wght@700;900&display=swap"
    rel="stylesheet">

  <!-- StyleSheet -->
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

  <!-- HerbalCare StyleSheet -->
  <link href="{{asset('frontend/css/signin-up.css')}}" rel="stylesheet">
</head>

<body>
  <section class="shop-signing register">
    <div class="signing-img-container">
      <img src="{{asset('images/login-herbal.jpg')}}" alt="Login Image" id="login-img" class="signing-img logging-img">
    </div>
    <div class="signing-form-container">
      <a href="{{route('home')}}"><img src="{{asset('images/logo_green.png')}}" alt="Website Logo"
          class="signing-web-logo"></a>
      <h1 class="signing-web-title"><a href="{{route('home')}}">HerbalCare</a></h1>
      <h2>Sign Up</h2>

      <!-- Form -->
      <form class="form" method="post" action="{{route('register.submit')}}" novalidate>
        @csrf

        <fieldset class="type-selection">
          <legend>User</legend>
          <div class="form-group">
            <input type="radio" name="cust_type" id="individual" value="individual" checked>
            <label for="individual">Individual</label>
          </div>

          <div class="form-group">
            <input type="radio" name="cust_type" id="company" value="company">
            <label for="company">Company</label>
          </div>
          @if ($errors->get('cust_type'))
            <div class="error">
              @error('cust_type')
                {{$message}}
              @enderror
            </div>
          @endif
        </fieldset>

        <fieldset class="details">
          <legend>Details</legend>
          <div class="fl-bl">
            <div class="form-group" id="first-name">
              <label for="fname">First Name<span>*</span></label>
              <input type="text" id="fname" name="fname" placeholder="First Name" value="{{ old('fname') }}">
            </div>
            
            <div class="form-group" id="last-name">
              <label for="lname">Last Name<span>*</span></label>
              <input type="text" id="lname" name="lname" placeholder="Last Name" value="{{ old('lname') }}">
            </div>
            
            <div class="form-group collapse" id="company-name">
              <label for="cname">Company Name<span>*</span></label>
              <input type="text" id="cname" name="cname" placeholder="Company Name" value="{{ old('cname') }}">
            </div>

            <div class="form-group collapse" id="trn">
              <label for="trn-number">TRN<span>*</span></label>
              <input type="number" id="trn-number" name="trn_number" placeholder="TRN Number" value="{{ old('trn_number') }}">
            </div>
          </div>

          @if ($errors->get('fname'))
            <div class="error">
              @error('fname')
                {{$message}}
              @enderror
            </div>

          @elseif ($errors->get('lname'))
            <div class="error">
              @error('lname')
                {{$message}}
              @enderror
            </div>

          @elseif ($errors->get('cname'))
            <div class="error">
              @error('cname')
                {{$message}}
              @enderror
            </div>

          @elseif ($errors->get('trn_number'))
            <div class="error">
              @error('trn_number')
                {{$message}}
              @enderror
            </div>
          @endif

          <div class="form-group">
            <label for="email">Email:<sup>*</sup></label>
            <input type="email" name="email" id="email" placeholder="Enter Email" value="{{ old('email') }}">
            @if ($errors->get('email'))
              <div class="error">
                @error('email')
                  {{$message}}
                @enderror
              </div>
            @endif
          </div>

          <div class="fl-bl">
            <div class="form-group">
              <label for="password">Password:<sup>*</sup></label>
              <input type="password" name="password" id="password" placeholder="Enter Password">
            </div>

            <div class="form-group">
              <label for="password_confirmation">Confirm Password:<sup>*</sup></label>
              <input type="password" name="password_confirmation" id="password_confirmation" placeholder="Confirm Password">
            </div>

            @if ($errors->get('password'))
              <div class="error">
                @error('password')
                  {!! $message !!}
                @enderror
              </div>
            @endif
          </div>
        </fieldset>

        <div class="form-group submit-btn">
          <button type="submit" class="btn signing-btn">Register</button>
        </div>
        <p>Already Registered? <a href="{{route('login.form')}}" class="btn">Log In</a></p>
      </form>
      <!--/ End Form -->
    </div>
  </section>

  <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
  <script src="{{asset('frontend/js/register.js')}}"></script>
</body>

</html>