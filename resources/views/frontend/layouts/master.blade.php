<!DOCTYPE html>
<html lang="en-us">
  <head>
		@php
			$Products = DB::table('products')->get();
		@endphp

		@include('frontend.layouts.head')	
  </head>
  <body>
		<!-- Header -->
		@include('frontend.layouts.header')
		<!-- End Header -->
    
    <section id="main-content">
		  @yield('main-content')
    </section>

		<!-- Footer -->
		@include('frontend.layouts.footer')
		<!-- End Footer -->

		<!-- Scripts -->
		<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
		<script src="https://unpkg.com/flickity@2.3.0/dist/flickity.pkgd.min.js" async></script>
		<script src="{{asset('frontend/js/jquery.exzoom.js')}}" async></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.1/bootstrap3-typeahead.min.js">
		<script src="{{asset('frontend/js/header.js')}}"></script>
		<script src="{{asset('frontend/js/main.js')}}"></script>
		@stack('scripts')
		<!-- End Scripts -->
  </body>
</html>