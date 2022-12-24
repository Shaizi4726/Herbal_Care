@extends('frontend.layouts.master')
@section('title','HerbalCare || Home')

@section('main-content')
<<<<<<< HEAD
  @php
    $Forms = DB::table('product_forms')->pluck('title');
    $TotalForms = count($Forms);
  @endphp
  <!-- <video src="{{asset('images/bannert.mp4')}}" autoplay muted loop></video>  -->
=======
@php
  $Forms = DB::table('product_forms')->pluck('title');
  $TotalForms = count($Forms);
@endphp
<!-- <video src="{{asset('images/bannert.mp4')}}" autoplay muted loop></video>  -->
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c
  @if(count($banners)>0)
    <section id="slider" class="slider">         
      <ul id="carousel-wrap" class="carousel-wrap">
          @foreach($banners as $key=>$banner)                                    
            <li>
              <picture>
                <source media="(min-width: 480px)" srcset="{{$banner->photo}}">
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
    @endphp

    @if($CategoryLists)
        @foreach($CategoryLists as $cat)
          @php
            $CatProducts = DB::table('products')->where('cat_id', $cat->id)->where('status', 'active')->limit(9)->get();
          @endphp

          @if(count($CatProducts) != 0)
          <div class="products">
            <div class="product-list">
              <div class="cat-content">                        
                <h2> {{$cat->title}} </h2>
              </div>
            </div>
            
            <div class="product-slider carousel hero-slider"  data-flickity='{ "contain": true, "pageDots": false, "initialIndex": 2 }'>
              @foreach($CatProducts as $product)
                @php
<<<<<<< HEAD
                  $minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
                  $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
=======
                  $minprice = number_format(DB::table('products_attributes')->where('product_id', $product->id)->min('price'), 2);
                  $maxprice = number_format(DB::table('products_attributes')->where('product_id', $product->id)->max('price'),2);
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c
                  $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');
                  
                  $Sizes = array();
                  foreach ($Forms as $form) {
                    ${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product->id)->where('form', $form)->pluck('size');
                    $Sizes[$form] =  ${$form . "sizes"};
                  }
                  $Sizes = json_encode($Sizes);
                @endphp
                <div class="product-card carousel-cell">
                  <img class="product-image" src="{{$product->photo}}" alt="product image">
<<<<<<< HEAD
                  
                  <div class="overlay">
                    <button id="{{$product->id}}" class="btn btn-quick-view" 
                      title="Quick View" onclick="showModal(id, `{{$product->photo}}`, {{$Images}}, 
                      `{{$product->title}}`, {{$Forms}}, {{$Sizes}}, {{$minprice}}, {{$maxprice}})"> 
                        <i class="fa-regular fa-eye"></i><p>Quick View</p></button>
                  </div>

                  <div class="meta-detail">
                    <h3 class="product-title">{{$product->title}}</h3>
                    <p class="price">AED <span class="value">{{number_format($minprice,2)}}</span> - AED <span class="value">{{number_format($maxprice,2)}}</span></p>
                  </div>
                  <div class="prod-detail-link">
                    <a href="{{route('product-detail', $product->id)}}" class="btn btn-submit detail-link"> Product Details </a>
                    <button class="btn favbtn" onclick="fav(this)"><i class="fa-regular fa-heart fav"></i></button>
                  </div>
                </div>
              @endforeach
              <div class="product-card carousel-cell link-card">
                <a href="{{route('product-cat', $cat->slug)}}" class="view-link">View All</a>
=======

                  <div class="overlay"><button id="{{$product->id}}" class="btn btn-quick-view" 
                  title="Quick View" onclick="showModal(id, `{{$product->photo}}`, {{$Images}}, 
                  `{{$product->title}}`, {{$Forms}}, {{$Sizes}}, {{$minprice}}, {{$maxprice}})"> 
                    <i class="fa-regular fa-eye"></i><p>Quick View</p></button>
                  </div>

                  <h3 class="product-title">{{$product->title}}</h3>
                  <p class="price">AED <span class="value">{{$minprice}} - {{$maxprice}}</span></p>
                </div>
              @endforeach
              <div class="product-card carousel-cell link-card">
                <a href="#" class="view-link">View All</a>
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c
              </div>
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
  <script>
    window.onload = function() {
      responsiveSlider();
    }
  </script>
@endpush