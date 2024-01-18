
@extends('layouts/contentLayoutMaster')

@section('title', 'History Pelunasan Piutang per Konsumen')
@section('page-title', 'History Pelunasan Piutang per Konsumen')


@section('vendor-style')
  {{-- vendor files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/datatables.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/select.dataTables.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/toastr.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link type="text/css" href="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.12/css/dataTables.checkboxes.css" rel="stylesheet" />

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

    .rounded-btn{
      border-radius: 0.4285rem !important;
    }

    table.data-list-view.dataTable, table.data-thumb-view.dataTable{
      border-spacing: 0 !important;
      padding: 0.5rem 0.7rem !important;
    }

    table.dataTable tbody td.select-checkbox:before, table.dataTable tbody th.select-checkbox:before{
      margin-top: 15px;
    }

    table.dataTable tr.selected td.select-checkbox:after, table.dataTable tr.selected th.select-checkbox:after{
      margin-top: 10px;
    }

    .custom-btn{
      min-width: 200px;
    }

    #loader {
      width: 100%;
      height: 100%;
      position: absolute;
      z-index: -1;
      opacity: 0;
      background-color: white;
      transition: all .5s ease-in-out;
      text-align: center;
      vertical-align: middle;
    }

    #loader img {
      margin: auto;
      max-width: 400px;
    }

    .loading #loader {z-index: 1000; opacity: 1.0}

  </style>
@endsection

@section('content')
  <div id="loader">
    <img src="{{ asset('images/preloader.gif') }}" />
    <h1> Data anda sedang diproses.<br />Jangan menutup halaman ini!</h1>
  </div>

  {{-- Data list view starts --}}
  <section id="data-list-view" class="data-list-view-header card" style="padding:25px 15px;">

    <div class="row">

      {{-- DataTable starts --}}
      <div class="table-responsive mt-1" id="tabel">
        <table class="table data-list-view" style="border:none;width:100%;">
          <thead>
          <tr>
            <th>Kode</th>
            <th>Tanggal</th>
            <th>Nama Konsumen</th>
            <th>Status</th>
            <th>Total Bayar</th>
            <th>Action</th>
          </tr>
          </thead>
        </table>
      </div>
      {{-- DataTable ends --}}

    </div>

  </section>
  {{-- Data list view end --}}
@endsection
@section('vendor-script')
  {{-- vendor js files --}}
  <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/datatables.buttons.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/tables/datatable/dataTables.select.min.js')) }}"></script>
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
  <script type="text/javascript" src="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.12/js/dataTables.checkboxes.min.js"></script>
@endsection
@section('page-script')
  {{-- Page js files --}}

  <script>

    let selected = [];
    let dataListView;
    let totalpelunasan = 0;

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

      f_loadtable();

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

    function f_delete(param){
        Swal.fire({
            title: 'Konfirmasi',
            text: "Apakah anda yakin untuk cancel data pelunasan ini?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Ya',
            cancelButtonText: 'Tidak',
            confirmButtonClass: 'btn btn-primary',
            cancelButtonClass: 'btn btn-danger ml-1',
            buttonsStyling: false,
        }).then(function (result) {
            if (result.value) {
                let link = "/penjualan/piutang-customer/cancel-data"; // Link untuk hapus

                $.post(link, {id: param, _token: '{{csrf_token()}}'})
                    .done(function (data) {
                        if (data == "berhasil") {
                            toastr.success('Data ini berhasil dihapus.', 'Berhasil', { positionClass: 'toast-top-right', containerId: 'toast-top-right', "closeButton": true });
                            f_loadtable();
                            f_hitungtotal();
                        }else{
                            Swal.fire('Peringatan', 'Data gagal tersimpan!', 'error');
                        }
                    });
            }
        })
    }

    function f_loadtable(){
        let link = "/penjualan/piutang-customer/list-data-history";

        dataListView = $(".data-list-view").DataTable({
            "destroy": true,
            processing: true,
            serverSide: true,
            ajax: link,
            columns: [
                {data: 'kode', name: 'kode'},
                {data: 'created_at', name: 'created_at',render: function ( data, type, row, meta ) {
                        if(data != null){
                            return moment(data).locale('id').format('DD MMMM YYYY');
                        }else{
                            return '-';
                        }
                    }},
                {data: 'namakonsumen', name: 'namakonsumen'},
                {data: 'status', name: 'status'},
                {data: 'nominal', name: 'nominal', render: $.fn.dataTable.render.number( '.', ',', 0, '' )},
                {data: 'action', name: 'action', orderable: false, searchable: false, width: 120}
            ],
            scrollX: true,
            scrollCollapse: true,
            columnDefs: [
                {
                    orderable: true,
                }
            ],
            dom:
                '<"top"<"action-filters"Blf>><"clear">rt<"bottom"<"actions">pi>',
            oLanguage: {
                sLengthMenu: "_MENU_",
                sSearch: ""
            },
            buttons: [

            ],
            aLengthMenu: [[10, 20, 50, -1], [10, 20, 50, 'All']],
            order: [[1, "desc"]],
            bInfo: false,
            pageLength: 50,
        });
    }

  </script>

@endsection
