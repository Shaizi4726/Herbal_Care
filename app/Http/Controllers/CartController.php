<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Wishlist;
use App\Models\CartItem;
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
    $product = Product::with('attrs')->where('id', $request->id)->first();

    for ($i = 0; $i < $items; $i++) {
      $pro_attr = $product->attrs()->where('price', $data['price'][$i])->first();

      if (($data['quantity'][$i] < 0) || empty($product)) {
        request()->session()->flash('error', 'Invalid Products');
        return back();
      } else if (Auth::check()) {
        if ($data['quantity'][$i] < 1) 
          continue;

        $already_cart = CartItem::where('user_id', auth()->user()->id)->where('product_id', $product->id)
          ->where('attr_id', $pro_attr->id)->first();

        if ($already_cart) {
          $quantity = $data['quantity'][$i];
          $total = $pro_attr->price * $quantity;
          $subtotal = $total / 1.05;
          $tax = $total - $subtotal;
          $already_cart->quantity += $quantity;
          $already_cart->total += $total;
          $already_cart->subtotal += $subtotal;
          $already_cart->tax += $tax;
          $already_cart->save();

        } else {

          $cart = new CartItem;
          $cart->user_id = auth()->user()->id;
          $cart->product_id = $product->id;
          $cart->attr_id = $pro_attr->id;
          $cart->form = $data['form'][$i];
          $cart->price = ($pro_attr->price - ($pro_attr->price * $pro_attr->discount) / 100);
          $cart->size = $pro_attr->size;
          $cart->quantity = $data['quantity'][$i];
          $cart->total = $pro_attr->price * $cart->quantity;
          $cart->subtotal = ($cart->total) / 1.05;
          $cart->tax = $cart->total - $cart->subtotal;
          $cart->save();
        }
      } else {
        $already_cart = 0;
        $cart_table = Session::get('cart');
        foreach ($cart_table as $cart_entry) {
          if ($cart_entry->product_id == $product->id && $cart_entry->attr_id == $pro_attr->id) {
            $already_cart = 1;
            $quantity = $data['quantity'][$i];
            $total = $pro_attr->price * $quantity;
            $subtotal = $total / 1.05;
            $tax = $total - $subtotal;
            $cart_entry->quantity += $quantity;
            $cart_entry->total += $total;
            $cart_entry->subtotal += $subtotal;
            $cart_entry->tax += $tax;
          }
        }

        if ($already_cart == 0) {
          $id = Session::get('id') + 1;
          $cart = new CartItem;
          $cart->id = $id;
          $cart->user_id = Session::get('_token');
          $cart->product_id = $product->id;
          $cart->attr_id = $pro_attr->id;
          $cart->form = $data['form'][$i];
          $cart->price = ($pro_attr->price - ($pro_attr->price * $pro_attr->discount) / 100);
          $cart->size = $pro_attr->size;
          $cart->quantity = $data['quantity'][$i];
          $cart->total = $pro_attr->price * $data['quantity'][$i];
          $cart->subtotal = ($cart->total) / 1.05;
          $cart->tax = $cart->total - $cart->subtotal;
          Session::push('cart', $cart);
          Session::put('id', $id);
        }
      }
    }
  }

  public function cartDelete(Request $request)
  {
    if(Auth::check()) {
      $cart = CartItem::find($request->id);
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
    $total;
    if (Auth::check()) {
      $cart = CartItem::find($request->id);
      $cart->quantity = $request->qty;
      $cart->total = $cart->price * $request->qty;
      $cart->subtotal = ($cart->total) / 1.05;
      $cart->tax = $cart->total - $cart->subtotal;
      $cart->save();

      $total = $cart->total;
    } else {
      $cart_items = Session::get('cart');
      $found = null; 

      foreach ($cart_items as $key => $item) {
        if($item->id == $request->id) {
          $item->quantity = $request->qty;
          $item->total = $item->price * $request->qty;
          $item->subtotal = ($item->total) / 1.05;
          $item->tax = $item->total - $item->subtotal;

          $total = $item->total;
        }
      }

      Session::pull('cart');
      Session::put('cart', $cart_items);
    }

    $subtotal = Helper::Cartsubtotal();
    $tax = Helper::totalCartTax();
    $total_subtotal = Helper::totalCartsubtotal();
    return [$total, $subtotal, $tax, $total_subtotal];
  }

  public function checkout(Request $request)
  {
    return view('frontend.pages.checkout');
  }
}