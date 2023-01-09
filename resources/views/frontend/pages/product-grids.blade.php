@extends('frontend.layouts.master')
<<<<<<< HEAD
@section('meta')
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name='copyright' content=''>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="keywords" content="online shop, purchase, cart, ecommerce site, best online shopping">
	<meta property="og:type" content="article">
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    
@endsection
@section('title','HERB || PRODUCT PAGE')
@section('main-content')
	<!-- Breadcrumbs -->
   
    <!-- <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="{{route('home')}}">Home <i class="ti-arrow-right"></i></a></li>
                            <li><a href="#">Grid </a></li>                           
                        </ul>                                                                                                                                                
                    </div>
                </div>
            </div>
        </div>        
    </div> -->
    <!-- End Breadcrumbs -->
    
    <!-- Product Style -->
    <form action="{{route('shop.filter')}}" method="POST" >
        @csrf
        <section class="product-area shop-sidebar shop section" >
            <div class="col-15">
                <div class="row">
                    <div class="col-lg-2 col-md-3 col-2">
                        <div class="shop-sidebar">
                                <!-- Single Widget -->
                                <div class="single-widget category">
                                    <h3 class="title">Categories</h3>
                                    <ul class="categor-list">
										@php
											// $category = new Category();
											$menu=App\Models\Category::getAllParentWithChild();
										@endphp
										@if($menu)
										<li>
											@foreach($menu as $cat_info)
													@if($cat_info->child_cat->count()>0)
														<li><a href="{{route('product-cat',$cat_info->slug)}}" style="font-size: 18px; font-weight: bold">{{$cat_info->title}}</a>
															<ul>
																@foreach($cat_info->child_cat as $sub_menu)
																	<li><a href="{{route('product-sub-cat',[$cat_info->slug,$sub_menu->slug])}}" style="font-size: 15px;">{{$sub_menu->title}}</a></li>
																@endforeach
															</ul>
														</li>
													@else
														<li><a href="{{route('product-cat',$cat_info->slug)}}">{{$cat_info->title}}</a></li>
													@endif
											@endforeach
										</li>
										@endif
                                        {{-- @foreach(Helper::productCategoryList('products') as $cat)
                                            @if($cat->is_parent==1)
												<li><a href="{{route('product-cat',$cat->slug)}}">{{$cat->title}}</a></li>
											@endif
                                        @endforeach --}}
                                    </ul>
                                </div>
                                <!--/ End Single Widget -->
                                <!-- Shop By Price -->
                                    <div class="single-widget range">
                                        <h3 class="title">Shop by Price</h3>
                                        <div class="price-filter">
                                            <div class="price-filter-inner">
                                                @php
                                                    $max=DB::table('products_attributes')->max('price');
                                                    // dd($max);
                                                @endphp
                                                <div id="slider-range" data-min="0" data-max="{{$max}}"></div>
                                                <div class="product_filter">
                                                <button type="submit" class="filter_button">Filter</button>
                                                <div class="label-input">
                                                    <span>Range:</span>
                                                    <input style="" type="text" id="amount" readonly/>
                                                    <input type="hidden" name="price_range" id="price_range" value="@if(!empty($_GET['price'])){{$_GET['price']}}@endif"/>
                                                </div>
                                                </div>
                                            </div>
                                        </div>                                                                                
                                    </div>
                                    <!--/ End Shop By Price -->
                                <!-- Single Widget -->
                                <div class="single-widget recent-post">
                                    <h3 class="title">Recent post</h3>
                                    {{-- {{dd($recent_products)}} --}}
                                    @foreach($recent_products as $product)
                                        <!-- Single Post -->
                                        @php
                                            $photo=explode(',',$product->photo);
                                        @endphp
                                        <div class="single-post first">
                                            <div class="image">
                                                <img src="{{$photo[0]}}" alt="{{$photo[0]}}">
                                            </div>
                                            <div class="content">
                                                <h4><a href="{{route('product-detail',$product->slug)}}">{{$product->title}}</a></h5>
                                                @foreach($product->attributes as $sizes)
												@endforeach
                                                @php
                                                    $minprice =  DB::table('products_attributes')->where('product_id',$sizes->product_id)->min('price');      
                                                    $maxprice =  DB::table('products_attributes')->where('product_id',$sizes->product_id)->max('price');                                                         
                                                @endphp										
										        <h4 class="price"><span class="getPrice" >AED. {{number_format($minprice,2)}} - {{number_format($maxprice,2)}} </span></h4>
                                               
                                                <!-- @php
                                                    $org=($product->price-($product->price*$product->discount)/100);
                                                @endphp -->
                                                

                                            </div>
                                        </div>
                                        <!-- End Single Post -->
                                    @endforeach
                                </div>
                                <!--/ End Single Widget -->
                                <!-- Single Widget -->
                                <div class="single-widget category">
                                    <h3 class="title">Brands</h3>
                                    <ul class="categor-list">
                                        @php
                                            $brands=DB::table('brands')->orderBy('title','ASC')->where('status','active')->get();
                                        @endphp
                                        @foreach($brands as $brand)
                                            <li><a href="{{route('product-brand',$brand->slug)}}">{{$brand->title}}</a></li>
                                        @endforeach
                                    </ul>
                                </div>
                                <!--/ End Single Widget -->
                        </div>
                    </div>
                    
                    <!-- <div class="col-lg-9 col-md-8 col-12" >
                        <div class="row" >
                            <div class="col-12">
                                <!-- Shop Top 
                                <div class="shop-top" >
                                    <div class="shop-shorter"  >
                                        <!-- <div class="single-shorter">
                                            
                                           <label>Show :</label>                                           
                                            <select class='show' name='show' onchange="this.form.submit();">
                                                <option value="">Default</option>
                                                <option value="10" @if(!empty($_GET['show']) && $_GET['show']=='10') selected @endif>10</option>
                                                <option value="25" @if(!empty($_GET['show']) && $_GET['show']=='25') selected @endif>25</option>
                                                <option value="50" @if(!empty($_GET['show']) && $_GET['show']=='50') selected @endif>50</option>
                                                <option value="100" @if(!empty($_GET['show']) && $_GET['show']=='100') selected @endif>100</option>
                                            </select> 
                                        </div>   -->          
                                        <!-- <div class="single-shorter">
                                            <label>Sort By :</label>
                                            <select class='sortBy' name='sortBy' onchange="this.form.submit();"> 
                                                 <!-- <option value="">Default</option> 
                                                <option value="title" @if(!empty($_GET['sortBy']) && $_GET['sortBy']=='title') selected @endif>A to Z</option>
                                                <option value="price" @if(!empty($_GET['sortBy']) && $_GET['sortBy']=='price') selected @endif>Price</option>
                                                <option value="category" @if(!empty($_GET['sortBy']) && $_GET['sortBy']=='category') selected @endif>Category</option>
                                                <option value="brand" @if(!empty($_GET['sortBy']) && $_GET['sortBy']=='brand') selected @endif>Brand</option>
                                            </select>
                                        </div> -->
                                                                          
                                        <!-- Pagination test  -->                                                                                           
                                        <!-- <div id="demoFour" class="demo" >                                         
                                            @foreach($products as $product) 
                                            <div>                                                                                              
                                                <h2>{{$product->title}} - {{$product->price}}</h2>                                                                                                  
                                            </div>                                       
                                            @endforeach
                                        </div> -->
                                    <!-- End of pagination 
                                    </div>
                                    <ul class="view-mode">
                                        <li class="active"><a href="javascript:void(0)"><i class="fa fa-th-large"></i></a></li>
                                    <!--    <li><a href="{{route('product-lists')}}"><i class="fa fa-th-list"></i></a></li> 
                                    </ul>
                                </div>
                                <!--/ End Shop Top 
                            </div>
                        </div><br> -->
                        <div class="col-lg-9 col-md-8 col-12" >
                            <div class="row" id="demoFour">
                                {{-- {{$products}} --}}
                                @if(count($products)>0)
                                    @foreach($products as $product)
                                    <div class="col-sm-2"><br>
                                        <div class="product-image-wrapper ">
                                            <div class="single-products">
                                                <div class="productinfo text-center ">
                                                    <a href="{{route('product-detail',$product->slug)}}">
                                                        @php
                                                            $photo=explode(',',$product->photo);
                                                        @endphp
                                                        <img class="default-img " src="{{$photo[0]}}" alt="{{$photo[0]}}">
                                                <!--        <img class="hover-img" src="{{$photo[0]}}" alt="{{$photo[0]}}">  -->
                                                        @if($product->discount)
                                                            <span class="price-dec">{{$product->discount}} % Off</span>
                                                        @endif
                                                    </a>
                                                        </div>
                                                        <div class="product-overlay ">
                                                            <div class="overlay-content ">
                                                                <div class="button-head ">
                                                                    <div class="product-action " >
                                                                        <h3 style="display: none;"><a href="{{route('product-detail',$product->slug)}}" style="color: black;" >{{$product->title}}</a></h3>
                                                                        <h3><a typp="button" id="abc{{$product->id}}" class="btnQuickView"  data-toggle="modal" data-target="#{{$product->id}}" title="Quick View" href="#"><i class=" ti-eye"><br></i><span><i>Quick Shop</i></span></a></h3>
                                                                    <!--    <h3><a title="Wishlist" href="{{route('add-to-wishlist',$product->slug)}}" class="wishlist" data-id="{{$product->id}}"><i class=" ti-heart "></i><span>Add to Wishlist</span></a></h3> -->
                                                                    </div>  
                                                                </div>
                                                                <div class="product-action-2 ">
                                                                        
                                                                <!--<a title="Add to cart" href="{{route('add-to-cart',$product->slug)}}">Add to cart</a>  -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="product-content " >
                                                        <h3><a href="{{route('product-detail',$product->slug)}}" style="color: black;" >{{$product->title}}</a></h3>
                                                        
                                                        <!-- @php
                                                            $after_discount=($product->price-($product->price*$product->discount)/100);
                                                        @endphp -->
                                                        @foreach($product->attributes as $sizes)
                                                        @endforeach
                                                        @php
                                                            $minprice =  DB::table('products_attributes')->where('product_id',$sizes->product_id)->min('price');      
                                                            $maxprice =  DB::table('products_attributes')->where('product_id',$sizes->product_id)->max('price');                                                         
                                                        @endphp                                                                                                    
                                                          
                                                        
                                                        <!-- @if($product->id == $sizes->product_id)  -->                                                                                         
                                                        <span type="range" class="pricerange" >AED. {{number_format($minprice,2)}} - {{number_format($maxprice,2)}} </span> 
                                                        <!-- @endif                                                                                                                                                                                  
                                                        <!-- <span>AED {{number_format($after_discount,2)}}</span> -->
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
                                    <!-- <h4 class="text-warning" style="margin:100px auto;">There are no products.</h4> -->
                                    @endif
                                </div>
                                <div class="row"  >
                                    <div class="col-md-12 justify-content-center d-flex">
                                    {{-- {{$products->appends($_GET)->links()}}  --}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <!--/ End Product Style 1  -->

    <!-- Modal -->
    @if($products)
        @foreach($products as $key=>$product)
            <div class="modal" id="{{$product->id}}" tabindex="-1" role="dialog">
                <div class="dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" onClick="location.reload()" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            </div>                            
                            <div class="modal-body">
                                <div class="row">                                    
                                    <div class="col-lg-5 col-md-12 ">
                                        <!-- Product Slider -->
                                        <div class="product-gallery">
                                            <div class="quickview-slider">
                                                <div class="container">                                                                                                             
                                                    @php
                                                        $images=DB::table('images')->orderBy('id','asc')->get();
                                                    @endphp                                                 
                                                    @php
                                                        $photo=explode(',',$product->photo);
                                                    // dd($photo);
                                                   
                                                    @endphp                                                                                                  
                                                    <div class="exzoom" id="exzoomabc{{$product->id}}">                                                    
                                                        <div class="exzoom_img_box">
                                                            <ul class='exzoom_img_ul' >
                                                                @foreach($photo as $data)
                                                                    <li><img src="{{$data}}"/></li>	
                                                                @endforeach
                                                                @foreach($product->images as $image)	
                                                                    <li><img src="{{('/images/'.$image->image)}}"/></li>                                                               	
                                                                @endforeach										
                                                            </ul>                                            
                                                        </div>										
                                                        <div class="exzoom_nav"></div>
                                                        <!-- Nav Buttons -->
                                                            <p class="exzoom_btn">
                                                                <a href="javascript:void(0);" class="exzoom_prev_btn" id="exzoomSet"> < </a>
                                                                <a href="javascript:void(0);" class="exzoom_next_btn"> > </a>
                                                            </p>                                                       																																																																													                                                    
                                                        </div> 
                                                    </div>                             
                                                </div>                                            
                                            </div>
                                            <!-- End Product slider -->
                                        </div>
                                        <div class="col-lg-3 col-md-12 ">
                                            <div class="quickview-content ">
                                                <h2>{{$product->title}}</h2>                                             
                                                    <div class="quickview-ratting-review">                                                        
                                                        <!--<div class="quickview-stock">
                                                            @if($product->stock >0)
                                                            <span><i class="fa fa-check-circle-o"></i> {{$product->stock}} in stock</span>
                                                            @else
                                                            <span><i class="fa fa-times-circle-o text-danger"></i> {{$product->stock}} out stock</span>
                                                            @endif
                                                        </div> 
                                                    </div>-->
                                                
                                                    <div class="col-lg-12 col-12">
                                                        <p style="width:200px;">
                                                            @php
                                                                $forms=DB::table('product_forms')->orderBy('title','DESC')->get();
                                                            @endphp
                                                            @foreach($product->attributes as $sizes)
                                                            @endforeach
                                                            @foreach($forms as $form)                                                        
                                                                @if($sizes->form)
                                                                    <button class="btn button btnMain{{$form->title}}" name="size" style="width:80px;height:30px;margin-right: 5px;" value="{{$sizes->product_id}}-{{$form->title}}">{{$form->title}} </button>
                                                                @endif
                                                            @endforeach                                                                                                    
                                                        </p>
                                                    </div>                                            
                                                </div>
                                                @php
                                                    $minprice =  DB::table('products_attributes')->where('product_id',$sizes->product_id)->min('price');      
                                                    $maxprice =  DB::table('products_attributes')->where('product_id',$sizes->product_id)->max('price');                                                         
                                                @endphp
                                            <!--        @php 
                                                    $after_discount=($product->price-(($product->price*$product->discount)/100));
                                                @endphp -->
                                                <h4 class="price" ><span type="range" style="font-size: 20px;" class="getPrice" >AED. {{number_format($minprice,2)}} - {{number_format($maxprice,2)}} </span>
                                                <!-- <h4 class="price"><span class="getPrice" >AED {{number_format($product->price,2)}}</span><!--<s>AED {{number_format($product->price,2)}}</s> </p></h4> -->
                                                <div class="quickview-peragraph">
                                                <!--    <p>{!! html_entity_decode($product->summary) !!}</p>  -->
                                                </div> <br>                                                                                  
                                                    <div class="col-lg-6 col-12">
                                                        
                                                        <p style="width:200px;">
                                                            @foreach($product->attributes as $sizes)           
                                                            <button class="btn button btn{{$sizes->form}}" name="price" style="width:80px;height:30px;margin-right: 5px;margin-top: 10px;" value="{{$sizes->id}}-{{$sizes->size}}">{{$sizes->size}} </button>
                                                            @endforeach
                                                            
                                                        </p><br>
                                                    
                                                        <!-- {{-- <div class="col-lg-6 col-12">
                                                            <h5 class="title">Color</h5>
                                                            <select>
                                                                <option selected="selected">orange</option>
                                                                <option>purple</option>
                                                                <option>black</option>
                                                                <option>pink</option>
                                                            </select>
                                                        </div> --}} -->
                                                    </div>
                                                </div>
                                                
                                                <form action="{{route('single-add-to-cart')}}" method="get" class="mt-4">
                                                    @csrf
                                                    <div class="quantity">
                                                        <!-- Input Order -->
                                                        <div class="input-group">
                                                            <div class="button minus">
                                                                <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                                    <i class="ti-minus"></i>
                                                                </button>
                                                            </div><br>
                                                        @foreach($product->attributes as $sizes)
                                                            @if($product->id == $sizes->product_id)
                                                                <input type="hidden" class="price1" id="price1" name="price" value="{{$sizes->price}}">                                                                                                                                                                                                                                                                                                                                                                    											
                                                                <input type="hidden" class="size" id="size" name="size" value="{{$sizes->size}}">
                                                                <input type="hidden" class="sku" id="sku" name="sku" value="{{$sizes->sku}}">                    
                                                            @endif                                                                                                                                                                                                                  
                                                        @endforeach
                                                            <input type="hidden" name="slug" value="{{$product->slug}}"> 
                                                            <input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1">
                                                            <div class="button plus">
                                                                <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                                                    <i class="ti-plus"></i>
                                                                </button><br>
                                                            </div>
                                                        </div>
                                                        <!--/ End Input Order -->
                                                    </div><br>
                                                    <div class="add-to-cart" style="width:100px;">
                                                        <button type="submit" class="btn"style="color: #e4d7b5;font-family:Myriad Pro;">Add to cart</button>
                                                    <!--    <a href="{{route('add-to-wishlist',$product->slug)}}" class="btn min"><i class="ti-heart"></i></a>-->
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
                @endforeach
            @endif
    <!-- Modal end -->

@endsection
@push('styles')
<style>
    .pagination{
        display:inline-flex;
    }
    .filter_button{
        /* height:20px; */
        text-align: center;
        background:#F7941D;
        padding:8px 16px;
        margin-top:10px;
        color: white;
    }
</style>
<style>
      div.dataTables_wrapper div.dataTables_paginate{
          display: none;
      }
      /* .zoom {
        transition: transform .1s; /* Animation 
        height:400px;
        width:400px;
      }

      .zoom:hover {
        transform: scale(2);
      } */
      .pricerange{
        font-size: 18px;
      }  
      
  
    .hidden { 
        display: none; 
    } 
    .exzoom{
        height:300px;
        width:300px;
    }        
  </style>
 
@endpush
@push('scripts')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<link href="{{asset('frontend/css/main.css')}}" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="{{asset('frontend/js/jquery-listnav.js')}}"></script>
<script src="{{asset('frontend/js/vendor.js')}}"></script>
<link rel="stylesheet" href="{{asset('frontend/css/demo.css')}}">
<link rel="stylesheet" href="{{asset('frontend/css/listnav.css')}}">
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Inconsolata' rel='stylesheet' type='text/css'>
<!-- <link rel="stylesheet" type="text/css" href="{{asset('frontend/css/demo.css')}}"> -->
<link rel="stylesheet" type="text/css" href="{{asset('frontend/css/../magnifier.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('frontend/css/gallery.css')}}">

<script>
$(function(){
	$('#demoFour').listnav({
        cookieName: 'cookie-demo',       
		includeAll: true,	
		onClick: function(letter) {
			$(".myLastClicked").text(letter.toUpperCase());
		}
	});
	// $('.demo ').click(function(e) {
	// 	e.preventDefault();
	// });
});

// $(function(){
//     $('.demo').detach().appendTo('col-sm-2');
//    });

</script>
    {{-- <script>
        $('.cart').click(function(){
            var quantity=1;
            var pro_id=$(this).data('id');
            $.ajax({
                url:"{{route('add-to-cart')}}",
                type:"POST",
                data:{
                    _token:"{{csrf_token()}}",
                    quantity:quantity,
                    pro_id:pro_id
                },
                success:function(response){
                    console.log(response);
					if(typeof(response)!='object'){
						response=$.parseJSON(response);
					}
					if(response.status){
						swal('success',response.msg,'success').then(function(){
							document.location.href=document.location.href;
						});
					}
                    else{
                        swal('error',response.msg,'error').then(function(){
							// document.location.href=document.location.href;
						});
                    }
                }
            })
        });
    </script> --}}
    <script>
        
        $(document).ready(function(){
        /*----------------------------------------------------*/
        /*  Jquery Ui slider js
        /*----------------------------------------------------*/
        if ($("#slider-range").length > 0) {
            const max_value = parseInt( $("#slider-range").data('max') ) || 500;
            const min_value = parseInt($("#slider-range").data('min')) || 0;
            const currency = $("#slider-range").data('currency') || '';
            let price_range = min_value+'-'+max_value;
            if($("#price_range").length > 0 && $("#price_range").val()){
                price_range = $("#price_range").val().trim();
            }

            let price = price_range.split('-');
            $("#slider-range").slider({
                range: true,
                min: min_value,
                max: max_value,
                values: price,
                slide: function (event, ui) {
                    $("#amount").val(currency + ui.values[0] + " -  "+currency+ ui.values[1]);
                    $("#price_range").val(ui.values[0] + "-" + ui.values[1]);
                }
            });
            }
        if ($("#amount").length > 0) {
            const m_currency = $("#slider-range").data('currency') || '';
            $("#amount").val(m_currency + $("#slider-range").slider("values", 0) +
                "  -  "+m_currency + $("#slider-range").slider("values", 1));
            }
        })
    </script>
    <script>
		$(function() {
    $.ajaxSetup({
        headers : {
            'CSRFToken' : getCSRFTokenValue()
        }
    });
});

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
        $(".btnPowder").hide();
        $(".btnMainPowder").click(function(){
            $(".btnPowder").show();
            $(".btnRaw").hide();
        });

        $(".btnMainRaw").click(function(){
            $(".btnRaw").show();
            $(".btnPowder").hide();
        });
        
    });

    $('button[name="price"]').click(function(e) {    
        e.preventDefault();
        $.ajax({
            type: 'get',
            url: '/get-product-price',
            data: { 
                idSize: $(this).val()          
            //    size: $(this).val() 
            },
            success: function(resp) {
                var arr =resp.split('#')                                       
                $(".getPrice").html("AED. "+arr[0]);
                //  $(".price").val(arr[0]);
                  $(".price1").val(arr[0]);
                // alert(resp);
            },
            error: function(resp) {
                alert('error');
            }                
        });    
    });

</script>
<script src="{{asset('frontend/js/jquery.exzoom.js')}}" rel="stylesheet"></script>
    <script>
		$('.btnQuickView').on('click',function(){
            var userid = $(this).attr("id");
			$("#exzoom"+userid).exzoom({
			"navWidth": 60,
			"navHeight": 60,
			"navItemNum": 5,
			"navItemMargin": 7,
			"navBorder": 1,
			"autoPlay": false,
			"autoPlayTimeout": 2000
		});
	});	    
	</script>
=======
@section('title','HERB || PRODUCT PAGE')

@push('styles')
    <link href="{{asset('frontend/css/products.css')}}" rel="stylesheet">
    <link href="{{asset('frontend/css/modal.css')}}" rel="stylesheet">
@endpush

@section('main-content')
  <div class="filters product-filters" id="product-filters">
    @if(count($sub_cat) !== 0)
      <select name="sub-category" id="sub-category-filter" class="filter">
        <option selected disabled>Sub Category</option>
        @foreach($sub_cat as $id=>$cat)
          <option value="{{$id}}">{{$cat}}</option>
        @endforeach
      </select>
      @endif

      <select name="promotion" id="promotion-filter" class="filter">
        <option selected disabled><span>Promotion</span></option>
        <option value="popular"><li>Popular</li></option>
        <option value="trending"><li>Trending</li></option>
        <option value="new"><li>New</li></option>
      </select>

      <select name="sort" id="sorting-filter" class="filter">
        <option selected disabled>Sort By</option>
        <option value="a-z">A to Z</option>
        <option value="z-a">Z to A</option>
        <option value="low-prc">Low Price</option>
        <option value="hgh-prc">High Price</option>
      </select>
  </div>

  <section class="products-catalog">
    @php
        $menu=App\Models\Category::getAllParentWithChild();
    @endphp
      <!-- Side Menu -->
      @if($menu)
      <div class="products-sidebar">
          <div class="categories-menu">
              <h3 class="title">Categories</h3>
              <ul class="cat-list">
                      @foreach($menu as $cat_info)
                        <li><a href="{{route('product-cat',$cat_info->slug)}}">{{$cat_info->title}}</a></li>
                      @endforeach
              </ul>
          </div>
      </div>
      @endif
      <!-- End Sidebar -->
  
      <div id="products-catalog" class="products catalog">
          @if(count($products)>0)
              @foreach($products as $product)
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
                      <button id="{{$product->id}}" class="btn btn-quick-view" 
                      title="Quick View" onclick="showModal(id, `{{$product->photo}}`, {{$Images}}, 
                      `{{$product->title}}`, {{$Forms}}, {{$Sizes}}, {{$minprice}}, {{$maxprice}}, `{{$product->slug}}`)"> 
                          <i class="fa-regular fa-eye"></i><p>Quick View</p></button>
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
          @else
              <p class="no-product">There is no product in this criteria.</p>
          @endif
      </div>
      <div class="modal-container" id="modal-container"></div>
  </section>
@endsection

@push('scripts')
  <script src="{{asset('frontend/js/products.js')}}"></script>
  <script src="{{asset('frontend/js/modal.js')}}"></script>
  <script>
    $(function() {
    $('#product-filters').change(() => {
      let subCat = $('#sub-category-filter').val(),
      promotion = $('#promotion-filter').val();
      sortBy = $('#sorting-filter').val();

      filterQuery('<?=$query?>', subCat, promotion, sortBy, <?=$search?>);
    });
  });
  </script>
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
@endpush