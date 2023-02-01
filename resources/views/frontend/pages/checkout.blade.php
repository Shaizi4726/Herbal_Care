@extends('frontend.layouts.master')
@section('title','HERB ||Checkout page')

@push('styles')
<link href="{{asset('frontend/css/checkout.css')}}" rel="stylesheet">
@endpush

@section('main-content')
<!-- Start Checkout -->
<h1 class="title page-title">Checkout</h1>
<p>Please register in order to checkout more quickly.</p>

<section class="shop-checkout checkout-sec">
  <!-- Form -->
  @auth
  <div class="form-container">
    <form class="form" id="order-form" method="POST" action="{{route('cart.order')}}" novalidate>
      @csrf
      <fieldset class="type-selection">
        <legend>Customer</legend>
        <div class="form-group">
          <input type="radio" name="cust_type" id="individual" value="individual" checked>
          <label for="individual">Individual</label>
        </div>
        
        <div class="form-group">
          <input type="radio" name="cust_type" id="company" value="company">
          <label for="company">Company</label>
        </div>
      </fieldset>

      <fieldset class="details">
        <legend>Details</legend>
        <div class="fl-bl">
          <div class="form-group" id="first-name">
            <label for="fname">First Name<span>*</span></label>
            <input type="text" id="fname" name="fname" placeholder="First Name" value="{{auth()->user()->name}}">
          </div>

          <div class="form-group collapse" id="company-name">
            <label for="cname">Company Name<span>*</span></label>
            <input type="text" id="cname" name="cname" placeholder="Company Name" value="">
          </div>

          <div class="form-group" id="last-name">
            <label for="lname">Last Name<span>*</span></label>
            <input type="text" id="lname" name="lname" placeholder="Last Name" value="">
          </div>

          <div class="form-group collapse" id="trn">
            <label for="trn-number">TRN<span>*</span></label>
            <input type="number" id="trn-number" name="trn_number" placeholder="TRN Number" value="">
          </div>
        </div>

        @if ($errors->get('fname'))
          <div class="error">
            @error('fname')
              {{$message}}
            @enderror
          </div>
        @endif

        @if ($errors->get('lname'))
          <div class="error">
            @error('lname')
              {{$message}}
            @enderror
          </div>
        @endif

        @if ($errors->get('cname'))
          <div class="error">
            @error('cname')
              {{$message}}
            @enderror
          </div>
        @endif

        @if ($errors->get('trn_number'))
          <div class="error">
            @error('trn_number')
              {{$message}}
            @enderror
          </div>
        @endif

        <script>console.log(<?= $errors ?>)</script>
        <div class="form-group">
          <label for="email">Email Address<span>*</span></label>
          <input type="email" name="email" id="email" placeholder="Email Address" value="{{auth()->user()->email}}">
        </div>

        @if ($errors->get('email'))
          <div class="error">
            @error('email')
              {{$message}}
            @enderror
          </div>
        @endif

        <div class="form-group">
          <label for="address">Address<span>*</span></label>
          <input type="text" name="address" id="address" placeholder="Address" value="">
        </div>

        @if ($errors->get('address'))
          <div class="error">
            @error('address')
              {{$message}}
            @enderror
          </div>
        @endif

        <div class="fl-bl">
          <div class="form-group">
            <label for=post-code>Postal Code</label>
            <input type="text" name="post_code" id="post-code" placeholder="Postal Code" value="">
          </div>

          <div class="form-group">
            <label for="country">Country<span>*</span></label>
            <input list="countries" placeholder="Country" name="country" id="country" class="countries-list">
            @php
            $countries = DB::table('countries')->where('status', 'active')->get();
            @endphp
            <datalist id="countries">
              @foreach($countries as $country)
                <option id="{{$country->id}}" data-iso="{{$country->iso_code}}" data-phone="{{$country->calling_code}}" value="{{$country->name}}">{{$country->name}}</option>
              @endforeach
            </datalist>
          </div>
        </div>
        <div class="fl-bl">
          <div id="state-div" class="form-group">
            <label for="state">State<span>*</span></label>
            <input list="states" placeholder="State" name="state" id="state" class="states-list">
            <datalist id="states"></datalist>
          </div>
          <div id="city-div" class="form-group">
            <label for="city">City<span>*</span></label>
            <input list="cities" placeholder="City" name="city" id="city" class="cities-list">
            <datalist id="cities"></datalist>
          </div>
        </div>
        <div class="form-group">
          <label for="phone">Phone Number <span>*</span></label>
          <div id="phone-div" class="phone-div">
            <img id="flag-img" class="flag-img" src="{{asset('images/flags/AE.png')}}" alt="Country Flag Image" width="64">
            <p id="call-code" class="call-code">+971</p>
            <input type="tel" name="phone" id="phone" placeholder="Phone Number" value="{{old('phone')}}">
          </div>
        </div>
      </fieldset>

      <fieldset class="payment-mthd type-selection">
        <legend>Payment Method</legend>
        <div class="form-group">
          <input type="radio" name="pay_mthd" id="cod-input" value="cod">
          <label for="cod-input">Cash on Delivery</label>
        </div>
        <div class="form-group">
          <input type="radio" name="pay_mthd" id="op-input" value="op">
          <label for="op-input">Online Payment</label>
        </div>
      </fieldset>

      <fieldset class="op-form collapse" id="op-form">
        <legend>Online Payment</legend>
        
        <div class="form-group">
          <label for="account-num">Card Number</label>
          <input type="tel" id="account-num" class="account-num"  name="account_num"  placeholder="Card Number" onkeypress="cardLen(this, event)" oninput="cardNum(this, event)" autocomplete="off">
        </div>
        
        <div class="form-group">
          <label for="account-name">Full Name</label>
          <input type="text" id="account-name" class="account-name" name="account_name" placeholder="Full Name (As per Card)" autocomplete="off">
        </div>

        <div class="fl-bl">
          <div class='form-group expiry'>
            <label for="account-expiry">Expiry Month</label>
            <input type="month" class='account-expiry' id='account-expiry' name="account_expiry" min= "@php echo date('Y-m'); @endphp" placeholder='Expiry Month'>
          </div>
        </div>
        
        <div class="form-group cvc">
          <label for="cvv-cvc">CVV/CVC</label>
          <input type="password" id="cvv-cvc" class="cvv-cvc" name="cvv_cvc" placeholder="CVV/CVC" pattern="[0-9]{3}" onkeypress="if(this.value.length == 3) return false;" autocomplete="off">
        </div>

        <div class="payment-options">
          <img src="{{('backend/img/payment-method.png')}}" alt="payment options">
        </div>
      </fieldset>
      <input type="submit" class="btn btn-checkout btn-plc" value="Place Order">
    </form>
  </div>
  @endauth

  <div class="order-summary">
    <div class="sums-summary">
      @php
      $subtotal = Helper::CartAmount();
      $tax = Helper::totalCartTax();
      $total_amount = Helper::totalCartAmount();
      @endphp

      <div class="summary-title-container">
        <h2>Order Summary</h2>
      </div>
      <div class="coupon">
        <h4>Have Coupon?</h4>
        <form action="{{route('coupon-store')}}" method="POST">
          @csrf
          <input name="code" placeholder="Enter Coupon Code">
          <button class="btn coupon-btn">Apply</button>
        </form>
      </div>
      <div class="cart-totals">
        <div class="cart-total-value">
          <h4 class="subtotal"> Subtotal: </h4>
          <p id="subtotal-value">AED {{number_format($subtotal, 2)}}</p>
        </div>
        <div class="cart-total-value">
          <h4 class="tax"> VAT(5%): </h4>
          <p id="tax-value">AED {{number_format($tax, 2)}}</p>
        </div>
      </div>
      <div class="cart-total-value grand-total">
        <h4 class="total"> Grand Total: </h4>
        <p id="grand-total-value">AED {{number_format($total_amount, 2)}}</p>
      </div>
      <input type="submit" form="order-form" class="btn btn-checkout" value="Place Order">
    </div>
    <div class="cart">
      @php
      $cart_products = Helper::getAllProductFromCart();
      @endphp

      @if($cart_products)
      @foreach($cart_products as $key=>$cart)
      <div class="cart-item">
        <img src="{{$cart->product['photo']}}" alt="product photo" class="cart-product-img zoom-img">
        <div class="cart-item-meta">
          <h2 class="cart-page-item-name">{{$cart->product['title']}}</h2>
          <div class="cart-item-stats">
            <div class="cart-page-item-price">
              <h4>Price: </h4>
              <p>AED {{number_format($cart->price, 2)}}</p>
            </div>
            <div class="cart-page-item-form">
              <h4>Form: </h4>
              <p>{{$cart->form}}</p>
            </div>
            <div class="cart-page-item-size">
              <h4>Size: </h4>
              <p>{{$cart->size}}</p>
            </div>
            <div class="cart-page-item-quantity">
              <h4>Quantity: </h4>
              <p>{{$cart->quantity}}</p>
            </div>
            <div class="cart-page-item-total">
              <h4>Total: </h4>
              <p id="{{$cart->id}}-total">AED {{number_format($cart->t_amount, 2)}}</p>
            </div>
          </div>
        </div>
      </div>
      @endforeach

      @else
      <p>Sorry! Your cart is empty. Choose products <a href="{{route('home')}}"> here </a>!</p>
      @endif
    </div>
  </div>
</section>
@endsection

@push('scripts')
<script src="{{asset('frontend/js/checkout.js')}}"></script>
@endpush