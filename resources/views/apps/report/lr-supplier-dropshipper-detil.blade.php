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

  <title> Laba Rugi Supplier Dropshipper </title>

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
              <h2 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;"> LABA RUGI SUPPLIER DROPSHIPPER </h2>
              <h5 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;font-weight:normal;"> Periode {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalmulai)->isoFormat('D MMMM Y') }} s/d {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalselesai)->isoFormat('D MMMM Y') }} </h5>
              <h5 style="color:#e31515;width:100%;text-align:center;font-family:'Poppins', sans-serif;">
                @if($request->client != "All")
                  @php
                    $penampung = DB::table('penampungs')->where('id',$request->client)->first();
                  @endphp

                  Filter Penampung : {{ $penampung->nama }}
                @else
                  Filter Penampung : Semua Penampung
                @endif
              </h5>
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
                        <th style="text-align:center;">No</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nama</th>
                        <th style="text-align:center;">No. Kontainer</th>
                        <th style="text-align:center;">Tonase</th>
                        <th style="text-align:center;">Hrg. Beli</th>
                        <th style="text-align:center;">Hrg. Jual</th>
                        <th style="text-align:center;">Pembelian</th>
                        <th style="text-align:center;">Penjualan</th>
                        <th style="text-align:center;">DP Kontainer</th>
                        <th style="text-align:center;">Sisa Bayar</th>
                        <th style="text-align:center;">Biaya Kontainer</th>
                        <th style="text-align:center;">Komisi</th>
                        <th style="text-align:center;">Laba Bersih</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                      $sumstonase = 0;
                      $sumslaba = 0;
                      $totallaba = 0;
                      $totaltonase = 0;
                      $x = 1;
                      $penampungsebelumnya = 0;
                      $y = 0;
                      @endphp

                      @foreach($tables ?? '' as $table)
                        @php
                          $biayadetails = DB::table('biaya_detail_dropshippers')->select(DB::raw('sum(nominal) as nominal_total'))->where('id_dropshippers',$table->id)->get();
                        @endphp
                        @if( $table->id_penampungs != $penampungsebelumnya )
                          @php
                            $penampungsebelumnya = $table->id_penampungs;
                            $sumstonase = 0;
                            $sumslaba = 0;
                            $x = 1
                          @endphp
                        @else
                          @php $x++; @endphp
                        @endif
                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $table->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$table->namapenampung}}</td>
                          <td>{{$table->no_kontainer}}</td>
                          <td style="text-align:right;">{{ number_format($table->qty,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($table->harga_beli,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($table->harga_jual,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($table->total_beli,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($table->total_jual,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($table->dp,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($table->sisa_bayar,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($biayadetails[0]->nominal_total,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($table->komisi,0,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($table->laba,0,',','.') }}</td>
                        </tr>
                        @php
                        $sumstonase = $sumstonase + $table->qty;
                        $totaltonase = $totaltonase + $table->qty;
                        $sumslaba = $sumslaba + $table->laba;
                        $totallaba = $totallaba + $table->laba;
                        $y++;
                        @endphp

                        @if($loop->last || $table->id_penampungs != $tables[$y]->id_penampungs )
                          <tr>
                            <td colspan="4" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:cyan;"> TOTAL TONASE </td>
                            <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:cyan;">{{ number_format($sumstonase,0,',','.') }}</td>
                          </tr>
                          <tr>
                            <td colspan="13" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL LABA </td>
                            <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumslaba,0,',','.') }}</td>
                          </tr>
                          <tr>
                            <td colspan="14"> </td>
                          </tr>
                        @endif

                      @endforeach

                      <tr>
                        <td colspan="3" style="text-align:right;padding-right:10px;font-size:18px;font-weight:bold;border:0;background-color:cyan;"> TONASE KESELURUHAN </td>
                        <td colspan="3" style="padding-left:10px;font-size:18px;font-weight:bold;background-color:cyan;border:0;">{{ number_format($totaltonase,0,',','.') }}</td>
                      </tr>
                      <tr>
                        <td colspan="3" style="text-align:right;padding-right:10px;font-size:18px;font-weight:bold;border:0;background-color:cyan;"> TOTAL LABA </td>
                        <td colspan="3" style="padding-left:10px;font-size:18px;font-weight:bold;background-color:cyan;border:0;">Rp {{ number_format($totallaba,0,',','.') }}</td>
                      </tr>

                      </tbody>
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
