@extends('frontend.layouts.master')
@section('title','HERB || PRODUCT PAGE')

@push('styles')
    <link href="{{asset('frontend/css/products.css')}}" rel="stylesheet">
    <link href="{{asset('frontend/css/modal.css')}}" rel="stylesheet">
@endpush

@section('main-content')
    
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

        <div class="product-menu">

        <div class="filters product-filters">
            @if(count($sub_cat) !== 0)
            <script>console.log(<?= $sub_cat ?>)</script>
            <select name="sub-category" id="sub-category-filter">
              <option selected disabled>Sub Category</option>
              @foreach($sub_cat as $id=>$cat)
                <option value="{{$id}}">{{$cat}}</option>
              @endforeach
            </select>
            @endif
        </div>
                           
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
                      </div>
        <div class="modal-container" id="modal-container"></div>
    </section>
@endsection

@push('scripts')
  <script src="{{asset('frontend/js/products.js')}}"></script>
  <script src="{{asset('frontend/js/modal.js')}}"></script>
@endpush