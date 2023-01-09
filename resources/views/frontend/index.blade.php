@extends('frontend.layouts.master')
<<<<<<< HEAD
@section('meta')
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
@endsection
@section('title','HERB || HOME PAGE')
@section('main-content')
  <!-- Slider Area -->
  @if(count($banners)>0)

    <section id="Gslider" class="carousel slide col-sm-10 " data-ride="carousel">            
        <ol class="carousel-indicators col-sm-8" >
            @foreach($banners as $key=>$banner)
                <li data-target="#Gslider" data-slide-to="{{$key}}" class="{{(($key==0)? 'active' : '')}}"></li>
            @endforeach
        </ol>
        <div class="carousel-inner bannerTop" role="listbox" >
            @foreach($banners as $key=>$banner)                    
                <div class="carousel-item {{(($key==0)? 'active' : '')}}"> 
                    <a href="{{route('product-grids')}}" >                       
                        <img class="first-slide" src="{{$banner->photo}}" alt="First slide" class="border border-dark">
                    </a>
                    <div class="carousel-caption d-none d-md-block text-left">
                        <h4 class="wow fadeInDown" >{{$banner->title}}</h4>
                        <p>{!! html_entity_decode($banner->description) !!}</p>                        
                        <a class="btn btn-lg ws-btn wow fadeInUpBig offerBanner" href="{{route('product-grids')}}" role="button">Shop Now<i class="far fa-arrow-alt-circle-right"></i></i></a>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
     @endif
    <section id="Gslider1" class="carousel slide col-sm-2" data-ride="carousel">
        <ol class="carousel-indicators col-sm-2" >
            @foreach($gifts as $key=>$gift)
                <li data-target="#Gslider" data-slide-to="{{$key}}" class="{{(($key==0)? 'active' : '')}}"></li>
            @endforeach
        </ol>
        
        <div class="carousel-inner bannerTop" role="listbox" >
            @foreach($gifts as $key=>$gift)
                <div class="carousel-item {{(($key==0)? 'active' : '')}}">    
                    <a href="{{route('product-grids')}}" >    
                                   
                        <img class="first-slide" src="{{$gift->photo}}" alt="First slide" class="border border-dark">
                    </a>
                    <div class="carousel-caption d-none d-md-block text-left">
                        <h1 class="wow fadeInDown offerBanner">{{$gift->title}}</h1>
                        <p style="font-family:Myriad Pro;">{!! html_entity_decode($gift->description) !!}</p>
                        <a class="btn btn-lg ws-btn wow fadeInUpBig" href="{{route('product-grids')}}" role="button">Shop Now<i class="far fa-arrow-alt-circle-right"></i></i></a>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
<div class="container"></div>

<!--/ End Slider Area -->

<!-- Start Small Banner  -->
<!-- <section class="small-banner section">
    <div class="container-fluid">
        <div class="row">
            @php
                $category_lists=DB::table('categories')->where('status','active')->where('is_parent','1')->get();
            @endphp
            @if($category_lists)
                @foreach($category_lists as $cat)                    
                        <!-- Single Banner  
                        <div class="col-lg-3 col-md-5 col-12 text-center">
                        
                            <div class="single-products ">
                            
                                @if($cat->photo)
                                    <a href="{{route('product-cat',$cat->slug)}}"></a>
                                    <img src="{{$cat->photo}}" alt="{{$cat->photo}}" class="border border-dark">
                                @else
                                    <a href="{{route('product-cat',$cat->slug)}}">
                                    <img src="https://via.placeholder.com/600x370" alt="#"><a>
                                @endif
                                <!-- <div class="content">
                                <a href="{{route('product-cat',$cat->slug)}}">Discover Now
                                    <h3 style="color:black;">{{$cat->title}}</h3>
                                        </a>
                                </div>                                                                
                                <div class="product-overlay" >
                                    <div class="overlay-content card-img-overlay text-center d-flex flex-column justify-content-center" >
                                        <div class="button-head" id="DivForHoverItem">
                                            <div class="product-action" id="HiddenText">                                               
                                            <a class="hoverText" href="{{route('product-cat',$cat->slug)}}" >
                                            {{$cat->title}}</a>                                             
                                            </div>   
                                        </div>                                        
                                    </div>   
                                </div> 
                                
                            </div>
                            <a class="hoverText" 
                            href="{{route('product-cat',$cat->slug)}}">{{$cat->title}}</a><br>                                                                                
                        </div>
                                                                    
                    <!-- /End Single Banner  
                @endforeach
            @endif
            
        </div>
        
    </div>
    
</section> -->

<section class="small-banner section">
    @php
        $category_lists=DB::table('categories')->where('status','active')->where('is_parent','1')->get();
    @endphp
    @if($category_lists)
        @foreach($category_lists as $cat)  
       
            <div class="child col-lg-3 single-products" style="height:430px;" id="childBorder">
                <div class="product-action"> 
                    @if($cat->photo)
                        <a href="{{route('product-cat',$cat->slug)}}">
                            <img src="{{$cat->photo}}" alt="{{$cat->photo}}" class="img-fluid" >
                        </a>
                    @else
                        <a href="{{route('product-cat',$cat->slug)}}">
                            <img src="https://via.placeholder.com/600x370" alt="#" class="img-fluid">
                        </a>
                    @endif
                </div>
            </div>
            <div class="child col-lg-3 single-products imgText" id="childBorder">
                <div class="product-action">                                               
                    <a class="hoverText" href="{{route('product-cat',$cat->slug)}}">
                        {{$cat->title}}
                    </a><br> 
                        {{$cat->slug}}
                                                            
                </div>   
            </div>  

        @endforeach
    @endif
</section>
<div class="container" ></div>
<!-- End Small Banner -->

<!-- Start Product Area -->
<!--<div class="product-area section">
    <div class="container">
        <div class="col-sm-18 padding-right">
                <div class="features_items"><!--features_items
                    <h2 class="title text-center" style="font-family: Cursive;font-size: 20px;font-weight: 900;">Product</h2>
                    <div class="nav-main">
                        <!-- Tab Nav 
                        <ul class="nav nav-tabs filter-tope-group" id="myTab" role="tablist">
                            @php
                                $categories=DB::table('categories')->where('status','active')->where('is_parent',1)->get();
                                // dd($categories);
                            @endphp
                            @if($categories)
                                <button class="btn" style="background:none;color:black;font-size: 20px;font-family: Cursive;Cursive;font-weight: 900;"data-filter="*">
                                    All Products
                                </button>
                                @foreach($categories as $key=>$cat)
                                    <b><i><button class="btn" style="background:none;color:blue;font-size: 20px;font-family: Cursive;font-weight: 900;"data-filter=".{{$cat->id}}">
                                        {{$cat->title}}
                                    </button></i></b>
                                    @endforeach
                            @endif
                        </ul><br><br><br><br><br><br>
                        <!--/ End Tab Nav 
                    </div>
                </div>
                <div class="tab-content isotope-grid" id="myTabContent">
                    @foreach($product_lists as $key=>$product)
                        <div class="col-sm-6 col-md-4 p-b-35 product-image-wrapper isotope-item {{$product->cat_id}}">
                            <div class="single-products">
                                <div class="product-img">
                                    <a href="{{route('product-detail',$product->slug)}}">                                            
                                        @php
                                            $photo=explode(',',$product->photo);
                                        // dd($photo);
                                        @endphp
                                            
                                        <img class="default-img" src="{{$photo[0]}}" alt="{{$photo[0]}}">
                                            
                                        @if($product->stock<=0)
                                            <span class="out-of-stock">Sale out</span>
                                        @elseif($product->condition=='new')
                                            <span class="new">New</span
                                        @elseif($product->condition=='hot')
                                            <span class="hot">Hot</span>
                                        @else
                                            <span class="price-dec">{{$product->discount}}% Off</span>
                                        @endif

                                    </a>
                                    <h3><i><a href="{{route('product-detail',$product->slug)}}">{{$product->title}}</a></i></h3>	
                                </div>

                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <div class="button-head">
                                                <div class="product-action">
                                                    <h3><a data-toggle="modal" data-target="#{{$product->id}}" title="Quick View" href="#"><i class=" ti-eye"></i><br><span><i>Quick Shop</i></span></a></h3>
                                            <!--    <a title="Wishlist" href="{{route('add-to-wishlist',$product->slug)}}" ><i class=" ti-heart "></i><span>Add to Wishlist</span></a> 
                                                </div>
                                            </div>
                                            <div class="product-action-2">
                                        <!--        <a title="Add to cart" href="{{route('add-to-cart',$product->slug)}}">Add to cart</a> 
                                        
                                            </div>
                                        </div>

                                    
                                    <div class="product-content">
                                        
                                        <div class="product-price">
                                            @php
                                                $after_discount=($product->price-($product->price*$product->discount)/100);
                                            @endphp
                                        <!--   <span>${{number_format($after_discount,2)}}</span>
                                            <del style="padding-left:4%;">${{number_format($product->price,2)}}</del> 
                                        </div>
                                    </div>
                                        
                                    </div>
                                </div>
                                                    
                            </div>
                    @endforeach
                        </div>
                    </div>                                                                
                </div>                            
            </div><!--features_items-->                        
            <!--/category-tab-->                        
                
        <!-- </div>
    </div>
</div> -->
<!-- End Product Area -->

<!-- End Midium Banner -->

<!-- Start Most Popular -->
<div class="product-area most-popular section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2 style="font-family:Myriad Pro;">Trending Item</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="owl-carousel popular-slider">
                    @foreach($product_lists as $product)
                        @if($product->condition=='hot')
                            <!-- Start Single Product -->
                        <div class="single-products">
                            <div class="product-img">
                                <a href="{{route('product-detail',$product->slug)}}">
                                    @php
                                        $photo=explode(',',$product->photo);
                                    // dd($photo);
                                    @endphp
                                    <img class="default-img" src="{{$photo[0]}}" alt="{{$photo[0]}}">
                                    <!-- <img class="hover-img" src="{{$photo[0]}}" alt="{{$photo[0]}}"> -->
                                    {{-- <span class="out-of-stock">Hot</span> --}}
                                </a>
                                
                                <div class="product-overlay">
                                    <div class="overlay-content">
                                        <div class="button-head"> 
                                        <a href="{{route('product-detail',$product->slug)}}"><h3 style="color: black;font-family:Myriad Pro;">{{$product->title}}</h3></a>  
                                            <!-- <h3><a data-toggle="modal" data-target="#{{$product->id}}" title="Quick View" href="#"><i class=" ti-eye"><br></i><span><i>Quick Shop</i></span></a></h3> -->
                                    <!--    <a title="Wishlist" href="{{route('add-to-wishlist',$product->slug)}}" ><i class=" ti-heart "></i><span>Add to Wishlist</span></a> -->
                                        </div>
                                
                                    </div>
                                </div>
                            </div>
                            
                            <div class="product-content">
                                <!-- <a href="{{route('product-detail',$product->slug)}}"><h3 style="color: black;">{{$product->title}}</h3></a>
                                <div class="product-price">
                                 <!--   <span class="old">${{number_format($product->price,2)}}</span> 
                                    @php
                                    $after_discount=($product->price-($product->price*$product->discount)/100)
                                    @endphp
                                 <!--   <span>${{number_format($after_discount,2)}}</span>  
                                
                            </div> -->
                            </div>
                        </div>
                        <!-- End Single Product -->
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Most Popular Area -->
<!--Start New item -->
<div class="product-area most-popular section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2 style="font-family:Myriad Pro;">New Item</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="owl-carousel popular-slider">
                    @foreach($product_lists as $product)
                        @if($product->condition=='new')
                            <!-- Start Single Product -->
                        <div class="single-products">
                            <div class="product-img">
                                <a href="{{route('product-detail',$product->slug)}}">
                                    @php
                                        $photo=explode(',',$product->photo);
                                    // dd($photo);
                                    @endphp
                                    <img class="default-img" src="{{$photo[0]}}" alt="{{$photo[0]}}">
                                    <!-- <img class="hover-img" src="{{$photo[0]}}" alt="{{$photo[0]}}"> -->
                                    {{-- <span class="out-of-stock" style="font-family:Myriad Pro;">New</span> --}}
                                </a>
                                <div class="product-overlay">
                                    <div class="overlay-content">
                                        <div class="button-head"> 
                                        <a href="{{route('product-detail',$product->slug)}}"><h3 style="color: black;font-family:Myriad Pro;">{{$product->title}}</h3></a>  
                                            <!-- <h3><a data-toggle="modal" data-target="#{{$product->id}}" title="Quick View" href="#"><i class=" ti-eye"><br></i><span><i>Quick Shop</i></span></a></h3> -->
                                    <!--    <a title="Wishlist" href="{{route('add-to-wishlist',$product->slug)}}" ><i class=" ti-heart "></i><span>Add to Wishlist</span></a> -->
                                        </div>
                                
                                    </div>
                                </div>
                            </div>
                            
                            <div class="product-content">
                                <!-- <a href="{{route('product-detail',$product->slug)}}"><h3 style="color: black;">{{$product->title}}</h3></a>
                                <div class="product-price">
                                 <!--   <span class="old">${{number_format($product->price,2)}}</span> 
                                    @php
                                    $after_discount=($product->price-($product->price*$product->discount)/100)
                                    @endphp
                                 <!--   <span>${{number_format($after_discount,2)}}</span>  
                                
                            </div> -->
                            </div>
                        </div>
                        <!-- End Single Product -->
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
{{-- @php
    $featured=DB::table('products')->where('is_featured',1)->where('status','active')->orderBy('id','DESC')->limit(1)->get();
@endphp --}}
<!-- Start Midium Banner  -->
<!--<section class="midium-banner">
    <div class="container">
        <div class="row">
            @if($featured)
                @foreach($featured as $data)
                    <!-- Single Banner  
                    <div class="col-lg-6 col-md-6 col-12">
                        <div>
                            @php
                                $photo=explode(',',$data->photo);
                            @endphp
                            <a href="{{route('product-detail',$data->slug)}}">
                            <img src="{{$photo[0]}}" alt="{{$photo[0]}}"></a>
                            <div class="content">
                                <p>{{$data->cat_info['title']}}</p>
                                <h3>{{$data->title}} <br>Up to<span> {{$data->discount}}%</span></h3>
                                <a href="{{route('product-detail',$data->slug)}}">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <!-- /End Single Banner  
                @endforeach
            @endif
        </div>
    </div>
</section>
<!-- End New Item -->
<!-- Start Shop Home List  -->
<!--<section class="shop-home-list section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-12">
                <div class="row">
                    <div class="col-12">
                        <div class="shop-section-title">
                            <h1>Latest Items</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    @php
                        $product_lists=DB::table('products')->where('status','active')->orderBy('id','DESC')->limit(6)->get();
                    @endphp
                    @foreach($product_lists as $product)
                        <div class="col-md-4">
                            <!-- Start Single List  
                            <div class="single-list">
                                <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        @php
                                            $photo=explode(',',$product->photo);
                                            // dd($photo);
                                        @endphp
                                        <img src="{{$photo[0]}}" alt="{{$photo[0]}}">
                                        <a href="{{route('add-to-cart',$product->slug)}}" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h4 class="title"><a href="#">{{$product->title}}</a></h4>
                                    <!--    <p class="price with-discount">${{number_format($product->discount,2)}}</p>  
                                    </div>
                                </div>
                                </div>
                            </div>
                            <!-- End Single List  
                        </div>
                    @endforeach

                </div>
            </div>
        </div>
    </div>
</section> -->
<!-- End Shop Home List  -->

<!-- Start Shop Blog  -->
<section class="shop-blog section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2 style="font-family:Myriad Pro;">From Our Blog</h2>
                </div>
            </div>
        </div>
        <div class="row">
            @if($posts)
                @foreach($posts as $post)
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Blog  -->
                        <div class="shop-single-blog">
                        <a href="{{route('blog.detail',$post->slug)}}" class="title">
                            <img src="{{$post->photo}}" alt="{{$post->photo}}">
                        </a>
                            <div class="content">
                                <p class="date">{{$post->created_at->format('d M , Y. D')}}</p>
                                <a href="{{route('blog.detail',$post->slug)}}" class="title" style="font-family:Myriad Pro;">{{$post->title}}</a>
                                <a href="{{route('blog.detail',$post->slug)}}" class="more-btn" style="font-family:Myriad Pro; font-size:15px">Continue Reading</a>
                            </div>
                        </div>
                        <!-- End Single Blog  -->
                    </div>
                @endforeach
            @endif

        </div>
    </div>
</section>
<!-- End Shop Blog  -->

<!-- Start Shop Services Area 
<section class="shop-services section home ">
    <div class="container">
        <div class="cat-nav-head">
            <div class="col-lg-3 col-md-6 col-12">
                <!-- Start Single Service
                <div class="single-service">
                    <i class="ti-rocket"></i>
                    <h4>Free shiping</h4>
                    <p>Orders over $100</p>
                </div>
                <!-- End Single Service 
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <!-- Start Single Service 
                <div class="single-service">
                    <i class="ti-reload"></i>
                    <h4>Free Return</h4>
                    <p>Within 30 days returns</p>
                </div>
                <!-- End Single Service 
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <!-- Start Single Service 
                <div class="single-service">
                    <i class="ti-lock"></i>
                    <h4>Sucure Payment</h4>
                    <p>100% secure payment</p>
                </div>
                <!-- End Single Service 
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <!-- Start Single Service 
                <div class="single-service">
                    <i class="ti-tag"></i>
                    <h4>Best Peice</h4>
                    <p>Guaranteed price</p>
                </div>
                <!-- End Single Service 
            </div>
        </div>
    </div>
</section>
<!-- End Shop Services Area -->

@include('frontend.layouts.newsletter')
<!-- Modal -->
@if($product_lists)
    @foreach($product_lists as $key=>$product) 
        <div class="modal fade" id="{{$product->id}}" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
                        </div>
                        <div class="modal-body">
                            <div class="row no-gutters">
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <!-- Product Slider -->
                                        <div class="product-gallery">
                                            <div class="quickview-slider-active">
                                                @php
                                                    $photo=explode(',',$product->photo);
                                                // dd($photo);
                                                @endphp
                                                @foreach($photo as $data)
                                                    <div class="single-slider">
                                                        <img src="{{$data}}" alt="{{$data}}">
                                                    </div>
                                                @endforeach
                                            </div>
                                        </div>
                                    <!-- End Product slider -->
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <div class="quickview-content">
                                        <h2>{{$product->title}}</h2>
                                        <div class="quickview-ratting-review">
                                            <div class="quickview-ratting-wrap">
                                                <div class="quickview-ratting">
                                                    {{-- <i class="yellow fa fa-star"></i>
                                                    <i class="yellow fa fa-star"></i>
                                                    <i class="yellow fa fa-star"></i>
                                                    <i class="yellow fa fa-star"></i>
                                                    <i class="fa fa-star"></i> --}}
                                                    @php
                                                        $rate=DB::table('product_reviews')->where('product_id',$product->id)->avg('rate');
                                                        $rate_count=DB::table('product_reviews')->where('product_id',$product->id)->count();
                                                    @endphp
                                                    @for($i=1; $i<=5; $i++)
                                                        @if($rate>=$i)
                                                            <i class="yellow fa fa-star"></i>
                                                        @else
                                                        <i class="fa fa-star"></i>
                                                        @endif
                                                    @endfor
                                                </div>
                                                <a href="#"> ({{$rate_count}} customer review)</a>
                                            </div>
                                        <!--    <div class="quickview-stock">
                                                @if($product->stock >0)
                                                <span><i class="fa fa-check-circle-o"></i> {{$product->stock}} in stock</span>
                                                @else
                                                <span><i class="fa fa-times-circle-o text-danger"></i> {{$product->stock}} out stock</span>
                                                @endif
                                            </div> -->
                                        </div>
                                        
                                                @php 
                                                    $after_discount=($product->price-(($product->price*$product->discount)/100));
                                                @endphp  
                                                
												<h4 class="price"><span class="getPrice" >AED {{number_format($product->price,2)}}</span><!--<s>AED {{number_format($product->price,2)}}</s> </p>--> 
                                                    </div>
                                                    <div>                                                
                                               
                                            
                                            <select class="selSize" name="Size" style="width: 15px;">
											<option value=""> Select Size </option>
											@foreach($product_detail as $sizes)
                                            @if($product->id == $sizes->product_id)
											<option value="{{$sizes->id}}-{{$sizes->size}}">{{$sizes->size}} </option>
                                            @endif
											@endforeach
                                        
											</select>
											</p>
                                    <!--    <div class="quickview-peragraph">
                                            <p>{!! html_entity_decode($product->summary) !!}</p>
                                        </div>
                                                    -->                       
                                        
                                        <form action="{{route('single-add-to-cart')}}" method="POST" class="mt-4">
                                            @csrf
                                            <div class="quantity">
                                                <!-- Input Order -->
                                                <div class="input-group">
                                                    <div class="button minus">
                                                        <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                            <i class="ti-minus"></i>
                                                        </button>
                                                    </div>                                                    
                                                    <input type="hidden" id="price1" class="price1" name="price" value="{{$product->price}}">  
                                                    @foreach($product_detail as $sizes)
                                                    @if($product->id == $sizes->product_id)
                                                                                                      											
													<input type="hidden" id="size" name="size" value="{{$sizes->size}}"> 
                                                    <input type="hidden" id="sku" name="sku" value="{{$sizes->sku}}">
                                                    <input type="hidden" id="id" name="id" value="{{$sizes->id}}">  
                                                     @endif                                       
													@endforeach
													<input type="hidden" name="slug" value="{{$product->slug}}">                                            
                                                    <input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1">
                                                    <div class="button plus">
                                                        <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                                            <i class="ti-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <!--/ End Input Order -->
                                                    </div>
                                                
                                            <div class="add-to-cart" style="width:170px;">
                                                <button type="submit" class="btn" >Add to cart</button>
                                                <a href="{{route('add-to-wishlist',$product->slug)}}" class="btn min"><i class="ti-heart"></i></a>
                                            </div>
                                            </form> 
                                        <div class="default-social">
                                        <!-- ShareThis BEGIN --><div class="sharethis-inline-share-buttons"></div><!-- ShareThis END -->
                                        <a href="{{route('product-detail',$product->slug)}}" >VIEW FULL PRODUCT INFO</a>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            
        
        </div>    
    @endforeach
@endif
<!-- Modal end -->
@endsection

@push('styles')
    <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=5f2e5abf393162001291e431&product=inline-share-buttons' async='async'></script>
    <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=5f2e5abf393162001291e431&product=inline-share-buttons' async='async'></script>
    <style>
  .border {
    display: inline-block;   
    margin: 0px;
  }
  </style>
    <style>
        /* Banner Sliding */
        #Gslider .carousel-inner {
        background: #000000;
        color:black;
        }

        #Gslider .carousel-inner{
        height: 550px;
        }
        #Gslider .carousel-inner img{
            width: 100% !important;
            opacity: .8;
        }

        #Gslider .carousel-inner .carousel-caption {
        bottom: 60%;
        }
        #Gslider .carousel-inner .carousel-caption h1 {
        font-size: 50px;
        font-weight: bold;
        line-height: 100%;
        color: #F7941D;
        }
        #Gslider .carousel-inner .carousel-caption p {
        font-size: 18px;
        color: black;
        margin: 28px 0 28px 0;
        }

        #Gslider .carousel-indicators {
        bottom: 70px;
        }
        .hoverText{
            font-size:20px;
            font-weight: bold;
            font-family:Myriad Pro;
            text-align: center;
            
        }
      /* Overlay Hidden 
        #DivForHoverItem {
        height: 50px;
        width: 300px;
        
        }

        #HiddenText {
            display: none;
        }

        #DivForHoverItem:hover #HiddenText {
            display:block;
        }  */
        #Gslider1 .carousel-inner {
        background: #000000;
        color:black;
        }

        #Gslider1 .carousel-inner{
        height: 550px;
        }
        #Gslider1 .carousel-inner img{
            width: 100% !important;
            opacity: .8;
        }

        #Gslider1 .carousel-inner .carousel-caption {
        bottom: 60%;
        }
        #Gslider1 .carousel-inner .carousel-caption h1 {
        font-size: 50px;
        font-weight: bold;
        line-height: 100%;
        color: #F7941D;
        }
        #Gslider1 .carousel-inner .carousel-caption p {
        font-size: 18px;
        color: black;
        margin: 28px 0 28px 0;
        }

        #Gslider1 .carousel-indicators {
        bottom: 70px;
        }
        .hoverText{
            font-size:20px;
            font-weight: bold;
            font-family:Myriad Pro;
            
        }
        .parent {
        /* border: 1px solid black; 
        margin: 1rem;
        padding: 2rem ; */
        text-align: center;
        }
        .child {
        /* display: inline-block; */
        /* border: 1px solid #443a2e; */
        /* padding: 1rem;   */
        vertical-align: middle;
        /* border-radius: 10px;   */
        /* background: linear-gradient(to right, #f7e0a6, #e0c073, #d6af54); */
        }
        #childBorder{
            border: 1px solid #443a2e;
        }
        .img-fluid{
            /* border: 1px solid #443a2e; */
            height:430px;
        }
        .imgText{
            height:430px;
            width:620px; 
            background:#D7C89D;
        }
        .bannerTop{
            height: 500px;
            
        }
        .offerBannerWow{
            font-family:Myriad Pro;
        }
        .offerBanner{
            font-family:Myriad Pro;
        }
        
</style>

@endpush

@push('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>

        /*==================================================================
        [ Isotope ]*/
        var $topeContainer = $('.isotope-grid');
        var $filter = $('.filter-tope-group');

        // filter items on button click
        $filter.each(function () {
            $filter.on('click', 'button', function () {
                var filterValue = $(this).attr('data-filter');
                $topeContainer.isotope({filter: filterValue});
            });

        });

        // init Isotope
        $(window).on('load', function () {
            var $grid = $topeContainer.each(function () {
                $(this).isotope({
                    itemSelector: '.isotope-item',
                    layoutMode: 'fitRows',
                    percentPosition: true,
                    animationEngine : 'best-available',
                    masonry: {
                        columnWidth: '.isotope-item'
                    }
                });
            });
        });

        var isotopeButton = $('.filter-tope-group button');

        $(isotopeButton).each(function(){
            $(this).on('click', function(){
                for(var i=0; i<isotopeButton.length; i++) {
                    $(isotopeButton[i]).removeClass('how-active1');
                }

                $(this).addClass('how-active1');
            });
        });
    </script>
    <script >
         function cancelFullScreen(el) {
            var requestMethod = el.cancelFullScreen||el.webkitCancelFullScreen||el.mozCancelFullScreen||el.exitFullscreen;
            if (requestMethod) { // cancel full screen.
                requestMethod.call(el);
            } else if (typeof window.ActiveXObject !== "undefined") { // Older IE.
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript !== null) {
                    wscript.SendKeys("{F11}");
                }
            }
        }

        function requestFullScreen(el) {
            // Supports most browsers and their versions.
            var requestMethod = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el.msRequestFullscreen;

            if (requestMethod) { // Native full screen.
                requestMethod.call(el);
            } else if (typeof window.ActiveXObject !== "undefined") { // Older IE.
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript !== null) {
                    wscript.SendKeys("{F11}");
                }
            }
            return false
        }        
    </script>
<script>
$(function() {
    $.ajaxSetup({
        headers : {
            'CSRFToken' : getCSRFTokenValue()
        }
    });
});
    
$(document).ready(function(){
//        alert("test");
         $(".selSize").change(function(){
        //    alert("test");
            var idSize =$(this).val();
//            alert(idSize);
            
            $.ajax({
                type:'get',
                url:'/get-product-price',
                data:{idSize:idSize},
                success:function(resp){
//                   alert(resp);
                    var arr =resp.split('#')
//                    alert(resp);
                    $(".getPrice").html("AED "+arr[0]);
                    $(".price").val(arr[0]);
                    $(".price1").val(arr[0]);
                   
                },error:function(){
                    alert("Please Select Size");
                }
            });
        });
    
    });


</script>

<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
@endpush
=======
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
      $PopProducts = DB::table('products')->where('promotion', 'popular')->where('status', 'active')->limit(9)->get();
      $TrnProducts = DB::table('products')->where('promotion', 'trending')->where('status', 'active')->limit(9)->get();
      $NewProducts = DB::table('products')->where('promotion', 'new')->where('status', 'active')->limit(9)->get();
    @endphp

    @if(count($PopProducts) != 0)
      <div class="products">
        <div class="title-content">                        
          <h2> Popular Items </h2>
        </div>
      
        <div class="product-slider carousel hero-slider"  data-flickity='{ "contain": true, "pageDots": false, "initialIndex": 2 }'>
          @foreach($PopProducts as $product)
            @php
              $minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
              $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
              $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');
              $Forms = DB::table('products_attributes')->where('product_id', $product->id)->distinct()->pluck('form');
              
              $Sizes = array();
              foreach ($Forms as $form) {
                ${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product->id)->where('form', $form)->pluck('size');
                $Sizes[$form] =  ${$form . "sizes"};
              }
              $Sizes = json_encode($Sizes);
            @endphp
            <div class="product-card carousel-cell">
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
                <button class="btn favbtn" onclick="fav(this)"><i class="fa-regular fa-heart fav"></i></button>
              </div>
            </div>
          @endforeach
          <div class="product-card carousel-cell link-card">
            <a href="{{route('product-cat', 'popular')}}" class="view-link">View All</a>
          </div>
        </div>
      </div>
    @endif

    @if(count($TrnProducts) != 0)
      <div class="products">
        <div class="title-content">                        
          <h2> Trending Items </h2>
        </div>
      
        <div class="product-slider carousel hero-slider"  data-flickity='{ "contain": true, "pageDots": false, "initialIndex": 2 }'>
          @foreach($TrnProducts as $product)
            @php
              $minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
              $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
              $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');
              $Forms = DB::table('products_attributes')->where('product_id', $product->id)->distinct()->pluck('form');
              
              $Sizes = array();
              foreach ($Forms as $form) {
                ${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product->id)->where('form', $form)->pluck('size');
                $Sizes[$form] =  ${$form . "sizes"};
              }
              $Sizes = json_encode($Sizes);
            @endphp
            <div class="product-card carousel-cell">
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
                <button class="btn favbtn" onclick="fav(this)"><i class="fa-regular fa-heart fav"></i></button>
              </div>
            </div>
          @endforeach
          <div class="product-card carousel-cell link-card">
            <a href="{{route('product-cat', 'trending')}}" class="view-link">View All</a>
          </div>
        </div>
      </div>
    @endif

    @if(count($NewProducts) != 0)
      <div class="products">
        <div class="title-content">                        
          <h2> New Items </h2>
        </div>
      
        <div class="product-slider carousel hero-slider"  data-flickity='{ "contain": true, "pageDots": false, "initialIndex": 2 }'>
          @foreach($NewProducts as $product)
            @php
              $minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
              $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
              $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');
              $Forms = DB::table('products_attributes')->where('product_id', $product->id)->distinct()->pluck('form');
              
              $Sizes = array();
              foreach ($Forms as $form) {
                ${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product->id)->where('form', $form)->pluck('size');
                $Sizes[$form] =  ${$form . "sizes"};
              }
              $Sizes = json_encode($Sizes);
            @endphp
            <div class="product-card carousel-cell">
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
                <button class="btn favbtn" onclick="fav(this)"><i class="fa-regular fa-heart fav"></i></button>
              </div>
            </div>
          @endforeach
          <div class="product-card carousel-cell link-card">
            <a href="{{route('product-cat', 'new')}}" class="view-link">View All</a>
          </div>
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
          
            <div class="product-slider carousel hero-slider"  data-flickity='{ "contain": true, "pageDots": false, "initialIndex": 2 }'>
              @foreach($CatProducts as $product)
                @php
                  $minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
                  $maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
                  $Images = DB::table('images')->where('product_id', $product->id)->pluck('image');
                  $Forms = DB::table('products_attributes')->where('product_id', $product->id)->distinct()->pluck('form');
                  
                  $Sizes = array();
                  foreach ($Forms as $form) {
                    ${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product->id)->where('form', $form)->pluck('size');
                    $Sizes[$form] =  ${$form . "sizes"};
                  }
                  $Sizes = json_encode($Sizes);
                @endphp
                <div class="product-card carousel-cell">
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
                    <button class="btn favbtn" onclick="fav(this)"><i class="fa-regular fa-heart fav"></i></button>
                  </div>
                </div>
              @endforeach
              <div class="product-card carousel-cell link-card">
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
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
