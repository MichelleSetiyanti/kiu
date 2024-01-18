
@extends('layouts/contentLayoutMaster')

@section('title', 'Laporan Dropshipper')
@section('page-title', 'Laporan Dropshipper')


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
          <label for="bayarpembelian">Status Bayar Pembelian</label>
          <select class="form-control" name="bayarpembelian" id="bayarpembelian">
            <option value="All">Semua Status</option>
            <option value="Y">Sudah Bayar</option>
            <option value="N">Belum Bayar</option>
          </select>
        </div>

        <div class="col-sm-6 col-md-6 mt-1">
          <label for="bayarpenjualan">Status Bayar Penjualan</label>
          <select class="form-control" name="bayarpenjualan" id="bayarpenjualan">
            <option value="All">Semua Status</option>
            <option value="Y">Sudah Bayar</option>
            <option value="N">Belum Bayar</option>
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
          <th width="45px">No.</th>
          <th>Kode</th>
          <th>Tanggal</th>
          <th>Penampung</th>
          <th>Total Jual</th>
          <th>Total Beli</th>
          <th>T. DP Penampung</th>
          <th>T. Biaya Tambahan</th>
          <th>Laba</th>
          <th>Action</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
          <th colspan="8" style="font-size:18px;text-align:right;"></th>
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
            <h4 class="modal-title" id="myModalLabel">Jasa Dropshipper Kontainer</h4>
            <button type="button" class="close" data-dismiss="modal" id="btntutupmodal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <form id="form" novalidate autocomplete="false">

              <div class="row">
                <input type="hidden" name="id" id="id" />
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="kode">Kode Transaksi</label>
                  <input type="text" class="form-control" name="kode" id="kode" readonly>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="penampung">Nama Penampung</label>
                  <select class="form-control select" name="penampung" id="penampung" onchange="getutangdp(this.value)" required>
                    <option value="" data-foo="" selected disabled> Pilih Penampung </option>
                    @foreach($clients as $penampung)
                      <option value="{{ $penampung->id }}" data-utangdp="{{ $penampung->utang_dp }}" data-foo="{{ $penampung->kode }} - {{ $penampung->keterangan }}">{{ $penampung->nama }}</option>
                    @endforeach
                  </select>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="tanggal">Tanggal Transaksi</label>
                  <input type="text" class="form-control date" name="tanggal" id="tanggal" placeholder="Tanggal Transaksi" required>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="nokontainer">Nomor Kontainer</label>
                  <input type="text" class="form-control" name="nokontainer" id="nokontainer" placeholder="Nomor Kontainer" required>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="nosegel">Nomor Segel</label>
                  <input type="text" class="form-control" name="nosegel" id="nosegel" placeholder="Nomor Segel" required>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="nonota">Nomor Nota</label>
                  <input type="text" class="form-control" name="nonota" id="nonota" placeholder="Nomor Nota" required>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="dp">Potong Utang DP</label>
                  <input type="text" class="form-control" name="dp" id="dp" value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);f_hitung();" required>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="utangdp">Utang DP Saat Ini</label>
                  <input type="text" class="form-control" name="utangdp" id="utangdp" value="0" readonly>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="biayatambahanotomatis">Biaya Tambahan</label>
                  <input type="text" class="form-control" name="biayatambahanotomatis" id="biayatambahanotomatis" value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);f_hitung();" required>
                </div>
                <div class="col-sm-4 mb-1 data-field-col hidden">
                  <label for="biayatambahan">Biaya Tambahan</label>
                  <input type="text" class="form-control" name="biayatambahan" id="biayatambahan" value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);f_hitung();" required>
                </div>
                <div class="col-sm-6 mb-1 data-field-col">
                  <label for="qty">Qty</label>
                  <input type="text" class="form-control" name="qty" id="qty" value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);f_hitung();" required>
                </div>
                <div class="col-sm-6 mb-1 data-field-col"> </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="hargabeli">Harga Beli</label>
                  <input type="text" class="form-control" name="hargabeli" id="hargabeli" value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);f_hitung();" required>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="totalbeli">Total Beli</label>
                  <input type="text" class="form-control" name="totalbeli" id="totalbeli" value="0" readonly>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="sisabayar">Sisa Bayar</label>
                  <input type="text" class="form-control" name="sisabayar" id="sisabayar" value="0" readonly>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="hargajual">Harga Jual</label>
                  <input type="text" class="form-control" name="hargajual" id="hargajual" value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);f_hitung();" required>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="totaljual">Total Jual</label>
                  <input type="text" class="form-control" name="totaljual" id="totaljual" value="0" readonly>
                </div>
                <div class="col-sm-4 mb-1 data-field-col">
                  <label for="potongan">Potongan</label>
                  <input type="text" class="form-control" name="potongan" id="potongan" value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);f_hitung();" required>
                </div>
                <div class="col-sm-12 mb-1 data-field-col">
                  <label for="laba">Laba</label>
                  <input type="text" class="form-control" name="laba" id="laba" value="0" readonly>
                </div>
                <div class="col-sm-12 mb-1 data-field-col proposal">
                  <label for="keterangan">Keterangan</label>
                  <textarea class="form-control" name="keterangan" id="keterangan" required></textarea>
                </div>
                <div class="col-sm-12 text-right mt-2 mb-1 pr-3">
                  <button type="button" class="btn btn-primary" value="Simpan" id="btnsubmit" name="btnsubmit" onclick="f_simpan(this.value)">Submit</button>
                </div>
              </div>

            </form>

          </div>
        </div>
      </div>
    </div>

    {{-- Modal --}}
    <div class="modal fade text-left" id="modal2" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel2" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel2">Rincian Biaya</h4>
            <button type="button" class="close" data-dismiss="modal" id="btntutup2" aria-label="Close">
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
                  <th>Kode</th>
                  <th>Nama Item</th>
                  <th>Tanggal</th>
                  <th>Biaya</th>
                  <th>Status</th>
                  <th>Catatan</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th style="font-size:18px;text-align:right;"></th>
                  <th colspan="2" style="font-size:18px;"></th>
                </tr>
                </tfoot>
              </table>
            </div>
            {{-- DataTable ends --}}

          </div>
        </div>
      </div>
    </div>

    {{-- Modal --}}
    <div class="modal fade text-left" id="modal3" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel2" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel2">Rincian Pinjaman Penampung</h4>
            <button type="button" class="close" data-dismiss="modal" id="btntutup3" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            {{-- DataTable starts --}}
            <div class="table-responsive pr-1 pl-1">
              <table class="table data-list-view-detail-2" style="border:none;width:100%;">
                <thead>
                <tr>
                  <th width="45px">No.</th>
                  <th>Kode</th>
                  <th>Penampung</th>
                  <th>Akun</th>
                  <th>Keterangan</th>
                  <th>Tanggal</th>
                  <th>Nominal (Rp. )</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th colspan="2" style="font-size:18px;text-align:right;"></th>
                  <th style="font-size:18px;"></th>
                </tr>
                </tfoot>
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
      let bayarpembelian = $("#bayarpembelian").val();
      let bayarpenjualan = $("#bayarpenjualan").val();

      let link = "/report/dropshipper/list" +
        "?tanggalmulai=" + tanggalmulai +
        "&tanggalselesai=" + tanggalselesai +
        "&client=" + client +
        "&bayarpembelian=" + bayarpembelian +
        "&bayarpenjualan=" + bayarpenjualan;

      $("#tabel").removeClass('hidden');

      dataListView = $(".data-list-view").DataTable({
        "destroy": true,
        processing: true,
        serverSide: true,
        ajax: link,
        columns: [
          {data: 'DT_RowIndex', name: 'DT_RowIndex', searchable: false},
          {data: 'kode', name: 'kode'},
          {data: 'tanggal', name: 'tanggal',render: function ( data, type, row, meta ) {
                  if(data != null){
                      return moment(data).locale('id').format('DD MMMM YYYY');
                  }else{
                      return '-';
                  }
              }},
          {data: 'namapenampung', name: 'namapenampung'},
          {data: 'kolomtotaljual', name: 'kolomtotaljual'},
          {data: 'kolomtotalbeli', name: 'kolomtotalbeli'},
          {data: 'totaldppenampung', name: 'totaldppenampung', render: $.fn.dataTable.render.number( '.', ',', 0, 'Rp ' )},
          {data: 'totalbiaya', name: 'totalbiaya', render: $.fn.dataTable.render.number( '.', ',', 0, 'Rp ' )},
          {data: 'laba', name: 'laba', render: $.fn.dataTable.render.number( '.', ',', 0, 'Rp ' )},
          {data: 'action', name: 'action', orderable: false, searchable: false}
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
        order: [[0, "asc"]],
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
            .column( 8 )
            .data()
            .reduce( function (a, b) {
              return intVal(a) + intVal(b);
            }, 0 );

          // Update footer by showing the total with the reference of the column index
          $( api.column( 0 ).footer() ).html('Subtotal : ');
          $( api.column( 8 ).footer() ).html('Rp '+accounting.formatNumber(Total1, 0, ".", ","));
        },
      });
    }

    function getutangdp(param){
        let link = "/jasa/dropshipper/request-data-utangdp"; // Link untuk request data

        $.post(link, {id: param, _token: '{{csrf_token()}}'})
            .done(function (data) {
                if(data != "gak ada"){
                    $("#utangdp").val(accounting.formatNumber(data, 0, ".", ","));
                }
            });
    }

    function f_viewdata(param){
      let link = "/jasa/dropshipper/request-data"; // Link untuk request data

      $.post(link, {id: param, _token: '{{csrf_token()}}'})
          .done(function (data) {
              let pecah = data.split("|");
              if (pecah[0] == "ada") {
                  $("#id").val(pecah[1]).attr('readonly',true);
                  $("#kode").val(pecah[2]).attr('readonly',true);
                  $("#keterangan").val(pecah[3]).attr('readonly',true);
                  $("#penampung").val(pecah[4]).trigger('change').attr('disabled',true);
                  $("#nokontainer").val(pecah[5]).attr('readonly',true);
                  $("#nonota").val(pecah[6]).attr('readonly',true);
                  $("#nosegel").val(pecah[7]).attr('readonly',true);
                  if(pecah[8] != "") {
                      $("#tanggal").attr('disabled',false);

                      const tanggal_js = new Date(pecah[8]);
                      $("#tanggal").pickadate('picker').set('select', tanggal_js);

                      $("#tanggal").attr('disabled',true);
                  }
                  $("#totalbeli").val(accounting.formatNumber(pecah[9], 2, ".", ",")).attr('readonly',true);
                  $("#totaljual").val(accounting.formatNumber(pecah[10], 2, ".", ",")).attr('readonly',true);
                  $("#sisabayar").val(accounting.formatNumber(pecah[11], 2, ".", ",")).attr('readonly',true);
                  $("#laba").val(accounting.formatNumber(pecah[12], 2, ".", ",")).attr('readonly',true);
                  $("#dp").val(accounting.formatNumber(pecah[13], 2, ".", ",")).attr('readonly',true);
                  $("#biayatambahan").val(accounting.formatNumber(pecah[14], 2, ".", ",")).attr('readonly',true);
                  $("#qty").val(accounting.formatNumber(pecah[15], 2, ".", ",")).attr('readonly',true);
                  $("#hargabeli").val(accounting.formatNumber(pecah[16], 2, ".", ",")).attr('readonly',true);
                  $("#hargajual").val(accounting.formatNumber(pecah[17], 2, ".", ",")).attr('readonly',true);
                  $("#potongan").val(accounting.formatNumber(pecah[18], 0, ".", ",")).attr('readonly',true);
                  $("#biayatambahanotomatis").val(accounting.formatNumber(pecah[19], 0, ".", ",")).attr('readonly',true);

                  $("#btnsubmit").addClass('hidden');
                  $("#modal").modal();
              }
          });
    }

    function f_viewbiaya(param){

        let dataListView = $(".data-list-view-detail").DataTable({
            "destroy": true,
            processing: true,
            serverSide: true,
            ajax: "/jasa/dropshipper/detil-biaya/list-detil?id="+param,
            columns: [
                {data: 'DT_RowIndex', name: 'DT_RowIndex', searchable: false},
                {data: 'kode', name: 'kode'},
                {data: 'nama', name: 'nama'},
                {data: 'tanggal', name: 'tanggal',render: function ( data, type, row, meta ) {
                        if(data != null){
                            return moment(data).locale('id').format('DD MMMM YYYY');
                        }else{
                            return '-';
                        }
                    }},
                {data: 'nominal', name: 'nominal', render: $.fn.dataTable.render.number( '.', ',', 2 )},
                {data: 'status', name: 'status',render: function ( data, type, row, meta ) {
                    if(data == "Lunas"){
                        return '<span class="badge badge-pill bg-success">Lunas</span>';
                    }else{
                        return '<span class="badge badge-pill bg-warning">Belum Lunas</span>';
                    }
                }},
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
                    .column( 4 )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );

                // Update footer by showing the total with the reference of the column index
                $( api.column( 3 ).footer() ).html('Subtotal : ');
                $( api.column( 4 ).footer() ).html('Rp '+accounting.formatNumber(Total1, 0, ".", ","));
            },
            aLengthMenu: [[-1], ['All']],
            order: [[0, "asc"]],
            bInfo: false,
            pageLength: -1
        });

        dataListView.columns.adjust();

        $("#modal2").modal();
    }

    function f_viewdp(param){

        let dataListView = $(".data-list-view-detail-2").DataTable({
            "destroy": true,
            processing: true,
            serverSide: true,
            ajax: "/report/dropshipper/list-dp?id="+param,
            columns: [
                {data: 'DT_RowIndex', name: 'DT_RowIndex', searchable: false},
                {data: 'kode', name: 'kode'},
                {data: 'namapenampung', name: 'namapenampung'},
                {data: 'kolomakun', name: 'kolomakun'},
                {data: 'keterangan', name: 'keterangan'},
                {data: 'tanggal', name: 'tanggal',render: function ( data, type, row, meta ) {
                        if(data != null){
                            return moment(data).locale('id').format('DD MMMM YYYY');
                        }else{
                            return '-';
                        }
                    }},
                {data: 'nominal', name: 'nominal', render: $.fn.dataTable.render.number( '.', ',', 0, 'Rp ' )}
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
                    .column( 6 )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );

                // Update footer by showing the total with the reference of the column index
                $( api.column( 4 ).footer() ).html('Subtotal : ');
                $( api.column( 6 ).footer() ).html('Rp '+accounting.formatNumber(Total1, 0, ".", ","));
            },
            aLengthMenu: [[-1], ['All']],
            order: [[0, "asc"]],
            bInfo: false,
            pageLength: -1
        });

        dataListView.columns.adjust();

        $("#modal3").modal();
    }

  </script>

@endsection
