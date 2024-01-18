
@extends('layouts/contentLayoutMaster')

@section('title', 'Laporan Pembelian Harian')
@section('page-title', 'Laporan Pembelian Harian')


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

    .table-detil th,.table-detil td{
        border: 1px solid black;
        text-align: center;
    }

    .top-left {
        position: absolute;
        top: 150px;
        right: 40px;
        transform: rotate(-40deg);
        z-index: 999;
        opacity: .7;
        color: red;
        font-size: 32px;
        font-weight: bold;
        border: 2px solid red;
        border-radius: 5px;
        padding: 5px 10px;
    }

  </style>
@endsection

@section('content')
  {{-- Data list view starts --}}
  <section id="data-list-view" class="data-list-view-header card" style="padding:25px 15px;">

    <div class="col-md-12">
      <div class="row">

        <div class="col-sm-12 col-md-12">
          <label for="tanggal">Tanggal</label>
          <input type="text" class="form-control date" name="tanggal" id="tanggal">
        </div>

        <div class="col-sm-12 col-md-12 mt-2">
          <button type="button" id="btnsearch" name="btnsearch" onclick="f_loaddetil()" class="btn bg-gradient-success waves-effect waves-light"> <i class="feather icon-list" style="margin-right:8px;"></i> Lihat Semua Data </button>
          <button type="button" id="btnsearch2" name="btnsearch2" onclick="f_loaddetilmasuk()" class="btn bg-gradient-info waves-effect waves-light ml-1"> <i class="feather icon-list" style="margin-right:8px;"></i> Lihat Data Masuk </button>
          <button type="button" id="btnsearch3" name="btnsearch3" onclick="f_loaddetilhasiltimbang()" class="btn bg-gradient-warning waves-effect waves-light ml-1"> <i class="feather icon-list" style="margin-right:8px;"></i> Lihat Data Hasil Timbang </button>
        </div>

        <div class="col-sm-12 col-md-12 mt-2">
          <div class="row">
            @foreach($pembelians as $pembelian)
              @php
                $penampung = DB::table('penampungs')->where('id',$pembelian->id_penampungs)->first();
                $pembelian_details = DB::table('pembelian_details')
                    ->join('barang_belis','pembelian_details.id_barang_belis','=','barang_belis.id')
                    ->select('pembelian_details.*','barang_belis.nama as namabarang','barang_belis.kode as kodebarang')
                    ->where('pembelian_details.id_pembelians',$pembelian->id)
                    ->orderBy('pembelian_details.created_at','asc')->get();

                $gambar = "truck.png";

                if($pembelian->tipe_pembelian == "Khusus"){
                  $gambar = "truck-2.png";
                }else if($pembelian->tipe_pembelian == "Keliling"){
                  $gambar = "truck-3.png";
                }
              @endphp

              <div class="col-md-6 col-12">
                <div class="card-detail">
                  <div class="card-header">
                    <h2 class="card-title col-md-12 text-center">{{ $penampung->nama.' - '.$pembelian->kategori }}</h2>
                  </div>
                  <div class="card-content">
                    <div class="card-body">
                      <div class="row">
                        @if($pembelian->status == "Selesai")
                          @if($pembelian->pembayaran == "Credit" and $pembelian->sisa > 0)
                            <div class="top-left">TRANSFER</div>
                          @else
                            <div class="top-left">LUNAS</div>
                          @endif
                        @endif

                        <div class="col-md-4 pb-2">
                          <img src="{{ url('/images/icons/'.$gambar) }}" width="100%" />
                        </div>
                        <div class="col-md-8">
                          <div class="browser-info">
                            <b>No.</b> {{$pembelian->kode}} <br />
                            <b>Tgl.</b> {{\Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $pembelian->created_at)->isoFormat('D-M-Y H:mm:ss')}} <br />
                            <b>Mobil.</b> {{$pembelian->no_plat}} ({{ $pembelian->sopir }}) <br />
                            <b>Bruto = </b> {{number_format($pembelian->bruto,0,',','.')}} <br />

                            @if($pembelian->status == "Selesai")
                              <b>Tara = </b> {{number_format($pembelian->tara,0,',','.')}} <br />
                              <b>Netto = </b> {{number_format($pembelian->netto,0,',','.')}} <br />
                            @endif

                          </div>
                        </div>
                        <div class="col-md-12">
                          <textarea class="form-control mb-2" rows="2" placeholder="Keterangan" disabled>{{$pembelian->keterangan}}</textarea>
                          <table class="table-detil">
                            <thead>
                            <tr>
                              <th>Kode</th>
                              <th>Barang</th>
                              <th>Jumlah</th>
                              <th>Harga</th>
                              <th>Subtotal</th>
                              </tr>
                            </thead>
                            <tbody>

                            @foreach($pembelian_details as $pembeliandetail)
                              <tr>
                                <td> {{$pembeliandetail->kodebarang}} </td>
                                <td> {{$pembeliandetail->namabarang}} </td>
                                <td> {{number_format($pembeliandetail->total_beli,0,',','.')}} </td>
                                <td> {{number_format($pembeliandetail->harga,0,',','.')}} </td>
                                <td> {{number_format($pembeliandetail->subtotal,0,',','.')}} </td>
                              </tr>
                            @endforeach

                            </tbody>
                          </table>

                          @if($pembelian->status != "Selesai")
                            <h4 class="mt-2"><b>{{ $pembelian->status }}</b></h4>
                          @endif

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            @endforeach
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

    let tanggal = new Date('{{ $date }}');

    $(document).ready(function() {

      "use strict"

      let viewport = document.querySelector("meta[name=viewport]");
      viewport.setAttribute('content', 'width=1500');

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

      $("#tanggal").pickadate('picker').set('select', tanggal);

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

    function f_loaddetil(){
        let tanggal = $("[name=tanggal_submit]").val();

        if(tanggal == ""){
            alert('Pilih tanggal untuk melihat Laporan Pembelian Rinci');
            return;
        }

        let link = "/report/pembelian-harian/date/" + tanggal;

        window.open(link,'_self');
    }

    function f_loaddetilmasuk(){
        let tanggal = $("[name=tanggal_submit]").val();

        if(tanggal == ""){
            alert('Pilih tanggal untuk melihat Laporan Pembelian Rinci');
            return;
        }

        let link = "/report/pembelian-harian/date-masuk/" + tanggal;

        window.open(link,'_self');
    }

    function f_loaddetilhasiltimbang(){
        let tanggal = $("[name=tanggal_submit]").val();

        if(tanggal == ""){
            alert('Pilih tanggal untuk melihat Laporan Pembelian Rinci');
            return;
        }

        let link = "/report/pembelian-harian/date-hasil-timbang/" + tanggal;

        window.open(link,'_self');
    }

  </script>

@endsection
