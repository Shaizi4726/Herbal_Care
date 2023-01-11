@extends('frontend.layouts.master')
@section('title','HerbalCare || Cart')

@push('styles')
  <link rel="stylesheet" href="{{asset('frontend/css/cart.css')}}">
@endpush

@section('main-content')
	<!-- Shopping Cart -->
  <h1 class="title page-title" id="cart-title">Shopping Cart</h1>

  @if(Helper::getAllProductFromCart())
		@foreach(Helper::getAllProductFromCart() as $key=>$cart)
      <div class="cart-page-item">
        <img src="{{$cart->product['photo']}}" alt="product photo" class="cart-product-img zoom-img">
        <div class="cart-page-item-meta">
          <h2 class="cart-page-item-name">{{$cart->product['title']}}</h2>
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
            <p><input type="number" name="item_quantity" class="item-quantity" min="1" value="{{$cart->quantity}}"></p>
          </div>
        </div>
        <div class="cart-page-item-data">
          <h4>Total: </h4> 
          <p>AED {{number_format($cart->t_amount, 2)}}</p>

          <button class="remove-btn btn"> Remove </button>
        </div>
      </div>
    @endforeach

  @else
    <p>Sorry! Your cart is empty. Add products to cart</p>
  @endif

  <div class="cart-summary">
    @php
      $subtotal = Helper::CartAmount();
      $tax = Helper::totalCartTax();
      $total_amount = Helper::totalCartAmount();
      $shipping=DB::table('shippings')->where('status','active')->limit(1)->get();
    @endphp

    <div class="summary-title-container">
      <h2>Cart Summary</h2>
    </div>
    <div class="coupon">
      <h4>Have Coupan?</h4>
      <form action="{{route('coupon-store')}}" method="POST">
        @csrf
        <input name="code" placeholder="Enter Coupon Code">
        <button class="btn coupon-btn">Apply</button>
      </form>
    </div>
    <div>
      <h4 class="subtotal"> Subtotal: </h4>
      <p>{{$subtotal}}</p>
    </div>
    <div>
      <h4 class="tax"> VAT(5%): </h4>
      <p>{{$tax}}</p>
    </div>
    <div>
      <h4 class="total"> Total: </h4>
      <p>{{$total_amount}}</p>
    </div>
    <button class="btn btn-submit">Checkout</button>
  </div>
			
									
									{{-- <div class="checkbox">`
										<label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox" onchange="showMe('shipping');"> Shipping</label>
									</div> --}}
								</div>
							</div>
							<div class="col-lg-4 col-md-7 col-12">
								<div class="right">
									<ul>
										<li class="order_subtotal" data-price="{{Helper::totalCartAmount()}}" >Cart Subtotal<span>AED. {{number_format(Helper::totalCartAmount(),2)}}</span></li>

										@if(session()->has('coupon'))
										<li class="coupon_price" data-price="{{Session::get('coupon')['value']}}" >You Save<span>AED. {{number_format(Session::get('coupon')['value'],2)}}</span></li>
										@endif
										@php
											
											if(session()->has('coupon')){
												$total_amount=$total_amount-Session::get('coupon')['value'];
											}
										@endphp
										@if(session()->has('coupon'))
											<li class="last" id="order_total_price" >You Pay<span>AED. {{number_format($total_amount,2)}}</span></li>
										@else
											<li class="last" id="order_total_price" >You Pay<span>AED. {{number_format($total_amount,2)}}</span></li>
										@endif
									</ul>
									<div class="button5">
										<a href="{{route('checkout')}}" class="btn">Checkout</a>
										<a href="{{route('product-grids')}}" class="btn">Continue shopping</a>
									</div>
								</div>
@endsection