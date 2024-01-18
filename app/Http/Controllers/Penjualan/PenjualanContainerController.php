<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class PenjualanContainerController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index(){
    $konsumens = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->where('aktif','=','Active')
      ->get();

    $suratjalans = DB::table('surat_jalan_kontainers')
      ->orderBy('kode', 'asc')
      ->where('status_pembayaran','!=','Selesai')
      ->orWhere('status_pengiriman','!=','Selesai')
      ->get();

    $hargajuals = DB::table('harga_juals')
      ->orderBy('kode', 'asc')
      ->where('aktif','=','Active')
      ->get();

    return view('apps.penjualan.penjualan-kontainer.index',[ 'konsumens' => $konsumens, 'hargajuals' => $hargajuals, 'suratjalans' => $suratjalans ]);
  }

  public function store(Request $request){

    parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

    DB::beginTransaction();

    try{
      $month = \Carbon\Carbon::now()->format('m');
      $year = \Carbon\Carbon::now()->format('Y');
      $invoices = DB::table('penjualans')->select(DB::raw('max(substr(kode,-4)) as nomor_max'))->where(DB::raw('MONTH(tanggal)'), $month)->where(DB::raw('YEAR(tanggal)'), $year)->where('kode','like','JKSNI%')->get();

      $kodetransaksi = "JKSNI".substr($year,-2).$month."-".Auth::id()."-".str_pad((int)$invoices[0]->nomor_max + 1,4,"0",STR_PAD_LEFT);


      DB::table('penjualans')->insert([
        'kode_harga_juals' => $data['kodeharga'],
        'kode' => $kodetransaksi,
        'tipe_penjualan' => 'Kontainer',
        'kategori' => $data['divisi'],
        'id_konsumens' => $data['konsumen'],
        'no_plat' => $data['noplat'],
        'sopir' => $data['sopir'],
        'keterangan' => $data['keterangan'],
        'biaya_tambahan' => $data['biayatambahan'],
        'biaya_bongkar' => $data['biayabongkar'],
        'biaya_lainnya' => $data['biayalainnya'],
        'pembayaran' => $data['pembayaran'],
        'status' => 'Belum Selesai',
        "tanggal" =>  \Carbon\Carbon::now(),
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

  public function requestdatapenjualan(Request $request){
    $penjualans = DB::table('penjualans')->where('status','Belum Selesai')->where('tipe_penjualan','Kontainer')->orderBy('created_at','desc')->get();

    if ($penjualans->count()){
      $data = "";

      foreach($penjualans as $penjualan){
        $encrypt = Crypt::encrypt($penjualan->id);

        $konsumen = DB::table('konsumens')->where('id',$penjualan->id_konsumens)->first();

        $data .= '<div class="col-md-6 col-12" onclick="window.open(\'/penjualan/penjualan-kontainer/detil/' . $encrypt . '\',\'_self\')">'.
          '<div class="card-detail">'.
          '<div class="card-header">'.
          '<h2 class="card-title col-md-12 text-center">'.$konsumen->nama.' - '.$penjualan->kategori.'</h2>'.
          '</div>'.
          '<div class="card-content">'.
          '<div class="card-body">'.
          '<div class="row">'.
          '<div class="col-md-4 pb-2">'.
          '<img src="'.$request->linkgambar.'" width="100%" />'.
          '</div>'.
          '<div class="col-md-8">'.
          '<div class="browser-info">'.
          '<b>No.</b> '.$penjualan->kode.' <br />'.
          '<b>Tgl.</b> '.\Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $penjualan->created_at)->isoFormat('D-M-Y H:mm:ss').' <br />'.
          '<b>Kontainer.</b> '.$penjualan->no_plat.' ('.$penjualan->sopir.') <br />'.
          '</div>'.
          '</div>'.
          '<div class="col-md-12">'.
          '<textarea class="form-control mb-2" rows="2" placeholder="Keterangan" disabled>'.$penjualan->keterangan.'</textarea>'.
          '<table class="table-detil">'.
          '<thead>'.
          '<tr>'.
          '<th>Kode</th>'.
          '<th>Barang</th>'.
          '<th>Jumlah</th>'.
          '<th>Harga</th>'.
          '<th>Subtotal</th>'.
          '</tr>'.
          '</thead>'.
          '<tbody>';

        $penjualan_details = DB::table('penjualan_details')
          ->join('barang_juals','penjualan_details.id_barang_juals','=','barang_juals.id')
          ->select('penjualan_details.*','barang_juals.nama as namabarang','barang_juals.kode as kodebarang')
          ->where('penjualan_details.id_penjualans',$penjualan->id)
          ->orderBy('penjualan_details.created_at','asc')->get();

        foreach($penjualan_details as $penjualandetail){
          $data .= '<tr>' .
            '<td> '.$penjualandetail->kodebarang.' </td>' .
            '<td> '.$penjualandetail->namabarang.' </td>' .
            '<td> '.number_format($penjualandetail->total_jual,0,',','.').' </td>' .
            '<td> '.number_format($penjualandetail->harga,0,',','.').' </td>' .
            '<td> '.number_format($penjualandetail->subtotal,0,',','.').' </td>' .
            '</tr>';
        }

        $data .= '</tbody>'.
          '</table>'.
          '</div>'.
          '</div>'.
          '</div>'.
          '</div>'.
          '</div>'.
          '</div>';
      }

      return $data;
    }else{
      return 'gak ada';
    }
  }

  public function index_detil($param){
    $id = Crypt::decrypt($param);

    $penjualan = DB::table('penjualans')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->select('penjualans.*','konsumens.nama as namakonsumen')
      ->where('penjualans.id','=',$id)
      ->orderBy('created_at','desc')
      ->first();

    if($penjualan->kategori == "Logam"){
      $produks = DB::table('barang_juals')
        ->join('harga_jual_details','harga_jual_details.id_barang_juals','=','barang_juals.id')
        ->join('harga_juals','harga_jual_details.id_harga_juals','=','harga_juals.id')
        ->select('barang_juals.*','harga_jual_details.harga as hargafilter')
        ->where('barang_juals.aktif','Active')
        ->where('barang_juals.id_kategori','=','5')
        ->where('harga_juals.kode',$penjualan->kode_harga_juals)
        ->orderBy('kode', 'asc')->get();
    }else{
      $produks = DB::table('barang_juals')
        ->join('harga_jual_details','harga_jual_details.id_barang_juals','=','barang_juals.id')
        ->join('harga_juals','harga_jual_details.id_harga_juals','=','harga_juals.id')
        ->select('barang_juals.*','harga_jual_details.harga as hargafilter')
        ->where('barang_juals.aktif','Active')
        ->where('barang_juals.id_kategori','!=','5')
        ->where('harga_juals.kode',$penjualan->kode_harga_juals)
        ->orderBy('kode', 'asc')->get();
    }

    if($penjualan->pembayaran == "Cash"){
      $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();
    }else{
      $akuns = DB::table('akuns')->where('kategori','Piutang Usaha')->get();
    }

    // update harga table details
    $penjualandetails = DB::table('penjualan_details')->where('id_penjualans',$id)->get();

    $kodehargadetil = DB::table('harga_juals')->where('kode',$penjualan->kode_harga_juals)->first();

    foreach($penjualandetails as $penjualandetail){
      $hargaproduk = DB::table('harga_jual_details')->where('id_harga_juals',$kodehargadetil->id)->where('id_barang_juals',$penjualandetail->id_barang_juals)->first();

      $harga = $hargaproduk->harga;
      $qty = $penjualandetail->total_jual;
      $subtotal = $harga * $qty;

      DB::table('penjualan_details')->where('id',$penjualandetail->id)->update([
        'harga' => $harga,
        'subtotal' => $subtotal
      ]);

    }

    return view('apps.penjualan.penjualan-kontainer.detil',[ 'penjualan' => $penjualan, 'produks' => $produks, 'akuns' => $akuns ]);
  }

  public function listdetil(Request $request){
    $penjualans = DB::table('penjualan_details')
      ->join('barang_juals','penjualan_details.id_barang_juals','=','barang_juals.id')
      ->select('penjualan_details.*','barang_juals.nama as namabarang','barang_juals.kode as kodebarang')
      ->where('penjualan_details.id_penjualans',$request->id)
      ->orderBy('penjualan_details.created_at','asc')
      ->get();
    return datatables()::of($penjualans)
      ->addColumn('action', function ($penjualans) {
        $class = "";
        $class2 = "hidden";

        if($penjualans->netto > 0){
          $class = "hidden";
          $class2 = "";
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap '.$class2.'" onclick="f_edittemp('.$penjualans->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Timbangan"></i></span>
            <span class="fonticon-wrap '.$class.'" onclick="f_inputtara('.$penjualans->id.')"><i class="feather icon-truck" data-toggle="tooltip" title="Input Tara"></i></span>
            <span class="fonticon-wrap" onclick="f_deletetemp('.$penjualans->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function store_detil(Request $request){

    DB::beginTransaction();

    try{
      $idtabel = DB::table('penjualan_details')->insertGetId([
        'id_penjualans' => $request->idpenjualan,
        'id_barang_juals' => $request->produk,
        'bruto' => $request->bruto,
        'waktu_timbang_bruto' => \Carbon\Carbon::now(),
        'catatan' => $request->catatan,
        'harga' => $request->harga,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return $idtabel;
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

  public function input_tara(Request $request){

    DB::beginTransaction();
    try{

      $penjualan = DB::table('penjualan_details')->where('id',$request->id)->first();

      $netto = $penjualan->bruto - $request->tara;
      $totaljual = $netto - $request->potongan;
      $subtotal = $penjualan->harga * $totaljual;

      DB::table('penjualan_details')->where('id',$request->id)->update([
        'tara' => $request->tara,
        'waktu_timbang_tara' => \Carbon\Carbon::now(),
        'netto' => $netto,
        'potongan' => $request->potongan,
        'total_jual' => $totaljual,
        'subtotal' => $subtotal,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      // update stok barang
      $barangdetils = DB::table('barang_jual_details')->where('id_barang_juals',$penjualan->id_barang_juals)->get();

      // delete table pemotongan
      DB::table('pemotongan_penjualans')->where('id_penjualan_details',$request->id)->delete();

      foreach($barangdetils as $barangdetil){
        $persentasepenggunaan = $barangdetil->persentase / 100;

        $barang = DB::table('barang_belis')->where('id',$barangdetil->id_barang_belis)->first();

        $stoklama = $barang->stok;

        $stokbaru = $stoklama - ($netto * $persentasepenggunaan); //ambil netto dengan logic penyusutan barang, sudah diproduksi tapi gak diakui, kalau case itu gak ada ambil total_jual

        DB::table('barang_belis')->where('id',$barangdetil->id_barang_belis)->update([
          'stok' => $stokbaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $totalpenggunaan = $netto * $persentasepenggunaan;

        // insert table pemotongan
        DB::table('pemotongan_penjualans')->insert([
          'id_penjualan_details' => $request->id,
          'id_barang_belis' => $barangdetil->id_barang_belis,
          'total' => $totalpenggunaan,
          "created_at" => \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

  public function update_detil(Request $request){

    DB::beginTransaction();
    try{

      $netto = $request->bruto - $request->tara;
      $totaljual = $netto - $request->potongan;
      $subtotal = $request->harga * $totaljual;

      // baca data penjualan sebelumnya
      $penjualan = DB::table('penjualan_details')->where('id',$request->id_temp)->first();

      $totaljuallama = $penjualan->total_jual;
      $nettolama = $penjualan->netto;

      $penambahanstok = $netto - $nettolama;

      DB::table('penjualan_details')->where('id',$request->id_temp)->update([
        'bruto' => $request->bruto,
        'tara' => $request->tara,
        'netto' => $netto,
        'potongan' => $request->potongan,
        'catatan' => $request->catatan,
        'harga' => $request->harga,
        'total_jual' => $totaljual,
        'subtotal' => $subtotal,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      // update stok barang
      $barangdetils = DB::table('barang_jual_details')->where('id_barang_juals',$penjualan->id_barang_juals)->get();

      // delete table pemotongan
      DB::table('pemotongan_penjualans')->where('id_penjualan_details',$request->id_temp)->delete();

      foreach($barangdetils as $barangdetil){
        $persentasepenggunaan = $barangdetil->persentase / 100;

        $barang = DB::table('barang_belis')->where('id',$barangdetil->id_barang_belis)->first();

        $stoklama = $barang->stok;

        $stokbaru = $stoklama - ($penambahanstok * $persentasepenggunaan); //ambil netto dengan logic penyusutan barang, sudah diproduksi tapi gak diakui, kalau case itu gak ada ambil total_jual

//        $stokbaru = $stoklama - ($penambahanstok * $persentasepenggunaan);

        DB::table('barang_belis')->where('id',$barangdetil->id_barang_belis)->update([
          'stok' => $stokbaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $totalpenggunaan = $netto * $persentasepenggunaan;

        // insert table pemotongan
        DB::table('pemotongan_penjualans')->insert([
          'id_penjualan_details' => $request->id_temp,
          'id_barang_belis' => $barangdetil->id_barang_belis,
          'total' => $totalpenggunaan,
          "created_at" => \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

  public function requestdata_detil(Request $request){
    $temp = DB::table('penjualan_details')->where('id',$request->id_temp)->get();

    if ($temp->count()){
      $barang = DB::table('barang_juals')->where('id',$temp[0]->id_barang_juals)->first();

      return 'ada|'. $barang->kode . "|" .$barang->nama . "|" . $temp[0]->bruto . "|" . $temp[0]->tara . "|" . $temp[0]->potongan . "|" . $temp[0]->harga . "|" . $temp[0]->catatan;
    }else{
      return 'gak ada|';
    }
  }

  public function requesttotal_detil(Request $request){
    $temp = DB::table('penjualan_details')->select(DB::raw('sum(subtotal) as nominal_total'))->where('id_penjualans',$request->idpenjualan)->get();

    if ($temp->count()){
      return 'ada|'. $temp[0]->nominal_total;
    }else{
      return 'gak ada|';
    }
  }

  public function drop_detil(Request $request){
    DB::beginTransaction();

    try{

      $penjualan = DB::table('penjualan_details')->where('id',$request->id)->first();

      $totaljual = $penjualan->total_jual;

      if($totaljual > 0){
        // update stok barang
        $barangdetils = DB::table('barang_jual_details')->where('id_barang_juals',$penjualan->id_barang_juals)->get();

        foreach($barangdetils as $barangdetil){
          $persentasepenggunaan = $barangdetil->persentase / 100;

          $barang = DB::table('barang_belis')->where('id',$barangdetil->id_barang_belis)->first();

          $stoklama = $barang->stok;

          $stokbaru = $stoklama + ($totaljual * $persentasepenggunaan);


          DB::table('barang_belis')->where('id',$barangdetil->id_barang_belis)->update([
            'stok' => $stokbaru,
            "updated_at" => \Carbon\Carbon::now()
          ]);
        }
      }

      // delete table pemotongan
      DB::table('pemotongan_penjualans')->where('id_penjualan_details',$request->id)->delete();

      DB::table('penjualan_details')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

  public function proses_detil(Request $request){
    DB::beginTransaction();

    try{

      $detils = DB::table('penjualan_details')->where('id_penjualans',$request->idpenjualan)->get();

      $bruto = 0;
      $tara = 0;
      $netto = 0;

      $i = 0;

      foreach($detils as $detil){
        if($i == 0){
          $tara = $detil->tara;
        }

        if($bruto < $detil->bruto){
          $bruto = $detil->bruto;
        }

        if($tara > $detil->tara){
          $tara = $detil->tara;
        }

        $netto += $detil->netto;

        $i++;
      }

      $sisa = 0;

      if($request->pembayaran == "Credit") {
        $sisa = $request->totalakhir;
      }

      DB::table('penjualans')->where('id',$request->idpenjualan)->update([
        'biaya_tambahan' => $request->biayatambahan,
        'biaya_bongkar' => $request->biayabongkar,
        'biaya_lainnya' => $request->biayalainnya,
        'subtotal' => $request->subtotal,
        'diskon' => $request->diskon,
        'pajak' => $request->pajak,
        'grandtotal' => $request->totalakhir,
        'kode_akun' => $request->akunpembayaran,
        'sisa' => $sisa,
        'bruto' => $bruto,
        'tara' => $tara,
        'netto' => $netto,
        'status' => $request->action,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

  public function index_list(){
    $konsumens = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->where('aktif','=','Active')
      ->get();

    return view('apps.penjualan.penjualan-kontainer.list-penjualan',[ 'konsumens' => $konsumens ]);
  }

  public function list_datapenjualan(Request $request){
    $penjualans = DB::table('penjualans')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->select('penjualans.*','konsumens.nama as namakonsumen')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('penjualans.id_konsumens','=',$request->client);
        }

        $query->where('penjualans.tipe_penjualan','=','Kontainer');
        $query->where('penjualans.status','!=','Belum Selesai');

      })
      ->orderBy('updated_at','desc')
      ->get();
    return datatables()::of($penjualans)
      ->addColumn('action', function ($penjualans) {
        $encrypt = Crypt::encrypt($penjualans->id);

        $count = DB::table('bayar_piutangs')
          ->where('id_penjualans',$penjualans->id)
          ->where('status','=','Paid')
          ->count();

        $class = "";
        $class2 = "hidden";
        $class3 = "";
        $class4 = "";
        $class5 = "";
        $class6 = "hidden";

        if($count > 0){
          $class = "hidden";
        }

        if(Auth::user()->status == "Staff" || Auth::user()->status == "Kasir"){
          $class = "hidden";
          $class5 = "hidden";
        }

        if(Auth::user()->status != "Staff" && Auth::user()->status != "Kasir"  && $penjualans->status == "Selesai"){
          $class6 = "";
        }

        if($penjualans->status == "Menunggu Persetujuan"){
          $class2 = "";
          $class3 = "hidden";
        }

        if(Auth::user()->status == "Staff" || Auth::user()->status == "Kasir"){
          if($penjualans->akses_edit == "Y"){
            $class4 = "";
          }else if($penjualans->akses_edit == "N"){
            $class4 = "hidden";
          }
        }

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_datadetil(' . $penjualans->id . ')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Detil Penjualan"></i></span>
            <span class="fonticon-wrap" onclick="window.open(\'/penjualan/print-data/' . $encrypt . '\',\'_blank\')"><i class="feather icon-printer" data-toggle="tooltip" title="Cetak Penjualan"></i></span>
            <span class="fonticon-wrap" onclick="window.open(\'/penjualan/print-surat-jalan/' . $encrypt . '\',\'_blank\')"><i class="feather icon-file-text" data-toggle="tooltip" title="Cetak Surat Jalan"></i></span> <br />
            <span class="fonticon-wrap '.$class6.'" onclick="window.open(\'/penjualan/penjualan-kontainer/edit-detil/' . $encrypt . '?text=Edit Data Penjualan\',\'_blank\')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data Penjualan"></i></span>
            <span class="fonticon-wrap '.$class2.'" onclick="window.open(\'/penjualan/penjualan-kontainer/edit-detil/' . $encrypt . '?text=Review Data Penjualan\',\'_blank\')"><i class="feather icon-check" data-toggle="tooltip" title="Review Data Penjualan"></i></span>
            <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$penjualans->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function index_suratjalan(){
    $konsumens = DB::table('konsumens')
      ->orderBy('nama', 'asc')
      ->where('aktif','=','Active')
      ->get();

    return view('apps.penjualan.penjualan-kontainer.surat-jalan',[ 'konsumens' => $konsumens ]);
  }

  public function list_suratjalan(Request $request){
    $penjualans = DB::table('penjualans')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->select('penjualans.*','konsumens.nama as namakonsumen')
      ->where(function($query) use ($request)
      {

        if($request->client != "All"){
          $query->where('penjualans.id_konsumens','=',$request->client);
        }

        $query->where('penjualans.tipe_penjualan','=','Kontainer');

      })
      ->orderBy('updated_at','desc')
      ->get();
    return datatables()::of($penjualans)
      ->addColumn('action', function ($penjualans) {
        $encrypt = Crypt::encrypt($penjualans->id);

        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_datadetil(' . $penjualans->id . ')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Detil Penjualan"></i></span>
            <span class="fonticon-wrap" onclick="window.open(\'/penjualan/print-surat-jalan/' . $encrypt . '\',\'_blank\')"><i class="feather icon-file-text" data-toggle="tooltip" title="Cetak Surat Jalan"></i></span> <br />
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function drop_penjualan(Request $request){
    DB::beginTransaction();

    try{
      $penjualanlama = DB::table('penjualans')->where('id',$request->id)->first();

      // insert trash penjualan
      $idtrash = DB::table('trash_penjualans')->insertGetId([
        'id_users' => Auth::User()->id,
        'id_konsumens' => $penjualanlama->id_konsumens,
        'tipe_penjualan' => $penjualanlama->tipe_penjualan,
        'kode_harga_juals' => $penjualanlama->kode_harga_juals,
        'kode_akun' => $penjualanlama->kode_akun,
        'kode' => $penjualanlama->kode,
        'no_plat' => $penjualanlama->no_plat,
        'sopir' => $penjualanlama->sopir,
        'kategori' => $penjualanlama->kategori,
        'tanggal' => $penjualanlama->tanggal,
        'pembayaran' => $penjualanlama->pembayaran,
        'jatuh_tempo' => $penjualanlama->jatuh_tempo,
        'keterangan' => $penjualanlama->keterangan,
        'catatan_nama' => $penjualanlama->catatan_nama,
        'biaya_tambahan' => $penjualanlama->biaya_tambahan,
        'subtotal' => $penjualanlama->subtotal,
        'diskon' => $penjualanlama->diskon,
        'pajak' => $penjualanlama->pajak,
        'grandtotal' => $penjualanlama->grandtotal,
        'bruto' => $penjualanlama->bruto,
        'tara' => $penjualanlama->tara,
        'netto' => $penjualanlama->netto,
        'status' => $penjualanlama->status,
        'sisa' => $penjualanlama->sisa,
        'waktu_timbang_bruto' => $penjualanlama->waktu_timbang_bruto,
        'waktu_timbang_tara' => $penjualanlama->waktu_timbang_tara,
        'akses_edit' => $penjualanlama->akses_edit,
        'biaya_bongkar' => $penjualanlama->biaya_bongkar,
        'biaya_lainnya' => $penjualanlama->biaya_lainnya,
        "created_at" => \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      // update stok barang
      $penjualandetils = DB::table('penjualan_details')->where('id_penjualans',$request->id)->get();
      foreach($penjualandetils as $penjualandetil){

        $totaljual = $penjualandetil->total_jual;

        if($totaljual > 0){
          // update stok barang
          $barangdetils = DB::table('barang_jual_details')->where('id_barang_juals',$penjualandetil->id_barang_juals)->get();

          // delete table pemotongan
          DB::table('pemotongan_penjualans')->where('id_penjualan_details',$penjualandetil->id)->delete();

          foreach($barangdetils as $barangdetil){
            $persentasepenggunaan = $barangdetil->persentase / 100;

            $barang = DB::table('barang_belis')->where('id',$barangdetil->id_barang_belis)->first();

            $stoklama = $barang->stok;

            $stokbaru = $stoklama + ($totaljual * $persentasepenggunaan);

            DB::table('barang_belis')->where('id',$barangdetil->id_barang_belis)->update([
              'stok' => $stokbaru,
              "updated_at" => \Carbon\Carbon::now()
            ]);
          }

          // insert trash detil penjualan

          DB::table('trash_penjualan_details')->insert([
            "id_penjualans" => $idtrash,
            'id_barang_juals' => $penjualandetil->id_barang_juals,
            'bruto' => $penjualandetil->bruto,
            'waktu_timbang_bruto' => $penjualandetil->waktu_timbang_bruto,
            'tara' => $penjualandetil->tara,
            'waktu_timbang_tara' => $penjualandetil->waktu_timbang_tara,
            'netto' => $penjualandetil->netto,
            'potongan' => $penjualandetil->potongan,
            'total_jual' => $penjualandetil->total_jual,
            'harga' => $penjualandetil->harga,
            'subtotal' => $penjualandetil->subtotal,
            'catatan' => $penjualandetil->catatan,
            'capture1' => $penjualandetil->capture1,
            'capture2' => $penjualandetil->capture2,
            'aktif' => $penjualandetil->aktif,
            "created_at" => \Carbon\Carbon::now(),
            "updated_at" => \Carbon\Carbon::now()
          ]);
        }

      }

      $countjurnallama = DB::table('jurnals')->where('kode','JO-'.$penjualanlama->kode)->count();

      if($countjurnallama > 0) {

        // hapus jurnal penjualan
        $jurnallama = DB::table('jurnals')->where('kode', 'JO-' . $penjualanlama->kode)->first();

        $detils = DB::table('jurnal_detils')->where('id_jurnals', $jurnallama->id)->get();

        foreach ($detils as $detil) {
          $akun = DB::table('akuns')->where('kode_akun', $detil->kode_akun)->first();

          $balancelama = $akun->saldo;
          $balancebaru = 0;

          if ($akun->saldo_normal == "D") {
            if ($detil->tipe == "D") {
              $balancebaru = $balancelama - $detil->nominal;
            } else if ($detil->tipe == "K") {
              $balancebaru = $balancelama + $detil->nominal;
            }
          } else if ($akun->saldo_normal == "K") {
            if ($detil->tipe == "K") {
              $balancebaru = $balancelama - $detil->nominal;
            } else if ($detil->tipe == "D") {
              $balancebaru = $balancelama + $detil->nominal;
            }
          }

          DB::table('akuns')->where('kode_akun', $detil->kode_akun)->update([
            'saldo' => $balancebaru,
            "updated_at" => \Carbon\Carbon::now()
          ]);
        }

        // hapus data jurnal
        DB::table('jurnals')->where('id', $jurnallama->id)->delete();
        DB::table('jurnal_detils')->where('id_jurnals', $jurnallama->id)->delete();
      }

      // hapus data penjualan
      DB::table('penjualan_details')->where('id_penjualans',$request->id)->delete();
      DB::table('penjualans')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

  public function index_edit_detil($param, Request $request){
    $id = Crypt::decrypt($param);

    $penjualan = DB::table('penjualans')
      ->join('konsumens','penjualans.id_konsumens','=','konsumens.id')
      ->select('penjualans.*','konsumens.nama as namakonsumen')
      ->where('penjualans.id','=',$id)
      ->orderBy('created_at','desc')
      ->first();

    if($penjualan->kategori == "Logam"){
      $produks = DB::table('barang_juals')
        ->join('harga_jual_details','harga_jual_details.id_barang_juals','=','barang_juals.id')
        ->join('harga_juals','harga_jual_details.id_harga_juals','=','harga_juals.id')
        ->select('barang_juals.*','harga_jual_details.harga as hargafilter')
        ->where('barang_juals.aktif','Active')
        ->where('barang_juals.id_kategori','=','5')
        ->where('harga_juals.kode',$penjualan->kode_harga_juals)
        ->orderBy('kode', 'asc')->get();
    }else{
      $produks = DB::table('barang_juals')
        ->join('harga_jual_details','harga_jual_details.id_barang_juals','=','barang_juals.id')
        ->join('harga_juals','harga_jual_details.id_harga_juals','=','harga_juals.id')
        ->select('barang_juals.*','harga_jual_details.harga as hargafilter')
        ->where('barang_juals.aktif','Active')
        ->where('barang_juals.id_kategori','!=','5')
        ->where('harga_juals.kode',$penjualan->kode_harga_juals)
        ->orderBy('kode', 'asc')->get();
    }

    if($penjualan->pembayaran == "Cash"){
      $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();
    }else{
      $akuns = DB::table('akuns')->where('kategori','Piutang Usaha')->get();
    }

    return view('apps.penjualan.penjualan-kontainer.edit-detil',[ 'penjualan' => $penjualan, 'produks' => $produks, 'akuns' => $akuns, 'request' => $request ]);
  }

  public function proses_edit_detil(Request $request){
    DB::beginTransaction();

    try{

      $detils = DB::table('penjualan_details')->where('id_penjualans',$request->idpenjualan)->get();

      $bruto = 0;
      $tara = 0;
      $netto = 0;

      $i = 0;

      foreach($detils as $detil){
        if($i == 0){
          $tara = $detil->tara;
        }

        if($bruto < $detil->bruto){
          $bruto = $detil->bruto;
        }

        if($tara > $detil->tara){
          $tara = $detil->tara;
        }

        $netto += $detil->netto;

        $i++;
      }

      $sisa = 0;

      if($request->pembayaran == "Credit"){
        $getpenjualan = DB::table('penjualans')->where('id',$request->idpenjualan)->first();

        $sisalama = $getpenjualan->sisa;
        $grandtotallama = $getpenjualan->grandtotal;

        $terbayarlama = $grandtotallama - $sisalama;

        $sisa = $request->totalakhir - $terbayarlama;

      }

      DB::table('penjualans')->where('id',$request->idpenjualan)->update([
        'biaya_tambahan' => $request->biayatambahan,
        'biaya_bongkar' => $request->biayabongkar,
        'biaya_lainnya' => $request->biayalainnya,
        'subtotal' => $request->subtotal,
        'diskon' => $request->diskon,
        'pajak' => $request->pajak,
        'grandtotal' => $request->totalakhir,
        'sisa' => $sisa,
        'kode_akun' => $request->akunpembayaran,
        'bruto' => $bruto,
        'tara' => $tara,
        'netto' => $netto,
        'status' => $request->action,
        "updated_at" => \Carbon\Carbon::now()
      ]);

      // update status surat jalan kontainer
      $getpenjualan = DB::table('penjualans')->where('id',$request->idpenjualan)->first();

      $nokontainer = $getpenjualan->no_plat;

      DB::table('surat_jalan_kontainers')->where('no_kontainer',$nokontainer)->update([
        'status_pengiriman' => 'Selesai',
        "updated_at" => \Carbon\Carbon::now()
      ]);



      $jurnallama = DB::table('jurnals')->where('kode','JO-'.$request->kodepenjualan)->first();


      $countjurnallama = DB::table('jurnals')->where('kode','JO-'.$request->kodepenjualan)->count();

      if($countjurnallama > 0) {
        $detils = DB::table('jurnal_detils')->where('id_jurnals',$jurnallama->id)->get();

        foreach($detils as $detil){
          $akun = DB::table('akuns')->where('kode_akun',$detil->kode_akun)->first();

          $balancelama = $akun->saldo;
          $balancebaru = 0;

          if($akun->saldo_normal == "D"){
            if($detil->tipe == "D"){
              $balancebaru = $balancelama - $detil->nominal;
            }else if($detil->tipe == "K"){
              $balancebaru = $balancelama + $detil->nominal;
            }
          }else if($akun->saldo_normal == "K"){
            if($detil->tipe == "K"){
              $balancebaru = $balancelama - $detil->nominal;
            }else if($detil->tipe == "D"){
              $balancebaru = $balancelama + $detil->nominal;
            }
          }

          DB::table('akuns')->where('kode_akun',$detil->kode_akun)->update([
            'saldo' => $balancebaru,
            "updated_at" => \Carbon\Carbon::now()
          ]);
        }

        DB::table('jurnals')->where('id',$jurnallama->id)->delete();
        DB::table('jurnal_detils')->where('id_jurnals',$jurnallama->id)->delete();
      }

      $akunpenjualan = "4101";
      $akunpembayaran = $request->akunpembayaran;
      $akunbiayatambahan = "4104";
      $akunbiayabongkar = "4105";
      $akunbiayalainnya = "4105";
      $akunpotongan = "4103";
      $akunpajak = "2501";

      $penjualan = DB::table('penjualans')->where('id',$request->idpenjualan)->first();

      $konsumen = DB::table('konsumens')->where('id',$penjualan->id_konsumens)->first();

      // create head jurnal
      $idjurnal = DB::table('jurnals')->insertGetId([
        'kode' => 'JO-'.$request->kodepenjualan,
        'keterangan' => 'Jurnal penjualan dengan Kode Transaksi '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
        'tanggal' => \Carbon\Carbon::now(),
        'tipe' => "Otomatis",
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);


      // input jurnal penjualan
      DB::table('jurnal_detils')->insert([
        'id_jurnals' => $idjurnal,
        'kode_akun' => $akunpenjualan,
        'tipe' => 'K',
        'keterangan' => 'Transaksi Penjualan '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
        'nominal' => $request->subtotal,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $akun = DB::table('akuns')->where('kode_akun',$akunpenjualan)->first();
      $balancelama = $akun->saldo;
      $balancebaru = $balancelama + $request->subtotal;

      DB::table('akuns')->where('kode_akun',$akunpenjualan)->update([
        'saldo' => $balancebaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);


      // input jurnal biaya tambahan
      if($request->biayatambahan != "0"){
        DB::table('jurnal_detils')->insert([
          'id_jurnals' => $idjurnal,
          'kode_akun' => $akunbiayatambahan,
          'tipe' => 'K',
          'keterangan' => 'Transaksi Penjualan '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
          'nominal' => $request->biayatambahan,
          "created_at" =>  \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $akun = DB::table('akuns')->where('kode_akun',$akunbiayatambahan)->first();
        $balancelama = $akun->saldo;
        $balancebaru = $balancelama + $request->biayatambahan;

        DB::table('akuns')->where('kode_akun',$akunbiayatambahan)->update([
          'saldo' => $balancebaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }


      // input jurnal pajak
      if($request->pajak != "0"){
        DB::table('jurnal_detils')->insert([
          'id_jurnals' => $idjurnal,
          'kode_akun' => $akunpajak,
          'tipe' => 'K',
          'keterangan' => 'Transaksi Penjualan '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
          'nominal' => $request->pajak,
          "created_at" =>  \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $akun = DB::table('akuns')->where('kode_akun',$akunpajak)->first();
        $balancelama = $akun->saldo;
        $balancebaru = $balancelama + $request->pajak;

        DB::table('akuns')->where('kode_akun',$akunpajak)->update([
          'saldo' => $balancebaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }


      // input jurnal kas / utang pembayaran
      DB::table('jurnal_detils')->insert([
        'id_jurnals' => $idjurnal,
        'kode_akun' => $akunpembayaran,
        'tipe' => 'D',
        'keterangan' => 'Transaksi Penjualan '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
        'nominal' => $request->totalakhir,
        "created_at" =>  \Carbon\Carbon::now(),
        "updated_at" => \Carbon\Carbon::now()
      ]);

      $akun = DB::table('akuns')->where('kode_akun',$akunpembayaran)->first();
      $balancelama = $akun->saldo;

      if($request->pembayaran == "Cash"){
        $balancebaru = $balancelama + $request->totalakhir;
      }else{
        $balancebaru = $balancelama + $request->totalakhir;
      }

      DB::table('akuns')->where('kode_akun',$akunpembayaran)->update([
        'saldo' => $balancebaru,
        "updated_at" => \Carbon\Carbon::now()
      ]);


      // input jurnal potongan
      if($request->diskon != "0"){
        DB::table('jurnal_detils')->insert([
          'id_jurnals' => $idjurnal,
          'kode_akun' => $akunpotongan,
          'tipe' => 'D',
          'keterangan' => 'Transaksi Penjualan '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
          'nominal' => $request->diskon,
          "created_at" =>  \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $akun = DB::table('akuns')->where('kode_akun',$akunpotongan)->first();
        $balancelama = $akun->saldo;
        $balancebaru = $balancelama + $request->diskon;

        DB::table('akuns')->where('kode_akun',$akunpotongan)->update([
          'saldo' => $balancebaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      // input jurnal biaya bongkar
      if($request->biayabongkar != "0"){
        DB::table('jurnal_detils')->insert([
          'id_jurnals' => $idjurnal,
          'kode_akun' => $akunbiayabongkar,
          'tipe' => 'D',
          'keterangan' => 'Biaya Bongkar Untuk Transaksi Penjualan '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
          'nominal' => $request->biayabongkar,
          "created_at" =>  \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $akun = DB::table('akuns')->where('kode_akun',$akunbiayabongkar)->first();
        $balancelama = $akun->saldo;
        $balancebaru = $balancelama + $request->biayabongkar;

        DB::table('akuns')->where('kode_akun',$akunbiayabongkar)->update([
          'saldo' => $balancebaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      // input jurnal biaya lainnya
      if($request->biayalainnya != "0"){
        DB::table('jurnal_detils')->insert([
          'id_jurnals' => $idjurnal,
          'kode_akun' => $akunbiayalainnya,
          'tipe' => 'D',
          'keterangan' => 'Biaya Lainnya Untuk Transaksi Penjualan '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
          'nominal' => $request->biayalainnya,
          "created_at" =>  \Carbon\Carbon::now(),
          "updated_at" => \Carbon\Carbon::now()
        ]);

        $akun = DB::table('akuns')->where('kode_akun',$akunbiayalainnya)->first();
        $balancelama = $akun->saldo;
        $balancebaru = $balancelama + $request->biayalainnya;

        DB::table('akuns')->where('kode_akun',$akunbiayalainnya)->update([
          'saldo' => $balancebaru,
          "updated_at" => \Carbon\Carbon::now()
        ]);
      }

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
