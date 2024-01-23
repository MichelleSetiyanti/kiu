@php
    function penyebut($nilai)
    {
        $nilai = abs($nilai);
        $huruf = ['', 'satu', 'dua', 'tiga', 'empat', 'lima', 'enam', 'tujuh', 'delapan', 'sembilan', 'sepuluh', 'sebelas'];
        $temp = '';
        if ($nilai < 12) {
            $temp = ' ' . $huruf[$nilai];
        } elseif ($nilai < 20) {
            $temp = penyebut($nilai - 10) . ' belas';
        } elseif ($nilai < 100) {
            $temp = penyebut($nilai / 10) . ' puluh' . penyebut($nilai % 10);
        } elseif ($nilai < 200) {
            $temp = ' seratus' . penyebut($nilai - 100);
        } elseif ($nilai < 1000) {
            $temp = penyebut($nilai / 100) . ' ratus' . penyebut($nilai % 100);
        } elseif ($nilai < 2000) {
            $temp = ' seribu' . penyebut($nilai - 1000);
        } elseif ($nilai < 1000000) {
            $temp = penyebut($nilai / 1000) . ' ribu' . penyebut($nilai % 1000);
        } elseif ($nilai < 1000000000) {
            $temp = penyebut($nilai / 1000000) . ' juta' . penyebut($nilai % 1000000);
        } elseif ($nilai < 1000000000000) {
            $temp = penyebut($nilai / 1000000000) . ' milyar' . penyebut(fmod($nilai, 1000000000));
        } elseif ($nilai < 1000000000000000) {
            $temp = penyebut($nilai / 1000000000000) . ' trilyun' . penyebut(fmod($nilai, 1000000000000));
        }
        return $temp;
    }

    function terbilang($nilai)
    {
        if ($nilai < 0) {
            $hasil = 'minus ' . trim(penyebut($nilai));
        } else {
            $hasil = trim(penyebut($nilai));
        }
        return $hasil . ' Rupiah';
    }
@endphp

<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=1500">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Invoice - {{ $penjualan->kode_inv . ' - ' . $penjualan->namakonsumen }} </title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

    <style>
        /* latin */
        @font-face {
            font-family: 'Calibri';
            font-style: italic;
            font-weight: 400;
            src: url(https://fonts.gstatic.com/l/font?kit=J7adnpV-BGlaFfdAhLQo6btPMDoTpA&skey=36a3d5758e0e2f58&v=v15) format('woff2');
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
        }

        /* latin */
        @font-face {
            font-family: 'Calibri';
            font-style: italic;
            font-weight: 700;
            src: url(https://fonts.gstatic.com/l/font?kit=J7aYnpV-BGlaFfdAhLQgUp5aHRgejiMIKQ&skey=8b00183e5f6700b6&v=v15) format('woff2');
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
        }

        /* latin */
        @font-face {
            font-family: 'Calibri';
            font-style: normal;
            font-weight: 400;
            src: url(https://fonts.gstatic.com/l/font?kit=J7afnpV-BGlaFfdAhLEY67FIEjg&skey=a1029226f80653a8&v=v15) format('woff2');
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
        }

        /* latin */
        @font-face {
            font-family: 'Calibri';
            font-style: normal;
            font-weight: 700;
            src: url(https://fonts.gstatic.com/l/font?kit=J7aanpV-BGlaFfdAjAo9_pxqHxIZrCE&skey=cd2dd6afe6bf0eb2&v=v15) format('woff2');
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
        }
    </style>

    <style>
        body {
            color: #2e323c;
            background: #f5f6fa;
            position: relative;
            height: 100%;
            -webkit-print-color-adjust: exact !important;
            color-adjust: exact !important;
            font-family: "Calibri";
            margin: 0;
        }

        .invoice-container {
            padding: 1rem;
            padding-top: 50px;
        }

        .invoice-container .invoice-header .invoice-logo {
            margin: 0.8rem 0 0 0;
            display: inline-block;
            font-size: 1.6rem;
            font-weight: 700;
            color: #2e323c;
        }

        .invoice-container .invoice-header .invoice-logo img {
            max-width: 300px;
            margin-top: -20px;
            margin-left: 10px;
        }

        .invoice-container .invoice-header address {
            font-size: 0.8rem;
            color: #9fa8b9;
            margin: 0;
        }

        .invoice-container .invoice-details {
            margin: 10px 0 0 54%;
            padding: 1rem;
            line-height: 180%;
            color: white;
            width: 200px;
        }

        .invoice-container .invoice-details .invoice-num {
            text-align: right;
            font-size: 0.8rem;
        }

        .invoice-container .invoice-body {
            padding: 1rem 0 0 0;
            font-size: 4rem;
        }

        .invoice-container .invoice-footer {
            text-align: center;
            font-size: 0.7rem;
            margin: 5px 0 0 0;
        }

        .invoice-status {
            text-align: center;
            padding: 1rem;
            background: #ffffff;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            margin-bottom: 1rem;
        }

        .invoice-status h2.status {
            margin: 0 0 0.8rem 0;
        }

        .invoice-status h5.status-title {
            margin: 0 0 0.8rem 0;
            color: #9fa8b9;
        }

        .invoice-status p.status-type {
            margin: 0.5rem 0 0 0;
            padding: 0;
            line-height: 150%;
        }

        .invoice-status i {
            font-size: 1.5rem;
            margin: 0 0 1rem 0;
            display: inline-block;
            padding: 1rem;
            background: #f5f6fa;
            -webkit-border-radius: 50px;
            -moz-border-radius: 50px;
            border-radius: 50px;
        }

        .invoice-status .badge {
            text-transform: uppercase;
        }

        @media (max-width: 767px) {
            .invoice-container {
                padding: 1rem;
            }
        }

        @media print {

            .no-print,
            .no-print * {
                display: none !important;
            }

            body {
                background: #ffffff !important;
            }
        }

        .card {
            background: #ffffff;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            border: 0;
            margin-bottom: 1rem;
        }

        .text-success {
            color: #00bb42 !important;
        }

        .text-muted {
            color: #9fa8b9 !important;
        }

        .custom-actions-btns {
            margin: auto;
            display: flex;
            justify-content: flex-end;
        }

        .custom-actions-btns .btn {
            margin: .3rem 0 .3rem .3rem;
        }

        tfoot th {
            border: none !important;
            line-height: 1rem;
        }

        .decoration {
            margin-left: 40px;
            margin-right: 40px;
        }

        .tabel {
            width: 100%;
        }

        .tabel th,
        .tabel tfoot tr {
            border: 1px solid black !important;
            padding: 5px;
        }

        .tabel td {
            border-top: none !important;
            border-bottom: none !important;
            border-left: 1px solid black !important;
            border-right: 1px solid black !important;
            padding: 0px 5px;
        }

        .tabel tfoot td {
            padding-top: 5px !important;
            padding-left: 10px !important;
            padding-bottom: 5px !important;
        }
    </style>
</head>

<body>
    <div class="html-content">
        <div class="row gutters">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="card">
                    <div class="card-body p-0">
                        <div class="invoice-container">
                            <div class="invoice-header">

                                <!-- Row start -->
                                <div class="row gutters no-print decoration">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                        <div class="custom-actions-btns mb-5">
                                            <a href="#" onclick="f_simpan();return false;"
                                                class="btn btn-primary">
                                                <i class="icon-download"></i> Download
                                            </a>
                                            <a href="#" onclick="f_print();return false;"
                                                class="btn btn-secondary">
                                                <i class="icon-printer"></i> Print
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="row gutters decoration">
                                    <h2 style="width:100%;text-align:center;margin-top:20px;font-size:5rem;">
                                        <u><b>FAKTUR</b></u> <br />{{ $penjualan->kode_inv }}
                                    </h2>
                                    <table style="width:100%;">
                                        <tr>
                                            <td
                                                style="text-transform: uppercase;font-size:3rem;width:100%;text-align:center;">
                                                PONTIANAK,
                                                {{ Carbon\Carbon::createFromFormat('Y-m-d', $penjualan->tanggal_inv)->isoFormat('D MMMM Y') }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td
                                                style="text-transform: uppercase;font-size:3rem;font-weight: bold;width:100%;text-align:center;">
                                                {{ $penjualan->namakonsumen }} </td>
                                        </tr>
                                    </table>
                                </div>

                            </div>


                            <div class="invoice-body">
                                <!-- Row start -->
                                <div class="row gutters">
                                    <div class="col-lg-12 col-md-12 col-sm-12">

                                        @foreach ($penjualandetails ?? '' as $penjualandetail)
                                            <div class="col-md-10 offset-md-1">
                                                <div class="row">
                                                    <div class="col-7"> {{ $penjualandetail->namabarang }} </div>
                                                    <div class="col-5 text-right">
                                                        {{-- {{ number_format($penjualandetail->subtotal, 0, ',', '.') }} --}}
                                                        {{ number_format($penjualandetail->total_jual * $penjualandetail->harga, 0, ',', '.') }}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-10 offset-md-1">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        {{ number_format($penjualandetail->total_jual, 2, ',', '.') }}
                                                        {{ strtoupper($penjualandetail->satuanbarang) }} x
                                                        {{ number_format($penjualandetail->harga) }}
                                                        {{-- {{ number_format($penjualandetail->harga - $penjualandetail->diskon - $penjualandetail->diskon_paket - $penjualandetail->diskon_extra, 0, ',', '.') }} --}}
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                        {{-- <div class="col-md-10 offset-md-1">
                                            <div class="row">
                                                <div class="col-7"> DISKON </div>
                                                <div class="col-5 text-right">

                                                    {{ number_format($penjualandetail->diskon + $penjualandetail->diskon_paket + $penjualandetail->diskon_extra, 0, ',', '.') }}
                                                </div>
                                            </div>
                                        </div> --}}
                                        <div class="col-md-10 offset-md-1">
                                            <div class="row">
                                                <div class="col-8 text-right" style="font-weight:bold;"> DISKON
                                                </div>
                                                <div class="col-4 text-right" style="font-weight:bold;">
                                                    {{ number_format(($penjualandetail->diskon + $penjualandetail->diskon_paket + $penjualandetail->diskon_extra) * $penjualandetail->total_jual, 0, ',', '.') }}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-10 offset-md-1">
                                            <div class="row">
                                                <div class="col-8 text-right" style="font-weight:bold;"> Grand Total
                                                </div>
                                                <div class="col-4 text-right" style="font-weight:bold;">
                                                    {{ number_format($penjualan->grandtotal, 0, ',', '.') }} </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- Row end -->
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    function f_print() {
        window.print();
    }

    function f_simpan() {
        $(".no-print").hide();

        var HTML_Width = $(".html-content").width();
        var HTML_Height = $(".html-content").height();
        var top_left_margin = 15;
        var PDF_Width = HTML_Width + (top_left_margin * 2);
        var PDF_Height = (PDF_Width * 1.5) + (top_left_margin * 2);
        var canvas_image_width = HTML_Width;
        var canvas_image_height = HTML_Height;

        var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;

        html2canvas($(".html-content")[0], {
            scale: 4
        }).then(function(canvas) {
            var imgData = canvas.toDataURL("image/jpeg", 1.0);
            var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
            pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width,
                canvas_image_height);
            for (var i = 1; i <= totalPDFPages; i++) {
                pdf.addPage(PDF_Width, PDF_Height);
                pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height * i) + (top_left_margin * 4),
                    canvas_image_width, canvas_image_height);
            }
            pdf.save("Invoice - {{ $penjualan->kode_inv . ' - ' . $penjualan->namakonsumen }} .pdf");
            $(".no-print").show();
        });
    }
</script>

</html>
