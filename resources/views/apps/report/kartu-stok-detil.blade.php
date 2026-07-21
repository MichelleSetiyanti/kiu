@php
use Illuminate\Support\Facades\DB;
@endphp

<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=1500">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title> Laporan Kartu Stok </title>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
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
    .invoice-container .invoice-body {
      padding: 1rem 0 0 0;
    }
    .invoice-container .invoice-footer {
      text-align: center;
      font-size: 0.7rem;
      margin: 5px 0 0 0;
    }

    @media print
    {
      @page {
        size: A4 landscape;
        margin: 10mm;
      }

      /* The width=1500 viewport meta (kept so the on-screen/PDF-capture
         layout has a stable, predictable width) would otherwise make the
         browser's native print shrink the whole page to fit that phantom
         1500px-wide viewport onto the physical A4 sheet, making everything
         tiny. Forcing 100% here makes native print reflow at the actual
         @page content width instead. */
      html, body, .html-content {
        width: 100% !important;
        max-width: 100% !important;
      }

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

    .qty-plus {
      color: #16a34a !important;
      font-weight: bold;
    }

    .qty-minus {
      color: #dc2626 !important;
      font-weight: bold;
    }

    .qty-sebelum {
      color: #6b7280 !important;
    }

    .qty-sesudah {
      color: #2563eb !important;
      font-weight: bold;
    }

    .custom-actions-btns {
      margin: auto;
      display: flex;
      justify-content: flex-end;
    }

    .custom-actions-btns .btn {
      margin: .3rem 0 .3rem .3rem;
    }

    .decoration {
        margin-left: 40px;
        margin-right: 40px;
        height: 30px;
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
                    <a href="#" onclick="f_exportExcel();return false;" class="btn btn-success">
                      <i class="icon-grid"></i> Export Excel
                    </a>
                    <a href="#" onclick="f_print();return false;" class="btn btn-secondary">
                      <i class="icon-printer"></i> Print
                    </a>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <div class="decoration"></div>

              <br />
              <h1 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;"> PT. KAPUAS INTAN UTAMA </h1>
              <h2 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;"> LAPORAN Kartu Stok </h2>
              <h5 style="color:#232F33;width:100%;text-align:center;font-family:'Poppins', sans-serif;font-weight:normal;"> Periode {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalmulai)->isoFormat('D MMMM Y') }} s/d {{ Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalselesai)->isoFormat('D MMMM Y') }} </h5>
              <h5 style="color:#e31515;width:100%;text-align:center;font-family:'Poppins', sans-serif;">
                  Filter Produk : {{ $barang->nama ?? '-' }}
              </h5>
              <br />

            </div>
            <div class="invoice-body" style="padding: 70px 40px 40px 40px;">
              <!-- Row start -->
              <div class="row gutters">
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="table-responsive">

                    <table class="table custom-table m-0 mt-4" id="tabelKartuStok">
                      <thead>
                      <tr>
                        <th colspan="7" style="text-align:center;font-size:16px;">KARTU STOK</th>
                      </tr>
                      <tr>
                        <th style="text-align:center;">No.</th>
                        <th style="text-align:center;">Tanggal</th>
                        <th style="text-align:center;">Nama Customer</th>
                        <th style="text-align:center;">Keterangan</th>
                        <th style="text-align:center;">Qty (+)</th>
                        <th style="text-align:center;">Qty (-)</th>
                        <th style="text-align:center;">Qty Sesudah</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $x = 1;
                      @endphp

                      @forelse($movements ?? [] as $movement)
                        <tr>
                          <td style="text-align:center;">{{ $x }}</td>
                          <td>{{ Carbon\Carbon::parse($movement->movement_date)->isoFormat('D MMMM Y') }}</td>
                          <td>{{ $movement->nama_customer ?? '-' }}</td>
                          <td>{!! $movement->keterangan !!}</td>
                          <td class="qty-plus" data-value="{{ $movement->type == 'in' ? $movement->quantity : 0 }}" style="text-align:right;">
                            {{ $movement->type == 'in' ? number_format($movement->quantity, 2, ',', '.') : '' }}
                          </td>
                          <td class="qty-minus" data-value="{{ $movement->type == 'out' ? $movement->quantity : 0 }}" style="text-align:right;">
                            {{ $movement->type == 'out' ? number_format($movement->quantity, 2, ',', '.') : '' }}
                          </td>
                          <td class="qty-sesudah" data-value="{{ $movement->after_stock }}" style="text-align:right;">{{ number_format($movement->after_stock, 2, ',', '.') }}</td>
                        </tr>
                        @php
                          $x++;
                        @endphp
                      @empty
                        <tr>
                          <td colspan="7" style="text-align:center;">Tidak ada data pergerakan stok pada periode ini.</td>
                        </tr>
                      @endforelse
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
  var namaProduk = @json($barang->nama ?? '-');

  function f_sanitizeFilename(name){
    return name.replace(/[\\\/:*?"<>|]/g, '-');
  }

  function f_print(){
    window.print();
  }

  function f_exportExcel(){
    // Built manually from data-value attributes instead of XLSX.utils.table_to_book():
    // table_to_book infers cell types from the displayed text, and misreads the
    // Indonesian-formatted numbers ("1.148,00") using US conventions (comma = thousands
    // separator), turning e.g. "-6,00" into -600. Reading the raw numeric value avoids that.
    var periode = @json(
      Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalmulai)->isoFormat('D MMMM Y')
      . ' s/d ' .
      Carbon\Carbon::createFromFormat('Y-m-d', $request->tanggalselesai)->isoFormat('D MMMM Y')
    );

    var rows = [
      ['KARTU STOK - ' + namaProduk],
      ['Periode ' + periode],
      [],
      ['No.', 'Tanggal', 'Nama Customer', 'Keterangan', 'Qty (+)', 'Qty (-)', 'Qty Sesudah'],
    ];

    document.querySelectorAll('#tabelKartuStok tbody tr').forEach(function (tr) {
      var cells = tr.children;
      if (cells.length < 7) {
        return;
      }
      rows.push([
        cells[0].textContent.trim(),
        cells[1].textContent.trim(),
        cells[2].textContent.trim(),
        cells[3].textContent.trim(),
        parseFloat(cells[4].getAttribute('data-value')) || '',
        parseFloat(cells[5].getAttribute('data-value')) || '',
        parseFloat(cells[6].getAttribute('data-value')),
      ]);
    });

    var ws = XLSX.utils.aoa_to_sheet(rows);
    ws['!merges'] = [
      { s: { r: 0, c: 0 }, e: { r: 0, c: 6 } },
      { s: { r: 1, c: 0 }, e: { r: 1, c: 6 } },
    ];
    var wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Kartu Stok');
    XLSX.writeFile(wb, 'Laporan Kartu Stok - ' + f_sanitizeFilename(namaProduk) + '.xlsx');
  }
</script>

</html>
