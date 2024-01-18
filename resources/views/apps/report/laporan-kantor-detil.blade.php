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

{{-- Set Array Akun --}}
@php
  $arrayakun = [];
@endphp
@foreach($akuns ?? '' as $akun)
@php
  $arrayakun[$akun->kode_akun] = $akun->nama;
@endphp
@endforeach

<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=1500">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title> Laporan Kantor ( Filter Akun : {{ $request->akun }} - {{ $arrayakun[$request->akun] }} )</title>

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
              <h2 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;"> Laporan Kantor </h2>
              <h5 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;font-weight:normal;"> Periode {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalmulai)->isoFormat('D MMMM Y') }} s/d {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalselesai)->isoFormat('D MMMM Y') }} </h5>
              <h5 style="color:#e31515;width:100%;text-align:center;font-family:'Poppins', sans-serif;">
                @if($request->akun == "All")
                  Filter Akun : Semua Akun
                @else
                  Filter Akun : {{ $request->akun }} - {{ $arrayakun[$request->akun] }}
                @endif
              </h5>
              <br />

            </div>
            <div class="invoice-body" style="padding: 70px 40px 40px 40px;">
              <!-- Row start -->
              <div class="row gutters">
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="table-responsive">
                    <table class="table custom-table m-0" @if($pembelians->isEmpty()) style="display:none;" @endif>
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
                          <td style="text-align:right;">{{ number_format($pembelian->sisa,2,',','.') }}</td>
                          <td>{{$pembelian->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pembelian->biaya_tambahan,2,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($pembelian->grandtotal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspembelian = $sumspembelian + $pembelian->grandtotal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="10" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL PEMBELIAN (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspembelian,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($penjualans->isEmpty()) style="display:none;" @endif>
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
                          <td style="text-align:right;">{{ number_format($penjualan->sisa,2,',','.') }}</td>
                          <td>{{$penjualan->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($penjualan->biaya_tambahan,2,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($penjualan->grandtotal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspenjualan = $sumspenjualan + $penjualan->grandtotal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="10" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL PENJUALAN (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspenjualan,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($jasatimbangs->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="11" style="text-align:center;font-size:16px;">JASA TIMBANG</th>
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
                        $sumsjasatimbang = 0;
                        $x = 1;
                      @endphp

                      @foreach($jasatimbangs ?? '' as $jasatimbang)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$jasatimbang->kode}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $jasatimbang->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$jasatimbang->kategori}}</td>
                          <td>{{$jasatimbang->namakonsumen}}</td>
                          <td>{{$jasatimbang->tipe_penjualan}}</td>
                          <td>{{$jasatimbang->pembayaran}}</td>
                          <td style="text-align:right;">{{ number_format($jasatimbang->sisa,2,',','.') }}</td>
                          <td>{{$jasatimbang->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($jasatimbang->biaya_tambahan,2,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($jasatimbang->grandtotal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsjasatimbang = $sumsjasatimbang + $jasatimbang->grandtotal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="10" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL JASA TIMBANG (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsjasatimbang,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($pengeluarans->isEmpty()) style="display:none;" @endif>
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
                          <td style="text-align:right;">{{ number_format($pengeluaran->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspengeluaran = $sumspengeluaran + $pengeluaran->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="8" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL PENGELUARAN OPERASIONAL (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspengeluaran,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($pendapatans->isEmpty()) style="display:none;" @endif>
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
                          <td style="text-align:right;">{{ number_format($pendapatan->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspendapatan = $sumspendapatan + $pendapatan->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="7" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TOTAL PENDAPATAN LAIN-LAIN (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspendapatan,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($bayarhutangpenampungs->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="9" style="text-align:center;font-size:16px;">PELUNASAN HUTANG PEMBELIAN (POTONG PINJAMAN)</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode</th>
                        <th style="text-align:center;">Kode Pembelian</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                        <th style="text-align:center;">Potong Pinjaman (Rp. )</th>
                        <th style="text-align:center;">Sisa Pelunasan (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsbayarhutangpenampung = 0;
                        $x = 1;
                        $arrayhutangpenampung = [];
                      @endphp

                      @foreach($bayarhutangpenampungs ?? '' as $bayarhutangpenampung)

                        @php
                          $stringid = $bayarhutangpenampung->kodepelunasan;

                          if (substr($stringid, -1, 1) == ',')
                          {
                            $stringid = substr($stringid, 0, -1);
                          }

                          $arrayid = explode(',', $stringid);

                          foreach($arrayid as $key){
                            array_push($arrayhutangpenampung,$key);
                          }

                          $pembelian_details = DB::table('bayar_hutangs')
                            ->join('pembelians','bayar_hutangs.id_pembelians','=','pembelians.id')
                            ->select('pembelians.*','bayar_hutangs.nominal as nominalpelunasan')
                            ->whereIn('bayar_hutangs.id',$arrayid)
                            ->orderBy('bayar_hutangs.created_at','asc')->get();

                          $kodepembelian = "";

                          foreach($pembelian_details ?? '' as $pembeliandetil){
                            $kodepembelian = $kodepembelian.$pembeliandetil->kode.' - ';
                          }

                          $kodepembelian = substr($kodepembelian, 0, -3);
                        @endphp

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$bayarhutangpenampung->kode}}</td>
                          <td>{{ $kodepembelian }}</td>
                          <td>{{$bayarhutangpenampung->namapenampung}}</td>
                          <td>{{$bayarhutangpenampung->kode_akun}} - {{ $arrayakun[$bayarhutangpenampung->kode_akun] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $bayarhutangpenampung->created_at)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($bayarhutangpenampung->nominal,2,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($bayarhutangpenampung->potongdp,2,',','.') }}</td>
                          <td style="text-align:right;">{{ number_format($bayarhutangpenampung->sisapelunasan,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsbayarhutangpenampung = $sumsbayarhutangpenampung + $bayarhutangpenampung->sisapelunasan;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="8" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PELUNASAN HUTANG PEMBELIAN (POTONG PINJAMAN) (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsbayarhutangpenampung,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($bayarhutangs->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="6" style="text-align:center;font-size:16px;">PELUNASAN HUTANG PEMBELIAN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode Pembelian</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsbayarhutang = 0;
                        $x = 1;
                      @endphp

                      @foreach($bayarhutangs ?? '' as $bayarhutang)

                        @if (!in_array($bayarhutang->id, $arrayhutangpenampung))

                          <tr>
                            <td style="text-align:center;">{{ $x }}</td>
                            <td>{{$bayarhutang->kodepembelian}}</td>
                            <td>{{$bayarhutang->namapenampung}}</td>
                            <td>{{$bayarhutang->kode_akun}} - {{ $arrayakun[$bayarhutang->kode_akun] }}</td>
                            <td>{{ Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $bayarhutang->created_at)->isoFormat('D MMMM Y') }}</td>
                            <td style="text-align:right;">{{ number_format($bayarhutang->nominal,2,',','.') }}</td>
                          </tr>
                          @php
                            $sumsbayarhutang = $sumsbayarhutang + $bayarhutang->nominal;
                            $x++;
                          @endphp

                        @endif

                      @endforeach
                      <tr>
                        <td colspan="5" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PELUNASAN HUTANG PEMBELIAN (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsbayarhutang,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($cancelbayarhutangs->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PEMBATALAN PELUNASAN HUTANG PEMBELIAN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode Pembelian</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">User</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumscancelbayarhutang = 0;
                        $x = 1;
                      @endphp

                      @foreach($cancelbayarhutangs ?? '' as $cancelbayarhutang)

                          <tr>
                            <td style="text-align:center;">{{ $x }}</td>
                            <td>{{$cancelbayarhutang->kodepembelian}}</td>
                            <td>{{$cancelbayarhutang->kode_akun}} - {{ $arrayakun[$cancelbayarhutang->kode_akun] }}</td>
                            <td>{{$cancelbayarhutang->namapenampung}}</td>
                            <td>{{ Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $cancelbayarhutang->created_at)->isoFormat('D MMMM Y') }}</td>
                            <td>{{$cancelbayarhutang->namauser}}</td>
                            <td style="text-align:right;">{{ number_format($cancelbayarhutang->nominal,2,',','.') }}</td>
                          </tr>
                          @php
                            $sumscancelbayarhutang = $sumscancelbayarhutang + $cancelbayarhutang->nominal;
                            $x++;
                          @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;">PEMBATALAN PELUNASAN HUTANG PEMBELIAN (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumscancelbayarhutang,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($bayarpiutangs->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="6" style="text-align:center;font-size:16px;">PEMBAYARAN PIUTANG PENJUALAN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode Penjualan</th>
                        <th style="text-align:center;">Konsumen</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsbayarpiutang = 0;
                        $x = 1;
                      @endphp

                      @foreach($bayarpiutangs ?? '' as $bayarpiutang)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$bayarpiutang->kodepenjualan}}</td>
                          <td>{{$bayarpiutang->kode_akun}} - {{ $arrayakun[$bayarpiutang->kode_akun] }}</td>
                          <td>{{$bayarpiutang->namakonsumen}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $bayarpiutang->created_at)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($bayarpiutang->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsbayarpiutang = $sumsbayarpiutang + $bayarpiutang->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="5" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PEMBAYARAN PIUTANG PENJUALAN (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsbayarpiutang,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($cancelbayarpiutangs->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PEMBATALAN PELUNASAN PIUTANG PENJUALAN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode Penjualan</th>
                        <th style="text-align:center;">Konsumen</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">User</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumscancelbayarpiutang = 0;
                        $x = 1;
                      @endphp

                      @foreach($cancelbayarpiutangs ?? '' as $cancelbayarpiutang)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$cancelbayarpiutang->kodepenjualan}}</td>
                          <td>{{$cancelbayarpiutang->kode_akun}} - {{ $arrayakun[$cancelbayarpiutang->kode_akun] }}</td>
                          <td>{{$cancelbayarpiutang->namakonsumen}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $cancelbayarpiutang->created_at)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$cancelbayarpiutang->namauser}}</td>
                          <td style="text-align:right;">{{ number_format($cancelbayarpiutang->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumscancelbayarpiutang = $sumscancelbayarpiutang + $cancelbayarpiutang->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;">PEMBATALAN PELUNASAN PIUTANG PENJUALAN (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumscancelbayarpiutang,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($bayarpiutangjasas->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="6" style="text-align:center;font-size:16px;">PEMBAYARAN PIUTANG JASA TIMBANG</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode Jasa Timbang</th>
                        <th style="text-align:center;">Konsumen</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsbayarpiutangjasa = 0;
                        $x = 1;
                      @endphp

                      @foreach($bayarpiutangjasas ?? '' as $bayarpiutangjasa)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$bayarpiutangjasa->kodepenjualan}}</td>
                          <td>{{$bayarpiutangjasa->kode_akun}} - {{ $arrayakun[$bayarpiutangjasa->kode_akun] }}</td>
                          <td>{{$bayarpiutangjasa->namakonsumen}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $bayarpiutangjasa->created_at)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($bayarpiutangjasa->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsbayarpiutangjasa = $sumsbayarpiutangjasa + $bayarpiutangjasa->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="5" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PEMBAYARAN PIUTANG JASA TIMBANG (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsbayarpiutangjasa,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($pinjamanpenampungs->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PINJAMAN PENAMPUNG</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode.</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumspinjamanpenampung = 0;
                        $x = 1;
                      @endphp

                      @foreach($pinjamanpenampungs ?? '' as $pinjamanpenampung)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pinjamanpenampung->kode}}</td>
                          <td>{{$pinjamanpenampung->namapenampung}}</td>
                          <td>{{$pinjamanpenampung->kode_akun}} - {{ $arrayakun[$pinjamanpenampung->kode_akun] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pinjamanpenampung->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$pinjamanpenampung->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pinjamanpenampung->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspinjamanpenampung = $sumspinjamanpenampung + $pinjamanpenampung->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PINJAMAN PENAMPUNG (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspinjamanpenampung,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($pengembalianpinjamanpenampungs->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PENGEMBALIAN PINJAMAN PENAMPUNG</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode.</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumspengembalianpinjamanpenampung = 0;
                        $x = 1;
                      @endphp

                      @foreach($pengembalianpinjamanpenampungs ?? '' as $pengembalianpinjamanpenampung)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pengembalianpinjamanpenampung->kode}}</td>
                          <td>{{$pengembalianpinjamanpenampung->namapenampung}}</td>
                          <td>{{$pengembalianpinjamanpenampung->kode_akun}} - {{ $arrayakun[$pengembalianpinjamanpenampung->kode_akun] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pengembalianpinjamanpenampung->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$pengembalianpinjamanpenampung->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pengembalianpinjamanpenampung->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspengembalianpinjamanpenampung = $sumspengembalianpinjamanpenampung + $pengembalianpinjamanpenampung->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PENGEMBALIAN PINJAMAN PENAMPUNG (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspengembalianpinjamanpenampung,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($pinjamankonsumens->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PINJAMAN KONSUMEN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode.</th>
                        <th style="text-align:center;">Konsumen</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumspinjamankonsumen = 0;
                        $x = 1;
                      @endphp

                      @foreach($pinjamankonsumens ?? '' as $pinjamankonsumen)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pinjamankonsumen->kode}}</td>
                          <td>{{$pinjamankonsumen->namakonsumen}}</td>
                          <td>{{$pinjamankonsumen->kode_akun}} - {{ $arrayakun[$pinjamankonsumen->kode_akun] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pinjamankonsumen->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$pinjamankonsumen->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pinjamankonsumen->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspinjamankonsumen = $sumspinjamankonsumen + $pinjamankonsumen->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PINJAMAN KONSUMEN (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspinjamankonsumen,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($pengembalianpinjamankonsumens->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PENGEMBALIAN PINJAMAN KONSUMEN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode.</th>
                        <th style="text-align:center;">Konsumen</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumspengembalianpinjamankonsumen = 0;
                        $x = 1;
                      @endphp

                      @foreach($pengembalianpinjamankonsumens ?? '' as $pengembalianpinjamankonsumen)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pengembalianpinjamankonsumen->kode}}</td>
                          <td>{{$pengembalianpinjamankonsumen->namakonsumen}}</td>
                          <td>{{$pengembalianpinjamankonsumen->kode_akun}} - {{ $arrayakun[$pengembalianpinjamankonsumen->kode_akun] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pengembalianpinjamankonsumen->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$pengembalianpinjamankonsumen->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pengembalianpinjamankonsumen->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspengembalianpinjamankonsumen = $sumspengembalianpinjamankonsumen + $pengembalianpinjamankonsumen->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PENGEMBALIAN PINJAMAN KONSUMEN (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspengembalianpinjamankonsumen,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($pinjamankaryawans->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PINJAMAN KARYAWAN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode.</th>
                        <th style="text-align:center;">Karyawan</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumspinjamankaryawan = 0;
                        $x = 1;
                      @endphp

                      @foreach($pinjamankaryawans ?? '' as $pinjamankaryawan)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pinjamankaryawan->kode}}</td>
                          <td>{{$pinjamankaryawan->namakaryawan}}</td>
                          <td>{{$pinjamankaryawan->akun_kas}} - {{ $arrayakun[$pinjamankaryawan->akun_kas] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pinjamankaryawan->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$pinjamankaryawan->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pinjamankaryawan->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspinjamankaryawan = $sumspinjamankaryawan + $pinjamankaryawan->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PINJAMAN KARYAWAN (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspinjamankaryawan,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($pengembalianpinjamankaryawans->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PENGEMBALIAN PINJAMAN KARYAWAN</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode.</th>
                        <th style="text-align:center;">Karyawan</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumspengembalianpinjamankaryawan = 0;
                        $x = 1;
                      @endphp

                      @foreach($pengembalianpinjamankaryawans ?? '' as $pengembalianpinjamankaryawan)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pengembalianpinjamankaryawan->kode}}</td>
                          <td>{{$pengembalianpinjamankaryawan->namakaryawan}}</td>
                          <td>{{$pengembalianpinjamankaryawan->kode_akun}} - {{ $arrayakun[$pengembalianpinjamankaryawan->kode_akun] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pengembalianpinjamankaryawan->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$pengembalianpinjamankaryawan->keterangan}}</td>
                          <td style="text-align:right;">{{ number_format($pengembalianpinjamankaryawan->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspengembalianpinjamankaryawan = $sumspengembalianpinjamankaryawan + $pengembalianpinjamankaryawan->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PENGEMBALIAN PINJAMAN KARYAWAN (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspengembalianpinjamankaryawan,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($transferkassmasuks->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">TRANSFER KAS MASUK</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode</th>
                        <th style="text-align:center;">Dari Akun</th>
                        <th style="text-align:center;">Untuk Akun</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumstransferkassmasuk = 0;
                        $x = 1;
                      @endphp

                      @foreach($transferkassmasuks ?? '' as $transferkassmasuk)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$transferkassmasuk->kode}}</td>
                          <td>{{$transferkassmasuk->akun_kas2}} - {{ $arrayakun[$transferkassmasuk->akun_kas2] }}</td>
                          <td>{{$transferkassmasuk->akun_kas}} - {{ $arrayakun[$transferkassmasuk->akun_kas] }}</td>
                          <td>{{$transferkassmasuk->keterangan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $transferkassmasuk->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($transferkassmasuk->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumstransferkassmasuk = $sumstransferkassmasuk + $transferkassmasuk->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TRANSFER KAS MASUK (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumstransferkassmasuk,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($transferkasskeluars->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">TRANSFER KAS KELUAR</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode</th>
                        <th style="text-align:center;">Dari Akun</th>
                        <th style="text-align:center;">Untuk Akun</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumstransferkasskeluar = 0;
                        $x = 1;
                      @endphp

                      @foreach($transferkasskeluars ?? '' as $transferkasskeluar)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$transferkasskeluar->kode}}</td>
                          <td>{{$transferkasskeluar->akun_kas2}} - {{ $arrayakun[$transferkasskeluar->akun_kas2] }}</td>
                          <td>{{$transferkasskeluar->akun_kas}} - {{ $arrayakun[$transferkasskeluar->akun_kas] }}</td>
                          <td>{{$transferkasskeluar->keterangan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $transferkasskeluar->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($transferkasskeluar->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumstransferkasskeluar = $sumstransferkasskeluar + $transferkasskeluar->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> TRANSFER KAS KELUAR (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumstransferkasskeluar,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($dppenampungs->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">DP PENAMPUNG DROPSHIPPER</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">No. Kontainer</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsdppenampung = 0;
                        $x = 1;
                      @endphp

                      @foreach($dppenampungs ?? '' as $dppenampung)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$dppenampung->nomorkontainer}}</td>
                          <td>{{$dppenampung->namapenampung}}</td>
                          <td>{{$dppenampung->kode_akun}} - {{ $arrayakun[$dppenampung->kode_akun] }}</td>
                          <td>{{$dppenampung->keterangan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $dppenampung->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($dppenampung->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsdppenampung = $sumsdppenampung + $dppenampung->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> DP PENAMPUNG DROPSHIPPER (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsdppenampung,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($dropshipperspembelians->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PEMBAYARAN PEMBELIAN DROPSHIPPER</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode.</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">No. Kontainer</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsdropshipperspembelian = 0;
                        $x = 1;
                      @endphp

                      @foreach($dropshipperspembelians ?? '' as $dropshipperspembelian)

                        @if($dropshipperspembelian->sisa_bayar > 0)

                          <tr>
                            <td style="text-align:center;">{{ $x }}</td>
                            <td>{{$dropshipperspembelian->kode}}</td>
                            <td>{{$dropshipperspembelian->namapenampung}}</td>
                            <td>{{$dropshipperspembelian->no_kontainer}}</td>
                            <td>{{$dropshipperspembelian->kode_akun_pembelian}} - {{ $arrayakun[$dropshipperspembelian->kode_akun_pembelian] }}</td>
                            <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $dropshipperspembelian->tanggal_bayar_pembelian)->isoFormat('D MMMM Y') }}</td>
                            <td style="text-align:right;">{{ number_format($dropshipperspembelian->sisa_bayar,2,',','.') }}</td>
                          </tr>
                          @php
                            $sumsdropshipperspembelian = $sumsdropshipperspembelian + $dropshipperspembelian->sisa_bayar;
                            $x++;
                          @endphp

                        @endif

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PEMBAYARAN PEMBELIAN DROPSHIPPER (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsdropshipperspembelian,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($dropshipperspenjualans->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PENERIMAAN PENJUALAN DROPSHIPPER</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode.</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">No. Kontainer</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsdropshipperspenjualan = 0;
                        $x = 1;
                      @endphp

                      @foreach($dropshipperspenjualans ?? '' as $dropshipperspenjualan)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$dropshipperspenjualan->kode}}</td>
                          <td>{{$dropshipperspenjualan->namapenampung}}</td>
                          <td>{{$dropshipperspenjualan->no_kontainer}}</td>
                          <td>{{$dropshipperspenjualan->kode_akun_penjualan}} - {{ $arrayakun[$dropshipperspenjualan->kode_akun_penjualan] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $dropshipperspenjualan->tanggal_bayar_penjualan)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($dropshipperspenjualan->total_jual - $dropshipperspenjualan->potongan,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsdropshipperspenjualan = $sumsdropshipperspenjualan + $dropshipperspenjualan->total_jual - $dropshipperspenjualan->potongan;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PENERIMAAN PENJUALAN DROPSHIPPER (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsdropshipperspenjualan,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($biayadetaildropshippers->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="8" style="text-align:center;font-size:16px;">BIAYA DROPSHIPPER</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">No. Kontainer</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Nama Item</th>
                        <th style="text-align:center;">Catatan</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsbiayadetaildropshipper = 0;
                        $x = 1;
                      @endphp

                      @foreach($biayadetaildropshippers ?? '' as $biayadetaildropshipper)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$biayadetaildropshipper->nomorkontainer}}</td>
                          <td>{{$biayadetaildropshipper->namapenampung}}</td>
                          <td>{{$biayadetaildropshipper->kode_akun}} - {{ $arrayakun[$biayadetaildropshipper->kode_akun] }}</td>
                          <td>{{$biayadetaildropshipper->nama}}</td>
                          <td>{{$biayadetaildropshipper->catatan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $biayadetaildropshipper->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($biayadetaildropshipper->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsbiayadetaildropshipper = $sumsbiayadetaildropshipper + $biayadetaildropshipper->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="7" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> BIAYA DROPSHIPPER (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsbiayadetaildropshipper,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($komisidropshippers->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="8" style="text-align:center;font-size:16px;">BIAYA KOMISI DROPSHIPPER</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">No. Kontainer</th>
                        <th style="text-align:center;">Penampung</th>
                        <th style="text-align:center;">Akun Pembayaran</th>
                        <th style="text-align:center;">Nama Penerima Komisi</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumskomisidropshipper = 0;
                        $x = 1;
                      @endphp

                      @foreach($komisidropshippers ?? '' as $komisidropshipper)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$komisidropshipper->nomorkontainer}}</td>
                          <td>{{$komisidropshipper->namapenampung}}</td>
                          <td>{{$komisidropshipper->kode_akun}} - {{ $arrayakun[$komisidropshipper->kode_akun] }}</td>
                          <td>{{$komisidropshipper->nama}}</td>
                          <td>{{$komisidropshipper->keterangan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $komisidropshipper->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($komisidropshipper->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumskomisidropshipper = $sumskomisidropshipper + $komisidropshipper->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="7" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> BIAYA KOMISI DROPSHIPPER (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumskomisidropshipper,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($jurnalmanualmasuks->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">JURNAL MANUAL (PEMASUKAN)</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kd. Jurnal</th>
                        <th style="text-align:center;">Ket. Jurnal</th>
                        <th style="text-align:center;">Akun</th>
                        <th style="text-align:center;">Ket. Detil</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsjurnalmanualmasuk = 0;
                        $x = 1;
                      @endphp

                      @foreach($jurnalmanualmasuks ?? '' as $jurnalmanualmasuk)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$jurnalmanualmasuk->kodejurnal}}</td>
                          <td>{{$jurnalmanualmasuk->keteranganjurnal}}</td>
                          <td>{{$jurnalmanualmasuk->kode_akun}} - {{ $arrayakun[$jurnalmanualmasuk->kode_akun] }}</td>
                          <td>{{$jurnalmanualmasuk->keterangan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $jurnalmanualmasuk->tanggaljurnal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($jurnalmanualmasuk->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsjurnalmanualmasuk = $sumsjurnalmanualmasuk + $jurnalmanualmasuk->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> JURNAL MANUAL (PEMASUKAN) (Debit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsjurnalmanualmasuk,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($jurnalmanualkeluars->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">JURNAL MANUAL (PENGELUARAN)</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kd. Jurnal</th>
                        <th style="text-align:center;">Ket. Jurnal</th>
                        <th style="text-align:center;">Akun</th>
                        <th style="text-align:center;">Ket. Detil</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsjurnalmanualkeluar = 0;
                        $x = 1;
                      @endphp

                      @foreach($jurnalmanualkeluars ?? '' as $jurnalmanualkeluar)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$jurnalmanualkeluar->kodejurnal}}</td>
                          <td>{{$jurnalmanualkeluar->keteranganjurnal}}</td>
                          <td>{{$jurnalmanualkeluar->kode_akun}} - {{ $arrayakun[$jurnalmanualkeluar->kode_akun] }}</td>
                          <td>{{$jurnalmanualkeluar->keterangan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $jurnalmanualkeluar->tanggaljurnal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($jurnalmanualkeluar->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsjurnalmanualkeluar = $sumsjurnalmanualkeluar + $jurnalmanualkeluar->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> JURNAL MANUAL (Pengeluaran) (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsjurnalmanualkeluar,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($perolehanassets->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PEROLEHAN ASSET</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kd. Asset</th>
                        <th style="text-align:center;">Nama Asset</th>
                        <th style="text-align:center;">No. Part</th>
                        <th style="text-align:center;">Akun</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumsperolehanasset = 0;
                        $x = 1;
                      @endphp

                      @foreach($perolehanassets ?? '' as $perolehanasset)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$perolehanasset->kode}}</td>
                          <td>{{$perolehanasset->nama}}</td>
                          <td>{{$perolehanasset->no_part}}</td>
                          <td>{{$perolehanasset->akun_kas}} - {{ $arrayakun[$perolehanasset->akun_kas] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $perolehanasset->tanggal_jurnal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($perolehanasset->nilai_jurnal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumsperolehanasset = $sumsperolehanasset + $perolehanasset->nilai_jurnal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PEROLEHAN ASSET (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumsperolehanasset,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($pengeluaranassets->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">PENGELUARAN OPPERASIONAL ASSET</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kode</th>
                        <th style="text-align:center;">Asset</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Akun</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nominal (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumspengeluaranasset = 0;
                        $x = 1;
                      @endphp

                      @foreach($pengeluaranassets ?? '' as $pengeluaranasset)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$pengeluaranasset->kode}}</td>
                          <td>{{$pengeluaranasset->namaasset}} - {{ $pengeluaranasset->namakategori }}</td>
                          <td>{{$pengeluaranasset->keterangan}}</td>
                          <td>{{$pengeluaranasset->akun_kas}} - {{ $arrayakun[$pengeluaranasset->akun_kas] }}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $pengeluaranasset->tanggal)->isoFormat('D MMMM Y') }}</td>
                          <td style="text-align:right;">{{ number_format($pengeluaranasset->nominal,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspengeluaranasset = $sumspengeluaranasset + $pengeluaranasset->nominal;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="6" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PENGELUARAN OPPERASIONAL ASSET (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspengeluaranasset,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    <table class="table custom-table m-0 mt-4" @if($payrolls->isEmpty()) style="display:none;" @endif>
                      <thead>
                      <tr>
                        <th colspan="6" style="text-align:center;font-size:16px;">PAYROLL - PEMBAYARAN GAJI</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Kd. Payroll</th>
                        <th style="text-align:center;">Nm. Karyawan</th>
                        <th style="text-align:center;">Tgl. Gajian</th>
                        <th style="text-align:center;">Akun</th>
                        <th style="text-align:center;">Gaji Bersih (Rp. )</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $sumspayroll = 0;
                        $x = 1;
                      @endphp

                      @foreach($payrolls ?? '' as $payroll)

                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{$payroll->kodepayroll}}</td>
                          <td>{{$payroll->namakaryawan}} - {{$payroll->kodekaryawan}}</td>
                          <td>{{ Carbon\Carbon::createFromFormat('Y-m-d', $payroll->tanggalgajian)->isoFormat('D MMMM Y') }}</td>
                          <td>{{$payroll->kode_akun}} - {{ $arrayakun[$payroll->kode_akun] }}</td>
                          <td style="text-align:right;">{{ number_format($payroll->gaji_bersih,2,',','.') }}</td>
                        </tr>
                        @php
                          $sumspayroll = $sumspayroll + $payroll->gaji_bersih;
                          $x++;
                        @endphp

                      @endforeach
                      <tr>
                        <td colspan="5" style="text-align:right;padding-right:10px;font-size:14px;font-weight:bold;background-color:yellow;"> PAYROLL - PEMBAYARAN GAJI (Kredit) </td>
                        <td style="padding-left:10px;font-size:14px;font-weight:bold;background-color:yellow;">{{ number_format($sumspayroll,2,',','.') }}</td>
                      </tr>
                      </tbody>
                    </table>

                    @php
                      $sumsdebit = $sumspendapatan + $sumspenjualan + $sumsjasatimbang + $sumsbayarpiutang + $sumsbayarpiutangjasa + $sumsdropshipperspenjualan + $sumspengembalianpinjamankaryawan + $sumspengembalianpinjamanpenampung + $sumstransferkassmasuk + $sumsjurnalmanualmasuk + $sumscancelbayarhutang + $sumspengembalianpinjamankonsumen;

                      $sumskredit = $sumspembelian + $sumspengeluaran + $sumsbiayadetaildropshipper + $sumspinjamanpenampung + $sumsdppenampung + $sumspinjamankaryawan + $sumstransferkasskeluar + $sumsbayarhutang + $sumsbayarhutangpenampung + $sumsdropshipperspembelian + $sumsjurnalmanualkeluar + $sumspengeluaranasset + $sumspayroll + $sumsperolehanasset + $sumskomisidropshipper + $sumscancelbayarpiutang + $sumspinjamankonsumen;


                      $debetawal = 0;
                      $kreditawal = 0;
                      $totalsaldoawal = 0;

                      $totalawal_d = DB::table('jurnal_detils')
                        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
                        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
                        ->where('jurnal_detils.kode_akun','=', $request->akun)
                        ->where('jurnals.tanggal','<',$request->tanggalmulai)
                        ->where('jurnal_detils.tipe','=','D')
                        ->get();

                      if(!$totalawal_d->isEmpty()) {
                        $debetawal = $totalawal_d[0]->totalnominal;
                      }

                      $totalawal_k = DB::table('jurnal_detils')
                        ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
                        ->select(DB::raw("SUM(jurnal_detils.nominal) as totalnominal"))
                        ->where('jurnal_detils.kode_akun','=', $request->akun)
                        ->where('jurnals.tanggal','<',$request->tanggalmulai)
                        ->where('jurnal_detils.tipe','=','K')
                        ->get();

                      if(!$totalawal_k->isEmpty()) {
                        $kreditawal = $totalawal_k[0]->totalnominal;
                      }

                      if($akun->saldo_normal == "D"){
                        $totalsaldoawal = $debetawal - $kreditawal + $akun->saldo_awal;
                      }else{
                        $totalsaldoawal = $debetawal - $kreditawal - $akun->saldo_awal;
                      }

                    @endphp

                    <table class="mt-4" style="background-color:cyan;font-size:26px;float:right;">
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">TOTAL DEBIT</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">Rp {{ number_format($sumsdebit,2,',','.') }}</th>
                      </tr>
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">TOTAL KREDIT</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">Rp {{ number_format($sumskredit,2,',','.') }}</th>
                      </tr>
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">PENAMBAHAN SALDO</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">Rp {{ number_format($sumsdebit - $sumskredit,2,',','.') }}</th>
                      </tr>
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">SALDO AWAL</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">Rp {{ number_format($totalsaldoawal,2,',','.') }}</th>
                      </tr>
                      <tr>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">SALDO AKHIR</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">:</th>
                        <th style="padding:5px 18px;font-family:'Poppins', sans-serif;">Rp {{ number_format($totalsaldoawal + $sumsdebit - $sumskredit,2,',','.') }}</th>
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
