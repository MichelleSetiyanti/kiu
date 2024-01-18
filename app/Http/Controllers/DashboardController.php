<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function home(){
        $totalbelumlunas = DB::table('penjualans')
          ->whereIn('status', ['not-paid'])
          ->count();

        $totallunas = DB::table('penjualans')
          ->whereIn('status', ['paid'])
          ->count();

        $totalinvoice = $totalbelumlunas + $totallunas;

        $invoices = DB::table('penjualans')->select([
        DB::raw("DATE_FORMAT(tanggal, '%Y') as year"),
        DB::raw("DATE_FORMAT(tanggal, '%m') as month"),
        DB::raw("SUM(grandtotal) as totalnominal"),
        DB::raw("SUM(sisa) as totalterbayar"),
        ])->orderBy('tanggal','asc')->groupBy('year')->groupBy('month')->limit(15)->get();

        $sumtotalterbayar = 0;
        $sumtotalpiutang = 0;
        foreach ($invoices as $invoice){
          $sumtotalterbayar += $invoice->totalterbayar;
          $sumtotalpiutang += $invoice->totalnominal;
        }

        $invoices2 = DB::table('penjualans')->select([
          DB::raw("SUM(grandtotal) as totalnominal"),
          DB::raw("SUM(sisa) as totalterbayar"),
        ])->get();

        $nilaijumlahpiutang = $invoices2[0]->totalnominal;
        $nilaijumlahpiutangterbayar = $invoices2[0]->totalterbayar;

        $pengeluaran = DB::table('pengeluarans')->select([
            DB::raw("SUM(nominal) as totalnominal"),
        ])->where('id','!=','0')->get();

        $totalpengeluaran = $pengeluaran[0]->totalnominal;

        $barangs = DB::table('barangs')
          ->join('kategori_barangs','barangs.id_kategori','=','kategori_barangs.id')
          ->select('barangs.*','kategori_barangs.nama as namakategori')
          ->orderBy('barangs.stok', 'asc')
          ->where('barangs.id','!=','0')
          ->where('barangs.stok','<=','40')
          ->get();

        return view('apps.misc.home', [
          'invoices' => $invoices,
          'sumtotalterbayar' => $sumtotalterbayar,
          'sumtotalpiutang' => $sumtotalpiutang,
          'totalbelumlunas' => $totalbelumlunas,
          'totallunas' => $totallunas,
          'totalinvoice' => $totalinvoice,
          'nilaijumlahpiutang' => $nilaijumlahpiutang,
          'totalpengeluaran' => $totalpengeluaran,
          'nilaijumlahpiutangterbayar' => $nilaijumlahpiutangterbayar,
          'barangs' => $barangs
        ]);
    }

    // Dashboard - Analytics
    public function dashboardAnalytics(){
        $pageConfigs = [
            'pageHeader' => false
        ];

        return view('/pages/dashboard-analytics', [
            'pageConfigs' => $pageConfigs
        ]);
    }

    // Dashboard - Ecommerce
    public function dashboardEcommerce(){
        $pageConfigs = [
            'pageHeader' => false
        ];

        return view('/pages/dashboard-ecommerce', [
            'pageConfigs' => $pageConfigs
        ]);
    }
}

