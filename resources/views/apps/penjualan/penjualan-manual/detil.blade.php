<?php
use Illuminate\Support\Facades\Crypt;
?>

@extends('layouts.contentLayoutMaster')

@section('title', 'Input Data Sales Order')
@section('page-title', 'Input Data Sales Order')


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
        .invalid-tooltip {
            right: 0;
            margin-right: 15px;
        }
    </style>
@endsection

@section('content')

    <!-- card actions section start -->
    <section>
        <!-- Info table about action starts -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Data Sales Order</h4>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li><a data-action="collapse"><i class="feather icon-chevron-down"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="row mb-1">

                                        <div class="col-sm-12 col-md-6 mb-1">

                                            <div class="row">

                                                <div class="col-sm-12 col-md-6 mb-1">
                                                    <label>Kode SO</label>
                                                    <input type="text" class="form-control"
                                                        value="{{ $penjualan->kode }}" readonly>
                                                </div>

                                                <div class="col-sm-12 col-md-6 mb-1">
                                                    <label>Nama Konsumen</label>
                                                    <select class="form-control select" name="konsumen" id="konsumen"
                                                        onchange="f_updatekonsumen(this.value)">
                                                        @foreach ($konsumens as $konsumen)
                                                            <option value="{{ $konsumen->id }}"
                                                                data-foo="{{ $konsumen->kode }} - {{ $konsumen->keterangan }}">
                                                                {{ $konsumen->nama }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-sm-12 col-md-6 mb-1">
                                                    <label>Tanggal SO</label>
                                                    <input type="text" class="form-control date" name="tanggal"
                                                        id="tanggal" onchange="f_ubahtanggal()" required>
                                                </div>

                                                <div class="col-sm-12 col-md-6 mb-1">
                                                    <label>Metode Pembayaran</label>
                                                    <select class="form-control" name="pembayaran" id="pembayaran"
                                                        onchange="ubahpembayaran(this.value)">
                                                        <option value="Cash">Cash</option>
                                                        <option value="Transfer">Transfer</option>
                                                        <option value="Credit">Credit</option>
                                                    </select>
                                                    <input type="text" class="form-control hidden"
                                                        value="{{ $penjualan->pembayaran }}" readonly>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="col-sm-12 col-md-6 mb-1">

                                            <div class="row">

                                                <div class="col-sm-12 col-md-12 mb-1">
                                                    <label>Keterangan</label>
                                                    <textarea class="form-control" name="keterangan" rows="3" id="keterangan">{{ $penjualan->keterangan }}</textarea>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="col-sm-12 col-md-12 mb-1 hidden">
                                            <label for="akuns">Pilih Akun Pembayaran</label>
                                            <select class="form-control select" name="akuns" id="akuns">
                                                @foreach ($akuns as $akun)
                                                    <option data-foo="{{ $akun->kategori }}"
                                                        value="{{ $akun->kode_akun }}">{{ $akun->kode_akun }} -
                                                        {{ $akun->nama }}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Info table about action Ends -->
    </section>

    {{-- Data list view starts --}}
    <section id="data-list-view" class="data-list-view-header card" style="padding:25px 15px;">

        <div class="col-md-12">
            <div class="row">

                <input type="hidden" name="id_temp" id="id_temp" />
                <input type="hidden" name="action" id="action" />

                <div class="col-sm-12 col-md-3">
                    <label for="produks">Produk</label>
                    <select class="form-control select" name="produks" id="produks" onchange="f_updatedetail()">
                        <option id="kosong" value="kosong" data-foo="" selected readonly> Pilih Produk </option>
                        @foreach ($produks as $produk)
                            <option id="{{ $produk->nama }}#{{ $produk->harga }}"
                                data-foo="{{ number_format($produk->harga, 0, ',', '.') }}" value="{{ $produk->id }}">
                                {{ $produk->nama }} - {{ $produk->kode }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="col-sm-12 col-md-3 pl-0 hidden">
                    <label for="namaproduk">Nama Produk</label>
                    <input type="text" class="form-control" name="namaproduk" id="namaproduk" readonly>
                </div>

                <div class="col-sm-12 col-md-2">
                    <div class="row">

                        <div class="col-sm-9 col-md-9 pl-0">
                            <label for="nominal">Harga</label>
                            <input type="text" class="form-control" name="nominal" id="nominal" value="0"
                                onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);">
                        </div>

                        <div class="col-sm-3 col-md-3 pl-0">
                            <button type="button" id="btnhistory" name="btnhistory"
                                style="padding:9px;margin-top:20px;"
                                class="btn bg-gradient-warning waves-effect waves-light" data-toggle="tooltip"
                                title="Lihat History Harga" onclick="historyharga();"> <i class="feather icon-rotate-cw"
                                    style="font-size:20px;"></i> </button>
                        </div>

                    </div>
                </div>

                <div class="col-sm-12 col-md-1 pl-0">
                    <label for="totaljual">Qty</label>
                    <input type="text" class="form-control" name="totaljual" id="totaljual" value="0"
                        onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);">
                </div>

                <div class="col-sm-12 col-md-4">
                    <div class="row">

                        <div class="col-sm-12 col-md-4 pl-0">
                            <label for="diskon">Diskon</label>
                            <input type="text" class="form-control" name="diskon" id="diskon" value="0"
                                onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);">
                        </div>

                        <div class="col-sm-12 col-md-4 pl-0">
                            <label for="diskonpaket">Diskon Paket</label>
                            <input type="text" class="form-control" name="diskonpaket" id="diskonpaket"
                                value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);">
                        </div>

                        <div class="col-sm-12 col-md-4 pl-0">
                            <label for="diskonextra">Diskon Extra</label>
                            <input type="text" class="form-control" name="diskonextra" id="diskonextra"
                                value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);">
                        </div>

                    </div>
                </div>

                <div class="col-sm-12 col-md-1 pl-0 hidden">
                    <label for="potonganitem">Potongan</label>
                    <input type="text" class="form-control" name="potonganitem" id="potonganitem" value="0"
                        onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);">
                </div>

                <div class="col-sm-12 col-md-2 pl-0">
                    <label for="catatan">Catatan</label>
                    <input type="text" class="form-control" name="catatan" id="catatan">
                </div>

            </div>

        </div>

        {{-- DataTable starts --}}
        <div class="table-responsive">
            <table class="table data-list-view" style="border:none;">
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
                        <th>Action</th>
                    </tr>
                </thead>
            </table>
        </div>
        {{-- DataTable ends --}}

        <div class="col-md-12 mt-1">

            <div class="row mr-1">

                <div class="col-md-6 mt-1 offset-3 col-sm-12 text-right">
                    <h4 style="margin:6px auto;"> Subtotal : </h4>
                </div>
                <div class="col-md-3 mt-1 col-sm-12">
                    <input type="text" class="form-control" style="font-weight: bold;" name="subtotal"
                        id="subtotal" value="Rp 0" readonly>
                </div>

                <div class="col-md-6 mt-1 offset-3 col-sm-12 text-right">
                    <h4 style="margin:6px auto;"> Diskon Nota : </h4>
                </div>
                <div class="col-md-3 mt-1 col-sm-12">
                    <input type="text" class="form-control" style="font-weight: bold;" name="diskonnota"
                        id="diskonnota" value="0" onfocus="f_tonumber(this.id)"
                        onblur="f_tocurrency(this.id);f_hitungtotal();">
                </div>

                <div class="col-md-6 mt-1 offset-3 col-sm-12 text-right">
                    <h4 style="margin:6px auto;"> Pajak : </h4>
                </div>
                <div class="col-md-1 mt-1 col-sm-3">
                    <select class="form-control" id="ifpajak" name="ifpajak" onchange="f_hitungtotal()">
                        <option value="N">Tidak</option>
                        <option value="Y">Ya</option>
                    </select>
                </div>
                <div class="col-md-2 mt-1 col-sm-9">
                    <input type="text" class="form-control" style="font-weight: bold;" name="pajak" id="pajak"
                        value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);f_hitungtotal();"
                        readonly>
                </div>

                <div class="col-md-6 mt-1 offset-3 col-sm-12 text-right hidden">
                    <h4 style="margin:6px auto;"> Biaya Tambahan : </h4>
                </div>
                <div class="col-md-3 mt-1 col-sm-12 hidden">
                    <input type="text" class="form-control" style="font-weight: bold;" name="biayatambahan"
                        id="biayatambahan" value="0" onfocus="f_tonumber(this.id)"
                        onblur="f_tocurrency(this.id);f_hitungtotal();">
                </div>

                <div class="col-md-6 mt-1 offset-3 col-sm-12 text-right">
                    <h4 style="margin:6px auto;"> DP : </h4>
                </div>
                <div class="col-md-3 mt-1 col-sm-12">
                    <input type="text" class="form-control" style="font-weight: bold;" name="downpayment"
                        id="downpayment" value="0" onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id);">
                </div>

                <div class="col-md-6 mt-1 offset-3 col-sm-12 text-right">
                    <h4 style="margin:6px auto;"> Total Akhir : </h4>
                </div>
                <div class="col-md-3 mt-1 col-sm-12">
                    <input type="text" class="form-control" style="font-weight: bold;" name="totalakhir"
                        id="totalakhir" value="Rp 0" readonly>
                </div>

                <div class="col-md-12 mt-1 col-sm-12 text-right">
                    <button type="button" id="btnsimpan" name="btnsimpan"
                        class="btn bg-gradient-info waves-effect waves-light mr-2"
                        onclick="f_prosesdata('belum selesai')"> Simpan Sementara </button>
                    <button type="button" id="btnsimpan" name="btnsimpan"
                        class="btn bg-gradient-success waves-effect waves-light" onclick="f_prosesdata('selesai')">
                        Selesai Input Data </button>
                </div>

            </div>

        </div>

        {{-- Modal --}}
        <div class="modal fade text-left" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Edit Data</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="row mb-1">

                            <div class="col-sm-12 col-md-6">

                                <div class="row">

                                    <div class="col-sm-12 col-md-12 mb-1">
                                        <label>Kode Barang</label>
                                        <input type="text" class="form-control" id="kodedetil" value=""
                                            readonly>
                                    </div>

                                    <div class="col-sm-12 col-md-12 mb-1">
                                        <label>Nama Barang</label>
                                        <input type="text" class="form-control" id="namadetil" value=""
                                            readonly>
                                    </div>

                                    <div class="col-sm-12 col-md-12 mb-1">
                                        <label>Qty</label>
                                        <input type="text" class="form-control" id="totaljualdetil" value="0"
                                            onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id)">
                                    </div>

                                    <div class="col-sm-12 col-md-12 mb-1">
                                        <label>Harga Jual</label>
                                        <input type="text" class="form-control" id="nominaldetil" value="0"
                                            onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id)">
                                    </div>

                                </div>


                            </div>

                            <div class="col-sm-12 col-md-6">

                                <div class="row">

                                    <div class="col-sm-12 col-md-12 mb-1">
                                        <label>Diskon</label>
                                        <input type="text" class="form-control" id="diskondetil" value="0"
                                            onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id)">
                                    </div>

                                    <div class="col-sm-12 col-md-12 mb-1">
                                        <label>Diskon Paket</label>
                                        <input type="text" class="form-control" id="diskonpaketdetil" value="0"
                                            onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id)">
                                    </div>

                                    <div class="col-sm-12 col-md-12 mb-1">
                                        <label>Diskon Extra</label>
                                        <input type="text" class="form-control" id="diskonextradetil" value="0"
                                            onfocus="f_tonumber(this.id)" onblur="f_tocurrency(this.id)">
                                    </div>

                                    <div class="col-sm-12 col-md-12 mb-1">
                                        <label>Catatan</label>
                                        <input type="text" class="form-control" id="catatandetil" value="">
                                    </div>

                                    <div class="col-sm-12 col-md-12 mb-1">
                                        <button type="button" class="btn bg-gradient-success waves-effect waves-light"
                                            onclick="f_addtemp()"> Simpan Perubahan </button>
                                    </div>

                                </div>

                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>

        {{-- Modal --}}
        <div class="modal fade text-left" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel2">History Harga Jual</h4>
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
                                        <th>Kode Transaksi</th>
                                        <th>Tanggal</th>
                                        <th>Qty</th>
                                        <th>Harga</th>
                                        <th>Diskon</th>
                                        <th>Diskon Paket</th>
                                        <th>Diskon Extra</th>
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
    <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/extensions/toastr.min.js')) }}"></script>
    <script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
    <script src="http://cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime.js"></script>
    <script src="https://unpkg.com/accounting@0.4.1/accounting.js"></script>
    <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/pickers/pickadate/picker.date.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/pickers/pickadate/legacy.js')) }}"></script>
    <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
    <script src="https://unpkg.com/accounting@0.4.1/accounting.js"></script>
@endsection
@section('page-script')
    {{-- Page js files --}}

    <script>
        let idpenjualan = "{{ $penjualan->id }}";

        let konsumen = "{{ $penjualan->id_konsumens }}";

        let idencrypt = "{{ Crypt::encrypt($penjualan->id) }}";

        let tanggal = "{{ $penjualan->tanggal }}"

        $(document).ready(function() {

            "use strict"

            $("body").tooltip({
                selector: '[data-toggle=tooltip]'
            });
            $('#biayatambahan').val(accounting.formatNumber({{ $penjualan->biaya_tambahan }}, 2, ".", ","));

            // init list view datatable
            f_loadtable();
            f_hitungtotal();
            f_clear();

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

            $(".select").select2({
                dropdownAutoWidth: true,
                width: '100%',
                matcher: matchCustom,
                templateResult: formatCustom
            });

            const tanggal_js = new Date(tanggal);
            $("#tanggal").pickadate('picker').set('select', tanggal_js);

            $("#pembayaran").val("{{ $penjualan->pembayaran }}").trigger('change');

            $("#konsumen").val("{{ $penjualan->id_konsumens }}").trigger('change');

            let downpayment = "{{ $penjualan->dp }}";

            $("#downpayment").val(accounting.formatNumber(downpayment, 2, ".", ","));

        });

        function f_ubahtanggal() {
            let tanggalsubmit = $("[name=tanggal_submit]").val();

            if (tanggalsubmit != tanggal) {
                $.post('/penjualan/penjualan-manual/update-tanggal', {
                        idpenjualan: idpenjualan,
                        tanggal: tanggalsubmit,
                        _token: '{{ csrf_token() }}'
                    })
                    .done(function(data) {
                        if (data != "gagal") {
                            location.reload();
                        }
                    });
            }
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

        function formatCustom(state) {
            return $(
                '<div><div>' + state.text + '</div><div class="foo">' +
                $(state.element).attr('data-foo') +
                '</div></div>'
            );
        }

        function f_updatekonsumen(idbaru) {
            if (idbaru != konsumen) {
                $.post('/penjualan/penjualan-manual/update-konsumen', {
                        idpenjualan: idpenjualan,
                        konsumen: idbaru,
                        _token: '{{ csrf_token() }}'
                    })
                    .done(function(data) {
                        if (data != "gagal") {
                            location.reload();
                        }
                    });
            }
        }

        function f_loadtable() {
            let dataListView = $(".data-list-view").DataTable({
                "destroy": true,
                processing: true,
                serverSide: true,
                ajax: "/penjualan/penjualan-manual/list-detil?id=" + idpenjualan,
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        searchable: false
                    },
                    {
                        data: 'namabarang',
                        name: 'namabarang'
                    },
                    {
                        data: 'total_jual',
                        name: 'total_jual',
                        render: $.fn.dataTable.render.number('.', ',', 2)
                    },
                    {
                        data: 'harga',
                        name: 'harga',
                        render: $.fn.dataTable.render.number('.', ',', 2)
                    },
                    {
                        data: 'diskon',
                        name: 'diskon',
                        render: $.fn.dataTable.render.number('.', ',', 2)
                    },
                    {
                        data: 'diskon_paket',
                        name: 'diskon_paket',
                        render: $.fn.dataTable.render.number('.', ',', 2)
                    },
                    {
                        data: 'diskon_extra',
                        name: 'diskon_extra',
                        render: $.fn.dataTable.render.number('.', ',', 2)
                    },
                    {
                        data: 'subtotal',
                        name: 'subtotal',
                        render: $.fn.dataTable.render.number('.', ',', 2)
                    },
                    {
                        data: 'catatan',
                        name: 'catatan'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    }
                ],
                responsive: false,
                columnDefs: [{
                    orderable: true,
                }],
                dom: '<"top"<"actions action-btns"B><"action-filters"lf>><"clear">rt<"bottom"<"actions">p>',
                oLanguage: {
                    sLengthMenu: "_MENU_",
                    sSearch: ""
                },
                aLengthMenu: [
                    [10, 20, 50, -1],
                    [10, 20, 50, 'All']
                ],
                order: [
                    [0, "asc"]
                ],
                bInfo: false,
                "paging": false,
                "bLengthChange": false,
                pageLength: -1,
                buttons: [{
                    text: "<i class='feather icon-plus'></i> Simpan Data",
                    action: function() {
                        f_addtemp()
                    },
                    className: "btn bg-gradient-success waves-effect waves-light",
                }],
                initComplete: function(settings, json) {
                    $(".dt-buttons .btn").removeClass("btn-secondary")
                }
            });
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
            $("#" + param).val(accounting.formatNumber(value, 2, ".", ","));
        }

        function nl2br(str, is_xhtml) {
            if (typeof str === 'undefined' || str === null) {
                return '';
            }
            var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';
            return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
        }

        $('#modal').on('hidden.bs.modal', function() {
            $("#action").val('Simpan');
        })

        function historyharga() {
            let produks = document.getElementById('produks').value;

            if (produks != "kosong") {
                let dataListView = $(".data-list-view-detail").DataTable({
                    "destroy": true,
                    processing: true,
                    serverSide: true,
                    ajax: "/penjualan/penjualan-manual/history-harga?idbarang=" + produks + "&konsumen=" + konsumen,
                    columns: [{
                            data: 'DT_RowIndex',
                            name: 'DT_RowIndex',
                            searchable: false
                        },
                        {
                            data: 'kodepenjualan',
                            name: 'kodepenjualan'
                        },
                        {
                            data: 'tanggalpenjualan',
                            name: 'tanggalpenjualan',
                            render: function(data, type, row, meta) {
                                if (data != null) {
                                    return moment(data).locale('id').format('DD MMMM YYYY');
                                } else {
                                    return '-';
                                }
                            }
                        },
                        {
                            data: 'total_jual',
                            name: 'total_jual',
                            render: $.fn.dataTable.render.number('.', ',', 2)
                        },
                        {
                            data: 'harga',
                            name: 'harga',
                            render: $.fn.dataTable.render.number('.', ',', 2)
                        },
                        {
                            data: 'diskon',
                            name: 'diskon',
                            render: $.fn.dataTable.render.number('.', ',', 2)
                        },
                        {
                            data: 'diskon_paket',
                            name: 'diskon_paket',
                            render: $.fn.dataTable.render.number('.', ',', 2)
                        },
                        {
                            data: 'diskon_extra',
                            name: 'diskon_extra',
                            render: $.fn.dataTable.render.number('.', ',', 2)
                        },
                        {
                            data: 'catatan',
                            name: 'catatan'
                        }
                    ],
                    responsive: false,
                    scrollY: '50vh',
                    scrollCollapse: true,
                    columnDefs: [{
                        orderable: true,
                    }],
                    dom: '<"clear">rt<"bottom"<"actions">p>',
                    oLanguage: {
                        sLengthMenu: "_MENU_",
                        sSearch: ""
                    },
                    aLengthMenu: [
                        [-1],
                        ['All']
                    ],
                    order: [
                        [0, "asc"]
                    ],
                    bInfo: false,
                    pageLength: -1
                });

                dataListView.columns.adjust();

                $("#modal2").modal();
            } else {
                Swal.fire('Peringatan', 'Pilih Produk terlebih dahulu!', 'error');
            }

        }

        function f_addtemp() {
            let produks = document.getElementById('produks').value;
            let action = $("#action").val();

            if ((produks != "kosong" && action == "Simpan") || action == "Edit") {
                let id_temp = $("#id_temp").val();
                let catatan = $("#catatan").val();
                let totaljual = accounting.unformat($("#totaljual").val(), ',');
                let harga = accounting.unformat($("#nominal").val(), ',');
                let diskon = accounting.unformat($("#diskon").val(), ',');
                let diskonpaket = accounting.unformat($("#diskonpaket").val(), ',');
                let diskonextra = accounting.unformat($("#diskonextra").val(), ',');

                if (action == "Simpan") {
                    $.post('/penjualan/penjualan-manual/store-detil', {
                            idpenjualan: idpenjualan,
                            produk: produks,
                            totaljual: totaljual,
                            harga: harga,
                            catatan: catatan,
                            diskon: diskon,
                            diskonpaket: diskonpaket,
                            diskonextra: diskonextra,
                            _token: '{{ csrf_token() }}'
                        })
                        .done(function(data) {
                            const toastAttributes = {
                                    positionClass: 'toast-top-right',
                                    containerId: 'toast-top-right',
                                    "closeButton": true
                                };
                            if (data == "stockhabis") {
                                f_clear();
                                toastr.error('Stock Tidak Mencukupi.', 'Warning', toastAttributes);
                                f_loadtable();
                                f_hitungtotal();
                            } else if (data != "gagal") {
                                f_clear();
                                toastr.success('Data ini berhasil disimpan.', 'Berhasil', toastAttributes);
                                f_loadtable();
                                f_hitungtotal();
                            } else {
                                Swal.fire('Peringatan', 'Data gagal tersimpan!', 'error');
                            }
                        });
                } else if (action == "Edit") {
                    catatan = $("#catatandetil").val();
                    totaljual = accounting.unformat($("#totaljualdetil").val(), ',');
                    harga = accounting.unformat($("#nominaldetil").val(), ',');
                    diskon = accounting.unformat($("#diskondetil").val(), ',');
                    diskonpaket = accounting.unformat($("#diskonpaketdetil").val(), ',');
                    diskonextra = accounting.unformat($("#diskonextradetil").val(), ',');

                    $.post('/penjualan/penjualan-manual/update-detil', {
                            id_temp: id_temp,
                            idpenjualan: idpenjualan,
                            totaljual: totaljual,
                            harga: harga,
                            catatan: catatan,
                            diskon: diskon,
                            diskonpaket: diskonpaket,
                            diskonextra: diskonextra,
                            _token: '{{ csrf_token() }}'
                        })
                        .done(function(data) {
                            if (data == "berhasil") {
                                f_clear();
                                toastr.success('Data ini berhasil diedit.', 'Berhasil', {
                                    positionClass: 'toast-top-right',
                                    containerId: 'toast-top-right',
                                    "closeButton": true
                                });
                                $("#modal").modal('hide');
                                f_loadtable();
                                f_hitungtotal();
                            } else {
                                Swal.fire('Peringatan', 'Data gagal tersimpan!', 'error');
                            }
                        });
                }
            } else {
                Swal.fire('Peringatan', 'Pilih Produk terlebih dahulu!', 'error');
            }
        }

        function f_edittemp(param) {
            let link = "/penjualan/penjualan-manual/request-data-detil"; // Link untuk request data

            $.post(link, {
                    id_temp: param,
                    _token: '{{ csrf_token() }}'
                })
                .done(function(data) {
                    let pecah = data.split("|");
                    if (pecah[0] == "ada") {

                        $('#id_temp').val(param);
                        $("#kodedetil").val(pecah[1]);
                        $("#namadetil").val(pecah[2]);
                        $('#totaljualdetil').val(accounting.formatNumber(pecah[3], 2, ".", ","));
                        $('#nominaldetil').val(accounting.formatNumber(pecah[4], 2, ".", ","));
                        $('#diskondetil').val(accounting.formatNumber(pecah[5], 2, ".", ","));
                        $('#diskonpaketdetil').val(accounting.formatNumber(pecah[6], 2, ".", ","));
                        $('#diskonextradetil').val(accounting.formatNumber(pecah[7], 2, ".", ","));
                        $("#catatandetil").val(pecah[8]);
                        $("#action").val("Edit");

                        $("#modal").modal();
                    }
                });
        }

        function f_deletetemp(param) {
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
            }).then(function(result) {
                if (result.value) {
                    let link = "/penjualan/penjualan-manual/drop-detil"; // Link untuk hapus

                    $.post(link, {
                            id: param,
                            _token: '{{ csrf_token() }}'
                        })
                        .done(function(data) {
                            if (data == "berhasil") {
                                toastr.success('Data ini berhasil dihapus.', 'Berhasil', {
                                    positionClass: 'toast-top-right',
                                    containerId: 'toast-top-right',
                                    "closeButton": true
                                });
                                f_loadtable();
                                f_hitungtotal();
                            } else {
                                Swal.fire('Peringatan', 'Data gagal tersimpan!', 'error');
                            }
                        });
                }
            })
        }

        function f_updatedetail() {
            let produk = $("#produks").find('option:selected').attr('id');
            if (produk != "kosong") {
                let data = produk.split("#");
                let harga = data[1];

                $("#namaproduk").val(data[0]);
                $("#nominal").val(accounting.formatNumber(harga, 2, ".", ","));
                $("#totaljual").val(accounting.formatNumber(0, 2, ".", ","));
            }
        }

        function f_clear() {
            $("#produks").val("kosong").trigger('change');
            $("#nominal").val(0);
            $("#namaproduk").val("");
            $("#catatan").val("");
            $("#totaljual").val(0);
            $("#diskon").val(0);
            $("#diskonextra").val(0);
            $("#diskonpaket").val(0);
            $("#potonganitem").val(0);
            $("#action").val("Simpan");
            $("#produks").focus();
        }

        function f_hitungtotal() {
            $.post('/penjualan/penjualan-manual/request-total-detil', {
                    idpenjualan: idpenjualan,
                    _token: '{{ csrf_token() }}'
                })
                .done(function(data) {
                    let pecah = data.split("|");
                    if (pecah[0] == "ada") {
                        let subtotal = parseInt(pecah[1]);
                        let diskon = accounting.unformat($("#diskonnota").val(), ',');
                        let biayatambahan = accounting.unformat($("#biayatambahan").val(), ',');
                        let pajak = 0;

                        let ifpajak = $("#ifpajak").val();

                        if (ifpajak == "Y") {
                            pajak = ((subtotal + biayatambahan - diskon) * 11) / 100;
                        }

                        $("#pajak").val(accounting.formatMoney(pajak, "Rp ", 0, ".", ","));
                        $("#subtotal").val(accounting.formatMoney(subtotal, "Rp ", 0, ".", ","));
                        $("#totalakhir").val(accounting.formatMoney((subtotal + biayatambahan - diskon) + pajak, "Rp ",
                            0, ".", ","));
                    }
                });
        }

        function f_prosesdata(param) {
            f_loadtable();
            f_hitungtotal();

            let action = "Belum Selesai";

            if (param == "selesai") {
                action = "Selesai";
            }

            let kodepenjualan = "{{ $penjualan->kode }}";
            let pembayaran = "{{ $penjualan->pembayaran }}";
            let akun = $("#akuns").val();
            let keterangan = $("#keterangan").val();
            let downpayment = accounting.unformat($("#downpayment").val(), ',');
            let subtotal = accounting.unformat($("#subtotal").val(), ',');
            let diskon = accounting.unformat($("#diskonnota").val(), ',');
            let pajak = accounting.unformat($("#pajak").val(), ',');
            let biayatambahan = accounting.unformat($("#biayatambahan").val(), ',');
            let totalakhir = accounting.unformat($("#totalakhir").val(), ',');

            $.post('/penjualan/penjualan-manual/proses-detil', {
                    idpenjualan: idpenjualan,
                    kodepenjualan: kodepenjualan,
                    downpayment: downpayment,
                    keterangan: keterangan,
                    subtotal: subtotal,
                    diskon: diskon,
                    pajak: pajak,
                    biayatambahan: biayatambahan,
                    totalakhir: totalakhir,
                    akunpembayaran: akun,
                    pembayaran: pembayaran,
                    action: action,
                    _token: '{{ csrf_token() }}'
                })
                .done(function(data) {
                    if (data == "berhasil") {
                        Swal.fire({
                            title: 'Informasi',
                            text: "Data berhasil tersimpan",
                            type: 'info',
                            confirmButtonText: 'Ya',
                            confirmButtonClass: 'btn btn-primary',
                            buttonsStyling: false,
                        }).then(function(result) {
                            location.href = "/penjualan/penjualan-manual/";
                        })
                    } else {
                        Swal.fire('Peringatan', 'Data gagal tersimpan!', 'error');
                    }
                });
        }

        function ubahpembayaran(value) {
            let pembayaranlama = "{{ $penjualan->pembayaran }}";

            if (value != pembayaranlama) {
                $.post('/penjualan/penjualan-umum/ubah-metode-pembayaran', {
                        idpenjualan: idpenjualan,
                        pembayaran: value,
                        _token: '{{ csrf_token() }}'
                    })
                    .done(function(data) {
                        location.reload();
                    });
            }
        }
    </script>

@endsection
