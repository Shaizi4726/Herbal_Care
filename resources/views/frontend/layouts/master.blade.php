<!DOCTYPE html>
<html lang="en-us">
  <head>
<<<<<<< HEAD
		@include('frontend.layouts.head')	
  </head>
  <body>
	  <!-- Header -->
	  @include('frontend.layouts.header')
	  <!--/ End Header -->

	  @yield('main-content')

	  <!-- Footer-->
	  @include('frontend.layouts.footer')


		<!-- Scripts -->
		<script src="{{asset('frontend/js/jquery.exzoom.js')}}"></script>
		<script src="{{asset('frontend/js/main.js')}}"></script>
=======
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

		<!-- Scripts -->
		<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
		<script src="https://unpkg.com/flickity@2.3.0/dist/flickity.pkgd.min.js"></script>
		<script src="{{asset('frontend/js/jquery.exzoom.js')}}"></script>
		<script src="{{asset('frontend/js/header.js')}}"></script>
		<script src="{{asset('frontend/js/main.js')}}"></script>
		@stack('scripts')
		<!-- End Scripts -->
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
  </body>
</html>