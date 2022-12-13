@extends('frontend.layouts.master')
@section('title','HerbalCare || Home')

@section('main-content')
  @if(count($banners)>0)
    <section id="slider" class="carousel">            
      <ul id="carousel-wrap" class="carousel-wrap">
          @foreach($banners as $key=>$banner)                                    
            <li>
              <picture>
                <source media="(min-width: 480px)" srcset="{{$banner->photo}}">
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

  <section class="index-cat">
    @php
        $category_lists=DB::table('categories')->where('status','active')->where('is_parent','1')->get();
    @endphp

    @if($category_lists)
        @foreach($category_lists as $cat)
          <div class="about-cat clearfix">
            <div class="cat-img">
              @if($cat->photo)
                <img src="{{$cat->photo}}" alt="{{$cat->photo}}">
              @endif
            </div>

            <div class="cat-content">                        
              <h3> {{$cat->title}} </h3>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere autem, excepturi accusamus quis amet sint dolores totam rem dolorem quisquam corrupti, pariatur voluptatem nemo commodi nisi reprehenderit itaque quod cum!
              </p>
            </div>
          </div>
        @endforeach
    @endif    
	</section>
@endsection