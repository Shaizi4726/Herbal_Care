
<!-- Start Shop Newsletter  -->
<section class="shop-newsletter">
  <h4>Newsletter</h4>
  <p>Subscribe to our newsletter and get <span>10%</span> off your first purchase</p>
  <form action="{{route('subscribe')}}" method="post" class="newsletter-form">
    @csrf
    <input type="email" name="email" placeholder="Email address" required>
    <button class="btn btn-submit" type="submit">Subscribe</button>
  </form>
</section>
<!-- End Shop Newsletter -->