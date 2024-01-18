
@extends('layouts/contentLayoutMaster')

@section('title', 'Mutasi Stock Barang Toko ke Pabrik')
@section('page-title', 'Mutasi Stock Barang Toko ke Pabrik')


@section('vendor-style')
  {{-- vendor files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/datatables.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/toastr.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/zebra_datepicker@latest/dist/css/bootstrap/zebra_datepicker.min.css">

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

    table.data-list-view.dataTable, table.data-thumb-view.dataTable{
      border-spacing: 0 !important;
      padding: 0.5rem 0.7rem !important;
    }

  </style>
@endsection

@section('content')
  {{-- Data list view starts --}}
  <section id="data-list-view" class="data-list-view-header card" style="padding:25px 15px;">
    <div class="col-md-12">
      <div class="row">

        <div class="col-sm-5 col-md-5 mt-1">
          <label for="tanggalfilter">Pilih Bulan</label>
          <input type="text" class="form-control filterdate" name="tanggalfilter" id="tanggalfilter">
        </div>

        <div class="col-sm-7 col-md-7 mt-2">
          <button type="button" id="btnsearch" name="btnsearch" onclick="f_loadtable()" class="btn bg-gradient-success waves-effect waves-light"> <i class="feather icon-search" style="margin-right:8px;"></i> Filter Data </button>
        </div>

      </div>

    </div>

    {{-- DataTable starts --}}
    <div class="table-responsive">
      <table class="table data-list-view" style="border:none;width:100%">
        <thead>
        <tr>
          <th width="45px">No.</th>
          <th>Kode</th>
          <th>Nama Barang</th>
          <th>Qty</th>
          <th>Keterangan</th>
          <th>Tanggal</th>
          <th>Action</th>
        </tr>
        </thead>
      </table>
    </div>
    {{-- DataTable ends --}}

    {{-- add new sidebar starts --}}
    <div class="add-new-data-sidebar">
      <div class="overlay-bg"></div>
      <div class="add-new-data">
        <form class="needs-validation" id="form" novalidate autocomplete="false">
          <div class="div mt-2 px-2 d-flex new-data-title justify-content-between">
            <div>
              <h4 class="text-uppercase proposal">Input Mutasi Barang</h4>
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
                  <label for="kode">Kode Mutasi</label>
                  <input type="text" class="form-control" name="kode" id="kode" readonly>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="produks">Barang</label>
                  <select class="form-control select" name="produks" id="produks" onchange="getstokbarang(this.value)">
                    <option id="kosong" value="kosong" data-foo="" selected readonly> Pilih Produk </option>
                    @foreach($produks as $produk)
                      <option id="{{ $produk->nama }}" data-foo="" value="{{ $produk->id }}">{{ $produk->kode }} - {{ $produk->nama }}</option>
                    @endforeach
                  </select>
                  <span style="color:red;font-size:14px;font-weight:bold;line-height:2;" id="stokbarang"> Stok Saat Ini : 0</span>
                </div>
                <div class="col-sm-12 data-field-col selesaikan">
                  <label for="qty">Qty Mutasi</label>
                  <input type="text" class="form-control" name="qty" id="qty" value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col proposal">
                  <label for="keterangan">Keterangan</label>
                  <input type="text" class="form-control" name="keterangan" id="keterangan" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
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
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/toastr.min.js')) }}"></script>
  <script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
  <script src="http://cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime.js"></script>
  <script src="https://unpkg.com/accounting@0.4.1/accounting.js"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.date.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/legacy.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
  <script src="https://cdn.jsdelivr.net/npm/zebra_datepicker@1.9.13/dist/zebra_datepicker.min.js"></script>
@endsection
@section('page-script')
  {{-- Page js files --}}

  <script>
    $(document).ready(function() {

      "use strict"

      $("body").tooltip({ selector: '[data-toggle=tooltip]' });

      // init list view datatable
      f_loadtable();

      $( '.date' ).pickadate({
        formatSubmit: 'yyyy-mm-dd',
        monthsFull: [ 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember' ],
        monthsShort: [ 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des' ],
        weekdaysShort: [ 'Mgg', 'Sn', 'Sl', 'Rb', 'Kms', 'Jum', 'Sab' ],
        today: 'Hari Ini',
        clear: false,
        close: 'Tutup',
        @if(Auth::user()->status == "Staff" || Auth::user()->status == "Kasir")
          min: 0,
          max: 0,
        @endif
        selectYears: true,
        selectMonths: true,
        firstDay: 1
      });

      $(".filterdate").Zebra_DatePicker({
        format: 'm-Y',
        default_position: 'below',
        icon_position: 'left',
      }).data('Zebra_DatePicker').set_date(new Date());

      $(".select").select2({
        dropdownAutoWidth: true,
        width: '100%',
        matcher: matchCustom,
        templateResult: formatCustom
      });

      // Scrollbar
      if ($(".data-items").length > 0) {
        new PerfectScrollbar(".data-items", { wheelPropagation: false })
      }

      // Close sidebar
      $(".hide-data-sidebar, .cancel-data-btn, .overlay-bg").on("click", function() {
        f_clear();
      })

      f_loadtable();

      f_clear();

    });

    function getstokbarang(param){
        let link = "/mutasi/toko-gudang/getstok"; // Ubah link untuk update

        $.post(link,{param:param, _token: '{{csrf_token()}}'})
            .done(function(data){
                $("#stokbarang").html("Stok Saat Ini : "+data);
            });
    }

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
      $("#"+param).val(accounting.formatNumber(value, 2, ".", ","));
    }

    function f_loadtable(){
      let tanggal = $("#tanggalfilter").val();

      $("#tabel").removeClass('hidden');

      let dataListView = $(".data-list-view").DataTable({
        "destroy": true,
        processing: true,
        serverSide: true,
        ajax: "/mutasi/toko-gudang/list?tanggal="+tanggal,
        columns: [
          {data: 'DT_RowIndex', name: 'DT_RowIndex', searchable: false},
          {data: 'kode', name: 'kode'},
          {data: 'namabarang', name: 'namabarang'},
          {data: 'qty', name: 'qty', render: $.fn.dataTable.render.number( '.', ',', 2, '' )},
          {data: 'keterangan', name: 'keterangan'},
          {data: 'created_at', name: 'created_at',render: function ( data, type, row, meta ) {
              if(data != null){
                return moment(data).locale('id').format('DD MMMM YYYY');
              }else{
                return '-';
              }
          }},
          {data: 'action', name: 'action', orderable: false, searchable: false}
        ],
        responsive: false,
        columnDefs: [
          {
            orderable: true,
          }
        ],
        dom:
          '<"top"<"actions action-btns"B><"action-filters"lf>><"clear">rt<"bottom"<"actions">p>',
        oLanguage: {
          sLengthMenu: "_MENU_",
          sSearch: ""
        },
        aLengthMenu: [[10, 20, 50, -1], [10, 20, 50, 'All']],
        order: [[0, "asc"]],
        bInfo: false,
        pageLength: 10,
        buttons: [
          {
            text: "<i class='feather icon-plus'></i> Tambah Data Mutasi",
            action: function () {
              $(this).removeClass("btn-secondary")
              f_clear()
              $(".add-new-data").addClass("show")
              $(".overlay-bg").addClass("show")
            },
            className: "btn-outline-primary"
          }
        ],
        initComplete: function (settings, json) {
          $(".dt-buttons .btn").removeClass("btn-secondary")
        }
      });
    }

    function f_clear(){
      $(".add-new-data").removeClass("show");
      $(".overlay-bg").removeClass("show");
      $("#form").removeClass('was-validated');
      $("#id").val("");
      $("#kode").val("");
      $("#keterangan").val("");
      $("#produks").val("kosong").prop('disabled',false).trigger('change');
      $("#qty").val("0");

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
        let link = "/mutasi/toko-gudang/store"; // Link default untuk simpan
        let data = $("#form").serialize();

        let qty = accounting.unformat($("#qty").val() , ',');

        if(param == "Edit"){
          link = "/mutasi/toko-gudang/update"; // Ubah link untuk update
        }

        $.post(link,{data:data, qty:qty, _token: '{{csrf_token()}}'})
          .done(function(data){
            f_clear();
            toastr.success('Pendapatan berhasil terinput.', 'Berhasil', { positionClass: 'toast-top-right', containerId: 'toast-top-right', "closeButton": true });
            f_loadtable();
          });
      }

    }

    function f_edit(param){
      let link = "/mutasi/toko-gudang/request-data"; // Link untuk request data

      $.post(link, {id: param, _token: '{{csrf_token()}}'})
        .done(function (data) {
          let pecah = data.split("|");
          if (pecah[0] == "ada") {
            $('#id').val(param);
            $('#keterangan').val(pecah[1]);
            $("#qty").val(accounting.formatNumber(pecah[2], 2, ".", ","));
            $("#produks").val(pecah[3]).prop('disabled',true).trigger('change');
            $("#kode").val(pecah[4]);
            $("#btnsubmit").val("Edit");
            $(".add-new-data").addClass("show");
            $(".overlay-bg").addClass("show");
          }
        });
    }

    function f_delete(param){
      Swal.fire({
        title: 'Konfirmasi',
        text: "Apakah anda yakin untuk menghapus data ini?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
        confirmButtonClass: 'btn btn-primary',
        cancelButtonClass: 'btn btn-danger ml-1',
        buttonsStyling: false,
      }).then(function (result) {
        if (result.value) {
          let link = "/mutasi/toko-gudang/drop"; // Link untuk hapus

          $.post(link, {id: param, _token: '{{csrf_token()}}'})
            .done(function (data) {
              if (data == "berhasil") {
                toastr.success('Data ini berhasil dihapus.', 'Berhasil', { positionClass: 'toast-top-right', containerId: 'toast-top-right', "closeButton": true });
                f_loadtable();
              }
            });
        }
      })

    }

  </script>

@endsection
