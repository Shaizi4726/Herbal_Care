<?php
use App\Models\Message;
use App\Models\Category;
use App\Models\Order;
use App\Models\Wishlist;
use App\Models\city;
use App\Models\Product;
use App\Models\CartItem;

// use Auth;

class Helper
{
  public static function getAllCategories()
  {
    $categories = Category::orderBy('id', 'ASC')->get();
    return $categories;
  }

  public static function getHeaderCategory()
  {
    $category = new Category();
    $menu = $category->getAllParentWithChild();
    if ($menu) {
      foreach ($menu as $cat_info) {
        if ($cat_info->child_cat->count() > 0) {
          ?>

          <li class="submenu-dropdown">
            <a href="<?php echo route('product-cat', $cat_info->slug); ?>" class="dropdown-item">
              <?php echo $cat_info->title; ?>
            </a>
            <ul class="collapse cat-submenu">
              <?php
              foreach ($cat_info->child_cat as $sub_menu) {
                ?>
                <li><a href="<?php echo route('product-sub-cat', [$cat_info->slug, $sub_menu->slug]); ?>" class="dropdown-item">
                    <?php echo $sub_menu->title; ?>
                  </a></li>
                <?php
              }
              ?>
            </ul>
          </li>

          <?php
        } else {
          ?>

          <li><a href="<?php echo route('product-cat', $cat_info->slug); ?>" class="dropdown-item">
              <?php echo $cat_info->title; ?>
            </a></li>

          <?php
        }
      }
      ?>

      <?php
    }
  }

  public static function productCategoryList($option = 'all')
  {
    if ($option = 'all') {
      return Category::orderBy('id', 'ASC')->get();
    }
    return Category::has('products')->orderBy('id', 'ASC')->get();
  }

  // Cart Count
  public static function cartCount() {
    if(Auth::check()) {
      $user_id=auth()->user()->id;
      return CartItem::where('user_id',$user_id)->count('product_id');
    }
    else {
      return 0;
    }
  }

  // Favorites Count
  public static function favCount() {
    if(Auth::check()) {
      $user_id=auth()->user()->id;
      return Wishlist::where('user_id',$user_id)->count('product_id');
    }
    else {
      return 0;
    }
  }

  // relationship cart with product
  public function product()
  {
    return $this->hasOne('App\Models\Product', 'id', 'product_id');
  }

  public static function getAllProductFromCart()
  {
    if (Auth::check()) {
      $user_id = auth()->user()->id;
      return CartItem::with('product')->where('user_id', $user_id)->get();
    } else {
      $cart = Session::get('cart');
      return $cart;
    }
  }

  // Total cart amount with tax
  public static function totalCartAmount()
  {
    if (Auth::check()) {
      $user_id = auth()->user()->id;
      return CartItem::where('user_id', $user_id)->sum('total');
    } else {
      $cart_items = Session::get('cart');
      $sum = 0;

      foreach ($cart_items as $item) {
        $sum += $item->t_amount;
      }

      return $sum;
    }
  }

  //Total cart amount without tax
  public static function CartAmount()
  {
    if (Auth::check()) {
      $user_id = auth()->user()->id;
      return CartItem::where('user_id', $user_id)->sum('subtotal');
    } else {
      $cart_items = Session::get('cart');
      $sum = 0;

      foreach ($cart_items as $item) {
        $sum += $item->amount;
      }

      return $sum;
    }
  }

  // Total cart tax
  public static function totalCartTax()
  {
    if (Auth::check()) {
      $user_id = auth()->user()->id;
      return CartItem::where('user_id', $user_id)->sum('tax');
    } else {
      $cart_items = Session::get('cart');
      $sum = 0;

      foreach ($cart_items as $item) {
        $sum += $item->tax_amount;
      }

      return $sum;
    }
  }

  public static function wishlistCount($user_id = '')
  {

    if (Auth::check()) {
      if ($user_id == "")
        $user_id = auth()->user()->id;
      return Wishlist::where('user_id', $user_id)->where('cart_id', null)->sum('quantity');
    } else {
      return 0;
    }
  }
  public static function getAllProductFromWishlist($user_id = '')
  {
    if (Auth::check()) {
      if ($user_id == "")
        $user_id = auth()->user()->id;
      return Wishlist::with('product')->where('user_id', $user_id)->where('cart_id', null)->get();
    } else {
      return 0;
    }
  }
  public static function totalWishlistPrice($user_id = '')
  {
    if (Auth::check()) {
      if ($user_id == "")
        $user_id = auth()->user()->id;
      return Wishlist::where('user_id', $user_id)->where('cart_id', null)->sum('amount');
    } else {
      return 0;
    }
  }

  // Total price with city and coupon
  public static function grandPrice($id, $user_id)
  {
    $order = Order::find($id);
    //        dd($id);
    if ($order) {
      $city_price = (float) $order->city->price;
      $order_price = self::orderPrice($id, $user_id);
      return number_format((float) ($order_price + $city_price), 2, '.', '');
    } else {
      return 0;
    }
  }

  public static function city()
  {
    return city::orderBy('id', 'DESC')->get();
  }
}

?>