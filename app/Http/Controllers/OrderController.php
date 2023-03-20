<?php

namespace App\Http\Controllers;

use App\Notifications\StatusNotification;
use App\Models\CartItem;
use App\Models\CancelItem;
use App\Models\City;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Payment;
use App\Models\ReturnItem;
use App\Models\Shipping;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Carbon\Carbon;
use PDF;
use Notification;
use Helper;
use Auth;
use Session;

class OrderController extends Controller
{
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index()
  {
    $orders=Order::orderBy('id','DESC')->paginate(10);
    return view('admin_panel.order.index')->with('orders',$orders);
  }

  /**
   * Store a newly created resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\Response
   */
  public function store(Request $request) {
    $current_month = Carbon::now()->month;
    $current_year = Carbon::now()->year;
    $current_date = Carbon::now()->toDateString();
      
    $this->validate($request, [
      'cust_type' => 'required|string'
    ]);
    
    if($request['cust_type'] == 'individual') {
      $this->validate($request, [
        'fname' => 'required|alpha',
        'lname' => 'required|alpha'
      ]);
    } else {
      $this->validate($request, [
        'cname' => 'required|string',
        'trn_no' => 'required|numeric'
      ]);
    }
    
    $this->validate($request, [
      'email' => 'required|email:strict,dns',
      'address'=>'nullable|string',
      'landmark'=>'nullable|string',
      'country'=>'required|string',
      'state'=>'nullable|string',
      'city'=>'nullable|string',
      'phone'=>'nullable|numeric',
      'altphone' => 'nullable|numeric'
    ]);
    
    if($request['shipping_option'] == 'different') {
      $this->validate($request, [
        'shipping_fname' => 'required|alpha',
        'shipping_lname' => 'required|alpha',
        'shipping_address'=>'required|string',
        'shipping_landmark'=>'nullable|string',
        'shipping_country' => 'required|string',
        'shipping_state' => 'required|string',
        'shipping_city' => 'required|string',
        'shipping_phone' => 'required|numeric',
        'shipping_altphone' => 'nullable|numeric'
      ]);
    }
    
    if($request['pay_mthd'] == 'op') {
      $this->validate($request, [
        'account_name' => 'required|string',
        'account_no' => 'required|digits: 16',
        'cvv_cvc' => 'required|numeric',
        'expiry_month' => 'required|digits: 2',
        'expiry_year' => 'required|digits: 4|gte:' . $current_year . '|lte: ' . ($current_year+5) . ''
      ]);
    }
    
    if($request['expiry_year'] == $current_year) {
      $this->validate($request, [
        'expiry_month' => 'gte:' . $current_month . ''
      ]);
    }
    
    if(Auth::check()) {
      if(empty(CartItem::where('user_id', Auth()->user()->id)->get()))
        return back();
    }
    else { 
      if(empty(Session::get('cart')))
        return back();
    }
    
    $order = new Order();
    $order->order_no = 'HC-' . $this->generateUniqueCode();
    if(Auth::check())
      $order->user_id = $request->user()->id;
    $order->fname = $request->fname;
    $order->lname = $request->lname;
    $order->cname = $request->cname;
    $order->trn_no = $request->trn_no;
    $order->email = $request->email;
    $order->phone = $request->phone;
    $order->altphone = $request->altphone;
    $order->address = $request->address;
    $order->city_id = $request->city;
    $order->landmark = $request->landmark;
    $order->save();
    
    $order_id = Order::where('order_no', $order->order_no)->pluck('id')->first();
    $subtotal = Helper::CartAmount();
    $tax = Helper::totalCartTax();
    $discount = Helper::total_discount();
    $total = Helper::totalCartAmount();
    
    if($total > 100)
      $shipping = 0;
    else {
      $shipping = City::where('id', $request->city)->pluck('shipping')->first();
      $total += $shipping;
    }
    
    $request->request->add(['total' => $total]);
    
    $payment = new Payment();
    $payment->order_id = $order_id;
    $payment->account_name = $request->account_name;
    $payment->account_no = $request->account_no;
    $payment->method = $request->pay_mthd;
    $payment->subtotal = $subtotal;
    $payment->tax = $tax;
    $payment->shipping = $shipping;
    $payment->discount = $discount;
    $payment->total = $total;
    $payment->save();
    
    if($request['pay_mthd'] == 'op') {
      $req = (new StripeController)->payment($request);
    }
    
    $shippings = new Shipping();
    $shippings->order_id = $order_id;
    if($request->shipping_option == 'different') {
      $shippings->fname = $request->shipping_fname;
      $shippings->lname = $request->shipping_lname;
      $shippings->phone = $request->shipping_phone;
      $shippings->altphone = $request->shipping_altphone;
      $shippings->address = $request->shipping_address;
      $shippings->city_id = $request->shipping_city;
      $shippings->landmark = $request->shipping_landmark;
    } else {
      $shippings->fname = $request->fname;
      $shippings->lname = $request->lname;
      $shippings->cname = $request->cname;
      $shippings->trn_no = $request->trn_no;
      $shippings->phone = $request->phone;
      $shippings->altphone = $request->altphone;
      $shippings->address = $request->address;
      $shippings->city_id = $request->city;
      $shippings->landmark = $request->landmark;
    }
    $shippings->ordered = $current_date;
    $shippings->save();
    
    if(Auth::check()) {
      $carts = CartItem::where('user_id', Auth::user()->id)->get();
    } else {
      $carts = Session::get('cart');
    }
      
    foreach($carts as $cart) {
      $order_item = new OrderItem;
      $order_item->order_id = $order_id;
      $order_item->product_id = $cart->product_id;
      $order_item->form = $cart->form;
      $order_item->size = $cart->size;
      $order_item->price = $cart->price;
      $order_item->quantity = $cart->quantity;
      $order_item->subtotal = $cart->subtotal;
      $order_item->tax = $cart->tax;
      if(Auth::check()) {
        $order_item->discount = $cart->discount;
        $order_item->coupon_id = $cart->coupon_id;
        $order->coupon_id = $cart->coupon_id;
        $order->save();
      }
      $order_item->total = $cart->total;
      $order_item->save();
    }

    if(Auth::check()) {  
      CartItem::where('user_id', Auth::user()->id)->delete();
    } else {
      Session::pull('cart');
      Session::pull('id');
    }
    
    // Notification::send(Auth()->user(), new StatusNotification('Order Placed'));
    $req = new Request;
    $req->id = $order_id;
    $pdf = $this->sale_invoice($req);  
    (new MailController)->send_mail($request->email, $pdf);
    
    request()->session()->flash('success','Your product successfully placed in order');
    return redirect()->route('home');
  }
  
  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function show($id)
  {
    $order=Order::find($id);
    return view('admin_panel.order.show')->with('order',$order);
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function edit($id)
  {
    $order=Order::find($id);
    return view('admin_panel.order.edit')->with('order',$order);
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  int  $id
   * @return \Illuminate\Http\Response
  */
  public function update(Request $request, $id)
  {
    $current_date=Carbon::now()->toDateString();
    $order=Order::with('shipping', 'payment')->where('id', $id)->get()[0];
    
    if($request->shipping_status == 'processed')
      $order->shipping->processed = $current_date;
    
    if($request->shipping_status == 'shipped')
      $order->shipping->shipped = $current_date;
    
    if($request->shipping_status == 'delivered') 
      $order->shipping->delivered = $current_date;

    $order->status = $request->order_status;
    $order->payment->status = $request->payment_status;
    $order->shipping->status = $request->shipping_status;

    $order->save();
    $order->shipping->save();
    $order->payment->save();
      
    return redirect()->route('order.index');
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function destroy($id)
  {
    $order=Order::find($id);
    if($order){
      $status=$order->delete();
      if($status){
        request()->session()->flash('success','Order Successfully deleted');
      }
      else{
        request()->session()->flash('error','Order can not deleted');
      }
      return redirect()->route('order.index');
    }
    else{
      request()->session()->flash('error','Order can not found');
      return redirect()->back();
    }
  }

  public function track_order(Request $request) {
    $order = Order::with('shipping')->where('order_no', $request->id)->get();

    return $order[0];
  }

  public function user_orders (Request $request) {
    $completed = 0;
    if(Auth::check()) {
      $orders = Order::with('payment')->where('user_id', Auth()->user()->id)->orderBy('created_at', 'desc')->get();

      if(count($orders) == 0) {
        $orders = 0;
      }
      else {
        foreach($orders as $ord) {
          if($ord->status == 'completed') {
            $completed = 1;
          }
        }
      }
    } else {
      $orders = 0;
    }

    return view('frontend.pages.orders-detail')->with(['orders' => $orders, 'order' => 0, 'return' => 0, 'cancel' => 0, 'completed' => $completed]);
  }

  public function order_details (Request $request) {
    $order = Order::with('order_items.product', 'shipping')->where('order_no', $request->id)->get();

    if(count($order) != 0) {
      $order = $order[0];
      $shipping = $order->shipping;

      $cancel = 1;
      $return = 0;
      $date = Carbon::now()->subDays(15)->toDateString();
      
      if($shipping->shipped != null ) {
        $cancel = 0;
      } 

      if ($shipping->status == 'delivered') {
        if($shipping->delivered > $date) {
          $return = 1;
        }
      }
    }
    else {
      $cancel = 0;
      $return = 0;
      $order = -1;
    }

    return view('frontend.pages.orders-detail')->with(['orders' => 0, 'order' => $order, 'return' => $return, 'cancel' => $cancel, 'completed' => 0]);
  }

  // Cancel order items
  public function cancel_order(Request $request) {
    $order = Order::with('payment', 'order_items', 'shipping.city')->where('id', $request->id)->first();
    
    if($request->all == 1) {
      $order->status = 'cancelled';
      foreach($order->order_items as $item) {
        $properties = collect($item->toArray())->only(['order_id', 'product_id', 'form', 'size', 'price', 'quantity', 'discount', 'total'])->all();
        
        $cancel = new CancelItem;
        $cancel->fill($properties);
        $cancel->reason = $request->reason;
        
        $order->payment->cancelled += $cancel->total;
        $order->payment->subtotal -= $item->subtotal;
        $order->payment->tax -= $item->tax;
        $order->payment->discount -= $item->discount;
        $order->payment->total = $order->payment->subtotal + $order->payment->tax - $order->payment->discount;
        
        $cancel->save();
        $item->delete();
      }
      
      $order->save();
    } else {
      foreach($request->items as $id) {
        $item = $order->order_items->where('id', $id)->first();
        $properties = collect($item->toArray())->only(['order_id', 'product_id', 'form', 'size', 'price', 'quantity', 'discount', 'total'])->all();
        
        $cancel = new CancelItem;
        $cancel->fill($properties);
        $cancel->reason = $request->reason;
        
        $order->payment->cancelled += $cancel->total;
        $order->payment->subtotal -= $item->subtotal;
        $order->payment->tax -= $item->tax;
        $order->payment->discount -= $item->discount;
        $order->payment->total = $order->payment->subtotal + $order->payment->tax - $order->payment->discount;
        
        $cancel->save();
        $item->delete();
      }
    }
    
    if($order->payment->total > 0 && $order->payment->total < 100) {
      $order->payment->shipping = $order->shipping->city->shipping;
    } else {
      $order->payment->shipping = 0;
    }

    if($order->payment->status == 'paid') {
      $refund = $order->payment->cancelled - $order->payment->shipping;
      $order->payment->refund = $refund;
    }

    $order->payment->total += $order->payment->shipping;
    $order->payment->save();
  }

  // Return order items
  public function return_order(Request $request) {
    $order = Order::with('payment', 'order_items', 'shipping.city')->where('id', $request->id)->first();

    if($request->all == 1) {
      $order->status = 'returned';
      foreach($order->order_items as $item) {
        $properties = collect($item->toArray())->only(['order_id', 'product_id', 'form', 'size', 'price', 'quantity', 'discount', 'total'])->all();

        $return = new ReturnItem;
        $return->fill($properties);
        $return->reason = $request->reason;

        $order->payment->returned += $return->total;
        $order->payment->subtotal -= $item->subtotal;
        $order->payment->tax -= $item->tax;
        $order->payment->discount -= $item->discount;
        $order->payment->total = $order->payment->subtotal + $order->payment->tax - $order->payment->discount;

        $return->save();
        $item->delete();
      }

      $order->save();
    } else {
      foreach($request->items as $id) {
        $item = $order->order_items->where('id', $id)->first();
        $properties = collect($item->toArray())->only(['order_id', 'product_id', 'form', 'size', 'price', 'quantity', 'discount', 'total'])->all();

        $return = new ReturnItem;
        $return->fill($properties);
        $return->reason = $request->reason;

        $order->payment->returned += $return->total;
        $order->payment->subtotal -= $item->subtotal;
        $order->payment->tax -= $item->tax;
        $order->payment->discount -= $item->discount;
        $order->payment->total = $order->payment->subtotal + $order->payment->tax - $order->payment->discount;
        
        $return->save();
        $item->delete();
      }
    }

    if($order->payment->total > 0 && $order->payment->total < 100) {
      $order->payment->shipping = $order->shipping->city->shipping;
    } else {
      $order->payment->shipping = 0;
    }

    if($order->payment->status == 'paid') {
      $refund = $order->payment->returned - $order->payment->shipping;
      $order->payment->refund = $refund;
    }

    $order->payment->total += $order->payment->shipping;
    $order->payment->save();
  }

  // Sale invoice generate
  public function sale_invoice(Request $request) {
    $order = Order::with('order_items', 'payment', 'shipping')->where('id', $request->id)->first();
    $file_name = $order->order_no.'-'.$order->fname.'.pdf';
    
    $pdf = PDF::loadview('frontend.order.sale-invoice', compact('order'));

    if($request->download == 1) {
      return $pdf->download($file_name);
    }
    
    return $pdf->output();
  }

  // Tax invoice generate
  public function tax_invoice(Request $request) {
    $order = Order::with('order_items', 'payment', 'shipping')->where('id', $request->id)->get()[0];
    $file_name = $order->order_no.'-'.$order->fname.'.pdf';
    
    $pdf = PDF::loadview('frontend.order.tax-invoice', compact('order'));

    if($request) {
      if($request->download == 1)
        return $pdf->download($file_name);
    }
    
    return $pdf->output();
  }

  /**
   * Generate unique code for orders
   *
   * @return response()
   */
  public function generateUniqueCode()
  {
    do {
      $code = random_int(1000000, 9999999);
    } while (Order::where("order_no", $code)->first());

    return $code;
  } 

  // Income chart
  public function incomeChart(Request $request){
    $year=\Carbon\Carbon::now()->year;
    // dd($year);
    $items=Order::with(['order_items'])->whereYear('created_at',$year)->where('status','completed')->get()
        ->groupBy(function($d){
            return \Carbon\Carbon::parse($d->created_at)->format('m');
        });
        // dd($items);
    $result=[];
    foreach($items as $month=>$item_collections){
      //dd($items);
        foreach($item_collections as $item){
            $amount=$item->order_items->sum('total');
            //dd($amount);
            $m=intval($month);
            // return $m;
            isset($result[$m]) ? $result[$m] += $amount :$result[$m]=$amount;
        }
    }
    $data=[];
    //dd($data);
    for($i=1; $i <=12; $i++){
        $monthName=date('F', mktime(0,0,0,$i,1));
        $data[$monthName] = (!empty($result[$i]))? number_format((float)($result[$i]), 2, '.', '') : 0.0;
    }
    return $data;
}
// dashboard Show Order Count
  public static function countActiveOrder(){
    $data=Order::count();
    if($data){
        return $data;
    }
    return 0;
  } 
//Dashboard show total amount of order
  public static function amountOrder(){
    $data=OrderItem::get();
    if($data){
        return $data->sum('total');
    }
    return 0;
  } 
  // dashboard Show Delevered
  public static function countActiveDelevered(){
    $data=Shipping::where('status','delivered')->count();
    if($data){
        return $data;
    }
    return 0;
  } 

  // dashboard Show Processe
  public static function countActiveProcessed(){
    $data=Shipping::where('status','processed')->count();
    if($data){
      return $data;
    }
    return 0;
  } 

  // dashboard Show Shipped
  public static function countActiveShipped(){
    $data=Shipping::where('status','shipped')->count();
    if($data){
        return $data;
    }
    return 0;
  } 

  // dashboard Show Ordered
  public static function countActiveOrdered(){
    $data=Shipping::where('status','ordered')->count();
    if($data){
        return $data;
    }
    return 0;
  } 
  // dashboard Show Cancelled
  public static function countActiveCancelled(){
    $data=CancelItem::count();
    if($data){
        return $data;
    }
    return 0;
  } 
  //Cancelled Amount
  public static function amountCance(){
    $data=CancelItem::get();
    if($data){
        return $data->sum('total');
    }
    return 0;
  } 
  // dashboard Show Returned
  public static function countActiveReturned(){
    $data=ReturnItem::count();
    //dd($data);
    if($data){
        return $data;
    }
    return 0;
  } 
  //Returned Amount
  public static function amountReturn(){
    $data=ReturnItem::get();
    if($data){
        return $data->sum('total');
    }
    return 0;
  } 

}
?>