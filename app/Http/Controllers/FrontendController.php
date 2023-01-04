<?php
namespace App\Http\Controllers;
use App\Models\Banner;
use App\Models\Product;
use App\Models\ProductForm;
use App\Models\ProductsAttribute;
use App\Models\Category;
use App\Models\PostTag;
use App\Models\PostCategory;
use App\Models\Post;
use App\Models\Cart;
use App\Models\Brand;
use App\User;
use Auth;
use Session;
use Newsletter;
use DB;
use Hash;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class FrontendController extends Controller
{

    public function index(Request $request)
    {
        return redirect()->route($request->user()
            ->role);
    }

    public function home()
    {
        $featured = Product::where('status', 'active')->where('is_featured', 1)
            ->orderBy('id', 'DESC')
            ->limit(2)
            ->get();
        $posts = Post::where('status', 'active')->orderBy('id', 'DESC')
            ->limit(3)
            ->get();
        $banners = Banner::where('status', 'active')->limit(3)
            ->orderBy('id', 'DESC')
            ->get();
        $products = Product::where('status', 'active')->orderBy('id', 'DESC')
            ->get();
        $product_detail = ProductsAttribute::where('status', 'active')->get();
        $category = Category::where('status', 'active')->where('is_parent', 1)
            ->orderBy('title', 'ASC')
            ->get();

        return view('frontend.index')
            ->with('featured', $featured)->with('posts', $posts)->with('banners', $banners)->with('product_lists', $products)->with('category_lists', $category)->with('product_detail', $product_detail);
    }

    public function aboutUs()
    {
        return view('frontend.pages.about-us');
    }

    public function contact()
    {
        return view('frontend.pages.contact');
    }

    public function productDetail($slug)
    {
        $product_detail = Product::getProductBySlug($slug);

        return view('frontend.pages.product_detail')->with('product_detail', $product_detail);
    }

    public function productGrids()
    {
        $products = Product::query();

        if (!empty($_GET['category']))
        {
            $slug = explode($_GET['category']);
            $cat_ids = Category::select('id')->whereIn('slug', $slug)->pluck('id')->toArray();
            $products->whereIn('cat_id', $cat_ids);
        }
        if (!empty($_GET['brand']))
        {
            $slugs = explode(',', $_GET['brand']);
            $brand_ids = Brand::select('id')->whereIn('slug', $slugs)->pluck('id')
                ->toArray();
            return $brand_ids;
            $products->whereIn('brand_id', $brand_ids);
        }
        if (!empty($_GET['sortBy']))
        {
            if ($_GET['sortBy'] == 'title')
            {
                $products = $products->where('status', 'active')
                    ->orderBy('title', 'ASC');

            }
            if ($_GET['sortBy'] == 'price')
            {
                $products = $products->orderBy('price', 'ASC');

            }
        }

        if (!empty($_GET['price']))
        {
            $price = explode('-', $_GET['price']);

            $products->whereBetween('price', $price);
        }

        $recent_products = Product::where('status', 'active')->orderBy('id', 'DESC')
            ->limit(3)
            ->get();
        // Sort by number
        if (!empty($_GET['show']))
        {
            $products = $products->where('status', 'active')
                ->paginate($_GET['show']);
        }
        else
        {
            $products = $products->where('status', 'active')
                ->paginate(9);

        }
        // Sort by name , price, category

        return view('frontend.pages.product-grids')
            ->with('products', $products)->with('recent_products', $recent_products); //->with('groups', $groups);
        
    }

    public function productFilter(Request $request)
    {
       if($request->search) {
        $products=Product::orwhere('title','like','%'.$request->que.'%')
        ->orwhere('slug','like','%'.$request->que.'%')
        ->orwhere('description','like','%'.$request->que.'%')
        ->orwhere('summary','like','%'.$request->que.'%')
        ->orderBy('id','DESC')
        ->paginate('9');
       }
       else {
        $products = Category::getProductByCat($request->que);
        $products = $products->products;
       }
       $sort_by = $request->sorting;

        if ($request->sub_cat) {
        $products = $products->where('child_cat_id', $request->sub_cat);
        }

        
        if ($request->promotion) {
        $products = $products->where('promotion', $request->promotion);
        }

        if ($sort_by) {
          if($sort_by == 'a-z')
          $products = $products->sortBy('title');
          else if($sort_by == 'z-a')
          $products = $products->sortByDesc('title');
          else if($sort_by == 'low-prc')
          $products = $products->sortBy('price');
          else if($sort_by == 'hgh-prc')
          $products = $products->sortByDesc('price');
        }

        if (count($products) !== 0)
        {
          $content = '';
            foreach ($products as $product)
            {
                $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
                $Forms = DB::table('products_attributes')->where('product_id', $product->id)->distinct()->pluck('form');
                $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');

                $Sizes = array();
                foreach ($Forms as $form)
                {
                    $
                    {
                        $form . "sizes"
                    } = DB::table('products_attributes')->where('product_id', $product->id)
                        ->where('form', $form)->pluck('size');
                    $Sizes[$form] = $
                    {
                        $form . "sizes"
                    };
                }
                $Sizes = json_encode($Sizes);
                $minPrice = number_format($product->price, 2);
                $maxPrice = number_format($maxprice, 2);

                $content .= <<<EOD
                    <div class="product-card carousel-cell">
                    <img class="product-image" src="{$product->photo}" alt="product image">
                    
                    <div class="overlay">
                        <button id="{$product->id}" class="btn btn-quick-view" 
                        title="Quick View" onclick='showModal(id, `{$product->photo}`, {$Images}, 
                        `{$product->title}`, {$Forms}, {$Sizes}, {$product->price}, {$maxprice}, `{$product->slug}`)'> 
                            <i class="fa-regular fa-eye"></i><p>Quick View</p></button>
                    </div>

                    <div class="meta-detail">
                        <h3 class="product-title">{$product->title}</h3>
                        <p class="price">AED <span class="value">{$minPrice}</span> - AED <span class="value">{$maxPrice}</span></p>
                    </div>
                    <div class="prod-detail-link">
                        <a href="/product-detail/{$product->slug}" class="btn btn-submit detail-link"> Product Details </a>
                        <button class="btn favbtn" onclick="fav(this)"><i class="fa-regular fa-heart fav"></i></button>
                    </div>
                    </div>
                  EOD; }
                }
            else {
                $content = <<<EOD
                <p class="no-product">There is no product in this criteria.</p>
              EOD;
            }
      return $content;
    }

    public function productSearch(Request $request){
        $recent_products=Product::where('status','active')->orderBy('id','DESC')->limit(3)->get();
        $products=Product::orwhere('title','like','%'.$request->search.'%')
                    ->orwhere('slug','like','%'.$request->search.'%')
                    ->orwhere('description','like','%'.$request->search.'%')
                    ->orwhere('summary','like','%'.$request->search.'%')
                    ->orderBy('id','DESC')
                    ->paginate('9');
        return view('frontend.pages.product-grids')->with('products',$products)->with('recent_products',$recent_products)->with('sub_cat', [])->with('query', $request->search)->with('search', 1);
    }
    


    public function productBrand(Request $request){
        $products=Brand::getProductByBrand($request->slug);
        $recent_products=Product::where('status','active')->orderBy('id','DESC')->limit(3)->get();
        if(request()->is('herb.loc/product-grids')){
            return view('frontend.pages.product-lists')->with('products',$products->products)->with('recent_products',$recent_products);
        }
        else{
            return view('frontend.pages.product-grids')->with('products',$products->products)->with('recent_products',$recent_products);
        }

    }
    public function productCat(Request $request){
        $products=Category::getProductByCat($request->slug);
        $sub_cat = Category::getChildByParentSlug($request->slug);
        $recent_products=Product::where('status','active')->orderBy('id','DESC')->limit(3)->get();

        return view('frontend.pages.product-grids')->with('products',$products->products)->with('recent_products',$recent_products)->with('sub_cat', $sub_cat)->with('query', $request->slug)->with('search', 0);
    }

    public function productSubCat(Request $request){
        $products=Category::getProductBySubCat($request->sub_slug);
        $recent_products=Product::where('status','active')->orderBy('id','DESC')->limit(3)->get();

        if(request()->is('e-shop.loc/product-grids')){
            return view('frontend.pages.product-lists')->with('products',$products->sub_products)->with('recent_products',$recent_products);
        }
        else{
            return view('frontend.pages.product-grids')->with('products',$products->sub_products)->with('recent_products',$recent_products);
        }

    }

    public function blog(){
        $post=Post::query();
        
        if(!empty($_GET['category'])){
            $slug=explode(',',$_GET['category']);
            // dd($slug);
            $cat_ids=PostCategory::select('id')->whereIn('slug',$slug)->pluck('id')->toArray();
            return $cat_ids;
            $post->whereIn('post_cat_id',$cat_ids);
            // return $post;
        }
        if(!empty($_GET['tag'])){
            $slug=explode(',',$_GET['tag']);
            // dd($slug);
            $tag_ids=PostTag::select('id')->whereIn('slug',$slug)->pluck('id')->toArray();
            // return $tag_ids;
            $post->where('post_tag_id',$tag_ids);
            // return $post;
        }

        if(!empty($_GET['show'])){
            $post=$post->where('status','active')->orderBy('id','DESC')->paginate($_GET['show']);
        }
        else{
            $post=$post->where('status','active')->orderBy('id','DESC')->paginate(9);
        }
        // $post=Post::where('status','active')->paginate(8);
        $rcnt_post=Post::where('status','active')->orderBy('id','DESC')->limit(3)->get();
        return view('frontend.pages.blog')->with('posts',$post)->with('recent_posts',$rcnt_post);
    }

    public function blogDetail($slug){
        $post=Post::getPostBySlug($slug);
        $rcnt_post=Post::where('status','active')->orderBy('id','DESC')->limit(3)->get();
        // return $post;
        return view('frontend.pages.blog-detail')->with('post',$post)->with('recent_posts',$rcnt_post);
    }

    public function blogSearch(Request $request){
        // return $request->all();
        $rcnt_post=Post::where('status','active')->orderBy('id','ASC')->limit(3)->get();
        $posts=Post::orwhere('title','like','%'.$request->search.'%')
            ->orwhere('quote','like','%'.$request->search.'%')
            ->orwhere('summary','like','%'.$request->search.'%')
            ->orwhere('description','like','%'.$request->search.'%')
            ->orwhere('slug','like','%'.$request->search.'%')
            ->orderBy('id','ASC')
            ->paginate(8);
        return view('frontend.pages.blog')->with('posts',$posts)->with('recent_posts',$rcnt_post);
    }

    public function blogFilter(Request $request){
        $data=$request->all();
        // return $data;
        $catURL="";
        if(!empty($data['category'])){
            foreach($data['category'] as $category){
                if(empty($catURL)){
                    $catURL .='&category='.$category;
                }
                else{
                    $catURL .=','.$category;
                }
            }
        }

        $tagURL="";
        if(!empty($data['tag'])){
            foreach($data['tag'] as $tag){
                if(empty($tagURL)){
                    $tagURL .='&tag='.$tag;
                }
                else{
                    $tagURL .=','.$tag;
                }
            }
        }
        // return $tagURL;
            // return $catURL;
        return redirect()->route('blog',$catURL.$tagURL);
    }

    public function blogByCategory(Request $request){
        $post=PostCategory::getBlogByCategory($request->slug);
        $rcnt_post=Post::where('status','active')->orderBy('id','ASC')->limit(3)->get();
        return view('frontend.pages.blog')->with('posts',$post->post)->with('recent_posts',$rcnt_post);
    }

    public function blogByTag(Request $request){
        // dd($request->slug);
        $post=Post::getBlogByTag($request->slug);
        // return $post;
        $rcnt_post=Post::where('status','active')->orderBy('id','ASC')->limit(3)->get();
        return view('frontend.pages.blog')->with('posts',$post)->with('recent_posts',$rcnt_post);
    }

    // Login
    public function login(){
        return view('frontend.pages.login');
    }
    public function loginSubmit(Request $request){
        $data= $request->all();
        if(Auth::attempt(['email' => $data['email'], 'password' => $data['password'],'status'=>'active'])){
            Session::put('user',$data['email']);
            request()->session()->flash('success','Successfully login');
            return redirect()->route('home');
        }
        else{
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

    public function register(){
        return view('frontend.pages.register');
    }
    public function registerSubmit(Request $request){
        // return $request->all();
        $this->validate($request,[
            'name'=>'string|required|min:2',
            'email'=>'string|required|unique:users,email',
            'password'=>'required|min:6|confirmed',
        ]);
        $data=$request->all();
        // dd($data);
        $check=$this->create($data);
        Session::put('user',$data['email']);
        if($check){
            request()->session()->flash('success','Successfully registered');
            return redirect()->route('home');
        }
        else{
            request()->session()->flash('error','Please try again!');
            return back();
        }
    }
    public function create(array $data){
        return User::create([
            'name'=>$data['name'],
            'email'=>$data['email'],
            'password'=>Hash::make($data['password']),
            'status'=>'active'
            ]);
    }
    // Reset password
    public function showResetForm(){
        return view('auth.passwords.old-reset');
    }

    public function subscribe(Request $request){
        if(! Newsletter::isSubscribed($request->email)){
                Newsletter::subscribePending($request->email);
                if(Newsletter::lastActionSucceeded()){
                    request()->session()->flash('success','Subscribed! Please check your email');
                    return redirect()->route('home');
                }
                else{
                    Newsletter::getLastError();
                    return back()->with('error','Something went wrong! please try again');
                }
            }
            else{
                request()->session()->flash('error','Already Subscribed');
                return back();
            }
    }


    public function getProductPrice(Request $request){
        $data = $request->all();
        $id = $data['id'];
        $size = $data['size'];
        $form = $data['form'];
        $proAttr = DB::table('products_attributes')->where('product_id', $id)->where('size', $size)->where('form', $form)->first();      
        return $proAttr->price;
    }

}
