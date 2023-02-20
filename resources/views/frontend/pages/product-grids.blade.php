@extends('frontend.layouts.master')
@section('title','HERB || PRODUCT PAGE')

@push('styles')
    <link href="{{asset('frontend/css/products.css')}}" rel="stylesheet">
    <link href="{{asset('frontend/css/modal.css')}}" rel="stylesheet">
@endpush

@section('main-content')
  <div class="sorts product-sorts" id="product-sorts">
    <span>Sort by: </span>
    <span id="selected-sort" class="selected-sort dropdown-toggle">Random</span>
    <ul id="sorting-list" class="sorting-list collapse">
      <li class="selected sort-list-item" data="rand" onclick="sort(this, {{$query}})">Random</li>
      <li class="sort-list-item" data="z-a" onclick="sort(this, {{$query}})">Z to A</li>
      <li class="sort-list-item" data="a-z" onclick="sort(this, {{$query}})">A to Z</li>
      <li class="sort-list-item" data="low-prc" onclick="sort(this, {{$query}})">Low Price</li>
      <li class="sort-list-item" data="hgh-prc" onclick="sort(this, {{$query}})">High Price</li>
      <li class="sort-list-item" data="new" onclick="sort(this, {{$query}})">New</li>
      <li class="sort-list-item" data="popular" onclick="sort(this, {{$query}})">Popular</li>
      <li class="sort-list-item" data="trending" onclick="sort(this, {{$query}})">Trending</li>
    </ul>
  </div>

  <section class="products-catalog">
      <!-- Side Menu -->
      @if($cats)
      <div class="products-sidebar">
          <div class="categories-menu">
              <h3 class="title">Categories</h3>
              <ul class="cat-list">
                @foreach($cats as $cat)
                  @php
                  $auth = Auth::check();
                    $subcats = $cat->subcat()->get();
                  @endphp
                  
                  @if(count($subcats) != 0)
                    <li class="dropdown-toggle"><a href="{{route('product-cat', $cat->slug)}}">{{$cat->name}}</a></li>
                    <ul class="subcat-menu">
                      @foreach($subcats as $subcat)
                        <li><a href="{{route('product-subcat', [$cat->slug, $subcat->slug])}}">{{$subcat->name}}</li>
                      @endforeach
                    </ul>
                  @else
                    <li><a href="{{route('product-cat', $cat->slug)}}">{{$cat->name}}</a>
                  @endif
                @endforeach
              </ul>
          </div>
      </div>
      @endif
      <!-- End Sidebar -->
  
      <div id="products-catalog" class="products catalog">
        @if($products->count() > 0)
            @foreach($products as $product)
            @php
              $minprice = $product->attrs()->min('price');
              $maxprice = $product->attrs()->max('price');
              $images = $product->images()->pluck('name');
              $forms = $product->forms()->get(['form_id', 'name']);
              $prod = $product->where('id', $product->id)->first(['id', 'name', 'photo']);

              $sizes = array();
              foreach ($forms as $form) {
                ${$form->name . "sizes"} = $product->attrs()->where('form_id', $form->form_id)->pluck('size');
                $sizes[$form->name] =  ${$form->name . "sizes"};
              }
              
              if(count($forms) == 0)
                $sizes = $product->attrs()->pluck('size');
              
              $sizes = json_encode($sizes);

              if($auth)
                $wishlist = $product->wishlists()->where('user_id', Auth::user()->id)->get();
            @endphp

                <div class="product-card {{$product->id}}-card carousel-cell">
                <img class="product-image" src="{{$product->photo}}" alt="product image">
                
                <div class="overlay">
                  <button id="trn{{$product->id}}" class="btn btn-quick-view" title="Quick View" onclick="showModal(id, {{$prod}}, {{$sizes}}, {{$images}}, {{$forms}}, {{$minprice}}, {{$maxprice}}, {{$auth}})"> 
                    <i class="fa-regular fa-eye"></i>
                    <p>Quick View</p>
                  </button>
                </div>

                <div class="meta-detail">
                  <h3 class="product-title">{{$product->name}}</h3>
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

      /* Show sorting menu*/
      $('#selected-sort').click(() => {
        $('#sorting-list').toggleClass('collapse');
      })
    })
  </script>
@endpush