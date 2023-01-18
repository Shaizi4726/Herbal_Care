<header class="header shop-header" id="header">
  <!-- Topbar -->
  <div class="topbar" id="mob-header">
    <div class="header-content">
      <div id="header-logo-title">
        @php $settings=DB::table('settings')->get(); @endphp
        <a href="{{route('home')}}" class="header-logo">
          <img src="@foreach($settings as $data) {{$data->logo}} @endforeach" alt="logo">
        </a>
        <h2 class="header-title">HerbalCare</h2>
      </div>
    </div>
    <div class="search-bar" id= "search"> 
      <button id="menu-button" class="btn header-icon" onclick="showMenu()"><i class="fa-solid fa-bars icon" id="bars-icon"></i></button>                                       
      <form method="post" action="{{route('product.search')}}" class="search-form">
        @csrf
        <input type="search" name="search" class="form-controller search-term" placeholder="Search Products...">                                                                
        <button type="submit" class="btn search-button" value="Search"><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
      <button id="mob-fav-button" class="btn fav-button header-icon">
        <a href="{{route('wishlist')}}">
        <i class="fa-solid fa-heart" id="fav-icon"></i>
        <div class="cart-quantity"><span>{{Helper::cartCount()}}</span></div></a>
      </button>
      <button id="mob-cart-button" class="btn header-icon cart-button">
        <a href="{{route('cart')}}">
        <i class="fa-solid fa-cart-shopping" id="cart-icon"></i>

        @auth
          <div class="cart-quantity"><span>{{count(Helper::getAllProductFromCart())}}</span></div></a>
        @else
          <div class="cart-quantity"><span>{{Session::get('cart_items')}}</span></div></a>
        @endauth

      </button>
    </div>      
  </div>      
  
  <div class="topbar" id="desktop-header">
    <div class="header-content">
      <div id="header-logo" class="header-logo">
        @php
          $settings=DB::table('settings')->get();
        @endphp                    
        <a href="{{route('home')}}"><img src="@foreach($settings as $data) {{$data->logo}} @endforeach" alt="logo" width="50" height="50"></a>
      </div>

      <div class="header-title-div">
        <h2 class="header-title">HerbalCare</h2>
      </div>
      
      <ul class="list-main">
        <li><i class="fa-solid fa-location-dot d-user-icon"></i><a class="user-nav rb" href="{{route('order.track')}}">Track Order</a></li>
        @auth 
          @if(Auth::user()->role=='admin')
            <li><i class="fa-solid fa-user-tie d-user-icon"></i><a class="user-nav rb" href="{{route('admin')}}"  target="_blank">{{Auth::user()->name}}</a></li>
          @else 
            <li><i class="fa-solid fa-user d-user-icon"></i><a class="user-nav rb" href="{{route('user')}}"  target="_blank">{{Auth::user()->name}}</a></li>
          @endif
            <li><i class="fa-solid fa-right-from-bracket d-user-icon"></i><a class="user-nav" href="{{route('user.logout')}}">Logout</a></li>
        @else
          <li><i class="fa-solid fa-right-to-bracket d-user-icon"></i><a class="user-nav rb" href="{{route('login.form')}}">Login</a></li>
          <li><i class="fa-solid fa-user-plus d-user-icon"></i><a class="user-nav" href="{{route('register.form')}}">Register</a></li>
        @endauth
      </ul>                    
    </div>
    
    <nav class="menu-bar" id="desktop-menu">
      <ul class="menu">
        <li><a href="{{route('home')}}" class="nav-link desktop-nav">Home</a></li>
        <li><a href="{{route('about-us')}}" class="nav-link desktop-nav">About</a></li>
        <li id = "shop">
          <a href="#" class="nav-link desktop-nav dropdown-toggle">Shop</a>
          <ul class="collapse cat-menu" id="desktop-cat-menu">
            {{Helper::getHeaderCategory()}}
          </ul>
        </li>
      </ul>

      <div class="search-bar">                                        
        <form method="post" action="{{route('product.search')}}" class="search-form">
          @csrf
          <input type="search" name="search" class="form-controller search-term" placeholder="Search Products...">                                                                
          <button type="submit" class="btn search-button" value="Search"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
      </div>

      <button class="btn header-icon cart-button">
        <a href="{{route('cart')}}" class="header-icon">
        <i class="fa-solid fa-cart-shopping" id="cart-icon"></i>
          <div class="cart-quantity"><span style="position: relative;top: 0.14em;">{{count(Helper::getAllProductFromCart())}}</span></div></a>
            <div class="collapse shopping-item">
              <div class="dropdown-cart-header">
                <span>{{count(Helper::getAllProductFromCart())}} Items</span>
                <a href="{{route('cart')}}">View Cart</a>
              </div>

              <ul class="shopping-list">
                @foreach(Helper::getAllProductFromCart() as $data)
                  <li>
                    <div class="product-det">
                      <h4><a class="prod-name" href="{{route('product-detail',$data->product['slug'])}}" target="_blank">{{$data->product['title']}}</a></h4>
                      <p class="total-cal font">{{$data->quantity}} x <span class="amount">{{number_format($data->price,2)}} AED</span></p>
                      <a href="{{route('cart-delete', $data->id)}}" class="remove font" title="Remove"><i class="fa-regular fa-trash-can"></i> Remove Item</a>
                    </div>
                    <a class="cart-img" href="#"><img src="{{$data->product['photo']}}" alt="product photo"></a>
                  </li>
                @endforeach
              </ul>

              <div class="bottom">
                <div class="total">
                    <span>Total = </span>
                    <span class="total-amount">AED {{number_format(Helper::totalCartAmount(),2)}}</span>
                </div>
                <div class="btn anim-checkout-btn">
                <a href="{{route('checkout')}}">Checkout</a>
                <div class="hover"></div>
                </div>
              </div>              
            </div>
      </button> 
    </nav>
  </div> 
</header>

<nav class="nav" id="mob-nav">
  <button type="button" class="btn close" id="close-btn" onclick="closeMenu()"><i class="fa-solid fa-xmark"></i></button>                  
  <div class="navbar-content">
    <ul class="menu">
      <li><a href="{{route('home')}}" class="nav-link mob-nav">Home</a></li>
      <li><a href="{{route('about-us')}}" class="nav-link mob-nav">About</a></li>
      <li>
        <a onclick="menu()" class="nav-link mob-nav dropdown-toggle">Shop</a>
        <ul class="collapse cat-menu" id="mob-cat-menu">
          {{Helper::getHeaderCategory()}}
        </ul>
      </li>
    </ul>
    <hr>
  
    <ul class="list-main">
      <li><i class="fa-solid fa-location-dot"></i><a class="user-nav" href="{{route('order.track')}}" >Track Order</a></li>
      @auth 
        @if(Auth::user()->role=='admin')
          <li><i class="fa-solid fa-user-tie"></i><a class="user-nav" href="{{route('admin')}}"  target="_blank">Dashboard</a></li>
        @else 
          <li><i class="fa-solid fa-user"></i><a class="user-nav" href="{{route('user')}}"  target="_blank">Dashboard</a></li>
        @endif
          <li><i class="fa-solid fa-right-from-bracket"></i><a class="user-nav" href="{{route('user.logout')}}">Logout</a></li>
      @else
        <li><i class="fa-solid fa-right-to-bracket"></i><a class="user-nav" href="{{route('login.form')}}">Login</a></li>
        <li><i class="fa-solid fa-user-plus"></i><a class="user-nav" href="{{route('register.form')}}">Register</a></li>
      @endauth
    </ul>    
  </div>
</nav>

