@extends('frontend.layouts.master')
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
                    <button id="{{$product->id}}" class="btn btn-quick-view" title="Quick View" onclick="showModal(id, `{{$product->photo}}`, {{$Images}}, `{{$product->title}}`, {{$Forms}}, {{$Sizes}}, {{$minprice}}, {{$maxprice}}, `{{$product->slug}}`, {{Auth::check()}})"> 
                      <i class="fa-regular fa-eye"></i>
                      <p>Quick View</p>
                    </button>
                  </div>

                  <div class="meta-detail">
                    <h3 class="product-title">{{$product->title}}</h3>
                    @if($minprice==$maxprice)
                      <p class="price">AED <span class="value">{{number_format($product->minprice,2)}}</span></p>
                    @else
                      <p class="price">AED <span class="value">{{number_format($product->minprice,2)}}</span> - AED <span class="value">{{number_format($maxprice,2)}}</span></p>
                    @endif                  
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
                  <button class="btn favbtn" onclick="window.location.href = '/user/login';"><i class="fa-regular fa-heart fav"></i></button>
                @endauth
                  </div>
                  </div>
              @endforeach
          @else
              <p class="no-product">There is no product in this category.</p>
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

    urlString = location.href;
    var childCatId = new URL(urlString).searchParams.get('subCat');
    if(childCatId) {
      $('#sub-category-filter').val(childCatId);
      filterQuery('<?=$query?>', childCatId, undefined, undefined, 0);
    }
})
  </script>
@endpush