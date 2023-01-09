<<<<<<< HEAD

	<!-- Start Footer Area -->
<footer class="footer shop" >
<div class="" id="footerFixed fixed-bottom">                          
                        <div class="col-lg-3 col-md-3 col-sm-6" >
                            <!-- Start Single Service -->
                            <div class="single-service" >
                             
                                <h4 class="footerFixed1"><i class="fa-solid fa-rocket"></i>Free shipping <br>Orders over AED. 100</h4>
                                 <!-- <p style="color: #e4d7b5;">Orders over AED. 100</p>  -->
                            </div>
                            <!-- End Single Service -->
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 ">
                            <!-- Start Single Service -->
                            <div class="single-service">
                                <h4 class="footerFixed1"><i class="fa-solid fa-clock-rotate-left"></i>Free Return <br>Within 30 days returns</h4>
                                 <!-- <p style="color: #e4d7b5;">Within 30 days returns</p>  -->
                            </div>
                            <!-- End Single Service -->
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6">
                            <!-- Start Single Service -->
                            <div class="single-service">
                                
                                <h4 class="footerFixed1"><i class="fa-solid fa-lock"></i>Secure Payment<br>100% secure payment</h4>
                                 <!-- <p style="color: #e4d7b5;">100% secure payment</p>  -->
                            </div>
                            <!-- End Single Service -->
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6">
                            <!-- Start Single Service -->
                            <div class="single-service">
                             
                                <h4 class="footerFixed1"><i class="fa-solid fa-tag"></i>Best Price <br>Guaranteed price</h4>
                                 <!-- <p style="color:#e4d7b5;">Guaranteed price</p>  -->
                            <!-- End Single Service -->
                        </div>
        		</div> 
			</div>
		<!-- Footer Top -->
	<div class="footer-top section">			
		<div class="container">
			<div class="row">					
				<div class="col-lg-5 col-md-6 col-12">
					<!-- Single Widget -->
					<div class="single-footer about">
						<div class="logo">
							<a href="index.html"><img src="{{asset('backend/img/logo2.png')}}" alt="#"></a>
						</div>
						@php
							$settings=DB::table('settings')->get();
						@endphp
						<p class="text">@foreach($settings as $data) {{$data->short_des}} @endforeach</p>
						<p class="call">Got Question? Call us 24/7<span><a href="tel:123456789">@foreach($settings as $data) {{$data->phone}} @endforeach</a></span></p>
					</div>
					<!-- End Single Widget -->
				</div>
				<div class="col-lg-2 col-md-6 col-12">
					<!-- Single Widget -->
					<div class="single-footer links">
						<h4 >Information</h4>
						<ul>
							<li><a href="{{route('about-us')}}">About Us</a></li>
							<li><a href="#">Faq</a></li>
							<li><a href="#">Terms & Conditions</a></li>
							<li><a href="{{route('contact')}}">Contact Us</a></li>
							<li><a href="#">Help</a></li>
						</ul>
					</div>
					<!-- End Single Widget -->
				</div>
				<div class="col-lg-2 col-md-6 col-12">
					<!-- Single Widget -->
					<div class="single-footer links">
						<h4>Customer Service</h4>
						<ul>
							<li><a href="#">Payment Methods</a></li>
							<li><a href="#">Money-back</a></li>
							<li><a href="#">Returns</a></li>
							<li><a href="#">Shipping</a></li>
							<li><a href="#">Privacy Policy</a></li>
						</ul>
					</div>
					<!-- End Single Widget -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Single Widget -->
					<div class="single-footer social">
						<h4>Get In Tuch</h4>
						<!-- Single Widget -->
						<div class="contact">
							<ul>
								<li>@foreach($settings as $data) {{$data->address}} @endforeach</li>
								<li>@foreach($settings as $data) {{$data->email}} @endforeach</li>
								<li>@foreach($settings as $data) {{$data->phone}} @endforeach</li>
							</ul>
						</div>
						<!-- End Single Widget 
						<div class="sharethis-inline-follow-buttons"></div> -->

			
					</div>
					<!-- End Single Widget -->
				</div>
			</div>				
		</div>
		
			<!-- End Footer Top -->
			<!--<div class="copyright">
				<div class="container">
					<div class="inner">
						<div class="row">
							<div class="col-lg-6 col-12">
								<div class="left">
									<p>Copyright © {{date('Y')}} <a href="#" target="_blank">Zafar Aqbal</a>  -  All Rights Reserved.</p>
								</div>
							</div>
							<div class="col-lg-6 col-12">
								<div class="right">
									<img src="{{asset('backend/img/payments.png')}}" alt="#">
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>--> 
	</footer>
<style>
	li{
		font-family:Myriad Pro;
		font-size:18px;
	}

	p{
		font-family:Myriad Pro;
		font-size:18px;
	}
</style>

	<!-- /End Footer Area -->
 
	<!-- Jquery -->
    <script src="{{asset('frontend/js/jquery.min.js')}}"></script>
    <script src="{{asset('frontend/js/jquery-migrate-3.0.0.js')}}"></script>
	<script src="{{asset('frontend/js/jquery-ui.min.js')}}"></script>
	<!-- Popper JS -->
	<script src="{{asset('frontend/js/popper.min.js')}}"></script>
	<!-- Bootstrap JS -->
	<script src="{{asset('frontend/js/bootstrap.min.js')}}"></script>
	<!-- Color JS -->
	<script src="{{asset('frontend/js/colors.js')}}"></script>
	<!-- Slicknav JS -->
	<script src="{{asset('frontend/js/slicknav.min.js')}}"></script>
	<!-- Owl Carousel JS -->
	<script src="{{asset('frontend/js/owl-carousel.js')}}"></script>
	<!-- Magnific Popup JS -->
	<script src="{{asset('frontend/js/magnific-popup.js')}}"></script>
	<!-- Waypoints JS -->
	<script src="{{asset('frontend/js/waypoints.min.js')}}"></script>
	<!-- Countdown JS -->
	<script src="{{asset('frontend/js/finalcountdown.min.js')}}"></script>
	<!-- Nice Select JS -->
	<script src="{{asset('frontend/js/nicesellect.js')}}"></script>
	<!-- Flex Slider JS -->
	<script src="{{asset('frontend/js/flex-slider.js')}}"></script>
	<!-- ScrollUp JS -->
	<script src="{{asset('frontend/js/scrollup.js')}}"></script>
	<!-- Onepage Nav JS -->
	<script src="{{asset('frontend/js/onepage-nav.min.js')}}"></script>
	{{-- Isotope --}}
	<script src="{{asset('frontend/js/isotope/isotope.pkgd.min.js')}}"></script>
	<!-- Easing JS -->
	<script src="{{asset('frontend/js/easing.js')}}"></script>

	<!-- Active JS -->
	<script src="{{asset('frontend/js/active.js')}}"></script>
	
	@stack('scripts')
	<script>
		setTimeout(function(){
		  $('.alert').slideUp();
		},5000);
		$(function() {
		// ------------------------------------------------------- //
		// Multi Level dropdowns
		// ------------------------------------------------------ //
			$("ul.dropdown-menu [data-toggle='dropdown']").on("click", function(event) {
				event.preventDefault();
				event.stopPropagation();

				$(this).siblings().toggleClass("show");


				if (!$(this).next().hasClass('show')) {
				$(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
				}
				$(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
				$('.dropdown-submenu .show').removeClass("show");
				});

			});
		});
	  </script>
=======
<!-- Start Footer Area -->
<footer class="footer shop-footer" >
	<!-- Footer Top -->
	<div class="footer-top main-footer">				
		<div class="footer-about">
			<div class="logo">
				<a href="{{route('home')}}"><img src="{{asset('backend/img/logo2.png')}}" alt="#"></a>
			</div>
			<hr>
			@php
				$settings=DB::table('settings')->get();
			@endphp

			<div class="footer-desc">
				<p class="desc-text">@foreach($settings as $data) {{$data->short_des}} @endforeach</p>
			</div>
		</div>

		<div class="footer-menu">
			<div class="footer-info">
				<h3>Information</h3>
				<hr>
				<ul>
					<li><a href="{{route('about-us')}}">About Us</a></li>
					<li><a href="#">Faq</a></li>
					<li><a href="#">Terms & Conditions</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>

			<div class="footer-cust-serv">
				<h3>Customer Service</h3>
				<hr>
				<ul>
					<li><a href="#">Payment Methods</a></li>
					<li><a href="#">Money-back</a></li>
					<li><a href="#">Returns</a></li>
					<li><a href="#">Shipping</a></li>
					<li><a href="{{route('contact')}}">Contact Us</a></li>
				</ul>
			</div>

			<div class="footer-loc">
				<div>
				<h3>Get In Touch</h3></div>
				<hr>
				<div>
				<ul>
					<li>@foreach($settings as $data) {{$data->address}} @endforeach</li>
					<li>@foreach($settings as $data) {{$data->email}} @endforeach</li>
					<li>@foreach($settings as $data) {{$data->phone}} @endforeach</li>
				</ul>
</div>
			</div>
		</div>
	</div>
	<!-- End Footer Top -->

	<div class="copyright">
		<p>Copyright &#169 {{date('Y')}} <a href="#" target="_blank">World Forum Trading</a>  -  All Rights Reserved.</p>
	</div>

	<!-- Fixed Footer -->
	<div id="footer-fixed" class="footer-fixed fixed-bottom collapse"> 
		<!-- Features -->
    <div class="features" >
			<div class="feature1" >
				<h4><i class="fa-solid fa-rocket"></i> Free shipping<br>Orders over AED. 100</h4>
			</div>
												
			<div class="feature2">
				<h4><i class="fa-solid fa-clock-rotate-left"></i> Free Return<br>Within 30 days returns</h4>
			</div>
										
			<div class="feature3">
				<h4><i class="fa-solid fa-lock"></i> Secure Payment<br>100% secure payment</h4>
			</div>
												
			<div class="feature4">
				<h4><i class="fa-solid fa-tag"></i> Best Price <br>Guaranteed price</h4>
			</div>
		</div>
		<!-- End Features -->
	</div>
	<!-- End Fixed Footer -->
</footer>
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
