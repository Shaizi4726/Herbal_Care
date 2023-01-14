@extends('frontend.layouts.master')
@section('title','HerbalCare || Cart')

@push('styles')
  <link rel="stylesheet" href="{{asset('frontend/css/cart.css')}}">
@endpush

@section('main-content')
	<!-- Shopping Cart -->
  <h1 class="title page-title" id="cart-title">Shopping Cart</h1>

  <section class="cart-section">
    <div class="cart-page-items">
      @if(count(Helper::getAllProductFromCart()) != 0)
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
                <input type="button" value="-" class="qty-minus minus qty-control" field="quantity">
						    <input type="number" name="item_quantity" value="{{$cart->quantity}}" min="1" oninput="this.value = Math.abs(this.value)" onchange="updateCartData(<?= $cart->id ?>, this.value)" class="qty item-quantity">
						    <input type="button" value="+" class="qty-plus plus qty-control" field="quantity">
              </div>
            </div>
            <div class="cart-page-item-data">
              <h4>Total: </h4> 
              <p id="{{$cart->id}}-total">AED {{number_format($cart->t_amount, 2)}}</p>

              <button class="remove-btn btn"><a href="{{route('cart-delete', $cart->id)}}"> Remove </a></button>
            </div>
          </div>
        @endforeach

      @else
        <p>Sorry! Your cart is empty. Choose products <a href="{{route('home')}}"> here </a>!</p>
      @endif
    </div>

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
      <a href="{{route('checkout')}}" class="btn btn-checkout">Checkout</a>
    </div>
  </section>
@endsection

@push('scripts') 
  <script src="{{asset('frontend/js/cart.js')}}"></script>
@endpush
