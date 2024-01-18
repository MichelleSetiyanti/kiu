<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
  <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

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
      margin: 1.5rem 0 0 0;
      padding: 1rem;
      line-height: 180%;
      background: #FFD3A7;
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
        color: #000000 !important;
      }

      body{
        background: #ffffff !important;
      }
    }

    .custom-table {
      border: 0px solid #e0e3ec;
    }
    .custom-table thead {
      background: #FFD3A7 !important;
    }
    .custom-table thead th {
      border: 0;
      color: #000;
    }
    .custom-table > tbody tr:hover {
      background: #fafafa;
    }
    .custom-table > tbody tr:nth-of-type(even) {
      background-color: #ffffff;
    }
    .custom-table > tbody td {
      border-bottom: 1px solid #e0e3ec;
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
  </style>
</head>
<body>
<div class="container html-content">
  <div class="row gutters">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
      <div class="card">
        <div class="card-body p-0">
          <div class="invoice-container">
            <div class="invoice-header">
              <!-- Row start -->
              <div class="row gutters">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                  <address style="color:black;font-size:13px;margin-bottom:35px;">
                    <span style="font-weight:bold;font-size:16px;"> Hallo {{ $payment->namamurid }} </span> <br />
                    Bersamaan dengan email ini, kami ingin mengingatkan Anda untuk membayar tagihan Anda di Beaztex Digital Agency. <br />
                    * (Silahkan abaikan pesan ini jika anda sudah melakukan pembayaran)
                  </address>
                </div>
              </div>
              <!-- Row end -->
              <!-- Row start -->
              <div class="row gutters">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                  <address class="text-right" style="font-size:15px;color:black;">
                    <span style="font-weight:bold;font-size:18px;"> Beaztex Digital Agency </span> <br />
                    Jl. WR Supratman No. 5 <br />
                    Benua Melayu Darat <br />
                    Pontianak 78122
                  </address>
                </div>
              </div>
              <!-- Row end -->
              <!-- Row start -->
              <div class="row gutters">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                  <address style="font-size:15px;color:black;">
                    <span style="font-weight:bold;font-size:20px;"> Tanggal </span> <br />
                    {{ Carbon\Carbon::createFromFormat('Y-m-d', $payment->tanggal)->translatedFormat('d F Y') }}<br>
                    <span style="font-weight:bold;font-size:20px;"> No Invoice </span> <br />
                    {{ $payment->no_inv }}
                  </address>
                </div>
{{--                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">--}}
{{--                  <div class="invoice-details">--}}
{{--                    <div class="invoice-num" style="text-align:center;">--}}
{{--                      <div style="font-weight:bold;font-size:22px;"> Rp {{ number_format($payment->total,0,',','.') }}</div>--}}
{{--                    </div>--}}
{{--                  </div>--}}
{{--                </div>--}}
              </div>
              <!-- Row end -->
            </div>
            <div class="invoice-body">
              <!-- Row start -->
              <div class="row gutters">
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="table-responsive">
                    <table class="table custom-table m-0">
                      <thead>
                      <tr>
                        <th>Keterangan</th>
                        <th>Jumlah</th>
                        <th>Harga</th>
                        <th>Total</th>
                      </tr>
                      </thead>
                      <tbody>
                      @foreach($paymentdetails ?? '' as $paymentdetail)
                        <tr>
                          <td>{{$paymentdetail->nama}}</td>
                          <td>1</td>
                          <td>Rp {{ number_format($paymentdetail->nominal,0,',','.') }}</td>
                          <td>Rp {{ number_format($paymentdetail->nominal,0,',','.') }}</td>
                        </tr>
                      @endforeach
                      </tbody>
                      <tfoot>
                      <tr>
                        <th colspan="3" style="font-size: 17px;text-align:right;padding-right:30px;"> Total Akhir </th>
                        <th style="font-size: 17px;"> Rp {{ number_format($payment->total,0,',','.') }} </th>
                      </tr>
                      </tfoot>
                    </table>
                  </div>
                </div>
              </div>
              <!-- Row end -->
            </div>
            <div class="invoice-footer">
              <!-- Row start -->
              <div class="row gutters">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="text-align:left;">
                  <address style="font-size:15px;color:black;">
                    <span style="font-weight:bold;font-size:20px;"> Penerima </span> <br />
                    <span style="font-weight:bold;"> {{ $payment->namamurid }} </span> <br />
                    {{ $payment->alamatmurid }} <br /> <br />

                    <span style="font-weight:bold;font-size:20px;"> Metode Pembayaran </span> <br />
                    - Cash <br />
                    - Transfer:  <br />
                    BCA Account  <br />
                    Merry Susanti The Dra  <br />
                    0293077085
                  </address>
                </div>
                <hr>
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="text-align:left;border-top: double;padding-top:10px;">
                  <address style="font-size:15px;color:black;">
                    <table>
                      <tr>
                        <th></th>
                        <th></th>
                      </tr>
                      <tr>
                        <td rowspan="3"> <img src="{{ asset('images/logo/alt_logo.png') }}" width="70px" /> </td>
                        <td> (0561) 730718 </td>
                      </tr>
                      <tr>
                        <td> 0852 1950 4502 </td>
                      </tr>
                      <tr>
                        <td> universalenglishcourse2018@gmail.com </td>
                      </tr>
                    </table>
                  </address>
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

</html>
