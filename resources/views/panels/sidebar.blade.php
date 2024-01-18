@php
    $configData = Helper::applClasses();
@endphp

<style>
    .dataTables_scrollHeadInner{
        width: 100% !important;
    }

    .data-list-view-detail{
        width: 100% !important;
    }
</style>

<div class="main-menu menu-fixed {{($configData['theme'] === 'light') ? "menu-light" : "menu-dark"}} menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand" href="/">
                    <h2 class="brand-text mb-0">Kapuas Intan...</h2>
                </a></li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block primary collapse-toggle-icon" data-ticon="icon-disc"></i></a></li>
        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

          {{-- Custom --}}

{{--          <li class="nav-item" id="home">--}}
{{--            <a href="/">--}}
{{--              <i class="feather icon-home"></i>--}}
{{--              <span class="menu-title">Beranda</span>--}}
{{--            </a>--}}
{{--          </li>--}}

{{--          <li class="navigation-header">--}}
{{--            <span>Data Master</span>--}}
{{--          </li>--}}
{{--          <li class="nav-item has-sub">--}}
{{--            <a>--}}
{{--              <i class="feather icon-book"></i>--}}
{{--              <span class="menu-title">Data Master</span>--}}
{{--            </a>--}}
{{--            <ul class="menu-content">--}}
{{--              <li class="is-shown" id="master-inventory">--}}
{{--                <a href="master/inventory">--}}
{{--                  <i class="feather icon-circle"></i>--}}
{{--                  <span class="menu-title"> Inventaris </span>--}}
{{--                </a>--}}
{{--              </li>--}}
{{--              <li class="is-shown">--}}
{{--                <a href="master/inventory">--}}
{{--                  <i class="feather icon-circle"></i>--}}
{{--                  <span class="menu-title"> asdf </span>--}}
{{--                </a>--}}
{{--              </li>--}}
{{--            </ul>--}}
{{--          </li>--}}


        {{--
          Daftar Index $menuData :
          0 = Super Admin
          1 = Owner
          2 = Supervisor
          3 = Staff
          4 = Admin Payroll
          5 = Operator Jembatan Timbang
        --}}

        {{-- Foreach menu item starts --}}
          @if (Auth::user()->status == "Super Admin")
            @php $i = 0 @endphp
          @elseif (Auth::user()->status == "Owner")
            @php $i = 1 @endphp
          @elseif (Auth::user()->status == "Supervisor")
            @php $i = 2 @endphp
          @elseif (Auth::user()->status == "Staff Pabrik")
            @php $i = 3 @endphp
          @elseif (Auth::user()->status == "Staff KA")
            @php $i = 4 @endphp
          @elseif (Auth::user()->status == "Staff KB")
            @php $i = 5 @endphp
          @elseif (Auth::user()->status == "Kasir")
            @php $i = 6 @endphp
          @endif
          @foreach($menuData[$i]->menu as $menu)
            @if(isset($menu->navheader))
              <li class="navigation-header">
                <span>{{ $menu->navheader }}</span>
              </li>
            @else
              {{-- Add Custom Class with nav-item --}}
              @php
                $custom_classes = "";
                if(isset($menu->classlist)) {
                  $custom_classes = $menu->classlist;
                }
                $translation = "";
                if(isset($menu->i18n)){
                    $translation = $menu->i18n;
                }
              @endphp
              <li class="nav-item {{ (request()->is(substr($menu->url,1))) ? 'active' : '' }} {{ $custom_classes }}">
                <a href="{{ $menu->url }}">
                  <i class="{{ $menu->icon }}"></i>
                  <span class="menu-title" data-i18n="{{ $translation }}">{{ $menu->name }}</span>
                  @if (isset($menu->badge))
                    <?php $badgeClasses = "badge badge-pill badge-primary float-right" ?>
                    <span class="{{ isset($menu->badgeClass) ? $menu->badgeClass.' test' : $badgeClasses.' notTest' }} ">{{$menu->badge}}</span>
                  @endif
                </a>
                @if(isset($menu->submenu))
                  @include('panels/submenu', ['menu' => $menu->submenu])
                @endif
              </li>
            @endif
          @endforeach
         {{-- Foreach menu item ends --}}

        </ul>
    </div>
</div>
<!-- END: Main Menu-->

{{--@yield('active-menu')--}}
