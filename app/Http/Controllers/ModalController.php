<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductAttribute;
use Illuminate\Http\Request;
use Auth;

class ModalController extends Controller
{
  public function create_modal(Request $request) {
    $product = Product::with('attrs', 'forms', 'images')->where('id', $request->product_id)->first();
    
    $forms = $product->forms()->get();
    $images = $product->images()->pluck('name');
    $sizes = array();

    if(count($forms) == 0) {
      $minprice = $product->attrs()->min('price');
      $maxprice = $product->attrs()->max('price');
      $sizes = $product->attrs()->pluck('size');
    } else {
      $minprice = $product->attrs()->where('form_id', $forms[0]->id)->min('price');
      $maxprice = $product->attrs()->where('form_id', $forms[0]->id)->max('price');
      $sizes = $product->attrs()->where('form_id', $forms[0]->id)->pluck('size');
    }

    $minprice = number_format($minprice, 2);
    $maxprice = number_format($maxprice, 2);
    
    $content = "";

    $content .= <<<EOD
      <div id="modal" class="modal">
        <button type="button" class="btn close modal-close" id="close-btn" onclick="closeModal()"><i class="fa-solid fa-xmark"></i></button>
    
        <div class="modal-content">
          <div class="shazoom" id="shazoom">
            <div class="img-box">
              <ul class="img-ul">
    EOD;

    foreach($images as $img) {
      $content .= <<<EOD
        <li><img src="/images$img" alt="Product Image"></li>
      EOD;
    }

    $content .= <<<EOD
          </ul>
        </div>

        <div class="zoom-nav"></div>

        <!-- Nav Buttons -->
        <p class="zoom-btn">
          <a href="javascript:void(0);" class="zoom-prev-btn"> < </a>
          <a href="javascript:void(0);" class="zoom-next-btn"> > </a>
        </p>
      </div>

      <div class="modal-details-container">
        <div class="product-modal-detail">
          <h1 id="product-name" class="title">$product->name</h1>

          <div id="modal-form">
    EOD;

    if(count($forms) != 0) {
      $content .= <<<EOD
        <div class="forms modal-radio" id="forms">
          <div id="forms-menu" class="forms-list">
      EOD;
      foreach($forms as $form) {
        if($form == $forms[0]) {
          $content .= <<<EOD
            <input type="radio" id="$form->name" name="product-form" value="$form->id" checked>
            <label for="$form->name">$form->name</label>
          EOD;
        } else {
          $content .= <<<EOD
            <input type="radio" id="$form->name" name="product-form" value="$form->id">
            <label for="$form->name">$form->name</label>
          EOD;
        }
      }

      $content .= <<<EOD
          </div>
        </div>
      EOD;
    }

    $content .= <<<EOD
      <div class="price-size-container modal-radio" id="price-size">
        <div class="prices" id="price">
    EOD;

        
    if($minprice == $maxprice) {
      $content .= <<<EOD
        <h4>AED $minprice</h4>
      EOD;
    } else {
      $content .= <<<EOD
        <h4>AED $minprice - AED $maxprice</h4>
      EOD;
    }

    $content .= <<<EOD
      </div>

      <div id="sizes-menu" class="sizes-list">
    EOD;

    foreach($sizes as $size) {
      $content .= <<<EOD
        <input type="radio" id="$size" name="product-size" class="product-size" value="$size">
        <label for="$size">$size</label>
      EOD;
    }

    $content .= <<<EOD
            </div>
          </div>

          <input type="hidden" name="price-input" id="price-input" value="">

          <div class="qty-manage" id="qty-manage">
            <input type="button" value="-" class="qty-minus minus qty-control" field="quantity" disabled>
            <input type="number" name="quantity" id="qty" class="qty" min="1" value="1" oninput="this.value = Math.abs(this.value)">
            <input type="button" value="+" class="qty-plus plus qty-control" field="quantity">
          </div>

          <div class="cart-btn-div" onclick="cartAdd($product->id)">
            <button id="modal-cart-btn" class="cart-btn">
              <span class="add-to-cart">Add to Cart</span>
              <span class="added">Added</span>
              <i class="fas fa-shopping-cart"></i>
              <i class="fas fa-box"></i>
            </button>
          </div>
        </div>
            
        <a href="/product-detail/$product->slug" class="modal-view-link btn" id="modal-view-link"><i class="fa-solid fa-circle-info" id="product-details-icon"></i>VIEW PRODUCT DETAILS</a>
      </div>

      <div id="location-popup" class="ch-popup" data-toggle="0" tabindex="-1">
        <button type="button" class="btn close close-inner" id="inner-close-btn" onclick="remInnerModal()">
          <i class="fa-solid fa-xmark"></i>
        </button>
        <button id="page-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="remInnerModal()">Stay on Page</button>
        <button id="shop-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="location.href = '/home'">Continue Shopping</button>
    EOD;

    if (Auth::check()) {
      $content .= <<<EOD
        <button id="chkt-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="location.href = '/checkout'">Checkout</button>
      EOD;
    } else {
      $content .= <<<EOD
        <button id="chkt-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="chOptions()">Checkout</button>
        <button id="guest-chkt-btn" class="btn btn-submit popup-btn chkt-btn collapse" onclick="location.href = '/checkout'">Checkout as Guest</button>
        <button id="login-chkt-btn" class="btn btn-submit popup-btn chkt-btn collapse" onclick="location.href = '/user/login?checkout=1'">Login to Checkout</button>
      EOD;
    }

    $content .= <<<EOD
            </div>
          </div>
        </div>
      </div>
    EOD;

    return $content;
  }

  public function create_sizes(Request $request) {
    $attrs = ProductAttribute::where(['product_id' => $request->product_id, 'form_id' => $request->form_id])->get();
    $sizes = array();

    if(count($attrs) == 0) {
      return;
    } else {
      $minprice = $attrs->min('price');
      $maxprice = $attrs->max('price');

      foreach($attrs as $attr) {
        $sizes[] =  $attr->size;
      }
    }

    $minprice = number_format($minprice, 2);
    $maxprice = number_format($maxprice, 2);
    
    $content = "";

    $content .= <<<EOD
      <div class="prices" id="price">
    EOD;

        
    if($minprice == $maxprice) {
      $content .= <<<EOD
        <h4>AED $minprice</h4>
      EOD;
    } else {
      $content .= <<<EOD
        <h4>AED $minprice - AED $maxprice</h4>
      EOD;
    }

    $content .= <<<EOD
      </div>

      <div id="sizes-menu" class="sizes-list">
    EOD;

    foreach($sizes as $size) {
      $content .= <<<EOD
        <input type="radio" id="$size" name="product-size" class="product-size" value="$size">
        <label for="$size">$size</label>
      EOD;
    }

    $content .= <<<EOD
      </div>
    EOD;

    return $content;
  }
}
