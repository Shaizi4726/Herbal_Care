<?php

namespace App\Http\Controllers;
use Auth;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Wishlist;
use App\Models\Cart;
use App\Models\ProductsAttribute;
use Illuminate\Support\Str;
use Helper;
class CartController extends Controller
{
    protected $product=null;
    protected $attribute=null;
    
    public function __construct(Product $product){
        $this->product=$product;
        
    }

<<<<<<< HEAD
    public function addToCart(Request $request){
        if (empty($request->id)) {
            request()->session()->flash('error','Invalid Products');
            return back();
        }        
        $product = Product::with('attributes')->where('id', $request->id)->first();
        $request->validate([
            'id'      =>  'required',
            'quant'     =>  'required',
            'price'     =>  'required',
            'size'      =>  'required',
        ]);
=======
//     public function addToCart(Request $request){

//         if (empty($request->id)) {
//             request()->session()->flash('error','Invalid Products');
//             return back();
//         }        
//         $product = Product::with('attributes')->where('id', $request->id)->first();
//         $request->validate([
//             'id'      =>  'required',
//             'quant'     =>  'required',
//             'price'     =>  'required',
//             'size'      =>  'required',
//         ]);
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c
       
//         // dd($request->quant[1]);


<<<<<<< HEAD
        $product = Product::with('attributes')->where('id', $request->id)->first();
=======
//         $product = Product::with('attributes')->where('slug', $request->slug)->first();
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c
       
//         $data = $request->all();
//         $proArr = explode("-",$data['price']);
//         $proAttr = ProductsAttribute::where(['price' => $proArr[0]])->first();
// //        dd($proAttr);
//         // return $product;
//         if (empty($product)) {
//             request()->session()->flash('error','Invalid Products');
//             return back();
//         }
       
<<<<<<< HEAD
        $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id',null)->where('product_id', $product->id)
        ->where('product_atrr_id', $proAttr->id)->first();
        // return $already_cart;
        if($already_cart && $proAttr->sku == $proAttr->sku) {
            // dd($already_cart);
            $already_cart->quantity = $already_cart->quantity + 1;
            $already_cart->amount1->$proAttr->price;
            $already_cart->amount = $already_cart->amount1 + $already_cart->amount1;
            $already_cart->tax_amount = ($already_cart->amount)/1.05;
            $already_cart->t_amount = $already_cart->amount-$already_cart->tax_amount;
            // return $already_cart->quantity;
            if ($already_cart->product->stock < $already_cart->quantity || $already_cart->product->stock <= 0) return back()->with('error','Stock not sufficient!.');
            $already_cart->save();
=======
//         $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id',null)->where('product_id', $product->id)
//         ->where('product_atrr_id', $proAttr->id)->first();
//         // return $already_cart;
//         if($already_cart && $proAttr->sku == $proAttr->sku) {
//             // dd($already_cart);
//             $already_cart->quantity = $already_cart->quantity + 1;
//             $already_cart->amount1->$proAttr->price;
//             $already_cart->amount = $already_cart->amount1 + $already_cart->amount1;
//             $already_cart->tax_amount = ($already_cart->amount)/1.05;
//             $already_cart->t_amount = $already_cart->amount-$already_cart->tax_amount;
//             // return $already_cart->quantity;
//             if ($already_cart->product->stock < $already_cart->quantity || $already_cart->product->stock <= 0) return back()->with('error','Stock not sufficient!.');
//             $already_cart->save();
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c
            
//         }else{
            
<<<<<<< HEAD
            $cart = new Cart;
            $cart->user_id = auth()->user()->id;
            $cart->product_id = $product->id;
            $cart->product_atrr_id = $proAttr->id;
            $cart->form = $proAttr->form;
            $cart->price = ($proAttr->price-($proAttr->price*$proAttr->discount)/100);
            $cart->size =$proAttr->size;
            $cart->quantity = 1;           
            $cart->amount=$cart->price*$cart->quantity;
            $cart->tax_amount=($cart->amount)/1.05;
            $cart->t_amount=$cart->amount-$cart->tax_amount;
            if ($cart->product->stock < $cart->quantity || $cart->product->stock <= 0) return back()->with('error','Stock not sufficient!.');
            $cart->save();
            $wishlist=Wishlist::where('user_id',auth()->user()->id)->where('cart_id',null)->update(['cart_id'=>$cart->id]);
        }
        request()->session()->flash('success','Product successfully added to cart');
        return back();       
    }  

    public function singleAddToCart(Request $request){
        $request->validate([
            'id' => 'required',
            'cart' => 'required',
=======
//             $cart = new Cart;
//             $cart->user_id = auth()->user()->id;
//             $cart->product_id = $product->id;
//             $cart->product_atrr_id = $proAttr->id;
//             $cart->form = $proAttr->form;
//             $cart->price = ($proAttr->price-($proAttr->price*$proAttr->discount)/100);
//             $cart->size =$proAttr->size;
//             $cart->quantity = 1;           
//             $cart->amount=$cart->price*$cart->quantity;
//             $cart->tax_amount=($cart->amount)/1.05;
//             $cart->t_amount=$cart->amount-$cart->tax_amount;
//             if ($cart->product->stock < $cart->quantity || $cart->product->stock <= 0) return back()->with('error','Stock not sufficient!.');
//             $cart->save();
//             $wishlist=Wishlist::where('user_id',auth()->user()->id)->where('cart_id',null)->update(['cart_id'=>$cart->id]);
//         }
//         request()->session()->flash('success','Product successfully added to cart');
//         return back();       
//     }  

    public function singleAddToCart(Request $request){
        dd($request->all());

        $request->validate([
            'id'      =>  'required',
            'quant'      =>  'required',
            'price'      =>  'required',
            'size'      =>  'required',
          
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c
        ]);
           
        $product= Product::with('attributes')->where('id', $request->id)->first();
        
<<<<<<< HEAD
        $data = $request->cart;     
        $items = count($data['size']);
=======
        $product = Product::with('attributes')->where('id', $request->id)->first();
     
//        $productsAttribute = ProductsAttribute::where('sku', $request->sku)->first();
    //   dd($product);
        $data = $request->all();     
        $proArr = explode("-",$data['price']);
        $proAttr = ProductsAttribute::where(['price' => $proArr[0]])->first();        
      // dd($data);
    //    echo "<pre>"; print_r($proAttr);die;
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c

        for ($i=0; $i<$items; $i++) {
            $proAttr = ProductsAttribute::where(['price' => $data['price'][$i], 'product_id' => $product->id])->first();        
            
            if ( ($data['quantity'][$i] < 1) || empty($product) ) {
                request()->session()->flash('error','Invalid Products');
                return back();
            }    
        
            $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id',null)->where('product_id', $product->id)
            ->where('product_atrr_id', $proAttr->id)->first();

            if ($already_cart) {
                $already_cart->quantity = $already_cart->quantity + $data['quantity'][$i];
                $already_cart->amount = ($proAttr->price * $data['quantity'][$i])+ $proAttr->price;
                $already_cart->tax_amount = ($already_cart->amount)/1.05;
                $already_cart->t_amount = $already_cart->amount-$already_cart->tax_amount;    
                
                $already_cart->save();
                
            } else {
                
                $cart = new Cart;
                $cart->user_id = auth()->user()->id;
                $cart->product_id = $product->id;
                $cart->product_atrr_id = $proAttr->id;
                $cart->form = $proAttr->form;
                $cart->price = ($proAttr->price-($proAttr->price*$proAttr->discount)/100);
                $cart->size = $proAttr->size;
                $cart->quantity = $data['quantity'][$i];
                $cart->t_amount=($proAttr->price * $data['quantity'][$i]);
                $cart->amount=($cart->t_amount)/1.05;
                $cart->tax_amount=$cart->t_amount-$cart->amount;
                $cart->save();
            }
        }
<<<<<<< HEAD
        return ('Added to cart successfully'); 
=======
        if ( ($request->quant[1] < 1) || empty($product) ) {
            request()->session()->flash('error','Invalid Products');
            return back();
        }    
     
        $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id',null)->where('product_id', $product->id)
        ->where('product_atrr_id', $proAttr->id)->first();
        //dd($already_cart);
        
        if($already_cart && $proAttr->sku == $proAttr->sku) {
            $already_cart->quantity = $already_cart->quantity + $request->quant[1];
            // $already_cart->price = ($product->price * $request->quant[1]) + $already_cart->price ;
            $already_cart->amount = ($proAttr->price * $request->quant[1])+ $proAttr->price;
            $already_cart->tax_amount = ($already_cart->amount)/1.05;
            $already_cart->t_amount = $already_cart->amount-$already_cart->tax_amount;            
            if ($already_cart->product->stock < $already_cart->quantity || $already_cart->product->stock <= 0) return back()->with('error','Stock not sufficient!.');
           // dd($proAttr);
            $already_cart->save();
            
        }else{
            
            $cart = new Cart;
            $cart->user_id = auth()->user()->id;
            $cart->product_id = $product->id;
            $cart->product_atrr_id = $proAttr->id;
            $cart->form = $proAttr->form;
            $cart->price = ($proAttr->price-($proAttr->price*$proAttr->discount)/100);
            $cart->size = $proAttr->size;
            $cart->quantity = $request->quant[1];
            $cart->amount=($proAttr->price * $request->quant[1]);
            $cart->tax_amount=($cart->amount)/1.05;
            $cart->t_amount=$cart->amount-$cart->tax_amount;
            if ($cart->product->stock < $cart->quantity || $cart->product->stock <= 0) return back()->with('error','Stock not sufficient!.');
            // return $cart;
            //dd($proAttr);
            $cart->save();
        
        }
        
        request()->session()->flash('success','Product successfully added to cart.');
        return back();       
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c
    } 
    
    public function cartDelete(Request $request){
        $cart = Cart::find($request->id);
        if ($cart) {
            $cart->delete();
            request()->session()->flash('success','Cart successfully removed');
            return back();  
        }
        request()->session()->flash('error','Error please try again');
        return back();       
    }     

    public function cartUpdate(Request $request){
        // dd($request->all());
        if($request->quant){
            $error = array();
            $success = '';
            // return $request->quant;
            foreach ($request->quant as $k=>$quant) {
                // return $k;
                $id = $request->qty_id[$k];
                // return $id;
                $cart = Cart::find($id);
                // return $cart;
                if($quant > 0 && $cart) {
                    // return $quant;

                    if($cart->product->stock < $quant){
                        request()->session()->flash('error','Out of stock');
                        return back();
                    }
                    $cart->quantity = ($cart->product->stock > $quant) ? $quant  : $cart->product->stock;
                    // return $cart;
                    
                    if ($cart->product->stock <=0) continue;
                    $after_price=($cart->price-($cart->price*$cart->product->discount)/100);
                    $cart->amount = $after_price * $quant;
                    $cart->tax_amount=($cart->amount*5)/100;
                    $cart->t_amount=$cart->amount-$cart->tax_amount;
                    // return $cart->price;
                    $cart->save();
                    $success = 'Cart successfully updated!';
                }else{
                    $error[] = 'Cart Invalid!';
                }
            }
            return back()->with($error)->with('success', $success);
        }else{
            return back()->with('Cart Invalid!');
        }    
    }

    // public function addToCart(Request $request){
    //     // return $request->all();
    //     if(Auth::check()){
    //         $qty=$request->quantity;
    //         $this->product=$this->product->find($request->pro_id);
    //         if($this->product->stock < $qty){
    //             return response(['status'=>false,'msg'=>'Out of stock','data'=>null]);
    //         }
    //         if(!$this->product){
    //             return response(['status'=>false,'msg'=>'Product not found','data'=>null]);
    //         }
    //         // $session_id=session('cart')['session_id'];
    //         // if(empty($session_id)){
    //         //     $session_id=Str::random(30);
    //         //     // dd($session_id);
    //         //     session()->put('session_id',$session_id);
    //         // }
    //         $current_item=array(
    //             'user_id'=>auth()->user()->id,
    //             'id'=>$this->product->id,
    //             // 'session_id'=>$session_id,
    //             'title'=>$this->product->title,
    //             'summary'=>$this->product->summary,
    //             'link'=>route('product-detail',$this->product->slug),
    //             'price'=>$this->product->price,
    //             'photo'=>$this->product->photo,
    //         );
            
    //         $price=$this->product->price;
    //         if($this->product->discount){
    //             $price=($price-($price*$this->product->discount)/100);
    //         }
    //         $current_item['price']=$price;

    //         $cart=session('cart') ? session('cart') : null;

    //         if($cart){
    //             // if anyone alreay order products
    //             $index=null;
    //             foreach($cart as $key=>$value){
    //                 if($value['id']==$this->product->id){
    //                     $index=$key;
    //                 break;
    //                 }
    //             }
    //             if($index!==null){
    //                 $cart[$index]['quantity']=$qty;
    //                 $cart[$index]['amount']=ceil($qty*$price);
    //                 if($cart[$index]['quantity']<=0){
    //                     unset($cart[$index]);
    //                 }
    //             }
    //             else{
    //                 $current_item['quantity']=$qty;
    //                 $current_item['amount']=ceil($qty*$price);
    //                 $cart[]=$current_item;
    //             }
    //         }
    //         else{
    //             $current_item['quantity']=$qty;
    //             $current_item['amount']=ceil($qty*$price);
    //             $cart[]=$current_item;
    //         }

    //         session()->put('cart',$cart);
    //         return response(['status'=>true,'msg'=>'Cart successfully updated','data'=>$cart]);
    //     }
    //     else{
    //         return response(['status'=>false,'msg'=>'You need to login first','data'=>null]);
    //     }
    // }

    // public function removeCart(Request $request){
    //     $index=$request->index;
    //     // return $index;
    //     $cart=session('cart');
    //     unset($cart[$index]);
    //     session()->put('cart',$cart);
    //     return redirect()->back()->with('success','Successfully remove item');
    // }

    public function checkout(Request $request){
        // $cart=session('cart');
        // $cart_index=\Str::random(10);
        // $sub_total=0;
        // foreach($cart as $cart_item){
        //     $sub_total+=$cart_item['amount'];
        //     $data=array(
        //         'cart_id'=>$cart_index,
        //         'user_id'=>$request->user()->id,
        //         'product_id'=>$cart_item['id'],
        //         'quantity'=>$cart_item['quantity'],
        //         'amount'=>$cart_item['amount'],
        //         'status'=>'new',
        //         'price'=>$cart_item['price'],
        //     );

        //     $cart=new Cart();
        //     $cart->fill($data);
        //     $cart->save();
        // }
        return view('frontend.pages.checkout');
    }
}
