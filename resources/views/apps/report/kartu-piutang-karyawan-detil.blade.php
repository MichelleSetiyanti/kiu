@php
    function penyebut($nilai) {
            $nilai = abs($nilai);
            $huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
            $temp = "";
            if ($nilai < 12) {
                $temp = " ". $huruf[$nilai];
            } else if ($nilai <20) {
                $temp = penyebut($nilai - 10). " belas";
            } else if ($nilai < 100) {
                $temp = penyebut($nilai/10)." puluh". penyebut($nilai % 10);
            } else if ($nilai < 200) {
                $temp = " seratus" . penyebut($nilai - 100);
            } else if ($nilai < 1000) {
                $temp = penyebut($nilai/100) . " ratus" . penyebut($nilai % 100);
            } else if ($nilai < 2000) {
                $temp = " seribu" . penyebut($nilai - 1000);
            } else if ($nilai < 1000000) {
                $temp = penyebut($nilai/1000) . " ribu" . penyebut($nilai % 1000);
            } else if ($nilai < 1000000000) {
                $temp = penyebut($nilai/1000000) . " juta" . penyebut($nilai % 1000000);
            } else if ($nilai < 1000000000000) {
                $temp = penyebut($nilai/1000000000) . " milyar" . penyebut(fmod($nilai,1000000000));
            } else if ($nilai < 1000000000000000) {
                $temp = penyebut($nilai/1000000000000) . " trilyun" . penyebut(fmod($nilai,1000000000000));
            }
            return $temp;
        }

        function terbilang($nilai) {
            if($nilai<0) {
                $hasil = "minus ". trim(penyebut($nilai));
            } else {
                $hasil = trim(penyebut($nilai));
            }
            return $hasil." Rupiah";
        }

use Illuminate\Support\Facades\DB;

@endphp

<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=1500">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title> Kartu Piutang Karyawan </title>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
  <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@800&display=swap" rel="stylesheet">

  <style>
    body{
      margin-top:20px;
      color: #2e323c;
      background: #f5f6fa;
      position: relative;
      height: 100%;
      -webkit-print-color-adjust: exact !important;
      color-adjust: exact !important;
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
      width:200px;
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

    @media print
    {
      .no-print, .no-print *
      {
        display: none !important;
      }

      .custom-table thead {
        background: #e0e3ec !important;
      }
      .custom-table thead th {
        border: 1px solid #e6e9f0;
        color: #232F33 !important;
      }

      body{
        background: #ffffff !important;
      }
    }

    .custom-table {
      border: 1px solid #e0e3ec;
    }
    .custom-table thead {
      background: #3e3e3e !important;
    }
    .custom-table thead th {
      border: 0;
      color: white;
    }
    .custom-table > tbody tr:nth-of-type(even) {
      background-color: #ffffff;
    }
    .custom-table > tbody td {
      border: 1px solid #e0e3ec;
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
        line-height: .5rem;
    }

    .decoration {
        margin-left: 40px;
        margin-right: 40px;
        height: 30px;
        /*background: #E25720;*/
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
              <div class="row gutters no-print">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                  <div class="custom-actions-btns mb-5">
                    <a href="#" onclick="f_simpan();return false;" class="btn btn-primary">
                      <i class="icon-download"></i> Download
                    </a>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <div class="decoration"></div>

              <br />
              <h1 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;"> CV. MUARA JAYA ABADI </h1>
              <h2 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;"> Kartu Piutang Karyawan </h2>
              <h3 style="color:#e31515;width:100%;text-align:center;font-family:'Poppins', sans-serif;">
                @php
                  $karyawan = DB::table('karyawans')->where('id',$request->karyawan)->first();
                @endphp

                {{ $karyawan->nama }}
              </h3>
              <h5 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;font-weight:normal;"> Periode {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalmulai)->isoFormat('D MMMM Y') }} s/d {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalselesai)->isoFormat('D MMMM Y') }} </h5>
              <br />

            </div>
            <div class="invoice-body" style="padding: 70px 40px 40px 40px;">
              <!-- Row start -->
              <div class="row gutters">
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="table-responsive">
                    <table class="table custom-table m-0">
                      <thead>
                      <tr>
                        <th style="text-align:center;font-size:26px;border-bottom:1px solid white;" colspan="5">Pinjaman Karyawan</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;width:50px;">No</th>
                        <th style="text-align:center;width:170px;">Tanggal</th>
                        <th style="text-align:center;width:140px;">Kode</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;width:200px;">Nominal</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                      $sumspinjaman = 0;
                      $sumspengembalian = 0;
                      $sumsbayarhutang = 0;
                      $x = 0;
                      @endphp

                      @foreach($pinjamans ?? '' as $pinjaman)
                        @php
                          $x++;
                        @endphp
                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pinjaman->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$pinjaman->kode}}</td>
                          <td>{{$pinjaman->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pinjaman->nominal,0,',','.') }}</td>
                        </tr>
                        @php
                          $sumspinjaman = $sumspinjaman + $pinjaman->nominal;
                        @endphp
                      @endforeach
                      <tr>
                        <td colspan="4" style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;"> Total Peminjaman Karyawan</td>
                        <td style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;">{{ number_format($sumspinjaman,0,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>


                    <table class="table custom-table m-0 mt-5">
                      <thead>
                      <tr>
                        <th style="text-align:center;font-size:26px;border-bottom:1px solid white;" colspan="4">Pengembalian Pinjaman - Potong Gaji</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Kode Payroll</th>
                        <th style="text-align:center;">Nominal</th>
                      </tr>
                      </thead>
                      <tbody>

                      @php
                      $x = 0;
                      @endphp

                      @foreach($bayargajis ?? '' as $bayargaji)
                        @php
                          $x++;
                        @endphp
                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $bayargaji->tanggal_gaji)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$bayargaji->kode}}</td>
                          <td style="text-align:right;">{{ number_format($bayargaji->potongpinjaman,0,',','.') }}</td>
                        </tr>
                        @php
                          $sumsbayarhutang = $sumsbayarhutang + $bayargaji->potongpinjaman;
                        @endphp
                      @endforeach
                      <tr>
                        <td colspan="3" style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;"> Pengembalian Pinjaman - Potong Gaji </td>
                        <td style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;">{{ number_format($sumsbayarhutang,0,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>


                    <table class="table custom-table m-0 mt-5">
                      <thead>
                      <tr>
                        <th style="text-align:center;font-size:26px;border-bottom:1px solid white;" colspan="5">Pengembalian Pinjaman Karyawan</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;width:50px;">No</th>
                        <th style="text-align:center;width:170px;">Tanggal</th>
                        <th style="text-align:center;width:140px;">Kode</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;width:200px;">Nominal</th>
                      </tr>
                      </thead>
                      <tbody>

                      @php $x = 0; @endphp

                      @foreach($pengembalians ?? '' as $pengembalian)
                        @php
                          $x++;
                        @endphp
                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pengembalian->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$pengembalian->kode}}</td>
                          <td>{{$pengembalian->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pengembalian->nominal,0,',','.') }}</td>
                        </tr>
                        @php
                          $sumspengembalian = $sumspengembalian + $pengembalian->nominal;
                        @endphp
                      @endforeach
                      <tr>
                        <td colspan="4" style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;"> Total Pengembalian Pinjaman Karyawan </td>
                        <td style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;">{{ number_format($sumspengembalian,0,',','.') }}</td>
                      </tr>
                      <tr>
                        <td colspan="4" style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;"> Sisa Pinjaman Karyawan </td>
                        <td style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;">{{ number_format($sumspinjaman - $sumsbayarhutang - $sumspengembalian,0,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

{{--                    <table class="table custom-table m-0 mt-5">--}}
{{--                      <thead>--}}
{{--                      <tr>--}}
{{--                        <th style="text-align:center;font-size:26px;border-bottom:1px solid white;" colspan="5">Potong Pembelian</th>--}}
{{--                      </tr>--}}
{{--                      <tr>--}}
{{--                        <th style="text-align:center;width:50px;">No</th>--}}
{{--                        <th style="text-align:center;width:170px;">Tanggal</th>--}}
{{--                        <th style="text-align:center;width:140px;">Kode</th>--}}
{{--                        <th style="text-align:center;">Keterangan</th>--}}
{{--                        <th style="text-align:center;width:200px;">Nominal</th>--}}
{{--                      </tr>--}}
{{--                      </thead>--}}
{{--                      <tbody>--}}

{{--                      @php $x = 0; @endphp--}}

{{--                      @foreach($bayarhutangs ?? '' as $bayarhutang)--}}
{{--                        @php--}}
{{--                          $x++;--}}

{{--                          $stringid = $bayarhutang->kodepelunasan;--}}

{{--                          if (substr($stringid, -1, 1) == ',')--}}
{{--                          {--}}
{{--                            $stringid = substr($stringid, 0, -1);--}}
{{--                          }--}}

{{--                          $arrayid = explode(',', $stringid);--}}

{{--                          $pembelian_details = DB::table('bayar_hutangs')--}}
{{--                            ->join('pembelians','bayar_hutangs.id_pembelians','=','pembelians.id')--}}
{{--                            ->select('pembelians.*','bayar_hutangs.nominal as nominalpelunasan')--}}
{{--                            ->whereIn('bayar_hutangs.id',$arrayid)--}}
{{--                            ->orderBy('bayar_hutangs.created_at','asc')->get();--}}
{{--                        @endphp--}}
{{--                        <tr>--}}
{{--                          <td style="text-align:center;">{{ $x }}</td>--}}
{{--                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $bayarhutang->created_at)->isoFormat('D MMMM Y') }}</td>--}}
{{--                          <td>{{$bayarhutang->kode}}</td>--}}
{{--                          <td>Potongan Pelunasan Untuk Transaksi Pembelian Dengan Kode : @foreach($pembelian_details ?? '' as $pembeliandetail) {{ $pembeliandetail->kode }}@if(!$loop->last), @endif @endforeach</td>--}}
{{--                          <td style="text-align:right;">{{ number_format($bayarhutang->potongdp,0,',','.') }}</td>--}}
{{--                        </tr>--}}
{{--                        @php--}}
{{--                          $sumsbayarhutang = $sumsbayarhutang + $bayarhutang->potongdp;--}}
{{--                        @endphp--}}
{{--                      @endforeach--}}
{{--                      <tr>--}}
{{--                        <td colspan="4" style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;"> Total Potong Pembelian </td>--}}
{{--                        <td style="text-align:right;padding-right:10px;font-size:22px;font-weight:bold;">{{ number_format($sumsbayarhutang,0,',','.') }}</td>--}}
{{--                      </tr>--}}
{{--                      </tbody>--}}
{{--                    </table>--}}

                  </div>
                </div>
              </div>
              <!-- Row end -->
            </div>
            <div class="invoice-footer">

            </div>
              <br />
              <br />
              <div class="decoration"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>

<script>
  function f_print(){
    window.print();
  }

  function f_simpan(){
    $(".no-print").hide();

    var HTML_Width = $(".html-content").width();
    var HTML_Height = $(".html-content").height();
    var top_left_margin = 15;
    var PDF_Width = HTML_Width + (top_left_margin * 2);
    var PDF_Height = (PDF_Width * 1.5) + (top_left_margin * 2);
    var canvas_image_width = HTML_Width;
    var canvas_image_height = HTML_Height;

    var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;

    html2canvas($(".html-content")[0],{scale:4}).then(function (canvas) {
      var imgData = canvas.toDataURL("image/jpeg", 1.0);
      var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
      pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);
      for (var i = 1; i <= totalPDFPages; i++) {
        pdf.addPage(PDF_Width, PDF_Height);
        pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
      }
      pdf.save("Laporan Kartu Piutang Karyawan.pdf");
      $(".no-print").show();
    });
  }
</script>

</html>
