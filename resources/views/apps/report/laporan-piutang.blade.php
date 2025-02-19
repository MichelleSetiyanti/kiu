@extends('layouts/contentLayoutMaster')

@section('title', 'Laporan Piutang')
@section('page-title', 'Laporan Piutang')


@section('vendor-style')
    {{-- vendor files --}}
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/tables/datatable/datatables.min.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/toastr.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/pickers/pickadate/pickadate.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/zebra_datepicker@latest/dist/css/bootstrap/zebra_datepicker.min.css">

@endsection
@section('page-style')
    {{-- Page css files --}}
    <link rel="stylesheet" href="{{ asset(mix('css/pages/data-list-view.css')) }}">
    <link rel="stylesheet" href="{{ asset(mix('css/plugins/extensions/toastr.css')) }}">

    <style>
        .invalid-tooltip {
            right: 0;
            margin-right: 15px;
        }

        .action-filters {
            width: 100%;
            text-align: right;
        }

        table.data-list-view.dataTable,
        table.data-thumb-view.dataTable {
            border-spacing: 0 !important;
            padding: 0.5rem 0.7rem !important;
        }

        table.dataTable tbody td.select-checkbox:before,
        table.dataTable tbody th.select-checkbox:before {
            margin-top: 5px;
        }

        table.dataTable tr.selected td.select-checkbox:after,
        table.dataTable tr.selected th.select-checkbox:after {
            margin-top: 0px;
        }

        .custom-btn {
            min-width: 200px;
        }

        .rounded-btn {
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
                    <input type="text" class="form-control filterdate" name="tanggalmulai" id="tanggalmulai">
                </div>

                <div class="col-sm-12 col-md-6">
                    <label for="tanggalselesai">Tanggal Selesai</label>
                    <input type="text" class="form-control filterdate" name="tanggalselesai" id="tanggalselesai">
                </div>

                <div class="col-sm-12 col-md-6 mt-1">
                    <label for="pajak"> Jenis Pajak</label>
                    <select class="form-control select" name="pajak" id="pajak">
                        <option value="PPN" data-foo="" selected> Dengan PPN </option>
                        <option value="NONPPN" data-foo="" selected> NON PPN </option>
                    </select>
                </div>

                <div class="col-sm-12 col-md-6 mt-1">
                    <label for="pelunasan"> Jenis Pelunasan</label>
                    <select class="form-control select" name="pelunasan" id="pelunasan">
                        <option value="Lunas" data-foo="" selected> Lunas </option>
                        <option value="Belum Lunas" data-foo="" selected> Belum Lunas </option>
                    </select>
                </div>

                <div class="col-sm-12 col-md-6 mt-1">
                    <label for="client"> Pilih Konsumen</label>
                    <select class="form-control select" name="client" id="client">
                        <option value="All" data-foo="" selected> Semua Konsumen </option>
                        @foreach ($clients as $konsumen)
                            <option value="{{ $konsumen->id }}"
                                data-foo="{{ $konsumen->kode }} - {{ $konsumen->keterangan }}">{{ $konsumen->nama }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="col-sm-12 col-md-12 mt-2">
                    <button type="button" id="btnsearch" name="btnsearch" onclick="f_loaddetil()"
                        class="btn bg-gradient-success waves-effect waves-light"> <i class="feather icon-search"
                            style="margin-right:8px;"></i> Filter Data </button>
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
    <script src="https://cdn.jsdelivr.net/npm/zebra_datepicker@1.9.13/dist/zebra_datepicker.min.js"></script>
@endsection
@section('page-script')
    {{-- Page js files --}}

    <script>
        let selected = [];
        let dataListView;

        $(document).ready(function() {

            "use strict"

            $("body").tooltip({
                selector: '[data-toggle=tooltip]'
            });

            $('.date').pickadate({
                formatSubmit: 'yyyy-mm-dd',
                monthsFull: ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus',
                    'September', 'Oktober', 'November', 'Desember'
                ],
                monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Ags', 'Sep', 'Okt', 'Nov',
                    'Des'
                ],
                weekdaysShort: ['Mgg', 'Sn', 'Sl', 'Rb', 'Kms', 'Jum', 'Sab'],
                today: 'Hari Ini',
                clear: 'Hapus Tanggal',
                close: 'Tutup',
                selectYears: true,
                selectMonths: true,
                firstDay: 1
            });

            $(".filterdate").Zebra_DatePicker({
                format: 'm-Y',
                default_position: 'below',
                icon_position: 'left',
            }).data('Zebra_DatePicker');

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
                '<div><div>' + state.text + '</div><div class="foo">' +
                $(state.element).attr('data-foo') +
                '</div></div>'
            );
        }

        function minmax(value, min, max) {
            if (parseInt(value) < min || isNaN(parseInt(value)))
                return min;
            else if (parseInt(value) > max)
                return max;
            else return value;
        }

        function f_tonumber(param) {
            let value = $("#" + param).val();
            $("#" + param).val(accounting.unformat(value, ','));
        }

        function f_tocurrency(param) {
            let value = $("#" + param).val();
            $("#" + param).val(accounting.formatNumber(value, 0, ".", ","));
        }

        function f_loaddetil() {
            let tanggalmulai = $("#tanggalmulai").val();
            let tanggalselesai = $("#tanggalselesai").val();
            let client = $("#client").val();
            let pajak = $("#pajak").val();
            let pelunasan = $("#pelunasan").val();

            if (tanggalmulai == "" || tanggalselesai == "") {
                alert('Pilih tanggal untuk melihat Laporan Rekap Penjualan');
                return;
            }

            let link = "/report/laporan-piutang/list" +
                "?tanggalmulai=" + tanggalmulai +
                "&tanggalselesai=" + tanggalselesai +
                "&client=" + client +
                "&pelunasan=" + pelunasan +
                "&pajak=" + pajak;

            window.open(link, '_blank');

        }
    </script>

@endsection
