
<!-- Start Shop Newsletter  -->
<section class="shop-newsletter section">
    <div class="container">
        <div class="inner-top">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-12">
                    <!-- Start Newsletter Inner -->
                    <div class="inner">
                        <h4 style="font-family:Myriad Pro;">Newsletter</h4>
                        <p style="font-family:Myriad Pro;"> Subscribe to our newsletter and get <span>10%</span> off your first purchase</p>
                        <form action="{{route('subscribe')}}" method="post" class="newsletter-inner">
                            @csrf
                            <input name="email" placeholder="Your email address" required="" type="email" style="font-family:Myriad Pro;">
                            <button class="btn" type="submit" style="color:#f2f4e6; font-family:Myriad Pro;" >Subscribe</button>
                        </form>
                    </div>
                    <!-- End Newsletter Inner -->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Shop Newsletter -->