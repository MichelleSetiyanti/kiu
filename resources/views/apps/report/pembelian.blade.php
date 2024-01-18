
@extends('layouts/contentLayoutMaster')

@section('title', 'Laporan Daftar Pembelian')
@section('page-title', 'Laporan Daftar Pembelian')


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
            <label for="client"> Pilih Penampung</label>
            <select class="form-control select" name="client" id="client">
                <option value="All" data-foo="" selected> Semua Penampung </option>
                @foreach($clients as $penampung)
                  <option value="{{ $penampung->id }}" data-foo="{{ $penampung->kode }} - {{ $penampung->keterangan }}">{{ $penampung->nama }}</option>
                @endforeach
            </select>
        </div>

        <div class="col-sm-6 col-md-6 mt-1">
          <label for="divisi">Divisi</label>
          <select class="form-control" name="divisi" id="divisi">
            <option value="All">Semua Divisi</option>
            <option value="Umum">Umum</option>
            <option value="Logam">Logam</option>
          </select>
        </div>

        <div class="col-sm-6 col-md-6 mt-1">
          <label for="metodepembayaran">Metode Pembayaran</label>
          <select class="form-control" name="metodepembayaran" id="metodepembayaran">
            <option value="All">Semua Metode</option>
            <option value="Cash">Cash</option>
            <option value="Credit">Credit</option>
          </select>
        </div>

        <div class="col-sm-6 col-md-6 mt-1">
          <label for="status">Status Pelunasan</label>
          <select class="form-control" name="status" id="status">
            <option value="All">Semua Status</option>
            <option value="paid">Lunas</option>
            <option value="not-paid">Belum Lunas</option>
          </select>
        </div>

        <div class="col-sm-6 col-md-6 mt-1">
          <label for="jenis">Jenis Pembelian</label>
          <select class="form-control" name="jenis" id="jenis">
            <option value="All">Semua Jenis</option>
            <option value="Umum">Pembelian Umum</option>
            <option value="Manual">Pembelian Manual</option>
            <option value="Khusus">Pembelian Khusus</option>
            <option value="Keliling">Pembelian Keliling</option>
          </select>
        </div>

        <div class="col-sm-12 col-md-12 mt-1">
          <label for="barang"> Filter Barang <span style="color:red;"> * (Hanya Terfilter di Data Detil) </span> </label>
          <select class="form-control select" name="barang" id="barang">
            <option value="All" data-foo="" selected> Semua Barang </option>
            @foreach($produks as $barang)
              <option value="{{ $barang->id }}" data-foo="{{ $barang->kode }}">{{ $barang->nama }}</option>
            @endforeach
          </select>
        </div>

        <div class="col-sm-12 col-md-12 mt-2">
          <button type="button" id="btnsearch" name="btnsearch" onclick="f_loadtable()" class="btn bg-gradient-success waves-effect waves-light"> <i class="feather icon-search" style="margin-right:8px;"></i> Filter Data </button>
          <button type="button" id="btnsearch" name="btnsearch" onclick="f_loaddetil()" class="btn bg-gradient-info waves-effect waves-light ml-2"> <i class="feather icon-list" style="margin-right:8px;"></i> Lihat Data Detil </button>
        </div>

      </div>

    </div>

    {{-- DataTable starts --}}
    <div class="table-responsive hidden mt-1" id="tabel">
      <table class="table data-list-view" style="border:none;width:100%;">
        <thead>
        <tr>
          <th>Kode.</th>
          <th>Tanggal</th>
          <th>Divisi</th>
          <th>Penampung</th>
          <th>Jenis Pembelian</th>
          <th>Metode Pembayaran</th>
          <th>Status Pelunasan</th>
          <th>Keterangan</th>
          <th>Biaya Tambahan</th>
          <th>Akun Pelunasan</th>
          <th>Total</th>
          <th>Action</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
          <th colspan="10" style="font-size:18px;text-align:right;"></th>
          <th style="font-size:18px;"></th>
          <th></th>
        </tr>
        </tfoot>
      </table>
    </div>
    {{-- DataTable ends --}}

    {{-- Modal --}}
    <div class="modal fade text-left" id="modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Detil Pembelian</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            {{-- DataTable starts --}}
            <div class="table-responsive pr-1 pl-1">
              <table class="table data-list-view-detail" style="border:none;width:100%;">
                <thead>
                <tr>
                  <th width="25px">No.</th>
                  <th>Nama Barang</th>
                  <th>Netto</th>
                  <th>Potongan</th>
                  <th>Total Beli</th>
                  <th>Harga</th>
                  <th>Subtotal</th>
                  <th>Catatan</th>
                </tr>
                </thead>
              </table>
            </div>
            {{-- DataTable ends --}}

          </div>
        </div>
      </div>
    </div>

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
      let client = $("#client").val();
      let status = $("#status").val();
      let jenis = $("#jenis").val();
      let metodepembayaran = $("#metodepembayaran").val();
      let divisi = $("#divisi").val();

      let link = "/report/pembelian/list" +
        "?tanggalmulai=" + tanggalmulai +
        "&tanggalselesai=" + tanggalselesai +
        "&client=" + client +
        "&jenis=" + jenis +
        "&metodepembayaran=" + metodepembayaran +
        "&divisi=" + divisi +
        "&status=" + status;

      $("#tabel").removeClass('hidden');

      dataListView = $(".data-list-view").DataTable({
        "destroy": true,
        processing: true,
        serverSide: true,
        ajax: link,
        columns: [
          {data: 'kode', name: 'kode'},
          {data: 'tanggal', name: 'tanggal',render: function ( data, type, row, meta ) {
              if(data != null){
                  return moment(data).locale('id').format('DD MMMM YYYY');
              }else{
                  return '-';
              }
          }},
          {data: 'kategori', name: 'kategori'},
          {data: 'namapenampung', name: 'namapenampung'},
          {data: 'tipe_pembelian', name: 'tipe_pembelian'},
          {data: 'pembayaran', name: 'pembayaran'},
          {data: 'sisa', name: 'sisa',render: function ( data, type, row, meta ) {
              if(data > 0){
                  return "<span class='badge badge-pill badge-warning'> Belum Lunas </span>";
              }else{
                  return "<span class='badge badge-pill badge-success'> Lunas </span>";
              }
          }},
          {data: 'keterangan', name: 'keterangan'},
          {data: 'biaya_tambahan', name: 'biaya_tambahan', render: $.fn.dataTable.render.number( '.', ',', 2, 'Rp ' )},
          {data: 'akunpelunasan', name: 'akunpelunasan'},
          {data: 'grandtotal', name: 'grandtotal', render: $.fn.dataTable.render.number( '.', ',', 2, 'Rp ' )},
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
            .column( 10 )
            .data()
            .reduce( function (a, b) {
              return intVal(a) + intVal(b);
            }, 0 );

          // Update footer by showing the total with the reference of the column index
          $( api.column( 0 ).footer() ).html('Subtotal : ');
          $( api.column( 10 ).footer() ).html('Rp '+accounting.formatNumber(Total1, 0, ".", ","));
        },
      });
    }

    function f_loaddetil(){
        let tanggalmulai = $("[name=tanggalmulai_submit]").val();
        let tanggalselesai = $("[name=tanggalselesai_submit]").val();
        let client = $("#client").val();
        let status = $("#status").val();
        let jenis = $("#jenis").val();
        let metodepembayaran = $("#metodepembayaran").val();
        let divisi = $("#divisi").val();
        let barang = $("#barang").val();

        if(tanggalmulai == "" || tanggalselesai == ""){
            alert('Pilih tanggal untuk melihat Laporan Pembelian Rinci');
            return;
        }

        let link = "/report/pembelian/list-detil" +
            "?tanggalmulai=" + tanggalmulai +
            "&tanggalselesai=" + tanggalselesai +
            "&client=" + client +
            "&jenis=" + jenis +
            "&metodepembayaran=" + metodepembayaran +
            "&divisi=" + divisi +
            "&barang=" + barang +
            "&status=" + status;

        window.open(link,'_blank');
    }

    function f_datadetil(param){

        let dataListView = $(".data-list-view-detail").DataTable({
            "destroy": true,
            processing: true,
            serverSide: true,
            ajax: "/pembelian/pembelian-umum/list-detil?id="+param,
            columns: [
                {data: 'DT_RowIndex', name: 'DT_RowIndex', searchable: false},
                {data: 'namabarang', name: 'namabarang'},
                {data: 'netto', name: 'netto', render: $.fn.dataTable.render.number( '.', ',', 2 )},
                {data: 'potongan', name: 'potongan', render: $.fn.dataTable.render.number( '.', ',', 2 )},
                {data: 'total_beli', name: 'total_beli', render: $.fn.dataTable.render.number( '.', ',', 2 )},
                {data: 'harga', name: 'harga', render: $.fn.dataTable.render.number( '.', ',', 0 )},
                {data: 'subtotal', name: 'subtotal', render: $.fn.dataTable.render.number( '.', ',', 0 )},
                {data: 'catatan', name: 'catatan'},
            ],
            responsive: false,
            scrollY: '50vh',
            scrollCollapse: true,
            columnDefs: [
                {
                    orderable: true,
                }
            ],
            dom:
                '<"clear">rt<"bottom"<"actions">p>',
            oLanguage: {
                sLengthMenu: "_MENU_",
                sSearch: ""
            },
            aLengthMenu: [[-1], ['All']],
            order: [[0, "asc"]],
            bInfo: false,
            pageLength: -1
        });

        dataListView.columns.adjust();

        $("#modal").modal();
    }

  </script>

@endsection