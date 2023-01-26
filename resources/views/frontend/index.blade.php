@extends('frontend.layouts.master')
@section('title','HerbalCare || Home')

@push('styles')
  <link href="{{asset('frontend/css/index.css')}}" rel="stylesheet">
  <link href="{{asset('frontend/css/modal.css')}}" rel="stylesheet">
@endpush

@section('main-content')
  <!-- <video src="{{asset('images/bannert.mp4')}}" autoplay muted loop></video> -->
  @if(count($banners)>0)
    <section id="slider" class="slider">         
      <ul id="carousel-wrap" class="carousel-wrap">
        @foreach($banners as $key=>$banner)                                    
          <li>
            <picture>
              <source media="(min-width: 600px)" srcset="{{$banner->photo}}">
              <source media="(min-width: 768px)" srcset="{{$banner->photo}}">
              <img class="slide-img" src="{{$banner->photo}}" alt="Slider Image">
            </picture>
          </li>
        @endforeach
      </ul>

      <a href="#" id="slide-prev">&lt;</a>
      <a href="#" id="slide-next">&gt;</a>
    </section>
  @endif

  <section class="products-catalog">
    @php
      $CategoryLists=DB::table('categories')->where('status','active')->where('is_parent','1')->get();
      $PopProducts = DB::table('products')->where('promotion', 'popular')->where('status', 'active')->get();
      $TrnProducts = DB::table('products')->where('promotion', 'trending')->where('status', 'active')->get();
      $NewProducts = DB::table('products')->where('promotion', 'new')->where('status', 'active')->get();
    @endphp

    @if(count($PopProducts) != 0)
      <div class="products">
        <div class="title-content">                        
          <h2> Popular Items </h2>
        </div>
      
        <div class="product-slider carousel hero-slider"  data-flickity='{ "contain": true, "pageDots": false, "autoPlay": 1500}'>
          @foreach($PopProducts as $product)
            @php
              $minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
              $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
              $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');
              $Forms = DB::table('products_attributes')->where('product_id', $product->id)->distinct()->pluck('form');
              if(Auth::user())
              $wishlist = DB::table('wishlists')->where('product_id', $product->id)->where('user_id', auth()->user()->id)->get();
              
              $Sizes = array();
              foreach ($Forms as $form) {
                ${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product->id)->where('form', $form)->pluck('size');
                $Sizes[$form] =  ${$form . "sizes"};
              }
              $Sizes = json_encode($Sizes);
            @endphp
            <div class="product-card {{$product->id}}-card carousel-cell">
              <img class="product-image" src="{{$product->photo}}" alt="product image">
              
              <div class="overlay">
                <button id="{{$product->id}}" class="btn btn-quick-view" title="Quick View" onclick="showModal(id, `{{$product->photo}}`, {{$Images}}, `{{$product->title}}`, {{$Forms}}, {{$Sizes}}, {{$minprice}}, {{$maxprice}}, `{{$product->slug}}`)"> 
                  <i class="fa-regular fa-eye"></i>
                  <p>Quick View</p>
                </button>
              </div>

              <div class="meta-detail">
                <h3 class="product-title">{{$product->title}}</h3>
                <p class="price">AED <span class="value">{{number_format($minprice,2)}}</span> - AED <span class="value">{{number_format($maxprice,2)}}</span></p>
              </div>
              <div class="prod-detail-link">
                <a href="{{route('product-detail', $product->slug)}}" class="btn btn-submit detail-link"> Product Details </a>
                @auth
                  @if(count($wishlist) != 0)
                    <button class="btn favbtn" onclick="fav(this, {{$product->id}})"><i class="fa-solid fa-heart fav"></i></button>
                  @else
                    <button class="btn favbtn" onclick="fav(this, {{$product->id}})"><i class="fa-regular fa-heart fav"></i></button>
                  @endif
                @else
                  <button class="btn favbtn" onclick="window.location.href = 'user/login';"><i class="fa-regular fa-heart fav"></i></button>
                @endauth
              </div>
            </div>
          @endforeach
        </div>
      </div>
    @endif

    @if(count($TrnProducts) != null)
      <div class="products">
        <div class="title-content">                        
          <h2> Trending Items </h2>
        </div>
      
        <div class="product-slider carousel hero-slider"  data-flickity='{ "contain": true, "pageDots": false, "autoPlay": 1500}'>
          @foreach($TrnProducts as $product)
            @php
              $minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
              $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
              $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');
              $Forms = DB::table('products_attributes')->where('product_id', $product->id)->distinct()->pluck('form');
              if(Auth::user())
              $wishlist = DB::table('wishlists')->where('product_id', $product->id)->where('user_id', auth()->user()->id)->get();
              
              $Sizes = array();
              foreach ($Forms as $form) {
                ${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product->id)->where('form', $form)->pluck('size');
                $Sizes[$form] =  ${$form . "sizes"};
              }
              $Sizes = json_encode($Sizes);
            @endphp
           
            <div class="product-card {{$product->id}}-card carousel-cell">
              <img class="product-image" src="{{$product->photo}}" alt="product image">
              
              <div class="overlay">
                <button id="{{$product->id}}" class="btn btn-quick-view" title="Quick View" onclick="showModal(id, `{{$product->photo}}`, {{$Images}}, `{{$product->title}}`, {{$Forms}}, {{$Sizes}}, {{$minprice}}, {{$maxprice}}, `{{$product->slug}}`)"> 
                  <i class="fa-regular fa-eye"></i>
                  <p>Quick View</p>
                </button>
              </div>

              <div class="meta-detail">
                <h3 class="product-title">{{$product->title}}</h3>
                <p class="price">AED <span class="value">{{number_format($minprice,2)}}</span> - AED <span class="value">{{number_format($maxprice,2)}}</span></p>
              </div>
              <div class="prod-detail-link">
                <a href="{{route('product-detail', $product->slug)}}" class="btn btn-submit detail-link"> Product Details </a>
                
                @auth
                  @if(count($wishlist) != 0)
                    <button class="btn favbtn" onclick="fav(this, {{$product->id}})"><i class="fa-solid fa-heart fav"></i></button>
                  @else
                    <button class="btn favbtn" onclick="fav(this, {{$product->id}})"><i class="fa-regular fa-heart fav"></i></button>
                  @endif
                @else
                  <button class="btn favbtn" onclick="window.location.href = 'user/login';"><i class="fa-regular fa-heart fav"></i></button>
                @endauth
              </div>
            </div>
          @endforeach
        </div>
      </div>
    @endif
    @if(count($NewProducts) != 0)
      <div class="products">
        <div class="title-content">                        
          <h2> New Items </h2>
        </div>
      
        <div class="product-slider carousel hero-slider"  data-flickity='{ "contain": true, "pageDots": false, "autoPlay": 1500}'>
          @foreach($NewProducts as $product)
            @php
              $minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
              $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
              $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');
              $Forms = DB::table('products_attributes')->where('product_id', $product->id)->distinct()->pluck('form');

              if(Auth::user())
              $wishlist = DB::table('wishlists')->where('product_id', $product->id)->where('user_id', auth()->user()->id)->get();
              
              $Sizes = array();
              foreach ($Forms as $form) {
                ${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product->id)->where('form', $form)->pluck('size');
                $Sizes[$form] =  ${$form . "sizes"};
              }
              $Sizes = json_encode($Sizes);
            @endphp
            <div class="product-card {{$product->id}}-card carousel-cell">
              <img class="product-image" src="{{$product->photo}}" alt="product image">
              
              <div class="overlay">
                <button id="{{$product->id}}" class="btn btn-quick-view" title="Quick View" onclick="showModal(id, `{{$product->photo}}`, {{$Images}}, `{{$product->title}}`, {{$Forms}}, {{$Sizes}}, {{$minprice}}, {{$maxprice}}, `{{$product->slug}}`)"> 
                  <i class="fa-regular fa-eye"></i>
                  <p>Quick View</p>
                </button>
              </div>

              <div class="meta-detail">
                <h3 class="product-title">{{$product->title}}</h3>
                <p class="price">AED <span class="value">{{number_format($minprice,2)}}</span> - AED <span class="value">{{number_format($maxprice,2)}}</span></p>
              </div>
              <div class="prod-detail-link">
                <a href="{{route('product-detail', $product->slug)}}" class="btn btn-submit detail-link"> Product Details </a>
                @auth
                  @if(count($wishlist) != 0)
                    <button class="btn favbtn" onclick="fav(this, {{$product->id}})"><i class="fa-solid fa-heart fav"></i></button>
                  @else
                    <button class="btn favbtn" onclick="fav(this, {{$product->id}})"><i class="fa-regular fa-heart fav"></i></button>
                  @endif
                @else
                  <button class="btn favbtn" onclick="window.location.href = 'user/login';"><i class="fa-regular fa-heart fav"></i></button>
                @endauth
              </div>
            </div>
          @endforeach
        </div>
      </div>
    @endif

    @if($CategoryLists)
      @foreach($CategoryLists as $cat)
        @php
          $CatProducts = DB::table('products')->where('cat_id', $cat->id)->where('status', 'active')->limit(9)->get();
        @endphp

        @if(count($CatProducts) != 0)
          <div class="products">
            <div class="title-content">                        
              <h2> {{$cat->title}} </h2>
            </div>
          
            <div class="product-slider carousel hero-slider"  data-flickity='{ "contain": true, "pageDots": false}'>
              @foreach($CatProducts as $product)
                @php
                  $minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
                  $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
                  $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');
                  $Forms = DB::table('products_attributes')->where('product_id', $product->id)->distinct()->pluck('form');

                  if(Auth::user())
                  $wishlist = DB::table('wishlists')->where('product_id', $product->id)->where('user_id', auth()->user()->id)->get();
                  
                  $Sizes = array();
                  foreach ($Forms as $form) {
                    ${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product->id)->where('form', $form)->pluck('size');
                    $Sizes[$form] =  ${$form . "sizes"};
                  }
                  $Sizes = json_encode($Sizes);
                @endphp
                <div class="product-card {{$product->id}}-card carousel-cell">
                  <img class="product-image" src="{{$product->photo}}" alt="product image">
                  
                  <div class="overlay">
                    <button id="{{$product->id}}" class="btn btn-quick-view" title="Quick View" onclick="showModal(id, `{{$product->photo}}`, {{$Images}}, `{{$product->title}}`, {{$Forms}}, {{$Sizes}}, {{$minprice}}, {{$maxprice}}, `{{$product->slug}}`)"> 
                      <i class="fa-regular fa-eye"></i>
                      <p>Quick View</p>
                    </button>
                  </div>

                  <div class="meta-detail">
                    <h3 class="product-title">{{$product->title}}</h3>
                    <p class="price">AED <span class="value">{{number_format($minprice,2)}}</span> - AED <span class="value">{{number_format($maxprice,2)}}</span></p>
                  </div>
                  <div class="prod-detail-link">
                    <a href="{{route('product-detail', $product->slug)}}" class="btn btn-submit detail-link"> Product Details </a>
                    @auth
                  @if(count($wishlist) != 0)
                    <button class="btn favbtn" onclick="fav(this, {{$product->id}})"><i class="fa-solid fa-heart fav"></i></button>
                  @else
                    <button class="btn favbtn" onclick="fav(this, {{$product->id}})"><i class="fa-regular fa-heart fav"></i></button>
                  @endif
                @else
                  <button class="btn favbtn" onclick="window.location.href = 'user/login';"><i class="fa-regular fa-heart fav"></i></button>
                @endauth
                  </div>
                </div>
              @endforeach
              <div class="product-card {{$product->id}}-card carousel-cell link-card">
                <a href="{{route('product-cat', $cat->slug)}}" class="view-link">View All</a>
              </div>
            </div>
          </div>
        @endif
      @endforeach
    @endif    
    <div class="modal-container" id="modal-container"></div>
	</section>
@endsection

@push('scripts')
  <script src="{{asset('frontend/js/index.js')}}"></script>
  <script src="{{asset('frontend/js/modal.js')}}"></script>
@endpush