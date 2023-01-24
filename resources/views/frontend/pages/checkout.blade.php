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
  <div class="form-container">
    <form class="form" method="POST" action="{{route('cart.order')}}">
      @csrf
      <div class="fl-bl">
        <div class="form-group">
          <label for="fname">First Name<span>*</span></label>
          <input type="text" id="fname" name="fname" placeholder="First Name" value="{{old('first_name')}}" required>
        </div>

        <div class="form-group">
          <label for="lname">Last Name<span>*</span></label>
          <input type="text" id="lname" name="lname" placeholder="Last Name" required value="{{old('lat_name')}}">
        </div>
      </div>

      <div class="form-group">
        <label for="email">Email Address<span>*</span></label>
        <input type="email" name="email" id="email" placeholder="Email Address" required value="{{old('email')}}">
      </div>

      <div class="form-group">
        <label for="address">Address<span>*</span></label>
        <input type="text" name="address" id="address" placeholder="Address" required value="{{old('address1')}}">
      </div>

      <div class="fl-bl">
        <div class="form-group">
          <label for=post-code>Postal Code</label>
          <input type="text" name="post_code" id="post-code" placeholder="Postal Code" value="{{old('post_code')}}">
        </div>

        <div class="form-group">
          <label for="country">Country<span>*</span></label>
          <input list="countries" placeholder="Country" name="country" id="country" class="countries-list">
          @php
          $countries = DB::table('countries')->where('status', 'active')->get();
          @endphp
          <datalist id="countries">
            @foreach($countries as $country)
            <option id="{{$country->id}}" value="{{$country->name}}">{{$country->name}}</option>
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
        <label>Phone Number <span>*</span></label>
        <input type="number" name="phone" placeholder="Phone Number" required value="{{old('phone')}}">
      </div>
    </form>
  </div>

  <div class="order-summary">
    @php
    $subtotal = Helper::CartAmount();
    $tax = Helper::totalCartTax();
    $total_amount = Helper::totalCartAmount();
    $city=DB::table('citys')->where('status','active')->limit(1)->get();
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
    <a href="{{route('checkout')}}" class="btn btn-checkout">Place Order</a>
  </div>
</section>
@endsection

@push('scripts')
<script src="{{asset('frontend/js/checkout.js')}}"></script>
@endpush