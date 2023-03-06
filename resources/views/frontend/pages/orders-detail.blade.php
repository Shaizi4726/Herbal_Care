@extends('frontend.layouts.master')
@section('title', 'HERB || Orders Detail Page')

@push('styles')
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
              <th>Sale Invoice</th>
              @if ($completed == 1)
                <th>Tax Invoice</th>
              @endif
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
                <a href="{{route('sale.pdf', ['id' => $ord->id, 'download' => 1])}}"> 
                  <button id="{{$ord->id}}-sale-invoice" class="btn btn-submit sale-invoice" data-order="{{$ord->order_no}}">Download</button>
                </a>
              </td>
              @if ($completed == 1)
                @if($ord->status == 'completed')
                  <td>
                    <a href="{{route('tax.pdf', ['id' => $ord->id, 'download' => 1])}}"> 
                      <button id="{{$ord->id}}-tax-invoice" class="btn btn-submit tax-invoice" data-order="{{$ord->order_no}}">Download</button>
                    </a>
                  </td>
                @else
                  <td></td>
                @endif
              @endif
              <td>
                <button id="{{$ord->id}}-order-detail" class="btn btn-submit order-data" data-order="{{$ord->order_no}}">Order Detail</button>
              </td>
            </tr>
          @endforeach
        </table>
      </div>
    </div>
  @endif

  @if ($order !== 0 && $order !== -1)
    <div class="order-details orders" id="order-details">
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
        <div class="order-items orders-table">
          @php 
            $items = $order->order_items;
            $j = 0;
          @endphp
          @if (count($items) !== 0)
            <div id="reason-div" class="reason-div collapse">
              <h2>Reason</h2>
              <button type="button" class="btn close" id="close-btn"><i class="fa-solid fa-xmark"></i></button>
              <ul class="reason-list">
                <li id="mind-change" class="reason-item">Change of Mind</li>
                <li id="damaged" class="reason-item">Damaged or Defective Product</li>
                <li id="no-need" class="reason-item">No Longer Needed</li>
                <li id="wrong-product" class="reason-item">Shipped Wrong Product</li>
                <li id="other">Other</li>
                <textarea name="reason" id="other-text" class="collapse" cols="30" rows="10"></textarea>
              </ul>
            </div>
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
                    <th><input type="checkbox" name="all" id="all-checkbox" class="btn btn-submit all-checkbox" value="{{$order->id}}"></th>
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
                    <td><input type="checkbox" name="item_checkbox" class="btn btn-submit item-checkbox" value="{{$item->id}}"></td>
                  @endif
                </tr>
              @endforeach
            </table>
          @endif
          <div class="summary-container">
            <div id="order-action" class="action">
              <input type="hidden" id="order" name="order" value="{{$order->id}}">
              @if($cancel == 1)
                <button id="cancel" class="btn btn-submit item-cancel action-btn" disabled>Cancel</button>
              @elseif($return == 1)
                <button id="return" class="btn btn-submit item-return action-btn" disabled>Return</button>
              @endif
            </div>
            <div class="summary">
              <h5>Subtotal: </h5><span class="value">AED {{number_format($order->payment->subtotal, 2)}}</span><br/>
              <h5>VAT Amount: </h5><span class="value">AED {{number_format($order->payment->tax, 2)}}</span><br/>
              <h5>Shipping: </h5><span class="value">AED {{number_format($order->payment->shipping, 2)}}</span><br/>
              <hr/>
              <h4>Grand Total: </h4><span class="value">AED {{number_format($order->payment->total, 2)}}</span><br/>
            </div>
          </div>
        </div>
      </div>
    </div>
  @elseif ($order == -1)
    <div class="fail-container" id="fail">
      <p id="fail-status">Sorry there is no order with this order number. Please recheck your order number.</p>
    </div>
  @endif

  <div class="tracking-order-section order-details-section">
    <div class="img-container">
      <img src="{{asset('images/order-detail.png')}}" class="tracking-order-main-img" id="tracking-order-main-img">
    </div>
    <div class="track-order-container order-details-container">
      <h2>Order Details</h2>
      <p>Enter the order number in the input box below and check details of the order. Order number would be given at the invoice slip.</p>
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