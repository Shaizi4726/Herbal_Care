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

		@yield('main-content')

		<!-- Footer -->
		@include('frontend.layouts.footer')
		<!-- End Footer -->

<<<<<<< HEAD
		<!-- Scripts -->
		<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
		<script src="https://unpkg.com/flickity@2.3.0/dist/flickity.pkgd.min.js"></script>
		<script src="{{asset('frontend/js/jquery.exzoom.js')}}"></script>
		<script src="{{asset('frontend/js/header.min.js')}}"></script>
		<script src="{{asset('frontend/js/index.min.js')}}"></script>
		@stack('scripts')
		<!-- End Scripts -->
=======
	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
	<script src="https://unpkg.com/flickity@2.3.0/dist/flickity.pkgd.min.js"></script>
	<script src="{{asset('frontend/js/jquery.exzoom.js')}}"></script>
	<script src="{{asset('frontend/js/header.min.js')}}"></script>
	<script src="{{asset('frontend/js/main.js')}}"></script>
>>>>>>> f4fe67e758ea4de0998c63203addc2fc3ed4023c
  </body>
</html>