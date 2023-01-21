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

    for ($i = 0; $i < $items; $i++) {
      $proAttr = ProductsAttribute::where(['price' => $data['price'][$i], 'product_id' => $product->id])->first();

      if (($data['quantity'][$i] < 1) || empty($product)) {
        request()->session()->flash('error', 'Invalid Products');
        return back();
      } else if (Auth::check()) {

        $already_cart = Cart::where('user_id', auth()->user()->id)->where('product_id', $product->id)
          ->where('product_atrr_id', $proAttr->id)->first();

        if ($already_cart) {
          $quantity = $data['quantity'][$i];
          $t_amount = $proAttr->price * $quantity;
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
          $cart->t_amount = $proAttr->price * $cart->quantity;
          $cart->amount = ($cart->t_amount) / 1.05;
          $cart->tax_amount = $cart->t_amount - $cart->amount;
          $cart->save();
        }
      } else {
        $already_cart = 0;
        $cart_table = Session::get('cart');
        foreach ($cart_table as $cart_entry) {
          if ($cart_entry->product_id == $product->id && $cart_entry->product_atrr_id == $proAttr->id) {
            $already_cart = 1;
            $quantity = $data['quantity'][$i];
            $t_amount = $proAttr->price * $data['quantity'][$i];
            $amount = $t_amount / 1.05;
            $tax_amount = $t_amount - $amount;
            $cart_entry->quantity += $quantity;
            $cart_entry->t_amount += $t_amount;
            $cart_entry->amount += $amount;
            $cart_entry->tax_amount += $tax_amount;
          }
        }

        if ($already_cart == 0) {
          $id = Session::get('id') + 1;
          $cart = new Cart;
          $cart->id = $id;
          $cart->user_id = Session::get('_token');
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
          Session::push('cart', $cart);
          Session::put('id', $id);
        }
      }
    }
  }

  public function cartDelete(Request $request)
  {
    if(Auth::check()) {
      $cart = Cart::find($request->id);
      $cart->delete();
      return back();
    }
    else {
      $cart_items = Session::get('cart');
      $found = null; 

      foreach ($cart_items as $key => $item) {
        if($item->id == $request->id) {
          $found = $key;
        }
      }

      Session::pull('cart');

      if ($found !== null) 
        unset($cart_items[$found]);

      Session::put('cart', $cart_items);
      return back();
    }
  }

  public function cartUpdate(Request $request)
  {
    $t_amount;
    if (Auth::check()) {
      $cart = Cart::find($request->id);
      $cart->quantity = $request->qty;
      $cart->t_amount = $cart->price * $request->qty;
      $cart->amount = ($cart->t_amount) / 1.05;
      $cart->tax_amount = $cart->t_amount - $cart->amount;
      $cart->save();

      $t_amount = $cart->t_amount;
    } else {
      $cart_items = Session::get('cart');
      $found = null; 

      foreach ($cart_items as $key => $item) {
        if($item->id == $request->id) {
          $item->quantity = $request->qty;
          $item->t_amount = $item->price * $request->qty;
          $item->amount = ($item->t_amount) / 1.05;
          $item->tax_amount = $item->t_amount - $item->amount;

          $t_amount = $item->t_amount;
        }
      }

      Session::pull('cart');
      Session::put('cart', $cart_items);
    }

    $subtotal = Helper::CartAmount();
    $tax = Helper::totalCartTax();
    $total_amount = Helper::totalCartAmount();
    return [$t_amount, $subtotal, $tax, $total_amount];
  }

  public function checkout(Request $request)
  {
    return view('frontend.pages.checkout');
  }
}