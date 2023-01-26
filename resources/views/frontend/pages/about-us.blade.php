@extends('frontend.layouts.master')

@section('title','HerbalCare || About Us')

@push('styles')
  <link href="{{asset('frontend/css/about-us.css')}}" rel="stylesheet">
@endpush

@section('main-content')
	<!-- About Us -->
	<section class="about-us section">
    @php
      $settings=DB::table('settings')->get();
    @endphp

    @foreach($settings as $data)
      <div class="about-img">
        <img src="{{$data->photo}}" alt="About Us image">
      </div>
      <div class="about-content">
        <h2>Welcome To <span>The Herb Room</span></h2>
        <p>{{$data->description}}</p>
      </div>
    @endforeach
	</section>
	<!-- End About Us -->

	@include('frontend.layouts.newsletter')
@endsection
