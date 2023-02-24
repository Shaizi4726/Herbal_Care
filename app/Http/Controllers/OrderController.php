<?php

namespace App\Http\Controllers;

use App\Notifications\StatusNotification;
use App\Models\CartItem;
use App\Models\Order;
use App\Models\Shipping;
use App\Models\Payment;
use App\Models\City;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Carbon\Carbon;
use PDF;
use Notification;
use Helper;
use Auth;

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
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      //
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
          'cname' => 'required|alpha_dashed',
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
          'shipping-fname' => 'required|alpha',
          'shipping-lname' => 'required|alpha',
          'shipping-address'=>'required|string',
          'shipping-landmark'=>'nullable|string',
          'shipping-country' => 'required|string',
          'shipping-state' => 'required|string',
          'shipping-city' => 'required|string',
          'shipping-phone' => 'required|numeric',
          'shipping-altphone' => 'nullable|numeric'
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
      
      if(Auth::check())
        if(empty(CartItem::where('user_id', Auth()->user()->id)->first())){
          return back();
        }

        $order = new Order();
        $order->order_no = 'ORD-'.strtoupper(Str::random(10));
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

        $order_id = Order::where('order_no', $order->order_no)->pluck('id')[0];
        $subtotal = Helper::CartAmount();
        $tax = Helper::totalCartTax();
        $total = Helper::totalCartAmount();

        if($total > 100)
          $shipping = 0;
        else
          $shipping = City::where('id', $request->city)->pluck('shipping')[0];

        $payment = new Payment();
        $payment->order_id = $order_id;
        $payment->account_name = $request->account_name;
        $payment->account_no = $request->account_no;
        $payment->method = $request->pay_mthd;
        $payment->subtotal = $subtotal;
        $payment->tax = $tax;
        $payment->shipping = $shipping;
        $payment->total = $total;
        $payment->save();
        
      // Notification::send(Auth()->user(), new StatusNotification('Order Placed'));
      
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
        // return $order;
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
        $order=Order::find($id);
        $this->validate($request,[
            'status'=>'required|in:new,process,delivered,cancel'
//            'payment_status'=>'required|in:unpaid,paid'
        ]);
        $data=$request->all();
        // return $request->status;
        if($request->status=='delivered'){
            foreach($order->cart as $cart){
                $product=$cart->product;
                // return $product;
                $product->stock -=$cart->quantity;
                $product->save();
            }
        }
        $status=$order->fill($data)->save();
        if($status){
            request()->session()->flash('success','Successfully updated order');
        }
        else{
            request()->session()->flash('error','Error while updating order');
        }

       
        // return $request->payment_status;
/*        if($request->payment_status=='paid'){
            foreach($order->cart as $cart){
                $product=$cart->product;
         //        return $product;
                $product->stock -=$cart->quantity;
                $product->save();
            }
        }
        $payment_status=$order->fill($data)->save();
        if($payment_status){
            request()->session()->flash('success','Successfully updated order');
        }
        else{
            request()->session()->flash('error','Error while updating order');
        }  */

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

    public function orderTrack(){
        return view('frontend.pages.order-track');
    }

    public function productTrackOrder(Request $request){
        $order=Order::where('user_id',auth()->user()->id)->where('order_no',$request->order_no)->first();
        if($order){
            if($order->status=="new"){
            request()->session()->flash('success','Your order has been placed. please wait.');
            return redirect()->route('home');
            }
            elseif($order->status=="process"){
                request()->session()->flash('success','Your order is under processing please wait.');
                return redirect()->route('home');
    
            }
            elseif($order->status=="delivered"){
                request()->session()->flash('success','Your order is successfully delivered.');
                return redirect()->route('home');
    
            }
            else{
                request()->session()->flash('error','Your order canceled. please try again');
                return redirect()->route('home');
            }
        }
        else{
            request()->session()->flash('error','Invalid order numer please try again');
            return back();
        }
    }

    // PDF generate
    public function pdf(Request $request){
        $order=Order::getAllOrder($request->id);
        // return $order;
        $file_name=$order->order_no.'-'.$order->first_name.'.pdf';
        // return $file_name;
        $pdf=PDF::loadview('admin_panel.order.pdf',compact('order'));
        return $pdf->download($file_name);
    }
    // Income chart
    public function incomeChart(Request $request){
        $year=\Carbon\Carbon::now()->year;
        // dd($year);
        $items=Order::with(['cart_info'])->whereYear('created_at',$year)->where('status','delivered')->get()
            ->groupBy(function($d){
                return \Carbon\Carbon::parse($d->created_at)->format('m');
            });
            // dd($items);
        $result=[];
        foreach($items as $month=>$item_collections){
            foreach($item_collections as $item){
                $amount=$item->cart_info->sum('amount');
                // dd($amount);
                $m=intval($month);
                // return $m;
                isset($result[$m]) ? $result[$m] += $amount :$result[$m]=$amount;
            }
        }
        $data=[];
        for($i=1; $i <=12; $i++){
            $monthName=date('F', mktime(0,0,0,$i,1));
            $data[$monthName] = (!empty($result[$i]))? number_format((float)($result[$i]), 2, '.', '') : 0.0;
        }
        return $data;
    }
    
}
