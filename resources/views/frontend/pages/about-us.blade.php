@extends('frontend.layouts.master')

@section('title','HerbalCare || About Us')

@section('main-content')
	<!-- About Us -->
	<section class="about-us section">
		<div class="about-content">
			@php
				$settings=DB::table('settings')->get();
			@endphp
			<h3>Welcome To <span>The Herb Room</span></h3>
			<p>@foreach($settings as $data) {{$data->description}} @endforeach</p>
		</div>
		<div class="about-img overlay">
			<img src="@foreach($settings as $data) {{$data->photo}} @endforeach" alt="@foreach($settings as $data) {{$data->photo}} @endforeach">
		</div>
	</section>
	<!-- End About Us -->

	@include('frontend.layouts.newsletter')
@endsection
