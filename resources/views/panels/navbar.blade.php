@if($configData["mainLayoutType"] == 'horizontal')
  <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu {{ $configData['navbarColor'] }} navbar-fixed">
      <div class="navbar-header d-xl-block d-none">
          <ul class="nav navbar-nav flex-row">
              <li class="nav-item"><a class="navbar-brand" href="/">
                  <div class="brand-logo"></div></a></li>
          </ul>
      </div>
  @else
      <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu {{ $configData['navbarClass'] }} navbar-light navbar-shadow {{ $configData['navbarColor'] }}">
  @endif
    <div class="navbar-wrapper">
        <div class="navbar-container content">
            <div class="navbar-collapse" id="navbar-mobile">
                <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                    <ul class="nav navbar-nav">
                        <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                    </ul>
                    <ul class="nav navbar-nav bookmark-icons">

                    </ul>
                </div>
                <ul class="nav navbar-nav float-right">

                    @if(Cookie::get('theme') == 'dark-layout')
                      <li class="nav-item d-none d-lg-block"><a class="nav-link" href="{{ url('/light-mode') }}"><i class="ficon feather icon-sun"></i></a></li>
                    @else
                      <li class="nav-item d-none d-lg-block"><a class="nav-link" href="{{ url('/dark-mode') }}"><i class="ficon feather icon-moon"></i></a></li>
                    @endif

                    <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600 mb-0">{{ Auth::user()->name }}</span></div><span><img class="round" src="{{asset('images/portrait/small/user.png') }}" alt="avatar" height="40" width="40" /></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" onclick="event.preventDefault();document.getElementById('logout-form').submit();"><i class="feather icon-power"></i> Logout</a>
                          <a class="dropdown-item" href="{{ url('/change-password') }}"><i class="feather icon-lock"></i> Ubah Password</a>
                          <form id="logout-form" action="/logout" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!-- END: Header-->
