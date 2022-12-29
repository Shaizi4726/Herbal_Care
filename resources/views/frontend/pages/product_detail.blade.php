@extends('frontend.layouts.master')
@section('title','HerbalCare || PRODUCT DETAIL')

@push('styles')
  <link href="{{asset('frontend/css/product-detail.css')}}" rel="stylesheet">
@endpush

@section('main-content')
	<section id="product-detail" class="modal-content">	
		<div class="shazoom" id="shazoom">
			<div class="img-box">
				<ul class="img-ul">
					<li><img src="{{$product_detail->photo}}" alt="product-photo"></li>
					@foreach($product_detail->images as $image)	
						<li><img src="{{('/images/'.$image->image)}}"/></li>	
					@endforeach										
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
				<h1 class="title">{{$product_detail->title}}</h1>
				<h4 class="subtitle">Scientific Name: {{$product_detail->scientific}}</h4>

				@php
					$rate=ceil($product_detail->getReview->avg('rate'))
				@endphp

				@for($i=1; $i<=5; $i++)
					@if($rate>=$i)
						<i class="fa-solid fa-star"></i>
					@else 
						<i class="fa-regular fa-star"></i>
					@endif
				@endfor

				<a href="#" class="total-review">({{$product_detail['getReview']->count()}}) Review</a>

				<form id="modal-form">
						@php
							$forms = DB::table('products_attributes')->where('product_id', $product_detail->id)->distinct()->pluck('form');

							$Sizes = array();
							foreach ($forms as $form) {
								${$form . "sizes"} = DB::table('products_attributes')->where('product_id', $product_detail->id)->where('form', $form)->pluck('size');
								$Sizes[$form] =  ${$form . "sizes"};
							}
							$Sizes = json_encode($Sizes);

							$minprice = DB::table('products_attributes')->where('product_id', $product_detail->id)->min('price');
              $maxprice = DB::table('products_attributes')->where('product_id', $product_detail->id)->max('price');
						@endphp
					<input type="hidden" name="product-id" value="{{$product_detail->id}}">
					<div class="forms modal-radio" id="forms"></div>
					<div class="prices" id="price">
						<p class="price">AED <span class="value">{{number_format($minprice,2)}}</span> - AED <span class="value">{{number_format($maxprice,2)}}</span></p>
					</div>
					<div class="sizes modal-radio" id="sizes"></div>
					<input type="hidden" name="price-input" id="price-input" value="">
					<div class="qty-manage" id="qty-manage">
						<input type="button" value="-" class="qty-minus minus qty-control" field="quantity" disabled>
						<input type="number" name="quantity" value="1" min="1" class="qty">
						<input type="button" value="+" class="qty-plus plus qty-control" field="quantity">
					</div>
					<input type="button" id="modal-add-list" class="btn btn-submit" value="Add to List" onclick="shopList()">
				</form>

				<form "  action="/add-to-cart" data="{{$product_detail->id}}" id="modal-cart-form">
					<button id="modal-cart-button" class="modal-cart-button">
						<span class="add-to-cart">Add to cart</span>
						<span class="added">Added</span>
						<i class="fas fa-shopping-cart"></i>
						<i class="fas fa-box"></i>
					</button>
				</form>
			</div>

			<div class="modal-shopping-list" id="modal-shopping-list">
					<table id="shopping-list-table">
						<caption>Shopping List</caption>
						<thead>
								<tr>
									<th id="list-frm">Form</th>
									<th id="list-sze">Size</th>
									<th id="list-qty">Qty</th>
									<th id="list-prc">Price</th>
									<th id="list-amt">Amount</th>
								</tr>
						</thead>
						<tbody id="list-body">
						</tbody>
						<tfoot>
							<tr>
								<th colspan="3">Total Amount</th>
								<th colspan="2" id="list-total"></th>
							</tr>
						</tfoot>
					</table>
			</div>
		</div>
	</section>

	<section class="details reviews">
			<div class="details-review-div">
				<input type="radio" id="description-btn" name="details-reviews-btn" value="${item}" checked>
      	<label for="${item}">${item}</label>
			</div>
			<div class="tab-content" id="tab-content">
				<!-- Description Tab -->
				<div class="tab-panel collapse" id="description">
					<div class="tab-single">
						<div class="row">
							<div class="col-12">
								<div class="single-des" id="detail">
									<!--<h3><b>Other Name:</b> {!! $product_detail->summary !!}</h3>  -->
									<h3>
										<b>Benefits:</b>
									</h3>
									<p class="pra"> {!! ($product_detail->benefit) !!}</p>
									<h3>
										<b>Description:</b>
									</h3>
									<p class="pra"> {!! ($product_detail->description) !!}</p>
									<h3>
										<b>Precautions: <b>
									</h3>
									<p class="pra">
										<em>We recommend that you consult with a quaified healthcare pracitioner before using herbal products, particularly if you are pregnant, nursing, or on any medication. <br>This information has not been evaluated by the Food and Drug Administration. <br> This product is not intended to diagnose, treat, cure, or prevent any disease. <br> For educational purpose only.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/ End Description Tab -->
				<!-- Reviews Tab -->
				<div class="tab-panel collapse" id="reviews" role="tabpanel">
					<div class="tab-single review-panel">
						<div class="row">
							<div class="col-12">
								<!-- Review -->
								<div class="comment-review">
									<div class="add-review">
										<h5>Add A Review</h5>
										<p>Your email address will not be published. Required fields are marked</p>
									</div>
									<h4>Your Rating <span class="text-danger">*</span>
									</h4>
									<div class="review-inner">
										<!-- Form --> @auth <form class="form" method="post" action="{{route('review.store',$product_detail->slug)}}"> @csrf <div class="row">
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
																<label class="star-rating__ico fa fa-star-o" for="star-rating-1" title="1 out of 5 stars"></label> @error('rate') <span class="text-danger">{{$message}}</span> @enderror
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-12 col-12">
													<div class="form-group">
														<label>Write a review</label>
														<textarea name="review" rows="6" placeholder=""></textarea>
													</div>
												</div>
												<div class="col-lg-12 col-12">
													<div class="form-group button5">
														<button type="submit" class="btn">Submit</button>
													</div>
												</div>
											</div>
										</form> @else <p class="text-center p-5"> You need to <a href="{{route('login.form')}}" style="color:rgb(54, 54, 204)">Login</a> OR <a style="color:blue" href="{{route('register.form')}}">Register</a>
										</p>
										<!--/ End Form --> @endauth
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
										<h4>{{ceil($product_detail->getReview->avg('rate'))}}
											<span>(Overall)</span>
										</h4>
										<span>Based on {{$product_detail->getReview->count()}} Comments</span>
									</div> @foreach($product_detail['getReview'] as $data)
									<!-- Single Rating -->
									<div class="single-rating">
										<div class="rating-author"> @if($data->user_info['photo']) <img src="{{$data->user_info['photo']}}" alt="{{$data->user_info['photo']}}"> @else <img src="{{asset('backend/img/avatar.png')}}" alt="Profile.jpg"> @endif </div>
										<div class="rating-des">
											<h6>{{$data->user_info['name']}}</h6>
											<div class="ratings">
												<ul class="rating"> @for($i=1; $i<=5; $i++) @if($data->rate>=$i) <li>
															<i class="fa fa-star"></i>
														</li> @else <li>
															<i class="fa fa-star-o"></i>
														</li> @endif @endfor </ul>
												<div class="rate-count">( <span>{{$data->rate}}</span>) </div>
											</div>
											<p>{{$data->review}}</p>
										</div>
									</div>
									<!--/ End Single Rating --> @endforeach
								</div>
								<!--/ End Review -->
							</div>
						</div>
					</div>
				</div>
				<!--/ End Reviews Tab -->
			</div>
	</section>
@endsection

@push('scripts')
	<script src="{{asset('frontend/js/product-detail.js')}}"></script>
	<script>
		var form = "<?= $forms[0] ?>";
		createForms(<?= $forms ?>);
		createSizes(form, <?= $Sizes ?>);
		Price(<?= $product_detail->id ?>);

		window.onload = function() {
  		$(function() {
				$('#modal-add-list').hide();
				/* Actions when form is changed */
				$("[name|='product-form']").change(() => {
					var form = $("[name|='product-form']:checked").val();
					createSizes(form, <?= $Sizes ?>);
					if($("[name|='product-size']:checked").val() == undefined) {
						$("#price").html('<p class="price">AED <span class="value">' + @php echo number_format($minprice,2) @endphp + '</span> - AED <span class="value">' + @php echo number_format($maxprice,2) @endphp + '</span></p>');
						$(".plus").prop('disabled', true);
						$('#modal-add-list').hide();
						$("input.qty").val('1');
						$("input.qty").prop('disabled', true)
						$('.minus').prop('disabled', true);
					}
					Price(<?= $product_detail->id ?>);
				})

				$("#modal-cart-button:eq(0)").hide();

				/* Enable minus button when value of input quantity is greater than 1 and vice versa */
				$('input.qty').change(() => {
					if ($('input.qty').val() > 1)
						$('.minus').prop('disabled', false);
					else
						$('.minus').prop('disabled', true);
				})
			})
		}
	</script>
@endpush