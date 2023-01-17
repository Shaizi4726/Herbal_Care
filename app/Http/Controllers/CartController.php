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
use Session;

class CartController extends Controller
{
  protected $product = null;
  protected $attribute = null;

  public function __construct(Product $product)
  {
    $this->product = $product;

  }

  public function singleAddToCart(Request $request)
  {
    $request->validate([
      'id' => 'required',
      'cart' => 'required',
    ]);

    $data = $request->cart;
    $items = count($data['size']);
    $product = Product::with('attributes')->where('id', $request->id)->first();
    
    if(Auth::check()) {
      for ($i = 0; $i < $items; $i++) {
        $proAttr = ProductsAttribute::where(['price' => $data['price'][$i], 'product_id' => $product->id])->first();
        
        
        if (($data['quantity'][$i] < 1) || empty($product)) {
          request()->session()->flash('error', 'Invalid Products');
          return back();
        }
        
        $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id', null)->where('product_id', $product->id)
          ->where('product_atrr_id', $proAttr->id)->first();

        if ($already_cart) {
          $quantity = $data['quantity'][$i];
          $t_amount = $proAttr->price * $data['quantity'][$i];
          $amount = $t_amount / 1.05;
          $tax_amount = $t_amount - $amount;
          $already_cart->quantity += $quantity;
          $already_cart->t_amount += $t_amount;
          $already_cart->amount += $amount;
          $already_cart->tax_amount += $tax_amount;
          $already_cart->save();

        } else {

          $cart = new Cart;
          $cart->user_id = auth()->user()->id;
          $cart->product_id = $product->id;
          $cart->plu = $product->plu;
          $cart->product_atrr_id = $proAttr->id;
          $cart->form = $proAttr->form;
          $cart->price = ($proAttr->price - ($proAttr->price * $proAttr->discount) / 100);
          $cart->size = $proAttr->size;
          $cart->quantity = $data['quantity'][$i];
          $cart->t_amount = $proAttr->price * $data['quantity'][$i];
          $cart->amount = ($cart->t_amount) / 1.05;
          $cart->tax_amount = $cart->t_amount - $cart->amount;
          $cart->save();
        }

      }
    }

    else {
      $total_items = Session::get('cart_items') + $items;
      Session::put('cart_items', $total_items);
      Session::push('cart', $data);
    }

    return ('Added to cart successfully');
  }

  public function cartDelete(Request $request)
  {
    $cart = Cart::find($request->id);
    $cart->delete();
    return back();
  }

  public function cartUpdate(Request $request)
  {
    if($request->qty) {
      $cart = Cart::find($request->id);
      $cart->quantity = $request->qty;
      $cart->t_amount = $cart->price * $request->qty;
      $cart->amount = ($cart->t_amount) / 1.05;
      $cart->tax_amount = $cart->t_amount - $cart->amount;
      $cart->save();

      $subtotal = Helper::CartAmount();
      $tax = Helper::totalCartTax();
      $total_amount = Helper::totalCartAmount();

      return [$cart->t_amount, $subtotal, $tax, $total_amount];
    } else {
      return back()->with('Cart Invalid!');
    }
  }

  public function checkout(Request $request)
  {
    return view('frontend.pages.checkout');
  }
}