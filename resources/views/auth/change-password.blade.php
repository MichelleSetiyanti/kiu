@extends('layouts/fullLayoutMaster')

@section('title', 'Ubah Password')

@section('page-style')
        {{-- Page Css files --}}
        <link rel="stylesheet" href="{{ asset(mix('css/pages/authentication.css')) }}">
@endsection
@section('content')
  @if(isset($status) && $status === 'success')
    <div class="col-xl-7 col-10 d-flex justify-content-center alert alert-success mb-2" style="margin:auto;">Password anda berhasil diubah!</div>
  @endif
  @if(isset($status) && $status === 'failed')
    <div class="col-xl-7 col-10 d-flex justify-content-center alert alert-danger mb-2" style="margin:auto;">Password anda gagal diubah!</div>
  @endif
  <section class="row flexbox-container">
    <div class="col-xl-7 col-10 d-flex justify-content-center" style="margin:auto;">
        <div class="card bg-authentication rounded-0 mb-0 w-100">
            <div class="row m-0">
                <div class="col-lg-6 d-lg-block d-none text-center align-self-center p-0">
                    <img src="{{ asset('images/pages/reset-password.png') }}" alt="branding logo">
                </div>
                <div class="col-lg-6 col-12 p-0">
                    <div class="card rounded-0 mb-0 px-2">
                        <div class="card-header pb-1">
                            <div class="card-title">
                                <h4 class="mb-0">Ubah Password</h4>
                            </div>
                        </div>
                        <p class="px-2">Masukkan password baru anda.</p>
                        <div class="card-content">
                            <div class="card-body pt-1">
                                <form action="{{ url('/master/user/update-password') }}" method="POST">
                                    {{ csrf_field() }}
                                    <fieldset class="form-label-group">
                                        <input type="password" class="form-control" id="user-password" name="user-password" placeholder="Password" onkeyup="check_pass();" required>
                                        <label for="user-password">Password</label>
                                    </fieldset>

                                     <fieldset class="form-label-group">
                                        <input type="password" class="form-control" id="user-confirm-password" name="user-confirm-password" placeholder="Confirm Password" onkeyup="check_pass();" required>
                                        <label for="user-confirm-password">Confirm Password</label>
                                    </fieldset>
                                    <div class="row pt-2">
                                        <div class="col-12 col-md-6 mb-1">
                                            <a href="{{ url('/') }}" class="btn btn-outline-primary btn-block px-0">Homepage</a>
                                        </div>
                                        <div class="col-12 col-md-6 mb-1">
                                            <button type="submit" id="submit" disabled class="btn btn-primary btn-block px-0">Ubah Password</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </section>
@endsection

<script>
  function check_pass() {
    if (document.getElementById('user-password').value == document.getElementById('user-confirm-password').value) {
      document.getElementById('submit').disabled = false;
    } else {
      document.getElementById('submit').disabled = true;
    }
  }
</script>
