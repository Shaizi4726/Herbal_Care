@extends('frontend.layouts.master')
@section('title','HERB || Order Track Page')

@push('styles')
<link rel="stylesheet" href="{{asset('frontend/css/order-track.css')}}">
@endpush

@section('main-content')
<section>
  <div class="tracking-order-section">
  <div class="img-container">
    <img src="{{asset('images/trackorder.png')}}" class="tracking-order-main-img" id="tracking-order-main-img">
  </div>
  <div class="track-order-container">
    <h2>Track Order</h2>
    <p>Enter your order id in the input box below and track your order. Order id would be given at the invoice slip.</p>
    <div class="form-group">
      <label for="order-id-input">Order Id:</label>
      <input type="text" class="order-id-input" id="order-id-input"  name="order_no" placeholder="Enter your order id">
    </div>
    <div class="form-group submit-track">
      <button id="order-track" class="btn btn-submit">Track Order</button>
    </div>
  </form>
</div>
</div>
<div class="img-container">
  <img src="{{asset('images/deliveryprocess.png')}}" class="tracking-order-main-img" id="tracking-order-main-img">
</div>
</section>
@endsection

@push('scripts')
  <script src="{{asset('frontend/js/order-track.js')}}"></script>
@endpush