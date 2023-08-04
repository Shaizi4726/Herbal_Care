@extends('main.layouts.master')
@section('title', 'Blogs || HerbalCare')

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;0,900;1,400;1,700;1,900&family=Source+Sans+3:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&display=swap" rel="stylesheet">
<link href="{{asset('css/blogs/main/blogs.min.css')}}" rel="stylesheet">

@section('main-content')
  <div class="blogs-carousel">
    @foreach($blogs as $blog)
      <div class="blog-card">
        <img class="blog-img" src="images/blogs/{{ $blog->image }}" alt="{{ $blog->title }} Image">

        <div class="meta-detail">
          <h2 class="card-blog-title">{{ $blog->title }}</h2>
        </div>
        <div class="read-more-link">
          <a href="{{route('blogs.show', $blog->slug)}}" class="btn btn-submit detail-link"> Read More </a>
        </div>
      </div>
    @endforeach
  </div>
@endsection