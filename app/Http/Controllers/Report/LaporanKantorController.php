<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class LaporanKantorController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $akuns = DB::table('akuns')->where('aktif','=','Active')->where('kategori','=','Kas & Bank')->get();

    return view('apps.report.laporan-kantor', [ 'akuns' => $akuns ]);
  }

  public function list_detil(Request $request)
  {
    $createdatmulai = $request->tanggalmulai.' 00:00:00';
    $createdatselesai = $request->tanggalselesai.' 23:59:59';

    $pembelians = DB::table('pembelians')
      ->join('penampungs','pembelians.id_penampungs','=','penampungs.id')
      ->select('pembelians.*','penampungs.nama as namapenampung')
      ->orderBy('pembelians.id', 'desc')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pembelians.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('pembelians.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pembelians.status','=','Selesai');
      })
      ->get();

    $penjualans = DB::table('penjualans')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->select('penjualans.*','konsumens.nama as namakonsumen')
      ->orderBy('penjualans.id', 'desc')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('penjualans.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('penjualans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('penjualans.status','=','Selesai');
      })
      ->get();

    $pengeluarans = DB::table('pengeluarans')
      ->join('kategori_pengeluarans','pengeluarans.id_kategori_pengeluarans','=','kategori_pengeluarans.id')
      ->select('pengeluarans.*','kategori_pengeluarans.nama as kategoripengeluaran')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pengeluarans.akun_kas', '=' , $request->akun);
        }

        $query->whereBetween('pengeluarans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pengeluarans.id','!=','0');
      })
      ->orderBy('pengeluarans.id', 'desc')
      ->get();

    $pemasukans = DB::table('pemasukans')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pemasukans.akun_kas', '=' , $request->akun);
        }

        $query->whereBetween('pemasukans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pemasukans.id','!=','0');
      })
      ->orderBy('pemasukans.id', 'asc')
      ->get();

    $bayar_hutangs = DB::table('bayar_hutangs')
      ->join('pembelians','bayar_hutangs.id_pembelians','=','pembelians.id')
      ->join('penampungs','pembelians.id_penampungs','=','penampungs.id')
      ->select('bayar_hutangs.*','pembelians.kode as kodepembelian','penampungs.nama as namapenampung')
      ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
      {
        if($request->akun != "All"){
          $query->where('bayar_hutangs.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('bayar_hutangs.created_at', [$createdatmulai, $createdatselesai]);
        $query->where('bayar_hutangs.id','!=','0');
      })
      ->orderBy('bayar_hutangs.id', 'asc')
      ->get();

    $bayar_hutang_penampungs = DB::table('bayar_hutang_penampungs')
      ->join('penampungs','bayar_hutang_penampungs.id_penampungs','=','penampungs.id')
      ->select('bayar_hutang_penampungs.*','penampungs.nama as namapenampung')
      ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
      {
        if($request->akun != "All"){
          $query->where('bayar_hutang_penampungs.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('bayar_hutang_penampungs.created_at', [$createdatmulai, $createdatselesai]);
        $query->where('bayar_hutang_penampungs.id','!=','0');
      })
      ->orderBy('bayar_hutang_penampungs.id', 'asc')
      ->get();

    $bayar_piutangs = DB::table('bayar_piutangs')
      ->join('penjualans','bayar_piutangs.id_penjualans','=','penjualans.id')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->select('bayar_piutangs.*','penjualans.kode as kodepenjualan','konsumens.nama as namakonsumen')
      ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
      {
        if($request->akun != "All"){
          $query->where('bayar_piutangs.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('bayar_piutangs.created_at', [$createdatmulai, $createdatselesai]);
        $query->where('bayar_piutangs.id','!=','0');
      })
      ->orderBy('bayar_piutangs.id', 'asc')
      ->get();

    $bayar_piutang_jasas = DB::table('bayar_piutang_jasas')
      ->join('jasa_timbangs','bayar_piutang_jasas.id_jasa_timbangs','=','jasa_timbangs.id')
      ->join('konsumens','jasa_timbangs.id_konsumens','=','konsumens.id')
      ->select('bayar_piutang_jasas.*','jasa_timbangs.kode as kodepenjualan','konsumens.nama as namakonsumen')
      ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
      {
        if($request->akun != "All"){
          $query->where('bayar_piutang_jasas.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('bayar_piutang_jasas.created_at', [$createdatmulai, $createdatselesai]);
        $query->where('bayar_piutang_jasas.id','!=','0');
      })
      ->orderBy('bayar_piutang_jasas.id', 'asc')
      ->get();

    $biaya_detail_dropshippers = DB::table('biaya_detail_dropshippers')
      ->join('dropshippers','biaya_detail_dropshippers.id_dropshippers','=','dropshippers.id')
      ->join('penampungs','dropshippers.id_penampungs','=','penampungs.id')
      ->select('biaya_detail_dropshippers.*','dropshippers.no_kontainer as nomorkontainer','penampungs.nama as namapenampung')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('biaya_detail_dropshippers.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('biaya_detail_dropshippers.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('biaya_detail_dropshippers.id','!=','0');
      })
      ->orderBy('biaya_detail_dropshippers.id', 'asc')
      ->get();

    $dp_konsumens = DB::table('dp_konsumens')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('id','!=','0');
      })
      ->orderBy('id', 'asc')
      ->get();

    $dp_penampungs = DB::table('dp_penampungs')
      ->join('dropshippers','dp_penampungs.id_dropshippers','=','dropshippers.id')
      ->join('penampungs','dp_penampungs.id_penampungs','=','penampungs.id')
      ->select('dp_penampungs.*','dropshippers.no_kontainer as nomorkontainer','penampungs.nama as namapenampung')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('dp_penampungs.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('dp_penampungs.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('dp_penampungs.id','!=','0');
      })
      ->orderBy('dp_penampungs.id', 'asc')
      ->get();

    $jasa_timbangs = DB::table('jasa_timbangs')
      ->join('konsumens','jasa_timbangs.id_konsumens','=','konsumens.id')
      ->select('jasa_timbangs.*','konsumens.nama as namakonsumen')
      ->orderBy('jasa_timbangs.id', 'desc')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('jasa_timbangs.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('jasa_timbangs.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('jasa_timbangs.status','=','Selesai');
      })
      ->get();

    $pinjaman_penampungs = DB::table('pinjaman_penampungs')
      ->join('penampungs','pinjaman_penampungs.id_penampungs','=','penampungs.id')
      ->select('pinjaman_penampungs.*','penampungs.nama as namapenampung')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pinjaman_penampungs.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('pinjaman_penampungs.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pinjaman_penampungs.id','!=','0');
      })
      ->orderBy('pinjaman_penampungs.id', 'asc')
      ->get();

    $pengembalian_pinjaman_penampungs = DB::table('pengembalian_pinjaman_penampungs')
      ->join('penampungs','pengembalian_pinjaman_penampungs.id_penampungs','=','penampungs.id')
      ->select('pengembalian_pinjaman_penampungs.*','penampungs.nama as namapenampung')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pengembalian_pinjaman_penampungs.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('pengembalian_pinjaman_penampungs.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pengembalian_pinjaman_penampungs.id','!=','0');
      })
      ->orderBy('pengembalian_pinjaman_penampungs.id', 'asc')
      ->get();

    $pinjaman_konsumens = DB::table('pinjaman_konsumens')
      ->join('konsumens','pinjaman_konsumens.id_konsumens','=','konsumens.id')
      ->select('pinjaman_konsumens.*','konsumens.nama as namakonsumen')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pinjaman_konsumens.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('pinjaman_konsumens.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pinjaman_konsumens.id','!=','0');
      })
      ->orderBy('pinjaman_konsumens.id', 'asc')
      ->get();

    $pengembalian_pinjaman_konsumens = DB::table('pengembalian_pinjaman_konsumens')
      ->join('konsumens','pengembalian_pinjaman_konsumens.id_konsumens','=','konsumens.id')
      ->select('pengembalian_pinjaman_konsumens.*','konsumens.nama as namakonsumen')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pengembalian_pinjaman_konsumens.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('pengembalian_pinjaman_konsumens.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pengembalian_pinjaman_konsumens.id','!=','0');
      })
      ->orderBy('pengembalian_pinjaman_konsumens.id', 'asc')
      ->get();

    $pinjaman_karyawans = DB::table('pinjaman_karyawans')
      ->join('karyawans','pinjaman_karyawans.id_karyawans','=','karyawans.id')
      ->select('pinjaman_karyawans.*','karyawans.nama as namakaryawan')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pinjaman_karyawans.akun_kas', '=' , $request->akun);
        }

        $query->whereBetween('pinjaman_karyawans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pinjaman_karyawans.id','!=','0');
      })
      ->where('pinjaman_karyawans.status','Disetujui')
      ->orderBy('pinjaman_karyawans.id', 'asc')
      ->get();

    $pengembalian_pinjaman_karyawans = DB::table('pengembalian_pinjaman_karyawans')
      ->join('karyawans','pengembalian_pinjaman_karyawans.id_karyawans','=','karyawans.id')
      ->select('pengembalian_pinjaman_karyawans.*','karyawans.nama as namakaryawan')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pengembalian_pinjaman_karyawans.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('pengembalian_pinjaman_karyawans.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pengembalian_pinjaman_karyawans.id','!=','0');
      })
      ->orderBy('pengembalian_pinjaman_karyawans.id', 'asc')
      ->get();

    $transferkassmasuk = DB::table('transferkass')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('akun_kas', '=' , $request->akun);
        }

        $query->whereBetween('tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('id','!=','0');
      })
      ->orderBy('id', 'asc')
      ->get();

    $transferkasskeluar = DB::table('transferkass')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('akun_kas2', '=' , $request->akun);
        }

        $query->whereBetween('tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('id','!=','0');
      })
      ->orderBy('id', 'asc')
      ->get();

    $dropshipperspenjualans = DB::table('dropshippers')
      ->join('penampungs','dropshippers.id_penampungs','=','penampungs.id')
      ->select('dropshippers.*','penampungs.nama as namapenampung')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('dropshippers.kode_akun_penjualan', '=' , $request->akun);
        }

        $query->whereBetween('dropshippers.tanggal_bayar_penjualan', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('dropshippers.bayar_penjualan','Y');
        $query->where('dropshippers.id','!=','0');
      })
      ->orderBy('dropshippers.tanggal_bayar_penjualan', 'asc')
      ->get();

    $dropshipperspembelians = DB::table('dropshippers')
      ->join('penampungs','dropshippers.id_penampungs','=','penampungs.id')
      ->select('dropshippers.*','penampungs.nama as namapenampung')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('dropshippers.kode_akun_pembelian', '=' , $request->akun);
        }

        $query->whereBetween('dropshippers.tanggal_bayar_pembelian', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('dropshippers.bayar_pembelian','Y');
        $query->where('dropshippers.id','!=','0');
      })
      ->orderBy('dropshippers.tanggal_bayar_pembelian', 'asc')
      ->get();

    $jurnalmanualmasuks = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select('jurnal_detils.*','jurnals.kode as kodejurnal','jurnals.keterangan as keteranganjurnal','jurnals.tanggal as tanggaljurnal')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('jurnal_detils.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('jurnals.tipe','Manual');
        $query->where('jurnal_detils.tipe','D');
        $query->where('jurnals.id','!=','0');
      })
      ->orderBy('jurnals.id', 'asc')
      ->get();

    $jurnalmanualkeluars = DB::table('jurnal_detils')
      ->join('jurnals','jurnal_detils.id_jurnals','=','jurnals.id')
      ->select('jurnal_detils.*','jurnals.kode as kodejurnal','jurnals.keterangan as keteranganjurnal','jurnals.tanggal as tanggaljurnal')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('jurnal_detils.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('jurnals.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('jurnals.tipe','Manual');
        $query->where('jurnal_detils.tipe','K');
        $query->where('jurnals.id','!=','0');
      })
      ->orderBy('jurnals.id', 'asc')
      ->get();

    $komisidropshippers = DB::table('komisi_dropshippers')
      ->join('dropshippers','komisi_dropshippers.id_dropshippers','=','dropshippers.id')
      ->join('penampungs','dropshippers.id_penampungs','=','penampungs.id')
      ->select('komisi_dropshippers.*','dropshippers.no_kontainer as nomorkontainer','penampungs.nama as namapenampung')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('komisi_dropshippers.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('komisi_dropshippers.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('komisi_dropshippers.id','!=','0');
      })
      ->orderBy('komisi_dropshippers.id', 'asc')
      ->get();

    $akuns = DB::table('akuns')->get();


    $cancel_bayar_hutangs = DB::table('cancel_bayar_hutangs')
      ->join('pembelians','cancel_bayar_hutangs.id_pembelians','=','pembelians.id')
      ->join('penampungs','pembelians.id_penampungs','=','penampungs.id')
      ->join('users','cancel_bayar_hutangs.id_users','=','users.id')
      ->select('cancel_bayar_hutangs.*','pembelians.kode as kodepembelian','penampungs.nama as namapenampung','users.name as namauser')
      ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
      {
        if($request->akun != "All"){
          $query->where('cancel_bayar_hutangs.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('cancel_bayar_hutangs.created_at', [$createdatmulai, $createdatselesai]);
        $query->where('cancel_bayar_hutangs.id','!=','0');
      })
      ->orderBy('cancel_bayar_hutangs.id', 'asc')
      ->get();

    $cancel_bayar_piutangs = DB::table('cancel_bayar_piutangs')
      ->join('penjualans','cancel_bayar_piutangs.id_penjualans','=','penjualans.id')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->join('users','cancel_bayar_piutangs.id_users','=','users.id')
      ->select('cancel_bayar_piutangs.*','penjualans.kode as kodepenjualan','konsumens.nama as namakonsumen','users.name as namauser')
      ->where(function($query) use ($request,$createdatmulai,$createdatselesai)
      {
        if($request->akun != "All"){
          $query->where('cancel_bayar_piutangs.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('cancel_bayar_piutangs.created_at', [$createdatmulai, $createdatselesai]);
        $query->where('cancel_bayar_piutangs.id','!=','0');
      })
      ->orderBy('cancel_bayar_piutangs.id', 'asc')
      ->get();

    $perolehanassets = DB::table('assets')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('akun_kas', '=' , $request->akun);
        }

        $query->whereBetween('tanggal_jurnal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('id','!=','0');
      })
      ->orderBy('tanggal_jurnal', 'asc')
      ->get();

    $pengeluaranassets = DB::table('pengeluaran_assets')
      ->join('assets','pengeluaran_assets.id_assets','assets.id')
      ->join('kategori_pengeluaran_assets','pengeluaran_assets.id_kategori_pengeluarans','kategori_pengeluaran_assets.id')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('pengeluaran_assets.akun_kas', '=' , $request->akun);
        }

        $query->whereBetween('pengeluaran_assets.tanggal', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('pengeluaran_assets.id','!=','0');
      })
      ->select('pengeluaran_assets.*','assets.nama as namaasset','kategori_pengeluaran_assets.nama as namakategori')
      ->orderBy('pengeluaran_assets.tanggal', 'asc')
      ->get();

    $payrolls = DB::table('payroll_details')
      ->join('payrolls','payroll_details.id_payrolls','payrolls.id')
      ->join('karyawans','payroll_details.id_karyawans','karyawans.id')
      ->where(function($query) use ($request)
      {
        if($request->akun != "All"){
          $query->where('payroll_details.kode_akun', '=' , $request->akun);
        }

        $query->whereBetween('payrolls.tanggal_gaji', [$request->tanggalmulai, $request->tanggalselesai]);
        $query->where('payroll_details.id','!=','0');
      })
      ->select('payroll_details.*','payrolls.kode as kodepayroll','karyawans.nama as namakaryawan','karyawans.kode as kodekaryawan','payrolls.tanggal_gaji as tanggalgajian')
      ->orderBy('payroll_details.id', 'asc')
      ->get();

    // untuk pendapatan dan pembayaran pembelian dropshipper perlu tambah tabel untuk history, baru bisa ditambahin ke laporan1

    return view('apps.report.laporan-kantor-detil',[ 'pembelians' => $pembelians, 'penjualans' => $penjualans, 'pendapatans' => $pemasukans, 'pengeluarans' => $pengeluarans, 'akuns' => $akuns, 'request' => $request, 'bayarpiutangs' => $bayar_piutangs, 'bayarpiutangjasas' => $bayar_piutang_jasas, 'jasatimbangs' => $jasa_timbangs, 'biayadetaildropshippers' => $biaya_detail_dropshippers, 'pinjamanpenampungs' => $pinjaman_penampungs, 'pengembalianpinjamanpenampungs' => $pengembalian_pinjaman_penampungs, 'pinjamankonsumens' => $pinjaman_konsumens, 'pengembalianpinjamankonsumens' => $pengembalian_pinjaman_konsumens, 'pinjamankaryawans' => $pinjaman_karyawans, 'pengembalianpinjamankaryawans' => $pengembalian_pinjaman_karyawans, 'dppenampungs' => $dp_penampungs, 'transferkassmasuks' => $transferkassmasuk, 'transferkasskeluars' => $transferkasskeluar, 'bayarhutangs' => $bayar_hutangs, 'bayarhutangpenampungs' => $bayar_hutang_penampungs, 'dropshipperspenjualans' => $dropshipperspenjualans, 'dropshipperspembelians' => $dropshipperspembelians, 'jurnalmanualmasuks' => $jurnalmanualmasuks, 'jurnalmanualkeluars' => $jurnalmanualkeluars, 'komisidropshippers' => $komisidropshippers, 'dpkonsumens' => $dp_konsumens, 'cancelbayarhutangs' => $cancel_bayar_hutangs, 'cancelbayarpiutangs' => $cancel_bayar_piutangs, 'perolehanassets' => $perolehanassets, 'pengeluaranassets' => $pengeluaranassets, 'payrolls' => $payrolls
    ]);
  }
}
