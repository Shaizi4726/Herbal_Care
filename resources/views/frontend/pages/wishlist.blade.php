@extends('frontend.layouts.master')
@section('title','HERB || PRODUCT PAGE')

@push('styles')
    <link href="{{asset('frontend/css/products.css')}}" rel="stylesheet">
    <link href="{{asset('frontend/css/modal.css')}}" rel="stylesheet">
@endpush

@section('main-content')
  <section class="products-catalog">
    @php
      $auth = Auth::check();
    @endphp
      <div id="products-catalog" class="products catalog">
        @if($products->count() > 0)
          @foreach($products as $product)
            @php
              $minprice = $product->attrs()->min('price');
              $maxprice = $product->attrs()->max('price');
              $images = $product->images()->pluck('name');
              $forms = $product->forms()->get(['form_id', 'name']);
              $prod = $product->where('id', $product->id)->first(['id', 'name', 'slug', 'photo']);

              $sizes = array();
              foreach ($forms as $form) {
                ${$form->name . "sizes"} = $product->attrs()->where('form_id', $form->form_id)->pluck('size');
                $sizes[$form->name] =  ${$form->name . "sizes"};
              }
              
              if(count($forms) == 0)
                $sizes = $product->attrs()->pluck('size');
              
              $sizes = json_encode($sizes);
            @endphp
                <div class="product-card {{$product->id}}-card carousel-cell">
                  <img class="product-image" src="{{$product->photo}}" alt="product image">
                  
                  <div class="overlay">
                    <button id="product{{$product->id}}" class="btn btn-quick-view" title="Quick View" onclick="showModal(id, {{$prod}}, {{$sizes}}, {{$images}}, {{$forms}}, {{$minprice}}, {{$maxprice}}, {{$auth}})"> 
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
                  </div>
                </div>
            @endforeach
        @else
          <p class="no-product">There is no product in the wishlist.</p>
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
      /* Show sorting menu*/
      $('#selected-sort').click(() => {
        $('#sorting-list').toggleClass('collapse');
      })
    })
  </script>
@endpush