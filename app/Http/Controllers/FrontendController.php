<?php
namespace App\Http\Controllers;
use App\Models\Banner;
use App\Models\Product;
use App\Models\ProductForm;
use App\Models\ProductAttribute;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\CartItem;
use App\Models\Brand;
use App\User;
use Auth;
use Session;
use Newsletter;
use DB;
use Hash;
use Illuminate\Support\Collection;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use SendsPasswordResetEmails;

class FrontendController extends Controller
{
  public function index(Request $request)
  {
    return view('frontend.pages.login')->with('checkout', $request->checkout);
  }
    

  public function home()
  {
    $banners = Banner::where('status', 'active')->orderBy('id', 'DESC')->limit(3)->get();
    $categories = Category::where('status', 'active')->get();
    $pop_products = Product::where('promotion', 'popular')->where('status', 'active')->orderBy('id', 'DESC')->get();
    $new_products = Product::where('promotion', 'new')->where('status', 'active')->orderBy('id', 'DESC')->get();
    $trn_products = Product::where('promotion', 'trending')->where('status', 'active')->orderBy('id', 'DESC')->get();
      
    return view('frontend.index')->with('banners', $banners)->with('categories', $categories)->with('pop_products', $pop_products)->with('new_products', $new_products)->with('trn_products', $trn_products);
  }

  public function product_detail($slug)
  {
    $product = Product::with('categories', 'images')->where('slug', $slug)->first();
    $category_ids = $product->categories->pluck('id');
    $relcats = Category::with('products')->whereIn('id', $category_ids)->get();
    
    $relproducts = collect();

    foreach($relcats as $cat)
      $relproducts = $relproducts->concat($cat->products)->unique();

    return view('frontend.pages.product-detail')->with('product', $product)->with('relproducts', $relproducts);
  }

  public function productSort(Request $request) {
    if($request->search) {
      $products = Product::orwhere('name','like','%'.$request->que.'%')->orwhere('slug','like','%'.$request->que.'%')->orwhere('sci_name','like','%'.$request->que.'%')->orwhere('other_name','like','%'.$request->que.'%')->orwhere('description','like','%'.$request->que.'%')->get();

    } else if ($request->subslug) {
      $subcat=SubCategory::with('products')->where('slug', $request->subslug)->get();
      $products=$subcat[0]->products()->get();

    } else {
      $category = Category::with('products')->where('slug', $request->slug)->get();
      $products = $category->pluck('products')[0];
    }

    $sort_by = $request->value;

    $products = $products->sortBy('name');
      
    if ($sort_by) {
      if($sort_by == 'a-z')
        $products = $products->sortBy('name');
      else if($sort_by == 'z-a')
        $products = $products->sortByDesc('name');
      else if($sort_by == 'low-prc')
        $products = $products->sortBy('minprice');
      else if($sort_by == 'hgh-prc')
        $products = $products->sortByDesc('minprice');
      else if($sort_by == 'new')
        $products = $products->where('promotion', 'new')->all();
      else if($sort_by == 'popular')
        $products = $products->where('promotion', 'popular')->all();
      else if($sort_by == 'trending')
        $products = $products->where('promotion', 'trending')->all();
    }

    if (count($products) !== 0) {
      $content = '';

      foreach ($products as $product) {
        $minprice = $product->attrs()->min('price');;
        $maxprice = $product->attrs()->max('price');
        
        if(Auth::check())
          $wishlist = $product->wishlists()->where('user_id', Auth::user()->id)->get();

        $minprice = number_format($minprice, 2);
        $maxprice = number_format($maxprice, 2);

        $content .= <<<EOD
          <div class="product-card {$product->id}-card carousel-cell">
          <img class="product-image" src="{$product->photo}" alt="product image">
          
          <div class="overlay">
            <button id="product-{$product->id}" class="btn btn-quick-view" title="Quick View" onclick="showModal(id, {$product->id})"> 
              <i class="fa-regular fa-eye"></i>
              <p>Quick View</p>
            </button>
          </div>

          <div class="meta-detail">
            <h3 class="product-title">{$product->name}</h3>
        EOD;

        if($product->minprice == $maxprice) {
          $content .= <<<EOD
            <p class="price">AED <span class="value">{$minprice}</span></p>
          EOD;
        } else {
          $content .= <<<EOD
            <p class="price">AED <span class="value">{$minprice}</span> - AED <span class="value">{$maxprice}</span></p>
          EOD;
        }

        $content .= <<<EOD
            </div>

            <div class="prod-detail-link">
              <a href="/product-detail/{$product->slug}" class="btn btn-submit detail-link"> Product Details </a>
        EOD;

        if(Auth::user()) {
          if(count($wishlist) != 0) {
            $content .= <<<EOD
                <button class="btn favbtn" onclick="fav(this, {$product->id})"><i class="fa-solid fa-heart fav"></i></button>
                </div>
              </div>
              EOD;
          }
          else {
            $content .= <<<EOD
                <button class="btn favbtn" onclick="fav(this, {$product->id})"><i class="fa-regular fa-heart fav"></i></button>
                </div>
              </div>
              EOD;
          }
        }

        else {
          $content .= <<<EOD
                  <button class="btn favbtn" onclick="window.location.href = 'user/login';"><i class="fa-regular fa-heart fav"></i></button>
                </div>
              </div>
            EOD;
        }
      } 

    } else {

      $content = <<<EOD
        <p class="no-product">There is no product in this criteria.</p>
      EOD;
    }
    return $content;
  }

  public function product_search(Request $request) {
    $products = Product::orwhere('name','like','%'.$request->search.'%')->orwhere('slug','like','%'.$request->search.'%')->orwhere('sci_name','like','%'.$request->search.'%')->orwhere('other_name','like','%'.$request->search.'%')->orwhere('description','like','%'.$request->search.'%')->orderBy('name')->get();
    $categories = Category::get();

    return view('frontend.pages.product-grids')->with(['products' => $products, 'cats' => $categories, 'slug' => null, 'subslug' => null, 'search' => 1, 'que' => $request->search]);
  }

  public function productBrand(Request $request){
    $products=Brand::getProductByBrand($request->slug);
    $recent_products=Product::where('status','active')->orderBy('id','DESC')->limit(3)->get();

    if(request()->is('herb.loc/product-grids')){
      return view('frontend.pages.product-lists')->with('products',$products->products)->with('recent_products',$recent_products);
    } else {
      return view('frontend.pages.product-grids')->with('products',$products->products)->with('recent_products',$recent_products);
    }
  }

  public function productCat(Request $request) {
    $category = Category::with('products')->where('slug', $request->slug)->first();
    $products = $category->products->sortBy('name');
    $categories = Category::where('status', 'active')->get();

    return view('frontend.pages.product-grids')->with(['products' => $products, 'cats' => $categories, 'slug' => $request->slug, 'subslug' => $request->subslug, 'search' => null, 'que' => null]);
  }

  public function productSubCat(Request $request){
    $subcat = SubCategory::with('products')->where('slug', $request->subslug)->first();
    $products = $subcat->products()->orderBy('name')->get();
    $categories = Category::where('status', 'active')->get();

    return view('frontend.pages.product-grids')->with(['products' => $products, 'cats' => $categories, 'slug' => $request->slug, 'subslug' => $request->subslug, 'search' => null, 'que' => null]);
  }

  // Login
  public function login(Request $request){
    return view('frontend.pages.login')->with('checkout', $request->checkout);
  }
    
  public function loginSubmit(Request $request) {
    $data= $request->all();
    if (array_key_exists('remember', $data))
      $remember = true;
    else
      $remember = false;

    if(Auth::attempt(['email' => $data['email'], 'password' => $data['password'],'status'=>'active'], $remember)){
      $cart_items = Session::get('cart');

      foreach($cart_items as $item) {
        $already_cart = CartItem::where('user_id', auth()->user()->id)->where('product_id', $item->product_id)->where('attr_id', $item->attr_id)->first();

        if ($already_cart) {
          $quantity = $item->quantity;
          $total = $item->total;
          $subtotal = $item->subtotal;
          $tax = $item->tax;
          $already_cart->quantity += $quantity;
          $already_cart->total += $total;
          $already_cart->subtotal += $subtotal;
          $already_cart->tax += $tax;
          $already_cart->save();

        } else {

          $cart = new CartItem;
          $cart->user_id = auth()->user()->id;
          $cart->product_id = $item->product_id;
          $cart->attr_id = $item->attr_id;
          $cart->form = $item->form;
          $cart->price = $item->price;
          $cart->size = $item->size;
          $cart->quantity = $item->quantity;
          $cart->total = $item->total;
          $cart->subtotal = $item->subtotal;
          $cart->tax = $item->tax;
          $cart->save();
        }
      }

      Session::pull('cart');
      Session::pull('id');
        Session::put('user', $data['email']);
        if($request->checkout == 1)
          return redirect()->route('checkout');
        return redirect()->route('home');
    } else {
      request()->session()->flash('error','Invalid email and password pleas try again!');
      return redirect()->back();
    }
  }

  public function logout(){
    Session::forget('user');
    Auth::logout();
    request()->session()->flash('success','Logout successfully');
    return back();
  }

  public function PassResetForm(Request $request){
    return view('auth.passwords.reset')->with('request',$request);
  }

  public function subscribe(Request $request) {
    if(! Newsletter::isSubscribed($request->email)) {
      Newsletter::subscribePending($request->email);
      if(Newsletter::lastActionSucceeded()){
        request()->session()->flash('success','Subscribed! Please check your email');
        return redirect()->route('home');
      } else {
        Newsletter::getLastError();
        return back()->with('error','Something went wrong! please try again');
      }
    } else {
      request()->session()->flash('error','Already Subscribed');
      return back();
    }
  }


  public function getProductprice(Request $request) {
    if($request->form == null)
      $proAttr = DB::table('product_attributes')->where('product_id', $request->id)->where('size', $request->size)->first();   
    else
      $proAttr = DB::table('product_attributes')->where('product_id', $request->id)->where('size', $request->size)->where('form_id', $request->form)->first();   
    return $proAttr->price;
  }

  public function autocomplete_search(Request $request)
  {
    $query = $request->get('query');
    $data = array();
    $filterResult = Product::where('sci_name', 'LIKE', '%'. $query. '%')->pluck('sci_name');
    foreach($filterResult as $result)
      $data[] = $result;
    $filterResult = Product::where('other_name', 'LIKE', '%'. $query. '%')->pluck('other_name');
    foreach($filterResult as $result) {
      $result = explode(',', $result);
      foreach ($result as $res)
        $data[] = $res;
    }
    $filterResult = Product::where('name','like','%'.$query.'%')->pluck('name');
    foreach($filterResult as $result)
      $data[] = $result;
    return response()->json($data);
  } 
}
