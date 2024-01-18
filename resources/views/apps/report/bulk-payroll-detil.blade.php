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

  <title> Laporan Pembelian Detil </title>

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
      border: 0px solid #e0e3ec;
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
              <h2 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;"> LAPORAN PAYROLL DETIL </h2>
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
                        <th style="width:20px;">No.</th>
                        <th>Kode.</th>
                        <th>Tanggal Gaji</th>
                        <th>Tgl. Mulai Absen</th>
                        <th>Tgl. Akhir Absen </th>
                        <th>Jenis Gaji</th>
                        <th>Status</th>
                        <th>Subtotal</th>
                        <th>Potongan</th>
                        <th>Total Akhir</th>
                        <th>User Input</th>
                      </tr>
                      </thead>
                      <tbody>
                      @foreach($payrolls ?? '' as $payroll)
                        <tr>
                          <td>{{ $loop->iteration }}</td>
                          <td>{{$payroll->kode}}</td>
                          <td style="padding-left:10px;"> {{ Carbon\Carbon::createFromFormat('Y-m-d', $payroll->tanggal_gaji)->isoFormat('D MMMM Y') }} </td>
                          <td style="padding-left:10px;"> {{ Carbon\Carbon::createFromFormat('Y-m-d', $payroll->tanggal_mulai)->isoFormat('D MMMM Y') }} </td>
                          <td style="padding-left:10px;"> {{ Carbon\Carbon::createFromFormat('Y-m-d', $payroll->tanggal_selesai)->isoFormat('D MMMM Y') }} </td>
                          <td>{{$payroll->jenis_gaji}}</td>
                          <td>{{$payroll->status}}</td>
                          <td>{{ number_format($payroll->subtotal,0,',','.') }}</td>
                          <td>{{ number_format($payroll->potongan,0,',','.') }}</td>
                          <td>{{ number_format($payroll->totalakhir,0,',','.') }}</td>
                          <td>{{$payroll->namauser}}</td>
                        </tr>
                        <tr>
                          <td></td>
                          <td colspan="11">
                            <table class="table custom-table m-0">
                              <thead style="background: #dfdfdf !important;">
                              <tr>
                                <th style="color: black !important;width:20px;">No.</th>
                                <th style="color: black !important;">Nama Karyawan</th>
                                <th style="color: black !important;">Jabatan Karyawan</th>
                                <th style="color: black !important;">Ak. Pembayaran</th>
                                <th style="color: black !important;">Gaji Awal</th>
                                <th style="color: black !important;">Bonus</th>
                                <th style="color: black !important;">Lembur</th>
                                <th style="color: black !important;">Pot. Absen</th>
                                <th style="color: black !important;">Pot. Terlambat</th>
                                <th style="color: black !important;">Pot. Pulang Awal</th>
                                <th style="color: black !important;">Pot. Pinjaman</th>
                                <th style="color: black !important;">Pot. Lainnya</th>
                                <th style="color: black !important;">Gaji Bersih</th>
                              </tr>
                              </thead>
                              <tbody>
                              @php
                                $payroll_details =  DB::table('payroll_details')
                                  ->join('karyawans','payroll_details.id_karyawans','=','karyawans.id')
                                  ->join('akuns','payroll_details.kode_akun','=','akuns.kode_akun')
                                  ->select('payroll_details.*','karyawans.nama as namakaryawan','akuns.nama as namaakun','karyawans.jabatan as jabatankaryawan')
                                  ->where('payroll_details.id_payrolls',$payroll->id)
                                  ->orderBy('payroll_details.created_at','asc')
                                  ->get();

                                $x = 1;

                              foreach($payroll_details as $payrolldetail){
                                @endphp
                                <tr>
                                  <td>{{ $x }}</td>
                                  <td> {{ $payrolldetail->namakaryawan }} </td>
                                  <td> {{ $payrolldetail->jabatankaryawan }} </td>
                                  <td> {{ $payrolldetail->namaakun }} </td>
                                  <td> {{ number_format($payrolldetail->gaji_awal,0,',','.') }} </td>
                                  <td> {{ number_format($payrolldetail->tambahan_bonus,0,',','.') }} </td>
                                  <td> {{ number_format($payrolldetail->tambahan_lembur,0,',','.') }} </td>
                                  <td> {{ number_format($payrolldetail->pot_absen,0,',','.') }} </td>
                                  <td> {{ number_format($payrolldetail->pot_terlambat,0,',','.') }} </td>
                                  <td> {{ number_format($payrolldetail->pot_pulangawal,0,',','.') }} </td>
                                  <td> {{ number_format($payrolldetail->pot_pinjaman,0,',','.') }} </td>
                                  <td> {{ number_format($payrolldetail->pot_lainnya,0,',','.') }} </td>
                                  <td> {{ number_format($payrolldetail->gaji_bersih,0,',','.') }} </td>
                                </tr>
                                @php
                                  $x++;
                                }
                                @endphp
                              </tbody>
                            </table>
                          </td>
                        </tr>
                      @endforeach
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

    html2canvas($(".html-content")[0],{scale:4}).then(function (canvas) {
      var imgData = canvas.toDataURL("image/jpeg", 1.0);
      var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
      pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);
      for (var i = 1; i <= totalPDFPages; i++) {
        pdf.addPage(PDF_Width, PDF_Height);
        pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
      }
      pdf.save("Laporan Payroll Detil.pdf");
      $(".no-print").show();
    });
  }
</script>

</html>
