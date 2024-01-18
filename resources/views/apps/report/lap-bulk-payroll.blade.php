
@extends('layouts/contentLayoutMaster')

@section('title', 'Laporan Payroll Detail')
@section('page-title', 'Laporan Payroll Detail')


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
          <label for="tanggalmulai">Tanggal Gaji Mulai</label>
          <input type="text" class="form-control date" name="tanggalmulai" id="tanggalmulai">
        </div>

        <div class="col-sm-12 col-md-6">
          <label for="tanggalselesai">Tanggal Gaji Selesai</label>
          <input type="text" class="form-control date" name="tanggalselesai" id="tanggalselesai">
        </div>

        <div class="col-sm-12 col-md-12 mt-1">
          <label for="karyawan">Karyawan</label>
          <select class="form-control select" name="karyawan" id="karyawan">
            <option value="All" data-foo="" selected> Semua Karyawan </option>
            @foreach($karyawans as $karyawan)
              <option value="{{ $karyawan->id}}" data-foo="{{ $karyawan->kode }}">{{ $karyawan->nama }}</option>
            @endforeach
          </select>
        </div>

        <div class="col-sm-6 col-md-6 mt-1">
          <label for="status">Status Pengajuan</label>
          <select class="form-control" name="status" id="status">
            <option value="Disetujui">Disetujui</option>
          </select>
        </div>

        <div class="col-sm-6 col-md-6 mt-1">
          <label for="jenisgaji">Jenis Gaji</label>
          <select class="form-control" name="jenisgaji" id="jenisgaji">
            <option value="All">Semua Jenis</option>
            <option value="Mingguan">Mingguan</option>
            <option value="Bulanan">Bulanan</option>
          </select>
        </div>

        <div class="col-sm-12 col-md-12 mt-2">
          <button type="button" id="btnsearch" name="btnsearch" onclick="f_loadtable()" class="btn bg-gradient-success waves-effect waves-light"> <i class="feather icon-search" style="margin-right:8px;"></i> Filter Data </button>
        </div>

      </div>

    </div>

    {{-- DataTable starts --}}
    <div class="table-responsive hidden mt-1" id="tabel">
      <table class="table data-list-view" style="border:none;width:100%;">
        <thead>
        <tr>
          <th>No.</th>
          <th>Nama Karyawan</th>
          <th>Ak. Pembayaran</th>
          <th>Tanggal Gaji</th>
          <th>Gaji Awal</th>
          <th>Pot. Absen</th>
          <th>Pot. Terlambat</th>
          <th>Pot. Pulang Awal</th>
          <th>Pot. Pinjaman</th>
          <th>Pot. Lainnya</th>
          <th>Lembur</th>
          <th>Bonus</th>
          <th>Gaji Bersih</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
          <th colspan="12" style="font-size:18px;text-align:right;"></th>
          <th style="font-size:18px;"></th>
        </tr>
        </tfoot>
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
      let status = $("#status").val();
      let jenisgaji = $("#jenisgaji").val();
      let karyawan = $("#karyawan").val();

      let link = "/report/lap-bulk-payroll/list" +
        "?tanggalmulai=" + tanggalmulai +
        "&tanggalselesai=" + tanggalselesai +
        "&jenisgaji=" + jenisgaji +
        "&karyawan=" + karyawan +
        "&status=" + status;

      $("#tabel").removeClass('hidden');

      dataListView = $(".data-list-view").DataTable({
        "destroy": true,
        processing: true,
        serverSide: true,
        ajax: link,
        columns: [
          {data: 'DT_RowIndex', name: 'DT_RowIndex', searchable: false},
          {data: 'namakaryawan', name: 'namakaryawan'},
          {data: 'namaakun', name: 'namaakun'},
          {data: 'tanggalgaji', name: 'tanggalgaji',render: function ( data, type, row, meta ) {
              if(data != null){
                  return moment(data).locale('id').format('DD MMMM YYYY');
              }else{
                  return '-';
              }
          }},
          {data: 'gaji_awal', name: 'gaji_awal', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'pot_absen', name: 'pot_absen', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'pot_terlambat', name: 'pot_terlambat', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'pot_pulangawal', name: 'pot_pulangawal', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'pot_pinjaman', name: 'pot_pinjaman', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'pot_lainnya', name: 'pot_lainnya', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'tambahan_lembur', name: 'tambahan_lembur', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'tambahan_bonus', name: 'tambahan_bonus', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'gaji_bersih', name: 'gaji_bersih', render: $.fn.dataTable.render.number( '.', ',', 0 )}
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
          { extend: 'excelHtml5', text: 'Export Excel', className: 'btn bg-gradient-primary waves-effect waves-light mr-1 rounded-btn', exportOptions: {columns: 'th:not(:last-child)'} },
          { extend: 'pdfHtml5', orientation: 'landscape', text: 'Export PDF', className: 'btn bg-gradient-info waves-effect waves-light mr-1 rounded-btn', exportOptions: {columns: 'th:not(:last-child)'} }
        ],
        aLengthMenu: [[10, 20, 50, -1], [10, 20, 50, 'All']],
        order: [[1, "desc"]],
        bInfo: true,
        pageLength: 50,
        "footerCallback": function ( row, data, start, end, display ) {
          var api = this.api(), data;

          // converting to interger to find total
          var intVal = function ( i ) {
            return typeof i === 'string' ?
              i.replace(/[\$,]/g, '')*1 :
              typeof i === 'number' ?
                i : 0;
          };

          var Total1 = api
            .column( 12 )
            .data()
            .reduce( function (a, b) {
              return intVal(a) + intVal(b);
            }, 0 );

          // Update footer by showing the total with the reference of the column index
          $( api.column( 0 ).footer() ).html('Subtotal : ');
          $( api.column( 12 ).footer() ).html('Rp '+accounting.formatNumber(Total1, 0, ".", ","));
        },
      });
    }

  </script>

@endsection
