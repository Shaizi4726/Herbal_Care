@extends('main.layouts.master')

@section('title') 
  {{ $blog->title }} - Blog || HerbalCare 
@endsection

@push('styles')
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;0,900;1,400;1,700;1,900&family=Source+Sans+3:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&display=swap" rel="stylesheet">
  <link href="{{asset('css/blogs/blog.min.css')}}" rel="stylesheet">
@endpush

@section('main-content')
  <section class="blog-section">
    <h1>{{ $blog->title }}</h1>
    <img src="images/blogs/{{ $blog->image }}" alt="{{ $blog->title }} Image">
    {!! $blog->post !!}
  </section>
@endsection