<!DOCTYPE html>
<html lang="en-us">
  <head>
		@include('frontend.layouts.head')	
  </head>
  <body>
	<!-- Header -->
	@include('frontend.layouts.header')
	<!-- End Header -->

	<!-- @yield('main-content') -->

	<!-- Footer -->
	@include('frontend.layouts.footer')
	<!-- End Footer -->

	<!-- Scripts -->
	<script src="{{asset('frontend/js/jquery.exzoom.js')}}"></script>
	<script src="{{asset('frontend/js/header.min.js')}}"></script>
	<!-- End Scripts -->
  </body>
</html>