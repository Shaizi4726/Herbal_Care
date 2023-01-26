<!DOCTYPE html>
<html>
<head>
  <title>Order @if($order)- {{$order->order_number}} @endif</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

@if($order)
<style type="text/css">
  .invoice-header {
    background: #f7f7f7;
    padding: 5px 5px 5px 5px;
    border-bottom: 1px solid gray;
  }
  .site-logo {
    margin-top: 10px;
  }
  .invoice-right-top h3 {
    padding-right: 4px;
    margin-top: 4px;
    color: green;
    font-size: 20px!important;
    font-family: serif;
  }
  .invoice-left-top {
    border: 4px solid green;
    padding-left: 5px;
    padding-top: 4px;
  }
  .invoice-left-top p {
    margin: 0;
    line-height: 10px;
    font-size: 11px;
    margin-bottom: 2px;
  }
  thead {
    background: green;
    color: #FFF;
  }
  .authority h5 {
    margin-top: -8px;
    color: green;
  }
  .thanks h4 {
    color: green;
    font-size: 20px;
    font-weight: normal;
    font-family: serif;
    margin-top: 10px;
  }
  .site-address p {
    line-height: 4px;
    font-weight: 200;
  }
  .table tfoot .empty {
    border: none;
  }
  .table-bordered {
    border: solid;
  }
  
  .table-header {
    padding: .75rem 1.25rem;
    margin-bottom: 0;
    background-color: rgba(0,0,0,.03);
    border-bottom: 1px solid rgba(0,0,0,.125);
  }
  .table td, .table th {
    padding: .30rem;
    padding-right: 8px;
  }
  
</style>
  <div class="invoice-header">
    <div class="float-left site-logo">
      <img src="{{'backend/img/logo2.png'}}" alt="">
    </div>
    <div class="float-right site-address">
      <h4>The Herb Room</h4>
      <h5>By WORLD FORUM TRADING L.L.C</h5>
      <p>Al Ras, Diera , P.O Box - 64389 
          Dubai - U.A.E</p>
      <p>TRN : 100013761000003 </p>
      <p>Phone: <a href="tel:{{env('APP_PHONE')}}"></a></p>
      <p>Email: <a href="mailto:{{env('APP_EMAIL')}}">theherbroom2001@gmail.com</a></p>
    </div>
    <div class="clearfix"></div>
  </div>
  <div class="invoice-top">
    <div class="invoice-top float-left">
      <h6>Buyer</h6>
      <h3>{{$order->first_name}} {{$order->last_name}}</h3>
      <div class="address">
        <p>
          <strong>Country: </strong>
          {{$order->country}}
        </p>
        <p>
          <strong>Address: </strong>
          {{ $order->address1 }} OR {{ $order->address2}}
        </p>
        <p><strong>Phone:</strong> {{ $order->phone }}</p>
          <p><strong>Email:</strong> {{ $order->email }}</p>
      </div>
    </div>  
   
    
    <div class="invoice-right-top float-right" > 
      <h5 class="invoice-right-top ">Tax Invoice</h5>   
      <h6>Invoice #{{$order->order_number}}</h6>
      <p>{{ $order->created_at->format('D d m Y') }}</p>
      {{-- <img class="img-responsive" src="data:image/png;base64, {{ base64_encode(QrCode::format('png')->size(150)->generate(route('admin.product.order.show', $order->id )))}}"> --}}
    </div>
    <div class="clearfix"></div>
  </div>
  <section class="order_details pt-3">
    <div class="table-header">
      <h5>Order Details</h5>
    </div>
    <table class="table table-bordered table-stripe">
      <thead>
        <tr>
          <th scope="col" class="col-6">Product</th>
          <th scope="col" class="col-6">Form</th>
          <th scope="col" class="col-3">Quantity</th>
          <th scope="col" class="col-3">Unit Price</th>
          <th scope="col" class="col-3">size</th>
          <th scope="col" class="col-3">Total(Excluding VAT)</th>
          <th scope="col" class="col-3">VAT 5%</th>
          <th scope="col" class="col-3">VAT Amount</th>
          <th scope="col" class="col-6">Total(Including VAT)</th>
        </tr>
      </thead>
      <tbody>
      @foreach($order->cart_info as $cart)
      @php 
        $product=DB::table('products')->select('title')->where('id',$cart->product_id)->get();
      @endphp
        <tr>
          <td><span>
              @foreach($product as $pro)
                {{$pro->title}}
              @endforeach
            </span></td>
          <td>{{$cart->form}}</td>
          <td>x{{$cart->quantity}}</td>
          <td><span>${{number_format($cart->price,2)}}</span></td>
          <td>{{$cart->size}}</td>
         <td><span>${{number_format($cart->tax_amount,2)}}</span></td>
          <td><span>5%</span></td>
          <td><span>${{number_format($cart->t_amount,2)}}</span></td>
          <td><span>${{number_format($cart->amount,2)}}</span></td>
        </tr>
      @endforeach
      </tbody>
      <tfoot>
        <tr>
          
          
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="text-right">${{number_format($order->tax_total,2)}}</th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="text-right">${{number_format($order->t_total,2)}}</th>
          <th scope="col"> <span>${{number_format($order->sub_total,2)}}</span></th>
        </tr>

        <tr>
          
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="text-right">Coupon:</th>
          <th scope="col"> <span>- ${{number_format($order->coupon,2)}}</span></th>
        </tr>
      {{-- @if(!empty($order->coupon))
        <tr>
          <th scope="col" class="empty"></th>
          <th scope="col" class="text-right">Discount:</th>
          <th scope="col"><span>-{{$order->coupon->discount(Helper::orderPrice($order->id, $order->user->id))}}{{Helper::base_currency()}}</span></th> 
        </tr>
      @endif --}}
        <tr>
        <th scope="col" class="empty"></th>
          
          <th scope="col" class="empty"></th>
          
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          
          @php
            $city_charge=DB::table('citys')->where('id',$order->city_id)->pluck('price');
          @endphp
          @if($order->city_id == null)
          {{-- @if(!empty($city_charge))
          <th scope="col" class="text-right ">city:</th>
          <th><span>+ ${{number_format($city_charge[0],2)}}</span></th>
          @endif --}}
          @else
          <th scope="col" class="text-right ">city:</th>
          <th><span>+ ${{number_format($city_charge[0],2)}}</span></th>
          @endif
        </tr>
        <tr>
        <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="empty"></th>
          <th scope="col" class="text-right">Total:</th>
          <th>
            <span>
                ${{number_format($order->total_amount,2)}}
            </span>
          </th>
        </tr>
      </tfoot>
    </table>
  </section>
  
  <div class="authority float-right mt-5">
    <p>-----------------------------------</p>
    <h5>Authority Signature:</h5>
  </div>
  <div class="thanks mt-3">
    <h4>Thank you for your business !!</h4>
  </div>
  <div class="clearfix"></div>
@else
  <h5 class="text-danger">Invalid</h5>
@endif
</body>
</html>