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

  <title> Laba Rugi Perdivisi ( Divisi : {{ $request->divisi }} )</title>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
  <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@800&display=swap" rel="stylesheet">

  <style>
    body{
      margin-top:14px;
      color: #2e323c;
      background: #f5f6fa;
      position: relative;
      height: 100%;
      color-adjust: exact !important;
      font-size: 12px !important;
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
      margin-top: -14px;
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
              <h2 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;"> LABA RUGI PERDIVISI </h2>
              <h5 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;font-weight:normal;"> Periode {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalmulai)->isoFormat('D MMMM Y') }} s/d {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalselesai)->isoFormat('D MMMM Y') }} </h5>
              <h5 style="color:#e31515;width:100%;text-align:center;font-family:'Poppins', sans-serif;">
                Divisi : {{ $request->divisi }}
              </h5>
              <br />

              {{-- Set Array Akun --}}
              @php
                $arrayakun = [];
              @endphp
              @foreach($akuns ?? '' as $akun)
                @php
                  $arrayakun[$akun->kode_akun] = $akun->nama;
                @endphp
              @endforeach

            </div>
            <div class="invoice-body" style="padding: 70px 40px 40px 40px;">
              <!-- Row start -->
              <div class="row gutters">
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="table-responsive">
                    <table class="table custom-table m-0">
                      <thead>
                      <tr>
                        <th colspan="11" style="text-align:center;font-size:16px;">PEMBELIAN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Divisi</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">Jenis Pembelian</th>
                        <th style="text-align:center;">Metode Pembayaran</th>
                        <th style="text-align:center;">Hutang Pelunasan</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Biaya Tambahan</th>
                        <th style="text-align:center;">Total</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                      $sumspembelian = 0;
                      $x = 1;
                      @endphp

                      @foreach($pembelians ?? '' as $pembelian)
                        
                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pembelian->kode}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pembelian->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$pembelian->kategori}}</td>
                          <td>{{$pembelian->namapenampung}}</td>
                          <td>{{$pembelian->tipe_pembelian}}</td>
                          <td>{{$pembelian->pembayaran}}</td>
                          <td style="text-align:right;">{{ number_format($pembelian->sisa,0,',','.') }}</td>
                          <td>{{$pembelian->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pembelian->biaya_tambahan,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($pembelian->grandtotal,0,',','.') }}</td>
                        </tr>
                        @php
                        $sumspembelian = $sumspembelian + $pembelian->grandtotal;
                        $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="10" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL PEMBELIAN </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspembelian,0,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4">
                      <thead>
                      <tr>
                        <th colspan="11" style="text-align:center;font-size:16px;">PENJUALAN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Divisi</th>
                        <th style="text-align:center;">Konsumen</th>
                        <th style="text-align:center;">Jenis Penjualan</th>
                        <th style="text-align:center;">Metode Pembayaran</th>
                        <th style="text-align:center;">Hutang Pelunasan</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Biaya Tambahan</th>
                        <th style="text-align:center;">Total</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                      $sumspenjualan = 0;
                      $x = 1;
                      @endphp

                      @foreach($penjualans ?? '' as $penjualan)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$penjualan->kode}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $penjualan->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$penjualan->kategori}}</td>
                          <td>{{$penjualan->namakonsumen}}</td>
                          <td>{{$penjualan->tipe_penjualan}}</td>
                          <td>{{$penjualan->pembayaran}}</td>
                          <td style="text-align:right;">{{ number_format($penjualan->sisa,0,',','.') }}</td>
                          <td>{{$penjualan->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($penjualan->biaya_tambahan,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($penjualan->grandtotal,0,',','.') }}</td>
                        </tr>
                        @php
                        $sumspenjualan = $sumspenjualan + $penjualan->grandtotal;
                        $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="10" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL PENJUALAN </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspenjualan,0,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4">
                      <thead>
                      <tr>
                        <th colspan="9" style="text-align:center;font-size:16px;">PENGELUARAN OPERASIONAL</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode</th>
                        <th style="text-align:center;">Kategori</th>
                        <th style="text-align:center;">Akun Kas</th>
                        <th style="text-align:center;">Akun Beban</th>
                        <th style="text-align:center;">Divisi</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                      $sumspengeluaran = 0;
                      $x = 1;
                      @endphp

                      @foreach($pengeluarans ?? '' as $pengeluaran)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pengeluaran->kode}}</td>
                          <td>{{$pengeluaran->kategoripengeluaran}}</td>
                          <td>{{$pengeluaran->akun_kas}} - {{ $arrayakun[$pengeluaran->akun_kas] }}</td>
                          <td>{{$pengeluaran->akun_beban}} - {{ $arrayakun[$pengeluaran->akun_beban] }}</td>
                          <td>{{$pengeluaran->divisi}}</td>
                          <td>{{$pengeluaran->keterangan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pengeluaran->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($pengeluaran->nominal,0,',','.') }}</td>
                        </tr>
                        @php
                        $sumspengeluaran = $sumspengeluaran + $pengeluaran->nominal;
                        $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="8" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL PENGELUARAN OPERASIONAL </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspengeluaran,0,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4">
                      <thead>
                      <tr>
                        <th colspan="8" style="text-align:center;font-size:16px;">PENDAPATAN LAIN-LAIN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode</th>
                        <th style="text-align:center;">Akun Kas</th>
                        <th style="text-align:center;">Akun Pendapatan</th>
                        <th style="text-align:center;">Divisi</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                      $sumspendapatan = 0;
                      $x = 1;
                      @endphp

                      @foreach($pendapatans ?? '' as $pendapatan)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pendapatan->kode}}</td>
                          <td>{{$pendapatan->akun_kas}} - {{ $arrayakun[$pendapatan->akun_kas] }}</td>
                          <td>{{$pendapatan->akun_pendapatan}} - {{ $arrayakun[$pendapatan->akun_pendapatan] }}</td>
                          <td>{{$pendapatan->divisi}}</td>
                          <td>{{$pendapatan->keterangan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pendapatan->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($pendapatan->nominal,0,',','.') }}</td>
                        </tr>
                        @php
                        $sumspendapatan = $sumspendapatan + $pendapatan->nominal;
                        $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="7" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL PENDAPATAN LAIN-LAIN </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspendapatan,0,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="mt-4" style="background-color:cyan;font-size:26px;float:right;">
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">TOTAL PEMBELIAN</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">Rp {{ number_format($sumspembelian,0,',','.') }}</th>
                      </tr>
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">TOTAL PENJUALAN</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">Rp {{ number_format($sumspenjualan,0,',','.') }}</th>
                      </tr>
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">TOTAL PENGELUARAN OPERASIONAL</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">Rp {{ number_format($sumspengeluaran,0,',','.') }}</th>
                      </tr>
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">TOTAL PENDAPATAN LAIN-LAIN</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">Rp {{ number_format($sumspendapatan,0,',','.') }}</th>
                      </tr>
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">LABA BERSIH</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;color:@if($sumspembelian + $sumspengeluaran > $sumspenjualan + $sumspendapatan) red @else green @endif;">Rp {{ number_format($sumspenjualan + $sumspendapatan - $sumspembelian - $sumspengeluaran,0,',','.') }}</th>
                      </tr>
                    </table>

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

    html2canvas($(".html-content")[0],{scale:4,orientation: 'landscape'}).then(function (canvas) {
      var imgData = canvas.toDataURL("image/jpeg", 1.0);
      var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
      pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);
      for (var i = 1; i <= totalPDFPages; i++) {
        pdf.addPage(PDF_Width, PDF_Height);
        pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
      }
      pdf.save("Laporan Pembelian Detil.pdf");
      $(".no-print").show();
    });
  }
</script>

</html>
