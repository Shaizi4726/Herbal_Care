@extends('frontend.layouts.master')
@section('title','HerbalCare || PRODUCT DETAIL')

@section('main-content')
	<section id="product-detail">	
		<div class="exzoom" id="exzoom">
			<div class="exzoom_img_box">
				<ul class="exzoom_img_ul">
					<li><img src="{{$product_detail->photo}}" alt="product-photo"></li>
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
					<input type="hidden" name="id" value="{{$product_detail->id}}">
					<div class="forms modal-radio" id="forms">
						@php
							$forms=DB::table('product_forms')->orderBy('title','DESC')->get();
						@endphp
						<script>createForms(@php echo $forms @endphp)</script>     
					</div>
					<div class="prices" id="price">
						<h3>AED ${args[6]} - AED ${args[7]}</h3>
					</div>
					<div class="sizes modal-radio" id="sizes"></div>
					<input type="hidden" name="price-input" id="price-input" value="">
					<div class="qty-manage" id="qty-manage">
						<input type="button" value="-" class="qty-minus minus qty-control" field="quantity" disabled>
						<input type="number" name="quantity" value="1" min="1" class="qty">
						<input type="button" value="+" class="qty-plus plus qty-control" field="quantity">
					</div>
					<input type="button" id="modal-submit" class="btn btn-submit" value="Add to List" onclick="shopList()">
				</form>

				<form "  action="/add-to-cart" data="${args[0]}" id="modal-cart-form">
					<button id="modal-cart-button" class="modal-cart-button">
						<span class="add-to-cart">Add to cart</span>
						<span class="added">Added</span>
						<i class="fas fa-shopping-cart"></i>
						<i class="fas fa-box"></i>
					</button>
				</form>
				
				<a href="/product-detail/${args[0]}" class="modal-view-link btn" id="modal-view-link"><i class="fa-solid fa-circle-info" id="product-details-icon"></i>VIEW PRODUCT DETAILS</a>
			</div>

			<div class="modal-shopping-list" id="modal-shopping-list">
					<table id="shopping-list-table">
						<caption>Shopping List</caption>
						<thead>
								<tr>
									<th id="list-frm">Form</th>
									<th id="list-sze">Size</th>
									<th id="list-qty">Quantity</th>
									<th id="list-prc">Unit Price</th>
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
@endsection

@push('scripts')
	<script>
		var exzoom = function(){
    $("#exzoom").exzoom({
      "autoPlay": false,
    });
  };
  exzoom();
	</script>
@endpush