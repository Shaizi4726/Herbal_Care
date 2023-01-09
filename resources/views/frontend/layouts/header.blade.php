<header class="header shop-header">
  <!-- Topbar -->
  <div class="topbar" id="primary-header">
    <div class="row header-content">
      <div class="col-3 header-item">
        <button class="btn header-icon" onclick="showMenu()"><i class="fa-solid fa-bars icon" id="bars-icon"></i></button>
      </div>

      <div class="col-6 header-item">
        @php $settings=DB::table('settings')->get(); @endphp
        <a href="{{route('home')}}">
          <img src="@foreach($settings as $data) {{$data->logo}} @endforeach" alt="logo">
        </a>
        <h2 class="w3-container w3-center" id="header-title">HerbalCare</h2>
      </div>

      <div class="col-3 header-item">
        <button class="btn header-icon"><i class="fa-solid fa-briefcase icon" id="briefcase-icon"></i></button>
      </div>
    </div>
  </div>
</header>

<nav class="nav" id="mob-nav">
  <button type="button" class="btn close" id="close-btn" onclick="closeMenu()"><i class="fa-solid fa-xmark"></i></button>                  
  <div id="navbar-content">
    <ul class="menu p-0">
      <li><a href="{{route('home')}}" class="nav-link mob-nav">Home</a></li>
      <li><a href="{{route('about-us')}}" class="nav-link mob-nav">About</a></li>
      <li>
        <a href="#" class="nav-link mob-nav">Shop<i class="fa-solid fa-chevron-down ps-2 mob-drop"></i></a>
      </li>
    </ul>
  </div> <hr>
  <div class="user-menu">
    <ul class="menu p-0">
      <li><a href="{{route('home')}}" class="nav-link mob-nav">Home</a></li>
      <li><a href="{{route('about-us')}}" class="nav-link mob-nav">About</a></li>
      <li>
        <a href="#" class="nav-link mob-nav">Shop<i class="fa-solid fa-chevron-down ps-2 mob-drop"></i></a>
      </li>
    </ul>
  </div>
</nav>