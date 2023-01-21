@extends('frontend.layouts.master')
@section('title','HERB ||Checkout page')

@section('main-content')
    <!-- Start Checkout -->
    <section class="shop-checkout section-checkout">
      <div class="form-container">
        <form class="form" method="POST" action="{{route('cart.order')}}">
          @csrf
            <h1>Checkout</h1>
              <p>Please register in order to checkout more quickly</p>
              <!-- Form -->
              <div class="form-group">
                  <label for="fname">First Name<span>*</span></label>
                  <input type="text" id="fname" name="fname" placeholder="" value="{{old('first_name')}}" required>
              
                  <label for="lname">Last Name<span>*</span></label>
                  <input type="text" id="lname" name="lname" placeholder="" required value="{{old('lat_name')}}">
              </div>
              <div class="form-group">
                  <label>Email Address<span>*</span></label>
                  <input type="email" name="email" placeholder="" required value="{{old('email')}}">
              </div>
              <div class="form-group">
                  <label>Phone Number <span>*</span></label>
                  <input type="number" name="phone" placeholder="" required value="{{old('phone')}}">
              </div>
              <div class="form-group">
                  <label>Country<sup>*</sup></label>
                  <select name="country" id="country-select-menu" class="country-select-menu">
                    <option value="AE">United Arab Emirates</option>
                  <select>
              </div>
              <div class="form-group">                                            
                  <label>City<sup>*</sup></label>
                  <input type="text" name="city" placeholder="" required value="{{old('vity')}}">
              </div>
              <div class="form-group">
                  <label>Address<sup>*</sup></label>
                  <input type="text" name="address1" placeholder="" required value="{{old('address1')}}">
              </div>
              <div class="form-group">
                  <label>Postal Code</label>
                  <input type="text" name="post_code" placeholder="" value="{{old('post_code')}}">
              </div>
                                    
              <label> Shipping Cost </label>
                @if(count(Helper::shipping())>0 && Helper::cartCount()>0)
                  <select name="shipping" class="nice-select">
                      <option value="">Select your address</option>
                      @foreach(Helper::shipping() as $shipping)
                      <option value="{{$shipping->id}}" class="shippingOption" data-price="{{$shipping->price}}">{{$shipping->type}}: ${{$shipping->price}}</option>
                      @endforeach
                  </select>
                @else 
                    <span>Free</span>
                @endif
@endsection