
@extends('layouts/contentLayoutMaster')

@section('title', 'PT. KAPUAS INTAN UTAMA - Dashboard')
@section('page-title', 'PT. KAPUAS INTAN UTAMA - Dashboard')

@section('vendor-style')
  {{-- vendor css files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/charts/apexcharts.css')) }}">
@endsection
@section('page-style')
  {{-- Page css files --}}
  <link rel="stylesheet" href="{{ asset(mix('css/pages/dashboard-ecommerce.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/pages/card-analytics.css')) }}">
@endsection

@if(Auth::User()->status == "Super Admin")

@section('content')
  {{-- Dashboard Ecommerce Starts --}}

  <section id="dashboard-ecommerce">
    <div class="row">
      <div class="col-md-4 col-12">
        <div class="card">
          <div class="card-header">
            <h4 class="card-title">Ringkasan Status Invoice</h4>
          </div>
          <div class="card-content">
            <div class="card-body">
              <div class="d-flex justify-content-between mb-25">
                <div class="browser-info">
                  <p class="mb-25">Lunas</p>
                  <h4>{{ $totalinvoice == 0 ? 0 : round($totallunas / $totalinvoice * 100,2) }}%</h4>
                </div>
                <div class="stastics-info text-right">
                  <span>{{ number_format($totallunas,0,',','.') }}</span>
                </div>
              </div>
              <div class="progress progress-bar-primary mb-2">
                <div class="progress-bar" role="progressbar" aria-valuenow="{{ $totalinvoice == 0 ? 0 : $totallunas / $totalinvoice * 100 }}" aria-valuemin="{{ $totalinvoice == 0 ? 0 : $totallunas / $totalinvoice * 100 }}" aria-valuemax="100" style="width:{{ $totalinvoice == 0 ? 0 : $totallunas / $totalinvoice * 100 }}%"></div>
              </div>
              <div class="d-flex justify-content-between mb-25">
                <div class="browser-info">
                  <p class="mb-25">Belum Lunas</p>
                  <h4>{{ $totalinvoice == 0 ? 0 : round($totalbelumlunas / $totalinvoice * 100,2) }}%</h4>
                </div>
                <div class="stastics-info text-right">
                  <span>{{ number_format($totalbelumlunas,0,',','.') }}</span>
                </div>
              </div>
              <div class="progress progress-bar-primary mb-2">
                <div class="progress-bar" role="progressbar" aria-valuenow="{{ $totalinvoice == 0 ? 0 : $totalbelumlunas / $totalinvoice * 100 }}" aria-valuemin="{{ $totalinvoice == 0 ? 0 : $totalbelumlunas / $totalinvoice * 100 }}" aria-valuemax="100"
                     style="width:{{ $totalinvoice == 0 ? 0 : $totalbelumlunas / $totalinvoice * 100 }}%"></div>
              </div>
              <div class="d-flex justify-content-between mb-25">
                <div class="browser-info">
                  <p class="mb-25">Total Invoice</p>
                </div>
                <div class="stastics-info text-right">
                  <span>{{ number_format($totalinvoice,0,',','.') }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 col-12">
        <div class="card">
          <div class="card-header d-flex justify-content-between align-items-end">
            <h4 class="mb-0">Persentase Piutang Lunas</h4>
          </div>
          <div class="card-content">
            <div class="card-body px-0 pb-0">
              <div id="goal-overview-chart" class="mt-75"></div>
              <div class="row text-center mx-0">
                <div class="col-6 border-top border-right d-flex align-items-between flex-column py-1">
                  <p class="mb-50">Total Terbayar</p>
                  <p class="text-bold-700">Rp {{ number_format($nilaijumlahpiutangterbayar,0,',','.') }}</p>
                </div>
                <div class="col-6 border-top d-flex align-items-between flex-column py-1">
                  <p class="mb-50">Total Piutang</p>
                  <p class="text-bold-700">Rp {{ number_format($nilaijumlahpiutang,0,',','.') }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-12 hidden">
        <div class="card">
          <div class="card-header d-flex justify-content-between pb-0">
            <h4 class="card-title">Rasio Total Penerimaan Invoice & Pembayaran Freelancer</h4>
          </div>
          <div class="card-content">
            <div class="card-body py-0">
              <div id="ratio-chart"></div>
            </div>
            <ul class="list-group list-group-flush customer-info">
              <li class="list-group-item d-flex justify-content-between ">
                <div class="series-info">
                  <i class="fa fa-circle font-small-3 text-success"></i>
                  <span class="text-bold-600">Total Penerimaan Invoice</span>
                </div>
                <div class="product-result">
                  <span>{{ number_format($nilaijumlahpiutangterbayar,0,',','.') }}</span>
                </div>
              </li>
              <li class="list-group-item d-flex justify-content-between ">
                <div class="series-info">
                  <i class="fa fa-circle font-small-3 text-warning"></i>
                  <span class="text-bold-600">Total Pembayaran Freelancer</span>
                </div>
                <div class="product-result">
                  <span>{{ number_format($totalpengeluaran,0,',','.') }}</span>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>

    </div>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-12">
        <div class="card">
          <div class="card-header d-flex justify-content-between align-items-end">
            <h4 class="card-title">Grafik Piutang</h4>
          </div>
          <div class="card-content">
            <div class="card-body pb-0">
              <div class="d-flex justify-content-start">
                <div class="mr-3">
                  <p class="mb-50 text-bold-600">Total Piutang <br /> (15 Bulan Terakhir)</p>
                  <h2 class="text-bold-400">
                    <sup class="font-medium-1">Rp</sup>
                    <span class="text-primary" style="color:rgb(115, 103, 240) !important;">{{ number_format($sumtotalpiutang,0,',','.') }}</span>

                  </h2>
                </div>
                <div>
                  <p class="mb-50 text-bold-600">Total Piutang Terbayar<br />(15 Bulan Terakhir)</p>
                  <h2 class="text-bold-400">
                    <sup class="font-medium-1">Rp</sup>
                    <span class="text-success">{{ number_format($sumtotalterbayar,0,',','.') }}</span>
                  </h2>
                </div>
              </div>
              <div id="revenue-chart"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  {{-- Dashboard Ecommerce ends --}}
@endsection
@section('vendor-script')
  {{-- vendor files --}}
  <script src="{{ asset(mix('vendors/js/charts/apexcharts.min.js')) }}"></script>
@endsection
@section('page-script')
  {{-- Page js files --}}
  <script>

    $(window).on("load", function () {

      var $primary = '#7367F0';
      var $success = '#28C76F';
      var $danger = '#EA5455';
      var $warning = '#FF9F43';
      var $info = '#00cfe8';
      var $primary_light = '#A9A2F6';
      var $danger_light = '#f29292';
      var $success_light = '#55DD92';
      var $warning_light = '#ffc085';
      var $info_light = '#1fcadb';
      var $strok_color = '#b9c3cd';
      var $label_color = '#e7e7e7';
      var $white = '#fff';

      let bulan = [];
      let datanominal = [];
      let dataterbayar = [];

      let totalpekerjaan = "{{ $totalinvoice }}";
      let totalpekerjaanberjalan = "{{ $nilaijumlahpiutangterbayar }}";
      let totalbatal = "{{ $totalpengeluaran }}";

      let nilaijumlahpiutang = "{{ $nilaijumlahpiutang }}";
      let nilaijumlahpiutangterbayar = "{{ $nilaijumlahpiutangterbayar }}";
      let persentaseterbayar = 0;

      if(nilaijumlahpiutang != ""){
        persentaseterbayar = nilaijumlahpiutangterbayar / nilaijumlahpiutang * 100;
      }

      @foreach ($invoices as $invoice)
        bulan.push("{{ $invoice->month.', '.$invoice->year }}");
        datanominal.push("{{ $invoice->totalnominal }}");
        dataterbayar.push("{{ $invoice->totalterbayar }}");
      @endforeach

      // revenue-chart Chart
      // -----------------------------

      var revenueChartoptions = {
        chart: {
          height: 270,
          toolbar: { show: false },
          type: 'line',
        },
        grid: {
          borderColor: $label_color,
        },
        stroke: {
          curve: 'smooth',
          dashArray: [0, 8],
          width: [4, 2],
        },
        legend: {
          show: true,
        },
        colors: [$success_light, $primary_light],

        fill: {
          type: 'gradient',
          gradient: {
            shade: 'dark',
            inverseColors: false,
            gradientToColors: [$success, $strok_color],
            shadeIntensity: 1,
            type: 'horizontal',
            opacityFrom: 1,
            opacityTo: 1,
            stops: [0, 100, 100, 100]
          },
        },
        markers: {
          size: 0,
          hover: {
            size: 5
          }
        },
        xaxis: {
          labels: {
            style: {
              colors: $strok_color,
            }
          },
          axisTicks: {
            show: false,
          },

          categories: bulan,
          axisBorder: {
            show: false,
          },
          tickPlacement: 'on',
        },
        yaxis: {
          tickAmount: 5,
          labels: {
            style: {
              color: $strok_color,
            },
            formatter: function (val) {
              return val > 999 ? (val / 1000) + 'k' : val;
            }
          }
        },
        tooltip: {
          x: { show: false }
        },
        series: [{
          name: "Total Terbayar",
          data: dataterbayar
        },
          {
            name: "Total Piutang",
            data: datanominal
          }
        ],

      }

      var revenueChart = new ApexCharts(
        document.querySelector("#revenue-chart"),
        revenueChartoptions
      );

      revenueChart.render();


      // Goal Overview  Chart
      // -----------------------------

      var goalChartoptions = {
        chart: {
          height: 280,
          type: 'radialBar',
          sparkline: {
            enabled: true,
          },
          dropShadow: {
            enabled: true,
            blur: 3,
            left: 1,
            top: 1,
            opacity: 0.1
          },
        },
        colors: [$success],
        plotOptions: {
          radialBar: {
            size: 110,
            startAngle: -150,
            endAngle: 150,
            hollow: {
              size: '77%',
            },
            track: {
              background: $strok_color,
              strokeWidth: '50%',
            },
            dataLabels: {
              name: {
                show: false
              },
              value: {
                offsetY: 18,
                color: '#99a2ac',
                fontSize: '4rem'
              }
            }
          }
        },
        fill: {
          type: 'gradient',
          gradient: {
            shade: 'dark',
            type: 'horizontal',
            shadeIntensity: 0.5,
            gradientToColors: ['#00b5b5'],
            inverseColors: true,
            opacityFrom: 1,
            opacityTo: 1,
            stops: [0, 100]
          },
        },
        series: [parseInt(persentaseterbayar)],
        stroke: {
          lineCap: 'round'
        },

      }

      var goalChart = new ApexCharts(
        document.querySelector("#goal-overview-chart"),
        goalChartoptions
      );

      goalChart.render();

      // Customer Chart
      // -----------------------------

      var customerChartoptions = {
        chart: {
          type: 'pie',
          height: 265,
          dropShadow: {
            enabled: false,
            blur: 5,
            left: 1,
            top: 1,
            opacity: 0.2
          },
          toolbar: {
            show: false
          }
        },
        labels: ['Total Penerimaan Invoice', 'Total Pembayaran Freelancer'],
        series: [parseInt(totalpekerjaanberjalan), parseInt(totalbatal)],
        dataLabels: {
          enabled: false
        },
        legend: { show: false },
        stroke: {
          width: 5
        },
        colors: [$warning, $danger],
        fill: {
          type: 'gradient',
          gradient: {
            gradientToColors: [$warning_light, $danger_light]
          }
        }
      }

      var customerChart = new ApexCharts(
        document.querySelector("#ratio-chart"),
        customerChartoptions
      );

      customerChart.render();

    });

    (jQuery);


  </script>
@endsection

@else

  @section('content')
        {{-- Data list view starts --}}
        <section id="data-list-view" class="data-list-view-header card" style="padding:25px 15px;">

          <div class="col-md-12">

            {{-- DataTable starts --}}
            <div class="table-responsive mt-1" id="tabel">
              <table class="table data-list-view" style="border:none;width:100%;">
                <thead>
                <tr>
                  <th width="45px">No.</th>
                  <th>Kode</th>
                  <th>Nama</th>
                  <th>Satuan</th>
                  <th>Kategori</th>
                  <th>Stok Toko</th>
                  <th>Stok Pabrik</th>
                </tr>
                </thead>
                <tbody>
                  @foreach($barangs ?? '' as $barang)
                    <tr>
                      <td> {{ $loop->iteration }}</td>
                      <td> {{ $barang->kode }}</td>
                      <td> {{ $barang->nama }}</td>
                      <td> {{ $barang->satuan }}</td>
                      <td> {{ $barang->namakategori }}</td>
                      <td> {{ number_format($barang->stok,2,',','.') }}</td>
                      <td> {{ number_format($barang->gudang,2,',','.') }}</td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
            {{-- DataTable ends --}}

          </div>

        </section>
        {{-- Data list view end --}}
  @endsection

@endif