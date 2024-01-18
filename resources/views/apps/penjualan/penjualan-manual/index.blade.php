
@extends('layouts/contentLayoutMaster')

@section('title', 'Sales Order')
@section('page-title', 'Sales Order')

@section('vendor-style')
  {{-- vendor files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/datatables.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/toastr.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">

@endsection
@section('page-style')
  {{-- Page css files --}}
  <link rel="stylesheet" href="{{ asset(mix('css/pages/data-list-view.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/plugins/extensions/toastr.css')) }}">

  <style>

    .invalid-tooltip{
      right:0;
      margin-right: 15px;
    }

    .action-filters{
      width: 100%;
      text-align: right;
    }

    table.data-list-view.dataTable, table.data-thumb-view.dataTable{
      border-spacing: 0 !important;
      padding: 0.5rem 0.7rem !important;
    }

    table.dataTable tbody td.select-checkbox:before, table.dataTable tbody th.select-checkbox:before{
      margin-top: 5px;
    }

    table.dataTable tr.selected td.select-checkbox:after, table.dataTable tr.selected th.select-checkbox:after{
      margin-top: 0px;
    }

    .custom-btn{
      min-width: 200px;
    }

    .rounded-btn{
      border-radius: 0.4285rem !important;
    }

    .card-detail{
        border: 2px solid #878080;
        border-radius: 5px;
        margin-top: 20px;
        margin-right: 5px;
        cursor: pointer;
    }

    .card-title{
        font-size: 26px;
        font-weight: bold;
        text-transform: uppercase;
        border-bottom: 1px solid #c5bdbd;
        padding-bottom: 20px;
    }

    .browser-info{
        font-size: 18px;
        height: 100%;
        vertical-align: middle;
        line-height: 30px;
    }

    .table-detil{
        border: 2px solid black;
        width: 100%;
    }

    .table-detil th, td{
        border: 1px solid black;
        text-align: center;
    }
  </style>
@endsection

@section('content')

  <div style="height:0px;overflow:hidden">
    <form method="POST" action="/payment/pelunasan/upload-foto" enctype="multipart/form-data">
      @csrf


      <input type="file" id="flgambar" name="flgambar" accept="image/png,image/x-png,image/jpeg,image/webp"/>
      <input type="hidden" id="txtid" name="txtid" />
      <input type="hidden" id="txtgambar" name="txtgambar" />
      <button type="submit" id="btnsubmit" name="btnsubmit" class="btn btn-success">
        Simpan Data
      </button>

    </form>
  </div>

  {{-- Data list view starts --}}
  <section id="data-list-view" class="data-list-view-header card" style="padding:25px 15px;">
    <div class="col-md-12">
      <div class="row">

        <div class="col-sm-12 col-md-12">
          <button type="button" id="btnsearch" name="btnsearch" onclick="f_bukasidebar()" class="btn bg-gradient-success waves-effect waves-light mt-2" style="margin-right:15px;"> <i class="feather icon-plus" style="margin-right:8px;"></i> Tambah Data Baru </button>

          <button type="button" id="btnsearch" name="btnsearch" onclick="f_loaddata()" class="btn bg-gradient-warning waves-effect waves-light mt-2" style="margin-right:15px;"> <i class="feather icon-refresh-ccw" style="margin-right:8px;"></i> Refresh Data </button>

          <button type="button" id="btnsearch" name="btnsearch" onclick="location.href='/penjualan/penjualan-manual/list-penjualan'" class="btn bg-gradient-primary waves-effect waves-light mt-2" style="margin-right:15px;"> <i class="feather icon-list" style="margin-right:8px;"></i> Lihat Data Sales Order </button>
        </div>

      </div>

    </div>

    <div class="row" id="data-penjualan">

{{--      <div class="col-md-4 col-12">--}}
{{--        <div class="card-detail">--}}
{{--          <div class="card-header">--}}
{{--            <h2 class="card-title col-md-12 text-center">asdf asdf </h2>--}}
{{--          </div>--}}
{{--          <div class="card-content">--}}
{{--            <div class="card-body">--}}
{{--              <div class="row">--}}
{{--                <div class="col-md-4 pb-2">--}}
{{--                  <img src="{{ url('/images/icons/truck.png') }}" width="100%" />--}}
{{--                </div>--}}
{{--                <div class="col-md-8">--}}
{{--                  <div class="browser-info">--}}
{{--                    <b>No.</b> Asdf <br />--}}
{{--                    <b>Tgl.</b> Asdf <br />--}}
{{--                    <b>Netto =</b> Asdf <br />--}}
{{--                  </div>--}}
{{--                </div>--}}
{{--                <div class="col-md-12">--}}
{{--                  <textarea class="form-control mb-2" rows="2" placeholder="Keterangan" disabled></textarea>--}}
{{--                  <table class="table-detil">--}}
{{--                    <thead>--}}
{{--                    <tr>--}}
{{--                      <th>Kode</th>--}}
{{--                      <th>Barang</th>--}}
{{--                      <th>Jumlah</th>--}}
{{--                      <th>Harga</th>--}}
{{--                      <th>Subtotal</th>--}}
{{--                    </tr>--}}
{{--                    </thead>--}}
{{--                    <tbody>--}}
{{--                    <tr>--}}
{{--                      <td>Kode</td>--}}
{{--                      <td>Barang</td>--}}
{{--                      <td>Jumlah</td>--}}
{{--                      <td>Harga</td>--}}
{{--                      <td>Subtotal</td>--}}
{{--                    </tr>--}}
{{--                    <tr>--}}
{{--                      <td>Kode</td>--}}
{{--                      <td>Barang</td>--}}
{{--                      <td>Jumlah</td>--}}
{{--                      <td>Harga</td>--}}
{{--                      <td>Subtotal</td>--}}
{{--                    </tr>--}}
{{--                    <tr>--}}
{{--                      <td>Kode</td>--}}
{{--                      <td>Barang</td>--}}
{{--                      <td>Jumlah</td>--}}
{{--                      <td>Harga</td>--}}
{{--                      <td>Subtotal</td>--}}
{{--                    </tr>--}}
{{--                    </tbody>--}}
{{--                  </table>--}}
{{--                </div>--}}
{{--              </div>--}}
{{--            </div>--}}
{{--          </div>--}}
{{--        </div>--}}
{{--      </div>--}}

    </div>

    {{-- add new sidebar starts --}}
    <div class="add-new-data-sidebar">
      <div class="overlay-bg"></div>
      <div class="add-new-data">
        <form class="needs-validation" id="form" novalidate autocomplete="false">
          <div class="div mt-2 px-2 d-flex new-data-title justify-content-between">
            <div>
              <h4 class="text-uppercase">Tambah Sales Order</h4>
            </div>
            <div class="hide-data-sidebar">
              <i class="feather icon-x"></i>
            </div>
          </div>
          <div class="data-items pb-3">
            <div class="data-fields px-2 mt-1">
              <div class="row">
                <input type="hidden" name="id" id="id" />
                <div class="col-sm-12 data-field-col">
                  <label for="kode">Kode</label>
                  <input type="text" class="form-control" name="kode" id="kode" disabled>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="konsumen">Nama Konsumen</label>
                  <select class="form-control select" name="konsumen" id="konsumen">
                    <option value="" data-foo="" selected disabled> Pilih Konsumen </option>
                    @foreach($konsumens as $konsumen)
                      <option value="{{ $konsumen->id }}" data-foo="{{ $konsumen->kode }} - {{ $konsumen->keterangan }}">{{ $konsumen->nama }}</option>
                    @endforeach
                  </select>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="tanggal">Tanggal SO</label>
                  <input type="text" class="form-control date" name="tanggal" id="tanggal" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="keterangan">Keterangan</label>
                  <textarea class="form-control" name="keterangan" id="keterangan" rows="2" placeholder="Keterangan"></textarea>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="pembayaran"> Metode Pembayaran </label>
                  <select class="form-control" name="pembayaran" id="pembayaran">
                    <option value="Cash" selected>Cash</option>
                    <option value="Transfer">Transfer</option>
                    <option value="Credit">Credit</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="add-data-footer d-flex justify-content-around px-3 mt-2">
            <div class="add-data-btn">
              <button type="button" class="btn btn-primary" value="Simpan" id="btnsubmit" name="btnsubmit" onclick="f_simpan(this.value)">Submit</button>
            </div>
            <div class="cancel-data-btn">
              <input type="button" class="btn btn-outline-danger" value="Cancel" onclick="f_clear()">
            </div>
          </div>
        </form>
      </div>
    </div>
    {{-- add new sidebar ends --}}

  </section>
  {{-- Data list view end --}}
@endsection
@section('vendor-script')
  {{-- vendor js files --}}
  <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.buttons.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.bootstrap4.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/buttons.bootstrap.min.js')) }}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/buttons.html5.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/toastr.min.js')) }}"></script>
  <script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
  <script src="http://cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime.js"></script>
  <script src="https://unpkg.com/accounting@0.4.1/accounting.js"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.date.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/legacy.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
@endsection
@section('page-script')
  {{-- Page js files --}}

  <script>

    let selected = [];
    let dataListView;

    $(document).ready(function() {

      "use strict"

      $("body").tooltip({ selector: '[data-toggle=tooltip]' });

      $( '.date' ).pickadate({
        formatSubmit: 'yyyy-mm-dd',
        monthsFull: [ 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember' ],
        monthsShort: [ 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des' ],
        weekdaysShort: [ 'Mgg', 'Sn', 'Sl', 'Rb', 'Kms', 'Jum', 'Sab' ],
        today: 'Hari Ini',
        clear: 'Hapus Tanggal',
        close: 'Tutup',
        selectYears: true,
        selectMonths: true,
        firstDay: 1
      });

      $(".select").select2({
        dropdownAutoWidth: true,
        width: '100%',
        matcher: matchCustom,
        templateResult: formatCustom
      });

      f_loaddata();

      $("#tanggal").pickadate('picker').set('select',new Date());

      // Scrollbar
      if ($(".data-items").length > 0) {
          new PerfectScrollbar(".data-items", { wheelPropagation: false })
      }

      // Close sidebar
      $(".hide-data-sidebar, .cancel-data-btn, .overlay-bg").on("click", function() {
          f_clear();
      })

      setInterval(function() {
          f_loaddata();
      }, 10000);
    });

    function stringMatch(term, candidate) {
      return candidate && candidate.toLowerCase().indexOf(term.toLowerCase()) >= 0;
    }

    function matchCustom(params, data) {
      // If there are no search terms, return all of the data
      if ($.trim(params.term) === '') {
        return data;
      }
      // Do not display the item if there is no 'text' property
      if (typeof data.text === 'undefined') {
        return null;
      }
      // Match text of option
      if (stringMatch(params.term, data.text)) {
        return data;
      }
      // Match attribute "data-foo" of option
      if (stringMatch(params.term, $(data.element).attr('data-foo'))) {
        return data;
      }
      // Return `null` if the term should not be displayed
      return null;
    }

    function formatCustom(state) {
      return $(
        '<div><div>' + state.text + '</div><div class="foo">'
        + $(state.element).attr('data-foo')
        + '</div></div>'
      );
    }

    function minmax(value, min, max)
    {
      if(parseInt(value) < min || isNaN(parseInt(value)))
        return min;
      else if(parseInt(value) > max)
        return max;
      else return value;
    }

    function f_tonumber(param){
      let value = $("#"+param).val();
      $("#"+param).val(accounting.unformat(value , ','));
    }

    function f_tocurrency(param){
      let value = $("#"+param).val();
      $("#"+param).val(accounting.formatNumber(value, 0, ".", ","));
    }

    function f_bukasidebar(){
        f_clear();
        $(".add-new-data").addClass("show");
        $(".overlay-bg").addClass("show");
    }

    function f_clear(){
        $(".add-new-data").removeClass("show");
        $(".overlay-bg").removeClass("show");
        $("#form").removeClass('was-validated');
        $("#id").val("");
        $("#kode").val("");
        $("#penampung").val("").trigger('change');
        $("#keterangan").val("");
        $("#tanggal").pickadate('picker').set('select',new Date());
        $("#pembayaran").val("Cash").trigger('change');
        $("#aktif").val("Active");
        $("#btnsubmit").val("Simpan");
    }

    function f_simpan(param){
        $("#form").addClass('was-validated');

        //cek kalau ada field required yang masih kosong
        let empty = false;
        $('#form').find('select, textarea, input').each(function(){
            if($( this ).prop( 'required' )){ if ( ! $( this ).val() ) { empty = true; } }
        });

        //tuliskan coding didalam if kalau udh ga ada field required yg kosong
        if (empty == false) {
            let link = "/penjualan/penjualan-manual/store"; // Link default untuk simpan
            let data = $("#form").serialize();

            let tanggal = $("[name=tanggal_submit]").val();

            if(param == "Edit"){
                link = "/penjualan/penjualan-manual/update"; // Ubah link untuk update
            }

            $.post(link,{data:data, tanggal:tanggal, _token: '{{csrf_token()}}'})
                .done(function(data){
                    f_clear();
                    toastr.success('Data ini berhasil disimpan.', 'Berhasil', { positionClass: 'toast-top-right', containerId: 'toast-top-right', "closeButton": true });
                    f_loaddata();
                });
        }

    }

    function f_loaddata(){
        let link = "/penjualan/penjualan-manual/request-data-penjualan"; // Link untuk request data

        let linkgambar = "{{ url('/images/icons/transaction.png') }}";

        $.post(link, {linkgambar: linkgambar, _token: '{{csrf_token()}}'})
            .done(function (data) {
                if (data != "gak ada") {
                    $("#data-penjualan").html(data);
                }else{
                    $("#data-penjualan").html('');
                }
            });
    }

  </script>

@endsection
