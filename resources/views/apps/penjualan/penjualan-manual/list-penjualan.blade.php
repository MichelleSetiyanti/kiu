
@extends('layouts/contentLayoutMaster')

@section('title', 'List Sales Order')
@section('page-title', 'List Sales Order')

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

        <div class="col-sm-12 col-md-6">
            <label for="client"> Pilih Konsumen <span style="color:red;">(*)</span></label>
            <select class="form-control select" name="client" id="client">
                <option value="All" data-foo="" selected> Semua Konsumen </option>
                @foreach($konsumens as $konsumen)
                  <option value="{{ $konsumen->id }}" data-foo="{{ $konsumen->kode }} - {{ $konsumen->keterangan }}">{{ $konsumen->nama }}</option>
                @endforeach
            </select>
        </div>

        <div class="col-sm-12 col-md-6">
          <button type="button" id="btnsearch" name="btnsearch" onclick="f_loadtable()" class="btn bg-gradient-success waves-effect waves-light mt-2"> <i class="feather icon-search" style="margin-right:8px;"></i> Filter Data </button>
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
          <th>Konsumen</th>
          <th>Catatan</th>
          <th>Total</th>
          <th>Metode Pembayaran</th>
          <th>Action</th>
        </tr>
        </thead>
      </table>
    </div>
    {{-- DataTable ends --}}

    {{-- Modal --}}
    <div class="modal fade text-left" id="modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Detil Penjualan</h4>
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
                  <th>Qty</th>
                  <th>Harga</th>
                  <th>Diskon</th>
                  <th>Diskon Paket</th>
                  <th>Diskon Extra</th>
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

    {{-- Modal --}}
    <div class="modal fade text-left" id="modal2" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Bukti Invoice</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-center">

            <img id="buktitransfer" name="buktitransfer" src="" style="max-width:60%;"/>

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
      let client = $("#client").val();

      let link = "/penjualan/penjualan-manual/list-data-penjualan" +
        "?client=" + client;

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
          {data: 'namakonsumen', name: 'namakonsumen'},
          {data: 'keterangan', name: 'keterangan'},
          {data: 'grandtotal', name: 'grandtotal', render: $.fn.dataTable.render.number( '.', ',', 0, 'Rp ' )},
          {data: 'pembayaran', name: 'pembayaran',render: function ( data, type, row, meta ) {
              if(data == "Credit"){
                  return "<span class='badge badge-pill badge-warning'> Credit </span>";
              }else if(data == "Cash"){
                  return "<span class='badge badge-pill badge-success'> Cash </span>";
              }else{
                  return "<span class='badge badge-pill badge-info'> Transfer </span>";
              }
          }},
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

    function f_datadetil(param){

      let dataListView = $(".data-list-view-detail").DataTable({
        "destroy": true,
        processing: true,
        serverSide: true,
        ajax: "/penjualan/penjualan-manual/list-detil?id="+param,
        columns: [
          {data: 'DT_RowIndex', name: 'DT_RowIndex', searchable: false},
          {data: 'namabarang', name: 'namabarang'},
          {data: 'total_jual', name: 'total_jual', render: $.fn.dataTable.render.number( '.', ',', 2 )},
          {data: 'harga', name: 'harga', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'diskon', name: 'diskon', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'diskon_paket', name: 'diskon_paket', render: $.fn.dataTable.render.number( '.', ',', 0 )},
          {data: 'diskon_extra', name: 'diskon_extra', render: $.fn.dataTable.render.number( '.', ',', 0 )},
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

    function f_showgambar(param){
      $("#modal2").modal();
      $("#buktitransfer").attr('src','/'+param);
    }

    function f_pelunasan(param){
      Swal.fire({
        title: 'Konfirmasi',
        text: "Apakah anda yakin untuk melunaskan data ini?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
        confirmButtonClass: 'btn btn-primary',
        cancelButtonClass: 'btn btn-danger ml-1',
        buttonsStyling: false,
      }).then(function (result) {
        if (result.value) {
          let link = "/payment/pelunasan/pelunasan"; // Link untuk hapus

          $.post(link, {id: param, _token: '{{csrf_token()}}'})
            .done(function (data) {
              if (data == "berhasil") {
                toastr.success('Data ini berhasil dilunaskan.', 'Berhasil', { positionClass: 'toast-top-right', containerId: 'toast-top-right', "closeButton": true });
                f_loadtable();
              }
            });
        }
      })
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
          let link = "/penjualan/penjualan-manual/drop"; // Link untuk hapus

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

    function f_aksesedit(param){
        Swal.fire({
            title: 'Konfirmasi',
            text: "Apakah anda yakin untuk memberikan staff akses edit data ini?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Ya',
            cancelButtonText: 'Tidak',
            confirmButtonClass: 'btn btn-primary',
            cancelButtonClass: 'btn btn-danger ml-1',
            buttonsStyling: false,
        }).then(function (result) {
            if (result.value) {
                let link = "/penjualan/penjualan-umum/akses-edit"; // Link untuk hapus

                $.post(link, {id: param, _token: '{{csrf_token()}}'})
                    .done(function (data) {
                        if (data == "berhasil") {
                            toastr.success('Akses berhasil diberikan.', 'Berhasil', { positionClass: 'toast-top-right', containerId: 'toast-top-right', "closeButton": true });
                        }
                    });
            }
        })
    }

    function f_upload(param){
      $("#txtid").val(param);
      $("#flgambar").click();
    }

    $('#flgambar').change(function(e){
      if(e.target.files[0] != undefined){
        $('#txtgambar').val(e.target.files[0].name);
        $("#btnsubmit").click();
        toastr.success('Bukti pembayaran berhasil diupload.', 'Berhasil', { positionClass: 'toast-top-right', containerId: 'toast-top-right', "closeButton": true });
        f_loadtable();
      }else{
        $('#txtgambar').val('');
      }
      document.getElementById("txtgambar").dispatchEvent(new Event('input'));
    });

  </script>

@endsection
