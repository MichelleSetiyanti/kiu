
@extends('layouts/contentLayoutMaster')

@section('title', 'Data Master - Kategori Barang')
@section('page-title', 'Data Master - Kategori Barang')


@section('vendor-style')
  {{-- vendor files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/datatables.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/toastr.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">

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

  </style>
@endsection

@section('content')
  {{-- Data list view starts --}}
  <section id="data-list-view" class="data-list-view-header card" style="padding:25px 15px;">

    {{-- DataTable starts --}}
    <div class="table-responsive">
      <table class="table data-list-view" style="border:none;">
        <thead>
        <tr>
          <th width="45px">No.</th>
          <th>Kode</th>
          <th>Nama</th>
          <th>Keterangan</th>
          <th>Status</th>
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
              <h4 class="text-uppercase">Form Kategori Barang</h4>
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
                  <label for="nama">Kode Kategori</label>
                  <input type="text" class="form-control" name="kode" id="kode" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="nama">Nama Kategori</label>
                  <input type="text" class="form-control" name="nama" id="nama" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="nama">Keterangan</label>
                  <input type="text" class="form-control" name="keterangan" id="keterangan">
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="aktif"> Status </label>
                  <select class="form-control" name="aktif" id="aktif">
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
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
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/toastr.min.js')) }}"></script>
@endsection
@section('page-script')
  {{-- Page js files --}}

  <script>
    $(document).ready(function() {

      "use strict"

      $("body").tooltip({ selector: '[data-toggle=tooltip]' });

      // init list view datatable
      f_loadtable();

      // Scrollbar
      if ($(".data-items").length > 0) {
        new PerfectScrollbar(".data-items", { wheelPropagation: false })
      }

      // Close sidebar
      $(".hide-data-sidebar, .cancel-data-btn, .overlay-bg").on("click", function() {
        f_clear();
      })

    });

    function f_loadtable(){
      let dataListView = $(".data-list-view").DataTable({
        "destroy": true,
        processing: true,
        serverSide: true,
        ajax: "/master/kategori-barang/list",
        columns: [
          {data: 'DT_RowIndex', name: 'DT_RowIndex', searchable: false},
          {data: 'kode', name: 'kode'},
          {data: 'nama', name: 'nama'},
          {data: 'keterangan', name: 'keterangan'},
          {data: 'aktif', name: 'aktif'},
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
        pageLength: 20,
        buttons: [
          {
            text: "<i class='feather icon-plus'></i> Tambah Data Baru",
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
      $('#kode').val("");
      $('#nama').val("");
      $('#keterangan').val("");
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
        let link = "/master/kategori-barang/store"; // Link default untuk simpan
        let data = $("#form").serialize();

        if(param == "Edit"){
          link = "/master/kategori-barang/update"; // Ubah link untuk update
        }

        $.post(link,{data:data, _token: '{{csrf_token()}}'})
          .done(function(data){
            f_clear();
            toastr.success('Data ini berhasil disimpan.', 'Berhasil', { positionClass: 'toast-top-right', containerId: 'toast-top-right', "closeButton": true });
            f_loadtable();
          });
      }

    }

    function f_edit(param){
      let link = "/master/kategori-barang/request-data"; // Link untuk request data

      $.post(link, {id: param, _token: '{{csrf_token()}}'})
        .done(function (data) {
          let pecah = data.split("|");
          if (pecah[0] == "ada") {
            $('#id').val(param);
            $('#kode').val(pecah[1]);
            $('#nama').val(pecah[2]);
            $('#keterangan').val(pecah[3]);
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
          let link = "/master/kategori-barang/drop"; // Link untuk hapus

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
