@extends('layouts/fullLayoutMaster')

@section('title', 'Login Page')

@section('page-style')
        {{-- Page Css files --}}
        <link rel="stylesheet" href="{{ asset(mix('css/pages/authentication.css')) }}">
@endsection

@section('page-script')
{{--  <script src="{{ asset('js/scripts/auth/login.js') }}"></script>--}}
@endsection

@section('content')
<section class="row flexbox-container">
  <div class="col-xl-8 col-11 d-flex justify-content-center">
      <div class="card bg-authentication rounded-0 mb-0">
          <div class="row m-0">
              <div class="col-lg-6 d-lg-block d-none text-center align-self-center px-1 py-0">
                  <img src="{{ asset('images/pages/login.png') }}" alt="branding logo">
              </div>
              <div class="col-lg-6 col-12 p-0">
                  <div class="card rounded-0 mb-0 px-2">
                      <div class="card-header pb-1">
                          <div class="card-title">
                              <h4 class="mb-0">Login</h4>
                          </div>
                      </div>
                      <p class="px-2">Selamat Datang Kembali, silahkan login ke akun Anda.</p>
                      <div class="card-content">
                          <div class="card-body pt-1">
                            <form method="POST" action="{{ route('login') }}">
                              @csrf
                              <fieldset class="form-label-group form-group position-relative has-icon-left">

                                  <input id="username" type="text" class="form-control @error('username') is-invalid @enderror" name="username" placeholder="Username" value="{{ old('username') }}" required  autofocus>

                                  <div class="form-control-position">
                                      <i class="feather icon-user"></i>
                                  </div>
                                  <label for="username">Username</label>
                                  @error('username')
                                      <span class="invalid-feedback" role="alert">
                                          <strong>{{ $message }}</strong>
                                      </span>
                                  @enderror
                              </fieldset>

                              <fieldset class="form-label-group position-relative has-icon-left">

                                  <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Password"required autocomplete="current-password">

                                  <div class="form-control-position">
                                      <i class="feather icon-lock"></i>
                                  </div>
                                  <label for="password">Password</label>
                                  @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                  @enderror
                              </fieldset>
                              <div class="form-group d-flex justify-content-between align-items-center">
                                  <div class="text-left">
                                      <fieldset class="checkbox">
                                        <div class="vs-checkbox-con vs-checkbox-primary">
                                          <input type="checkbox" {{ old('remember') ? 'checked' : '' }}>
                                          <span class="vs-checkbox">
                                            <span class="vs-checkbox--check">
                                              <i class="vs-icon feather icon-check"></i>
                                            </span>
                                          </span>
                                          <span class="">Remember me</span>
                                        </div>
                                      </fieldset>
                                  </div>

                              </div>
                              <button type="submit" class="btn btn-primary float-right btn-inline">Login</button>
                            </form>
                          </div>
                      </div>
                      <div class="login-footer">
                        <div class="divider"></div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</section>
@endsection
