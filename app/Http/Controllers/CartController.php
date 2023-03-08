<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Wishlist;
use App\Models\CartItem;
use App\Models\ProductAttribute;
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

  public function cart_add(Request $request)
  {
    $request->validate([
      'product_id' => 'required',
      'form_id' => 'required',
      'price' => 'required',
      'size' => 'required',
      'qty' => 'required',
    ]);

    $product = Product::with('attrs.form')->where('id', $request->product_id)->first();
    $attr = $product->attrs->where('form_id', $request->form_id)->where('size', $request->size)->first();

    if ($request->qty < 1) {
      return response()->json(['error' => 'Invalid Quantity Value. Quantity must be positive integer'], 404);

    } else if (empty($product)) {

      return response()->json(['error' => 'Invalid Product. No such product'], 404);

    } else if (Auth::check()) {

      $already_cart = CartItem::where(['user_id' => auth()->user()->id, 'product_id' => $product->id, 'attr_id' => $attr->id])->first();

      if ($already_cart) {
        $quantity = $request->qty;
        $total = $attr->price * $quantity;
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
        $cart->attr_id = $attr->id;
        $cart->form = $attr->form->name;
        $cart->price = $attr->price;
        $cart->size = $attr->size;
        $cart->quantity = $request->qty;
        $cart->total = $attr->price * $cart->quantity;
        $cart->subtotal = $cart->total / 1.05;
        $cart->tax = $cart->total - $cart->subtotal;
        $cart->save();
      }

    } else {
      
      $already_cart = 0;
      $cart_table = Session::get('cart');

      foreach ($cart_table as $cart_entry) {
        if ($cart_entry->product_id == $product->id && $cart_entry->attr_id == $attr->id) {
          $already_cart = 1;
          $quantity = $request->qty;
          $total = $attr->price * $quantity;
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
        $cart->attr_id = $attr->id;
        $cart->form = $attr->form->name;
        $cart->price = $attr->price;
        $cart->size = $attr->size;
        $cart->quantity = $request->qty;
        $cart->total = $cart->price * $cart->quantity;
        $cart->subtotal = $cart->total / 1.05;
        $cart->tax = $cart->total - $cart->subtotal;
        Session::push('cart', $cart);
        Session::put('id', $id);
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

  public function cart_update(Request $request)
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

    $subtotal = Helper::CartAmount();
    $tax = Helper::totalCartTax();
    $total_amount = Helper::totalCartAmount();
    return [$total, $subtotal, $tax, $total_amount];
  }

  public function checkout(Request $request)
  {
    return view('frontend.pages.checkout');
  }
}