
@extends('layouts/contentLayoutMaster')

@section('title', 'Data Master - Konsumen')
@section('page-title', 'Data Master - Konsumen')


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
          <th>Nama Konsumen</th>
          <th>Alamat</th>
          <th>No. HP</th>
          <th width="80px">Status</th>
          <th>Keterangan</th>
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
              <h4 class="text-uppercase">Form Konsumen</h4>
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
                  <label for="kode">Kode Konsumen</label>
                  <input type="text" class="form-control" name="kode" id="kode" readonly required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="nama">Nama Konsumen</label>
                  <input type="text" class="form-control" name="nama" id="nama" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="tipekonsumen"> Tipe Konsumen </label>
                  <select class="form-control" name="tipekonsumen" id="tipekonsumen" onchange="f_tipekonsumen(this.value)">
                    <option value="Umum" selected>Umum</option>
                    <option value="Perusahaan">Perusahaan</option>
                  </select>
                </div>
                <div class="col-sm-12 data-field-col perusahaan">
                  <label for="namagroup">Nama Group</label>
                  <select class="form-control" name="namagroup" id="namagroup">
                  </select>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="contactperson">Contact Person</label>
                  <input type="text" class="form-control" name="contactperson" id="contactperson" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="nohp">Nomor HP</label>
                  <input type="text" class="form-control" name="nohp" id="nohp" placeholder="0000-0000-000000" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="alamat">Alamat</label>
                  <textarea class="form-control" name="alamat" id="alamat" rows="3" placeholder="Alamat" required></textarea>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="termin">Termin</label>
                  <input type="text" class="form-control" name="termin" id="termin" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="plafon">Plafon</label>
                  <input type="text" class="form-control" name="plafon" id="plafon" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="npwp">Nomor NPWP / NIK</label>
                  <input type="text" class="form-control" name="npwp" id="npwp" required>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="alamatnpwp">Alamat NPWP / NIK</label>
                  <textarea class="form-control" name="alamatnpwp" id="alamatnpwp" rows="3" placeholder="Alamat NPWP / NIK" required></textarea>
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col perusahaan">
                  <label for="nomorrekening">Nomor Rekening</label>
                  <input type="text" class="form-control" name="nomorrekening" id="nomorrekening">
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
                </div>
                <div class="col-sm-12 data-field-col">
                  <label for="keterangan">Keterangan</label>
                  <input type="text" class="form-control" name="keterangan" id="keterangan" placeholder="Keterangan">
                  <div class="invalid-tooltip">
                    Kolom ini harus diisi
                  </div>
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
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.date.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/pickers/pickadate/legacy.js')) }}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>

@endsection
@section('page-script')
  {{-- Page js files --}}

  <script>
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

      $("#namagroup").select2({
          dropdownAutoWidth: true,
          width: '100%',
          tags: true
      });

      // init list view datatable
      f_loadtable();

      f_updategroup();

      // Scrollbar
      if ($(".data-items").length > 0) {
        new PerfectScrollbar(".data-items", { wheelPropagation: false })
      }

      $('#nohp').mask('0000-0000-000000');

      // Close sidebar
      $(".hide-data-sidebar, .cancel-data-btn, .overlay-bg").on("click", function() {
        f_clear();
      })

    });

    function f_updategroup(){
        var $options = $();

        $.post("/master/konsumen/get-group",{_token: '{{csrf_token()}}'})
            .done(function(data){

                for (var i in data) {
                    $options = $options.add(
                        $('<option>').attr('value', data[i].nama_group).html(data[i].nama_group)
                    );
                }
                $('#namagroup').html($options).trigger('change');
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

    function f_tipekonsumen(param){
        if(param == "Umum"){
            $(".umum").css('display','block');
            $(".perusahaan").css('display','none');
        }else{
            $(".umum").css('display','none');
            $(".perusahaan").css('display','block');
        }
    }

    function formatCustom(state) {
      return $(
        '<div><div>' + state.text + '</div><div class="foo">'
        + $(state.element).attr('data-foo')
        + '</div></div>'
      );
    }

    function f_loadtable(){
      let dataListView = $(".data-list-view").DataTable({
        "destroy": true,
        processing: true,
        serverSide: true,
        ajax: "/master/konsumen/list",
        columns: [
          {data: 'DT_RowIndex', name: 'DT_RowIndex', searchable: false},
          {data: 'kode', name: 'kode'},
          {data: 'nama', name: 'nama'},
          {data: 'alamat', name: 'alamat'},
          {data: 'no_hp', name: 'no_hp'},
          {data: 'aktif', name: 'aktif'},
          {data: 'keterangan', name: 'keterangan'},
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
        aLengthMenu: [[50, 100, 200, -1], [50, 100, 200, 'All']],
        order: [[0, "asc"]],
        bInfo: false,
        pageLength: 50,
        buttons: [
          {
            text: "<i class='feather icon-plus'></i> Tambah Data Baru",
            action: function () {
              $(this).removeClass("btn-secondary")
              f_clear()
              $(".add-new-data").addClass("show")
              $(".overlay-bg").addClass("show")
              f_getkode()
            },
            className: "btn-outline-primary"
          }
        ],
        initComplete: function (settings, json) {
          $(".dt-buttons .btn").removeClass("btn-secondary")
        }
      });
    }

    function f_getkode(){
        let link = "/master/konsumen/get-kode"; // Link untuk hapus

        $.post(link, {_token: '{{csrf_token()}}'})
            .done(function (data) {
                $("#kode").val(data);
            });
    }

    function f_clear(){
      $(".add-new-data").removeClass("show");
      $(".overlay-bg").removeClass("show");
      $("#form").removeClass('was-validated');
      $("#id").val("");
      $("#nama").val("");
      $("#kode").val("");
      $("#tipekonsumen").val("Umum");
      $("#namagroup").val("");
      $("#contactperson").val("");
      $("#nohp").val("");
      $("#alamat").val("");
      $("#termin").val("");
      $("#plafon").val("");
      $("#npwp").val("");
      $("#alamatnpwp").val("");
      $("#nomorrekening").val("");
      $("#keterangan").val("");
      $("#aktif").val("Active");
      $("#btnsubmit").val("Simpan");

      f_updategroup();
      f_tipekonsumen('Umum');
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
        let link = "/master/konsumen/store"; // Link default untuk simpan
        let data = $("#form").serialize();

        if(param == "Edit"){
          link = "/master/konsumen/update"; // Ubah link untuk update
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
      let link = "/master/konsumen/request-data"; // Link untuk request data

      $.post(link, {id: param, _token: '{{csrf_token()}}'})
        .done(function (data) {
          let pecah = data.split("|");
          if (pecah[0] == "ada") {
            $('#id').val(param);
            $("#nama").val(pecah[1]);
            $("#kode").val(pecah[2]);
            $("#tipekonsumen").val(pecah[3]);
            $("#namagroup").val(pecah[4]);
            $("#contactperson").val(pecah[5]);
            $("#nohp").val(pecah[6]);
            $("#alamat").val(pecah[7]);
            $("#termin").val(pecah[8]);
            $("#plafon").val(pecah[9]);
            $("#npwp").val(pecah[10]);
            $("#alamatnpwp").val(pecah[11]);
            $("#nomorrekening").val(pecah[12]);
            $("#keterangan").val(pecah[13]);
            $("#aktif").val(pecah[14]);

            f_tipekonsumen(pecah[3]);


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
          let link = "/master/konsumen/drop"; // Link untuk hapus

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
