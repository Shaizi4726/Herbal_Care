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
        @if($product_detail->scientific)
        <h4 class="subtitle">Scientific Name: {{$product_detail->scientific}}</h4>
        @endif
        
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
            @if($minprice==$maxprice)
              <p class="price">AED <span class="value">{{number_format($minprice,2)}}</span></p>
            @else
              <p class="price">AED <span class="value">{{number_format($minprice,2)}}</span> - AED <span class="value">{{number_format($maxprice,2)}}</span></p>
            @endif            
            </div>
            <div class="sizes modal-radio" id="sizes"></div>
            <input type="hidden" name="price-input" id="price-input" value="">
            <div class="qty-manage" id="qty-manage">
              <input type="button" value="-" class="qty-minus minus qty-control" field="quantity" disabled>
              <input type="number" name="quantity" value="1" min="1" oninput="this.value = Math.abs(this.value)" class="qty">
              <input type="button" value="+" class="qty-plus plus qty-control" field="quantity">
            </div>
            <input type="button" id="detail-add-list" class="btn btn-submit add-list" value="Add to List" onclick="shopList()">
            <i id="cart-button-arrow" class="fa-solid fa-right-long"></i>
            <div class="cart-button-div">
              <button form="modal-cart-form" id="detail-cart-button" class="cart-button">
                <span class="add-to-cart">Add to Cart</span>
                <span class="added">Added</span>
                <i class="fas fa-shopping-cart"></i>
                <i class="fas fa-box"></i>
              </button>
            </div>
          </form>
          
          <form action="/add-to-cart" data="{{$product_detail->id}}" id="modal-cart-form"></form>
        </div>
        
        <section class="popup-section" id="ch-popup-sec">
          <div id="location-popup" class="ch-popup">
            <button id="page-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="location.reload()">Stay on Page</button>
            <button id="shop-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="location.href = `<?= route('home')?>`">Continue Shopping</button>
            @auth
            <button id="chkt-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="location.href = `<?= route('checkout')?>`">Checkout</button>
            @else
            <button id="chkt-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="chOptions()">Checkout</button>
            @endauth
            <button id="guest-chkt-btn" class="btn btn-submit popup-btn chkt-btn collapse" onclick="location.href = `<?= route('checkout')?>`">Checkout as Guest</button>
            <button id="login-chkt-btn" class="btn btn-submit popup-btn chkt-btn collapse" onclick="location.href = `<?= route('login.form')?>?checkout=1`">Login to Checkout</button>
          </div>
        </section>
      
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
		@php
			$benefits = explode('@', $product_detail->benefit);
		@endphp
		
		<div class="details-review-div">
			<button id="details-btn" class="btn details-review-btn" data-toggle="description" onclick="showDetail(this)">Details</button>
			<button id="reviews-btn" class="btn details-review-btn" data-toggle="reviews" onclick="showDetail(this)">Reviews</button>
		</div>
		
		<div class="tab-content" id="tab-content">
			<!-- Description Tab -->
			<div class="tab-panel collapse" id="description">
				@if ($benefits[0])
					<h3>
						 Benefits:
					</h3>
					<ul class="benefits">
						@foreach ($benefits as $benefit)
							<li>{{$benefit}}</li>
						@endforeach
					</ul>
				@endif
				@if ($product_detail->description)
					<h3>
						Description:
					</h3>
					<p class="desc-para">{{$product_detail->description}}</p>
				@endif
				<h3>
					Precautions:
				</h3>
				<ul class="precautions">
					<li>We recommend that you consult with a quaified healthcare pracitioner before using herbal products, particularly if you are pregnant, nursing, or on any medication.</li> 
					<li>This information has not been evaluated by the Food and Drug Administration.</li>
					<li>This product is not intended to diagnose, treat, cure, or prevent any disease.</li> 
					<li>For educational purpose only.</li>
				</ul>
			</div>
			<!-- End Description Tab -->

			<!-- Reviews Tab -->
			<div class="tab-panel collapse" id="reviews">
				<div class="add-review">
					<h3>Add Review</h3>
					<p>Your email address will not be published.</p>
				</div>
        
				<div class="review-inner">
					<h4>Your Rating</h4>

					@auth 
						<form class="form" method="post" action="{{route('review.store',$product_detail->slug)}}"> 
							@csrf 
							<div class="rate">
								<input type="radio" id="star5" name="rate" value="5" />
								<label for="star5" title="text">5 stars</label>
								<input type="radio" id="star4" name="rate" value="4" />
								<label for="star4" title="text">4 stars</label>
								<input type="radio" id="star3" name="rate" value="3" />
								<label for="star3" title="text">3 stars</label>
								<input type="radio" id="star2" name="rate" value="2" />
								<label for="star2" title="text">2 stars</label>
								<input type="radio" id="star1" name="rate" value="1" />
								<label for="star1" title="text">1 star</label>
							</div>

							<div class="form-group">
								<textarea name="review" placeholder="Write a review"  rows="6" cols="50"></textarea>
							</div>

							<div class="form-review-btn">
								<button type="submit" class="btn ">Submit</button>
							</div>
						</form> 
					@else 
						<p class="review-auth-action"> 
							You need to <a href="{{route('login.form')}}" class="review-auth-link form-review-btn btn">Login</a> OR <a href="{{route('register.form')}}" class="review-auth-link form-review-btn btn">Register</a>
						</p>
					@endauth
				</div>

				<div class="user-reviews">
					<div class="prev-reviews">
						<h3>Reviews</h3>
					</div>
					@foreach($product_detail['getReview'] as $data)
						<div class="single-rating">
							<div class="rating-author"> 
								@if($data->user_info['photo']) 
									<img src="{{$data->user_info['photo']}}" alt="User Photo" width="50" height="50"> 
								@else 
									<img src="{{asset('backend/img/avatar.png')}}" alt="Profile Pic" width="50" height="50"> 
								@endif 
								<h4>{{$data->user_info['name']}}</h4>
							</div>

							<div class="rating-des">
								<div class="ratings">
									<ul class="rating"> 
										@for($i=1; $i<=5; $i++) 
											@if($data->rate>=$i) 
												<li> <i class="fa-solid fa-star"></i> </li> 
											@else 
												<li> <i class="fa-regular fa-star"></i> </li> 
											@endif 
										@endfor 
									</ul>
									<span class="rate-count"> ( {{$data->rate}} ) </span>
								</div>
								<p>{{$data->review}}</p>
							</div>
						</div> 
					@endforeach
				</div>
			</div>
			<!--/ End Review -->
		</div>
	</section>
  

	<!-- Start Most Popular -->
	<section class="products-area related-products">
		<div class="section-title">
			<h2>Related Products</h2>
		</div>

		<div class="products">
			<div class="product-slider carousel hero-slider"  data-flickity='{ "autoPlay": 1000, "contain": true, "pageDots": false, "initialIndex": 2 }'>
				@foreach($product_detail->rel_prods as $product)
					@if($product->id !== $product_detail->id)
						@php
								$minprice = DB::table('products_attributes')->where('product_id', $product->id)->min('price');
								$maxprice = DB::table('products_attributes')->where('product_id', $product->id)->max('price');
						@endphp
						<div class="product-card carousel-cell">
							<img class="product-image" src="{{$product->photo}}" alt="product image">

							<div class="meta-detail">
								<h3 class="product-title">{{$product->title}}</h3>
                @if($minprice==$maxprice)
                  <p class="price">AED <span class="value">{{number_format($minprice,2)}}</span></p>
                @else
                  <p class="price">AED <span class="value">{{number_format($minprice,2)}}</span> - AED <span class="value">{{number_format($maxprice,2)}}</span></p>
                @endif							
              </div>
							<div class="prod-detail-link">
								<a href="{{route('product-detail', $product->slug)}}" class="btn btn-submit detail-link"> Product Details </a>
								<button class="btn favbtn" onclick="fav(this)"><i class="fa-regular fa-heart fav"></i></button>
							</div>
						</div>
					@endif
				@endforeach
			</div>
		</div>
	</section>
	<!-- End Most Popular Area -->
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
        shazoom();

				$('.add-list').hide();
				/* Actions when form is changed */
				$("[name|='product-form']").change(() => {
					var form = $("[name|='product-form']:checked").val();
					createSizes(form, <?= $Sizes ?>);
					if($("[name|='product-size']:checked").val() == undefined) {
						$("#price").html('<p class="price">AED <span class="value">' + @php echo number_format($minprice,2) @endphp + '</span> - AED <span class="value">' + @php echo number_format($maxprice,2) @endphp + '</span></p>');
						$(".plus").prop('disabled', true);
						$('.add-list').hide();
						$("input.qty").val('1');
						$("input.qty").prop('disabled', true)
						$('.minus').prop('disabled', true);
					}
					Price(<?= $product_detail->id ?>);
				})

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