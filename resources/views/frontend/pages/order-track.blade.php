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
    </div>
  </div>
  <div class="tracking-details collapse" id="track-order-details">
    <h1>Tracking Information</h1>
    <div class="success-container collapse" id="success">
      <div class="order-detail">
        <div class="order">
          <h2>ORDER: </h2>
          <h3 id="order-no"></h3>
        </div>
        <div class="status">
          <h4>STATUS: </h4>
          <h4 id="status"></h4>
        </div>
        <p id="status-line"></p>
      </div>
      <div class="tracking-dates">
        <div class="date-container">
          <div class="label">
            <div class="tracking-icon"><i class="bx bxs-shopping-bags" id="order-icon"></i></div>
            <h4>ORDERED</h4>
          </div>
          <p id="order-date" class="date">-- ------- ----</p>
        </div>
        <div class="date-container">
          <div class="label">
            <div class="tracking-icon"><i class="fa-solid fa-clipboard-list" id="process-icon"></i></div>
            <h4>PROCESSED</h4>
          </div>
          <p id="process-date" class="date">-- ------- ----</p>
        </div>
        <div class="date-container">
          <div class="label">
            <div class="tracking-icon"><i class="fa-solid fa-truck-fast" id="ship-icon"></i></div>
            <h4>SHIPPED</h4>
          </div>
          <p id="ship-date" class="date">-- ------- ----</p>
        </div>
        <div class="date-container">
          <div class="label">
            <div class="tracking-icon"><i class="bx bxs-package" id="deliver-icon"></i></div>
            <h4>DELIVERED</h4>
          </div>
          <p id="deliver-date" class="date">-- ------- ----</p>
        </div>
      </div>
      <div class="status-img-container">
        <img src="{{asset('images/ordered_track.png')}}" alt="tracking-status" id="status-img" width="50%">
      </div>
    </div>
    <div class="fail-container collapse" id="fail">
      <p id="fail-status">Sorry there is no order with this order number. Please recheck your order number and track again.</p>
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