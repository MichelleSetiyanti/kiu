
@extends('layouts/contentLayoutMaster')

@section('title', 'Neraca - Induk Skontro')
@section('page-title', 'Neraca - Induk Skontro')


@section('vendor-style')
  {{-- vendor files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/datatables.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/toastr.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">

  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
  <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
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

    .rounded-btn{
      border-radius: 0.4285rem !important;
    }

    .modal-dialog,
    .modal-content {
      /* 80% of window height */
      max-height: 80% !important;
    }

    .modal-body {
      overflow-y: scroll;
    }

  </style>
@endsection

@section('content')
  {{-- Data list view starts --}}
  <section id="data-list-view" class="data-list-view-header card" style="padding:25px 15px;">
    <div class="col-md-12">

      <div class="row">

        <div class="col-sm-12 col-md-6">
          <label for="tanggal">S/D Tanggal :</label>
          <input type="text" class="form-control date" name="tanggal" id="tanggal">
        </div>

        <div class="col-sm-12 col-md-12 mt-2">
          <button type="button" id="btnsearch" name="btnsearch" onclick="f_loaddata()" class="btn bg-gradient-success waves-effect waves-light"> <i class="feather icon-search" style="margin-right:8px;"></i> Filter Data </button>
          <button type="button" id="btndownload" name="btndownload" onclick="f_download()" class="btn bg-gradient-info waves-effect waves-light ml-1"> <i class="feather icon-download" style="margin-right:8px;"></i> Download Laporan </button>
        </div>

      </div>

      <div class="row html-content hidden mb-4" id="detil">

        <div class="col-md-12" style="font-size:18px;color:black;margin:auto;">

          <h1 class="text-center" style="margin-top:50px;"><b>CV. Muara Jaya Abadi</b></h1>
          <h2 class="text-center"> <b>Neraca - Induk Skontro</b> </h2>
          <h3 class="text-center mb-5" id="textperiodelaporan"> Periode Jan 2024 s/d Mar 2024 </h3>

          <div id="detildata" class="row">


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

      $("#tanggal").pickadate('picker').set('select',new Date());

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

      $(".data-list-view-log").DataTable({scrollX: true, scrollCollapse: true,});

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

    function formatDate(dateString) {
        var bulan = ['Januari', 'Februari', 'Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];

        var tanggal = new Date(dateString).getDate();
        var xbulan = new Date(dateString).getMonth();
        var xtahun = new Date(dateString).getYear();

        var bulan = bulan[xbulan];
        var tahun = (xtahun < 1000)?xtahun + 1900 : xtahun;

        return tanggal + ' ' + bulan + ' ' + tahun;
    }

    function f_loaddata(){
      let tanggal = $("[name=tanggal_submit]").val();


      if(tanggal != ""){
        $.post('/report/neraca/get-data',{tanggal: tanggal, _token: '{{csrf_token()}}'})
            .done(function(data){
                $("#detil").removeClass('hidden');

                $("#textperiodelaporan").html("Per Tanggal. "+formatDate(tanggal));

                $("#detildata").html(data);
            });
      }else{
        toastr.error('Pilih tanggal terlebih dahulu.', 'Peringatan', { positionClass: 'toast-top-right', containerId: 'toast-top-right', "closeButton": true });
      }
    }

    function f_download(){
        $(".no-print").hide();

        let tanggal = $("[name=tanggal_submit]").val();

        var HTML_Width = $(".html-content").width();
        var HTML_Height = $(".html-content").height();
        var top_left_margin = 30;
        var PDF_Width = HTML_Width + (top_left_margin * 2);
        var PDF_Height = (PDF_Width * 1.5) + (top_left_margin * 2);
        var canvas_image_width = HTML_Width;
        var canvas_image_height = HTML_Height;

        var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;

        html2canvas($(".html-content")[0],{scale:2}).then(function (canvas) {
            var imgData = canvas.toDataURL("image/jpeg", 1.0);
            var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
            pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);
            for (var i = 1; i <= totalPDFPages; i++) {
                pdf.addPage(PDF_Width, PDF_Height);
                pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
            }
            pdf.save("Neraca - Induk Skontro - Per Tanggal. "+formatDate(tanggal)+".pdf");
            $(".no-print").show();
        });
    }
  </script>

@endsection
