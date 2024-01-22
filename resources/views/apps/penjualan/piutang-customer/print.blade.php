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

    <title>Nota Pelunasan Penjualan - {{ $bayarpiutang->kode . ' - ' . $bayarpiutang->namakonsumen }} </title>

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
            color: black;
            background: #f5f6fa;
            position: relative;
            height: 100%;
            -webkit-print-color-adjust: exact !important;
            color-adjust: exact !important;
            font-family: "Calibri";
            margin: 0;
        }

        .invoice-container {
            /*padding: 1rem;*/
            /*padding-top: 50px;*/
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
                color: black !important;
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

        .table th,
        .table tr,
        .table td {
            border: 1px dotted black !important;
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
                                <!-- Row end -->

                                <div class="row gutters decoration">
                                    <table style="width:100%;border:1px solid black;">
                                        <tr>
                                            <td style="font-weight:bold;padding-left:15px;padding-top:10px;width:50%;border: 1px solid black;"
                                                rowspan="2">
                                                {{--                      <img style="width:60%" src="{{ asset('/images/logo/kop_kiu.png') }}" /> --}}
                                            </td>
                                            <td
                                                style="font-weight:bold;padding-top:10px;width:50%;border: 1px solid black;font-size:40px;height:100px;text-align:center;">
                                                KWITANSI </td>
                                        </tr>
                                        <tr>
                                            <td
                                                style="font-weight:bold;border: 1px solid black;font-size:36px;text-align:center;">
                                                {{ $bayarpiutang->kode }} </td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid black;font-size:24px;" colspan="2">
                                                <table
                                                    style="width:90%;margin-left:5%;margin-top:20px;margin-bottom:20px;">
                                                    <tr>
                                                        <td style="width:200px;vertical-align: top;"> Sudah Terima Dari
                                                        </td>
                                                        <td style="vertical-align: top;"> : </td>
                                                        <td style="vertical-align: top;">
                                                            {{ $bayarpiutang->namakonsumen }} </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="vertical-align: top;"> Uang Sejumlah </td>
                                                        <td style="vertical-align: top;"> : </td>
                                                        <td style="text-transform: capitalize;vertical-align: top;">
                                                            {{ terbilang($bayarpiutang->nominal) }} </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="vertical-align: top;"> Untuk Pembayaran </td>
                                                        <td style="vertical-align: top;"> : </td>
                                                        <td style="vertical-align: top;"> Sesuai Dengan Faktur Terlampir
                                                        </td>
                                                    </tr>

                                                    @php
                                                        $kode = [];
                                                        $value = '';
                                                    @endphp

                                                    @foreach ($penjualandetails ?? '' as $penjualandetail)
                                                        @php
                                                            if (in_array($penjualandetail->kode_inv, $kode) == false) {
                                                                $value = $value . $penjualandetail->kode_inv . ', ';
                                                            }

                                                            array_push($kode, $penjualandetail->kode_inv);
                                                        @endphp
                                                    @endforeach

                                                    <tr>
                                                        <td> </td>
                                                        <td> </td>
                                                        <td> ( Faktur Penjualan {{ substr($value, 0, -2) }} )</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <div
                                                                style="border: 2px solid black;width:450px;margin-top:20px;padding-left:20px;padding-top:10px;padding-bottom:10px;font-weight:bold;font-size:20px;">
                                                                PEMBAYARAN HARAP DI TRANSFER KE : <br />
                                                                PT. KAPUAS INTAN UTAMA <br />
                                                                BANK CENTRAL ASIA <br />
                                                                CABANG : TANJUNG PURA, PONTIANAK <br />
                                                                NO REK : 347 888 9889
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>

                                                <div
                                                    style="width:500px;border-top:2px double black;border-bottom: 2px double black;text-align:center;margin-bottom:20px;font-size:30px;">
                                                    Rp : # {{ number_format($bayarpiutang->nominal, 2, ',', '.') }} #
                                                </div>

                                                <div
                                                    style="width:50%;text-align:center;margin-bottom:30px;
                                                    margin-top:-20px;
                                                    font-size:20px;margin-left:50%;">
                                                    Pontianak, {{ \Carbon\Carbon::now()->isoFormat('D MMMM Y') }}
                                                </div>

                                            </td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                            <div class="invoice-body" style="padding: 20px 40px;">
                                <!-- Row start -->
                                <div class="row gutters">
                                    <div class="col-lg-12 col-md-12 col-sm-12">

                                    </div>
                                </div>
                                <!-- Row end -->
                            </div>
                            <div class="invoice-footer">
                                <!-- Row start -->
                                <div class="row gutters decoration" style="font-size:15px;">

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
            pdf.save(
                "Nota Pelunasan Penjualan - {{ $bayarpiutang->kode . ' - ' . $bayarpiutang->namakonsumen }}.pdf"
            );
            $(".no-print").show();
        });
    }
</script>

</html>
