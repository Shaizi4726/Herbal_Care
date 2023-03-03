@extends('frontend.layouts.master')
@section('title','HERB || Order Track Page')

@push('styles')
  <link rel="stylesheet" href="{{asset('frontend/css/order-track.css')}}">
  <link rel="stylesheet" href="{{asset('frontend/css/orders-detail.css')}}">
@endpush

@section('main-content')
  @php 
    $i = 0;
    @endphp
    @if ($orders !== 0)
    <div class="orders">
      <h1>Orders</h1>
      <div class="orders-table">
        <table>
          <thead>
            <tr>
              <th>S.No</th>
              <th>Order No</th>
              <th>Name</th>
              <th>Amount</th>
              <th>Status</th>
              <th>Details</th>
            </tr>
          </thead>
          
          @foreach ($orders as $ord)
            @php 
              $i++;
            @endphp
            <tr>
              <td>{{$i}}</td>
              <td>{{$ord->order_no}}</td>
              <td>{{$ord->fname}} {{$ord->lname}}</td>
              <td>AED {{$ord->payment->total}}</td>
              <td>{{ucfirst($ord->status)}}</td>
              <td>
                <button id="{{$ord->id}}-order-track" class="btn btn-submit order-data" data-order="{{$ord->order_no}}">Order Detail</button>
              </td>
            </tr>
          @endforeach
        </table>
      </div>
    </div>
  @endif

  @if ($order !== 0)
    <div class="order-details" id="order-details">
      <h1>Order Information</h1>
      <div class="success-container" id="success">
        <div class="order-detail">
          <div class="order">
            <h2>ORDER: </h2>
            <h3 id="order-no">#{{$order->order_no}}</h3>
          </div>
          <div class="status">
            <h4>STATUS: </h4>
            <h4 id="status">{{ucfirst($order->status)}}</h4>
          </div>
          <div class="address">
            <div class="billing">
              @php 
                $city = App\Models\City::with('state', 'country')->where('id', $order->city_id)->get()[0];
              @endphp
              <h3>Billing Address</h3>
              @if($order->cname == null)
                <h5>Name: </h5><span class="value">{{$order->fname}} {{$order->lname}}</span><br/>
              @else
                <h5>Company: </h5><span class="value">{{$order->cname}}</span><br/>
                <h5>TRN No: </h5><span class="value">{{$order->trn_no}}</span><br/>
              @endif
                <h5>Phone: </h5><span class="value">+ {{$city->country->calling_code}} {{$order->phone}}</span><br/>
                <h5>Email: </h5><span class="value">{{$order->email}}</span><br/>
                <h5>Address: </h5><span class="value">{{$order->address}}, {{$city->name}},<br>{{$city->state->name}}, {{$city->country->name}}</span><br/>
            </div>
            <div class="shipping">
              @php 
                $shipping_city = App\Models\City::with('state', 'country')->where('id', $order->shipping->city_id)->get()[0];
              @endphp
              <h3>Shipping Address</h3>
              @if($order->cname == null)
                <h5>Name: </h5><span class="value">{{$order->shipping->fname}} {{$order->shipping->lname}}</span><br/>
              @else
                <h5>Company: </h5><span class="value">{{$order->shipping->cname}}</span><br/>
                <h5>TRN No: </h5><span class="value">{{$order->shipping->trn_no}}</span><br/>
              @endif
                <h5>Phone: </h5><span class="value">+ {{$shipping_city->country->calling_code}} {{$order->shipping->phone}}</span><br/>
                <h5>Address: </h5><span class="value">{{$order->shipping->address}}, {{$shipping_city->name}},<br/> {{$shipping_city->state->name}}, {{$shipping_city->country->name}}</span><br/>
            </div>
          </div>
        </div>
        <div class="order-items">
          @php 
            $items = $order->order_items;
            $j = 0;
          @endphp
          @if (count($items) !== 0)
            <table>
              <thead>
                <tr>
                  <th>S.No</th>
                  <th>Image</th>
                  <th>Product</th>
                  <th>Form</th>
                  <th>Size</th>
                  <th>Price</th>
                  <th>Qty</th>
                  <th>Amount</th>
                  @if($return != 0 || $cancel != 0)
                    <th>Action</th>
                  @endif
                </tr>
              </thead>

              @foreach ($items as $item)
                @php 
                  $j++;
                @endphp
                <tr>
                  <td>{{$j}}</td>
                  <td><img src="{{$item->product->photo}}" alt="Product Image" width="80" height="80"></td>
                  <td>{{$item->product->name}}</td>
                  <td>{{$item->form}}</td>
                  <td>{{$item->size}}</td>
                  <td>{{$item->price}}</td>
                  <td>{{$item->quantity}}</td>
                  <td>{{$item->total}}</td>
                  @if($return != 0 || $cancel != 0)
                    @if($cancel == 1)
                      <td><button id="{{$item->id}}-item-detail" class="btn btn-submit item-cancel" data-item="{{$item->id}}">Cancel</button></td>
                    @elseif($return == 1)
                      <td><button id="{{$item->id}}-item-detail" class="btn btn-submit item-return" data-item="{{$item->id}}">Return</button></td>
                    @endif
                  @endif
                </tr>
              @endforeach
            </table>
          @endif
        </div>
      </div>
    </div>
  @elseif ($order == -1)
    <div class="fail-container" id="fail">
      <p id="fail-status">Sorry there is no order with this order number. Please recheck your order number and track again.</p>
    </div>
  @endif

  <div class="tracking-order-section order-details-section">
    <div class="img-container">
      <img src="{{asset('images/order-detail.png')}}" class="tracking-order-main-img" id="tracking-order-main-img">
    </div>
    <div class="track-order-container order-details-container">
      <h2>Order Details</h2>
      <p>Enter your order id in the input box below and check details for your order. Order id would be given at the invoice slip.</p>
      <div class="form-group">
        <label for="order-id-input">Order No:</label>
        <input type="text" class="order-id-input" id="order-id-input" name="order_no" placeholder="Enter your order id">
      </div>

      <div class="form-group submit-detail">
        <button id="order-data" class="btn btn-submit">Order Detail</button>
      </div>
    </div>
  </div>
@endsection

@push('scripts')
  <script src="{{asset('frontend/js/orders-detail.js')}}"></script>
@endpush