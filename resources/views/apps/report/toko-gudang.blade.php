
@extends('layouts/contentLayoutMaster')

@section('title', 'Laporan Mutasi Toko ke Pabrik')
@section('page-title', 'Laporan Mutasi Toko ke Pabrik')


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

  </style>
@endsection

@section('content')
  {{-- Data list view starts --}}
  <section id="data-list-view" class="data-list-view-header card" style="padding:25px 15px;">

    <div class="col-md-12">
      <div class="row">

        <div class="col-sm-12 col-md-6">
          <label for="tanggalmulai">Tanggal Mulai</label>
          <input type="text" class="form-control date" name="tanggalmulai" id="tanggalmulai">
        </div>

        <div class="col-sm-12 col-md-6">
          <label for="tanggalselesai">Tanggal Selesai</label>
          <input type="text" class="form-control date" name="tanggalselesai" id="tanggalselesai">
        </div>

        <div class="col-sm-12 col-md-12 mt-1">
          <label for="produks">Pilih Barang</label>
          <select class="form-control select" name="produks" id="produks">
              <option data-foo="" value="All"> Semua Barang </option>
            @foreach($produks as $produk)
              <option id="{{ $produk->nama }}" data-foo="" value="{{ $produk->id }}">{{ $produk->kode }} - {{ $produk->nama }}</option>
            @endforeach
          </select>
        </div>

        <div class="col-sm-12 col-md-12 mt-2">
          <button type="button" id="btnsearch" name="btnsearch" onclick="f_loadtable()" class="btn bg-gradient-info waves-effect waves-light"> <i class="feather icon-list" style="margin-right:8px;"></i> Lihat Data Mutasi </button>
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
        </tr>
        </thead>
      </table>
    </div>
    {{-- DataTable ends --}}

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

    function f_loadtable(){
        let tanggalmulai = $("[name=tanggalmulai_submit]").val();
        let tanggalselesai = $("[name=tanggalselesai_submit]").val();
        let produks = $("#produks").val();

        $("#tabel").removeClass('hidden');

        let dataListView = $(".data-list-view").DataTable({
            "destroy": true,
            processing: true,
            serverSide: true,
            ajax: "/report/toko-gudang/list?tanggalmulai=" + tanggalmulai + "&tanggalselesai=" + tanggalselesai + "&produks=" + produks,
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
                    }}
            ],
            responsive: false,
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
            aLengthMenu: [[10, 20, 50, -1], [10, 20, 50, 'All']],
            order: [[1, "desc"]],
            bInfo: false,
            pageLength: 50,
            buttons: [
                { extend: 'excelHtml5', text: 'Export Excel', className: 'btn bg-gradient-primary waves-effect waves-light mr-1 rounded-btn' },
                { extend: 'pdfHtml5', orientation: 'landscape', text: 'Export PDF', className: 'btn bg-gradient-info waves-effect waves-light mr-1 rounded-btn' }
            ],
            initComplete: function (settings, json) {
                $(".dt-buttons .btn").removeClass("btn-secondary")
            }
        });
    }

  </script>

@endsection