
@extends('frontend.layouts.master')
@section('meta')
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name='copyright' content=''>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="keywords" content="online shop, purchase, cart, ecommerce site, best online shopping">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Inconsolata' rel='stylesheet' type='text/css'>

@section('title','HERB || PRODUCT DETAIL')
@section('main-content')

		<!-- Breadcrumbs -->
		<!-- <div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="bread-inner">
							<ul class="bread-list">
								<li><a href="{{route('home')}}">Home<i class="ti-arrow-right"></i></a></li>									
								<li class="active"><a href="">Shop Details</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div> -->
		<!-- End Breadcrumbs -->
				
		<!-- Shop Single -->
		<section class="shop single section">
			<div class="container">
				<div class="row"> 
					<div class="col-12">
						<div class="row">
							<div class="col-lg-6 col-12">
								<!-- Product Slider -->
								<!-- <div class="product-gallery"> -->
									<!-- Images slider -->																							
									@php
										$images=DB::table('images')->orderBy('id','asc')->get();
									@endphp
									
									@php 
										$photo=explode(',',$product_detail->photo);
									// dd($photo);
									@endphp
									
									<div class="exzoom" id="exzoom">
											<!-- Images -->
										<div class="exzoom_img_box">										
											<ul class='exzoom_img_ul'>
												@foreach($photo as $data)
													<li><img src="{{$data}}"/></li>	
												@endforeach		
												@foreach($product_detail->images as $image)	
													<li><img src="{{('/images/'.$image->image)}}"/></li>	
												@endforeach										
											</ul>											
										</div>										
										<div class="exzoom_nav"></div>
										<!-- Nav Buttons -->
											<p class="exzoom_btn">
												<a href="javascript:void(0);" class="exzoom_prev_btn"> < </a>
												<a href="javascript:void(0);" class="exzoom_next_btn"> > </a>
											</p>
										</div>																																																																					
									<!-- </div> -->
								<!-- End Product slider -->
							</div>
							<div class="col-lg-6 col-12">
								<div class="product-des">
									<!-- Description -->
									<div class="short">
										<h1>{{$product_detail->title}}</h1> <br>
										<h4>Scientific Name: {!! $product_detail->scientific !!}</h4>												
										<div class="rating-main">
											<ul class="rating">
												@php
													$rate=ceil($product_detail->getReview->avg('rate'))
												@endphp
													@for($i=1; $i<=5; $i++)
														@if($rate>=$i)
															<li><i class="fa fa-star"></i></li>
														@else 
															<li><i class="fa fa-star-o"></i></li>
														@endif
													@endfor
											</ul>
											<a href="#" class="total-review">({{$product_detail['getReview']->count()}}) Review</a>
										</div>
										<div class="col-lg-12 col-12">
												<p style="width:200px;">
													@php
														$forms=DB::table('product_forms')->orderBy('title','DESC')->get();
													@endphp
													@foreach($product_detail->attributes as $sizes)
													@endforeach
													@foreach($forms as $form)                                                        
														@if($sizes->form)
															<button class="btn button btnMain{{$form->title}}" name="size" style="width:80px;height:30px;margin-right:5px;" value="{{$sizes->product_id}}-{{$form->title}}">{{$form->title}} </button>
														@endif
													@endforeach                                                                                                    
												</p>
											</div> 
											
											
											
								<!--        @php 
											$after_discount=($product_detail->price-(($product_detail->price*$product_detail->discount)/100));
										@endphp -->
										@php
											$minprice =  DB::table('products_attributes')->where('product_id',$sizes->product_id)->min('price');      
											$maxprice =  DB::table('products_attributes')->where('product_id',$sizes->product_id)->max('price');                                                         
										@endphp
										
										<h4 class="price"><span class="getPrice" >AED. {{number_format($minprice,2)}} - {{number_format($maxprice,2)}} </span></h4>
										<!-- <h4 class="price"><span class="getPrice" >AED {{number_format($product_detail->price,2)}}</span><!--<s>AED {{number_format($product_detail->price,2)}}</s> </p></h4> -->
										
									</div>
									<br>
									<!--/ End Description -->
									<!-- Color -->
									{{-- <div class="color">
										<h4>Available Options <span>Color</span></h4>
										<ul>
											<li><a href="#" class="one"><i class="ti-check"></i></a></li>
											<li><a href="#" class="two"><i class="ti-check"></i></a></li>
											<li><a href="#" class="three"><i class="ti-check"></i></a></li>
											<li><a href="#" class="four"><i class="ti-check"></i></a></li>
										</ul>
									</div> --}}
									<!--/ End Color -->
									<!-- Size -->
									<!--
										<div class="size mt-12">
											<h4>Size</h4>
											<ul>
										@foreach($product_detail->attributes as $sizes)	
											<li id="selSize"><a href="#">{{$sizes->size}}</a></li>
										@endforeach
											</ul>
										</div>
									-->
									<div class="col-lg-12 col-15">
												
										<p style="width:200px;">
											@foreach($product_detail->attributes as $sizes)           
												<button class="btn button btn{{$sizes->form}}" name="price" style="width:80px;height:30px;margin-right: 5px;margin-top: 5px;" value="{{$sizes->id}}-{{$sizes->size}}">{{$sizes->size}} </button>
											@endforeach
											
										</p>
									</div>
									
									<!--/ End Size -->
									<!-- Product Buy -->
									
									<div class="product-buy" >
									<div class="row">
										<form action="{{route('single-add-to-cart')}}" method="POST" class="mt-4">
											@csrf 																								
												<!-- <h6>Quantity :</h6> -->
												<!-- Input Order -->
												<div class="input-group">
													<div class="button minus"  >
														<button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]" >
															<i class="ti-minus"></i>
														</button>
													</div><br>
													
													@foreach($product_detail->attributes as $sizes)
													@if($product_detail->id == $sizes->product_id) 
													
														
													<input type="hidden" class="price1" id="price1" name="price" value="{{$sizes->price}}">                                                                                                                                                                                                                                                                                                                                                                  											
													<input type="hidden" class="size" id="size" name="size" value="{{$sizes->size}}">
													<input type="hidden" class="sku" id="sku" name="sku" value="{{$sizes->sku}}">
														
													@endif  
													
													@endforeach
													<input type="hidden" name="slug" value="{{$product_detail->slug}}">
													
													<input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1" id="quantity" style="width: 50px;">&nbsp;
													<div class="button plus">
														<button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]"  >
															<i class="ti-plus"></i>
														</button><br>
													</div><br>
													</form>
												<!--/ End Input Order -->
											
													<button type="submit" class="btn" >Add to cart</button>&nbsp;
													<!--		<a href="{{route('add-to-wishlist',$product_detail->slug)}}" class="btn min"><i class="ti-heart"></i></a> -->
												
										

										<!--
										<p class="cat">Category :<a href="{{route('product-cat',$product_detail->cat_info['slug'])}}">{{$product_detail->cat_info['title']}}</a></p>
										@if($product_detail->sub_cat_info)
										<p class="cat mt-1">Sub Category :<a href="{{route('product-sub-cat',[$product_detail->cat_info['slug'],$product_detail->sub_cat_info['slug']])}}">{{$product_detail->sub_cat_info['title']}}</a></p>
										@endif  -->
										<!--		<p class="availability">Stock : @if($product_detail->stock>0)<span class="badge badge-success">{{$product_detail->stock}}</span>@else <span class="badge badge-danger">{{$product_detail->stock}}</span>  @endif</p> -->
									
										<!--/ End Product Buy -->

									<!--
										<form action="{{route('add-to-wishlist',$product_detail->slug)}}" method="get">
											@csrf 
											
													Input Order 
																											
													<input type="hidden" name="slug" value="{{$product_detail->slug}}">
													
												<button type="Submit" class="btn min"><i class="ti-heart"></i></button>
											
										</form>-->
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="product-info">
									<div class="nav-main">
										<!-- Tab Nav -->
										<ul class="nav nav-tabs" id="myTab" role="tablist">
											<li class="nav-item button details btnDetail" ><a class="nav-link" data-toggle="tab" href="#description" role="tab">Details</a></li>
											<li class="nav-item button reviews btnReview"><a class="nav-link" data-toggle="tab" href="#reviews" role="tab">Reviews</a></li>
										</ul>
										<!--/ End Tab Nav -->
									</div>
									<div class="tab-content" id="myTabContent">
										<!-- Description Tab -->
								
										<div class="tab-pane fade show1 " id="description" role="tabpanel">
																					
											<!-- <b>Show Details You must be loggin<b></a>  -->
											<div class="tab-single">
												<div class="row" >
													<div class="col-12">
														<div class="single-des" id="detail">
											
														<!--	<h3><b>Other Name:</b> {!! $product_detail->summary !!}</h3>  -->
															<h3><b>Benefits:</b></h3><p> {!! ($product_detail->benafit) !!}</p> 
															<h3> <b>Description:</b></h3><p> {!! ($product_detail->description) !!}</p> 
															<h3><b>Precautions:<b></h3>
															<p style="color:black;"><em>We recommend that you consult with a quaified healthcare pracitioner before using herbal 
																products, particularly if you are pregnant, nursing, or on any medication. <br>This information has not been evaluated by the 
																Food and Drug Administration.<br> This product is not intended to diagnose, treat, cure, or prevent any disease.<br> For educational purpose only.</p>
														
														</div>
													</div>
												</div>
											</div>													
										</div>																								
										<!--/ End Description Tab -->
										<!-- Reviews Tab -->
										<div class="tab-pane fade hide1" id="reviews" role="tabpanel">
											<div class="tab-single review-panel">
												<div class="row">
													<div class="col-12">
														
														<!-- Review -->
														<div class="comment-review">
															<div class="add-review">
																<h5>Add A Review</h5>
																<p>Your email address will not be published. Required fields are marked</p>
															</div>
															<h4>Your Rating <span class="text-danger">*</span></h4>
															<div class="review-inner">
																	<!-- Form -->
														@auth
														<form class="form" method="post" action="{{route('review.store',$product_detail->slug)}}">
															@csrf
															<div class="row">
																<div class="col-lg-12 col-12">
																	<div class="rating_box">
																		<div class="star-rating">
																			<div class="star-rating__wrap">
																			<input class="star-rating__input" id="star-rating-5" type="radio" name="rate" value="5">
																			<label class="star-rating__ico fa fa-star-o" for="star-rating-5" title="5 out of 5 stars"></label>
																			<input class="star-rating__input" id="star-rating-4" type="radio" name="rate" value="4">
																			<label class="star-rating__ico fa fa-star-o" for="star-rating-4" title="4 out of 5 stars"></label>
																			<input class="star-rating__input" id="star-rating-3" type="radio" name="rate" value="3">
																			<label class="star-rating__ico fa fa-star-o" for="star-rating-3" title="3 out of 5 stars"></label>
																			<input class="star-rating__input" id="star-rating-2" type="radio" name="rate" value="2">
																			<label class="star-rating__ico fa fa-star-o" for="star-rating-2" title="2 out of 5 stars"></label>
																			<input class="star-rating__input" id="star-rating-1" type="radio" name="rate" value="1">
																			<label class="star-rating__ico fa fa-star-o" for="star-rating-1" title="1 out of 5 stars"></label>
																			@error('rate')
																				<span class="text-danger">{{$message}}</span>
																			@enderror
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-lg-12 col-12">
																	<div class="form-group">
																		<label>Write a review</label>
																		<textarea name="review" rows="6" placeholder="" ></textarea>
																	</div>
																</div>
																<div class="col-lg-12 col-12">
																	<div class="form-group button5">	
																		<button type="submit" class="btn">Submit</button>
																	</div>
																</div>
															</div>
														</form>
														@else 
														<p class="text-center p-5">
															You need to <a href="{{route('login.form')}}" style="color:rgb(54, 54, 204)">Login</a> OR <a style="color:blue" href="{{route('register.form')}}">Register</a>

														</p>
														<!--/ End Form -->
														@endauth
															</div>
														</div>
													
														<div class="ratting-main">
															<div class="avg-ratting">
																{{-- @php 
																	$rate=0;
																	foreach($product_detail->rate as $key=>$rate){
																		$rate +=$rate
																	}
																@endphp --}}
																<h4>{{ceil($product_detail->getReview->avg('rate'))}} <span>(Overall)</span></h4>
																<span>Based on {{$product_detail->getReview->count()}} Comments</span>
															</div>
															@foreach($product_detail['getReview'] as $data)
															<!-- Single Rating -->
															<div class="single-rating">
																<div class="rating-author">
																	@if($data->user_info['photo'])
																	<img src="{{$data->user_info['photo']}}" alt="{{$data->user_info['photo']}}">
																	@else 
																	<img src="{{asset('backend/img/avatar.png')}}" alt="Profile.jpg">
																	@endif
																</div>
																<div class="rating-des">
																	<h6>{{$data->user_info['name']}}</h6>
																	<div class="ratings">

																		<ul class="rating">
																			@for($i=1; $i<=5; $i++)
																				@if($data->rate>=$i)
																					<li><i class="fa fa-star"></i></li>
																				@else 
																					<li><i class="fa fa-star-o"></i></li>
																				@endif
																			@endfor
																		</ul>
																		<div class="rate-count">(<span>{{$data->rate}}</span>)</div>
																	</div>
																	<p>{{$data->review}}</p>
																</div>
															</div>
															<!--/ End Single Rating -->
															@endforeach
														</div>
														
														<!--/ End Review -->
														
													</div>
												</div>
											</div>
										</div>
										<!--/ End Reviews Tab -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--/ End Shop Single -->
		
		<!-- Start Most Popular -->
	<div class="product-area most-popular related-product section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>Related Products</h2>
					</div>
				</div>
			</div>
			<div class="row">
				{{-- {{$product_detail->rel_prods}} --}}
				<div class="col-12">
					<div class="owl-carousel popular-slider">
						@foreach($product_detail->rel_prods as $data)
							@if($data->id !==$product_detail->id)
								<!-- Start Single Product -->
								<div class="single-products">
									<div class="product-img">
										<a href="{{route('product-detail',$data->slug)}}">
											@php 
												$photo=explode(',',$data->photo);
											@endphp
											<img class="default-img" src="{{$photo[0]}}" alt="{{$photo[0]}}">
											<!-- <img class="hover-img" src="{{$photo[0]}}" alt="{{$photo[0]}}"> -->
											<span class="price-dec">{{$data->discount}} % Off</span>
												{{-- <span class="out-of-stock">Hot</span> --}}
										</a>
										<!--<div class="button-head">
										   <div class="product-action">
												<a data-toggle="modal" data-target="#modelExample" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>  -->
										<!--	<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>-->
										<!-- <div class="product-overlay ">
											<div class="overlay-content ">
												<div class="button-head ">
													<div class="product-action " >
														<h3 style="display: none;"><a href="{{route('product-detail',$product_detail->slug)}}" style="color: black;" >{{$product_detail->title}}</a></h3>
														<h3><a data-toggle="modal" data-target="#{{$product_detail->id}}" title="Quick View" href="#"><i class=" ti-eye"><br></i><span><i>Quick Shop</i></span></a></h3>
													<!--    <h3><a title="Wishlist" href="{{route('add-to-wishlist',$product_detail->slug)}}" class="wishlist" data-id="{{$product_detail->id}}"><i class=" ti-heart "></i><span>Add to Wishlist</span></a></h3> 
													</div>  
												</div>
												<div class="product-action-2 ">
														
												<!--<a title="Add to cart" href="{{route('add-to-cart',$product_detail->slug)}}">Add to cart</a>  
												</div>
											</div>
										</div> -->
									</div>
									<div class="product-content">
										<h3><a href="{{route('product-detail',$data->slug)}}">{{$data->title}}</a></h3>
										<div class="product-price">
											<!-- @php 
												$after_discount=($data->price-(($data->discount*$data->price)/100));
											@endphp -->
											@php
												$minprice =  DB::table('products_attributes')->where('product_id',$data->id)->min('price');      
												$maxprice =  DB::table('products_attributes')->where('product_id',$data->id)->max('price');                                                         
											@endphp 
										<!--	<span class="old">AED. {{number_format($data->price,2)}}</span>-->
											<span>AED. {{number_format($minprice,2)}} - {{number_format($maxprice,2)}}</span>
										</div>
									
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
	

<!-- Modal -->
<div class="modal fade" id="modelExample" tabindex="-1" role="dialog">
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
									<div class="single-slider">
										<img src="images/modal1.png" alt="#">
									</div>
									<div class="single-slider">
										<img src="images/modal2.png" alt="#">
									</div>
									<div class="single-slider">
										<img src="images/modal3.png" alt="#">
									</div>
									<div class="single-slider">
										<img src="images/modal4.png" alt="#">
									</div>
								</div>
							</div>
						<!-- End Product slider -->
					</div>
					<!-- <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<div class="quickview-content">
							<h2>Flared Shift Dress</h2>
							<div class="quickview-ratting-review">
								<div class="quickview-ratting-wrap">
									<div class="quickview-ratting">
										<i class="yellow fa fa-star"></i>
										<i class="yellow fa fa-star"></i>
										<i class="yellow fa fa-star"></i>
										<i class="yellow fa fa-star"></i>
										<i class="fa fa-star"></i>
									</div>
									<a href="#"> (1 customer review)</a>
								</div>
								<div class="quickview-stock">
									<span><i class="fa fa-check-circle-o"></i> in stock</span>
								</div>
							</div>
							<h3>$29.00</h3>
							<div class="quickview-peragraph">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam.</p>
							</div>
							<div class="size">
								<div class="row">
									<div class="col-lg-6 col-12">
										<h5 class="title">Size</h5>
										<select>
											<option selected="selected">s</option>
											<option>m</option>
											<option>l</option>
											<option>xl</option>
										</select>
									</div>
									<div class="col-lg-6 col-12">
										<h5 class="title">Color</h5>
										<select>
											<option selected="selected">orange</option>
											<option>purple</option>
											<option>black</option>
											<option>pink</option>
										</select>
									</div>
								</div>
							</div>
							<div class="quantity">
								<!-- Input Order 
								<div class="input-group">
									<div class="button minus">
										<button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
											<i class="ti-minus"></i>
										</button>
									</div>
									<input type="text" name="qty" class="input-number"  data-min="1" data-max="1000" value="1">
									<div class="button plus">
										<button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
											<i class="ti-plus"></i>
										</button>
									</div>
								</div>
								<!--/ End Input Order
							</div>
							<div class="add-to-cart">
								<a href="#" class="btn">Add to cart</a>
						<!--       <a href="#" class="btn min"><i class="ti-heart"></i></a>
								<a href="#" class="btn min"><i class="fa fa-compress"></i></a>  
							</div>
							<!-- <div class="default-social">
								<h4 class="share-now">Share:</h4>
								<ul>
									<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
									<li><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
								</ul>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- Modal end -->

@endsection
@push('styles')
	<style>
		/* Rating */
		.rating_box {
		display: inline-flex;
		}

		.star-rating {
		font-size: 0;
		padding-left: 10px;
		padding-right: 10px;
		}

		.star-rating__wrap {
		display: inline-block;
		font-size: 1rem;
		}

		.star-rating__wrap:after {
		content: "";
		display: table;
		clear: both;
		}

		.star-rating__ico {
		float: right;
		padding-left: 2px;
		cursor: pointer;
		color: #F7941D;
		font-size: 16px;
		margin-top: 5px;
		}

		.star-rating__ico:last-child {
		padding-left: 0;
		}

		.star-rating__input {
		display: none;
		}

		.star-rating__ico:hover:before,
		.star-rating__ico:hover ~ .star-rating__ico:before,
		.star-rating__input:checked ~ .star-rating__ico:before {
		content: "\F005";
		}
		
		
	</style>

@endpush
@push('scripts')
<link rel="stylesheet" type="text/css" href="magnifier.css">
    {{-- <script>
        $('.cart').click(function(){
            var quantity=$('#quantity').val();
            var pro_id=$(this).data('id');
            // alert(quantity);
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
							document.location.href=document.location.href;
						});
                    }
                }
            })
        });

		
    </script> --}}	
	<script>
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

	$(document).ready(function(){
		$(".hide1").hide();
		$(".btnDetail").click(function(){
			$(".show1").show();
			$(".hide1").hide();
		});

		$(".btnReview").click(function(){
			$(".show1").hide();
			$(".hide1").show();
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
				$(".price").val(arr[0]);
				$(".price1").val(arr[0]);
				
			//  alert(resp);
			},
			error: function(resp) {
				alert('error');
			}
			
			
		});
		
	});



	</script>
	<script src="{{asset('frontend/js/jquery.exzoom.js')}}" rel="stylesheet"></script>
	<script>
		$(function(){
			
			$("#exzoom").exzoom({
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
@endpush