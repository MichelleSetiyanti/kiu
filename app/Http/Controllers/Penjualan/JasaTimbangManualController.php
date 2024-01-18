<?php

namespace App\Http\Controllers\Penjualan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use File;
use Matrix\Exception;

class JasaTimbangManualController extends Controller
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

        $hargajuals = DB::table('harga_juals')
            ->orderBy('kode', 'asc')
            ->where('aktif','=','Active')
            ->get();

        return view('apps.penjualan.jasa-timbang-manual.index',[ 'konsumens' => $konsumens, 'hargajuals' => $hargajuals ]);
    }

    public function store(Request $request){

        parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

        DB::beginTransaction();

        try{
            $month = \Carbon\Carbon::now()->format('m');
            $year = \Carbon\Carbon::now()->format('Y');
            $invoices = DB::table('jasa_timbangs')->select(DB::raw('max(substr(kode,-4)) as nomor_max'))->where(DB::raw('MONTH(tanggal)'), $month)->where(DB::raw('YEAR(tanggal)'), $year)->where('kode','like','JTMSNI%')->get();

            $kodetransaksi = "JTMSNI".substr($year,-2).$month."-".Auth::id()."-".str_pad((int)$invoices[0]->nomor_max + 1,4,"0",STR_PAD_LEFT);

            $kode = DB::table('jasa_timbangs')->insertGetId([
                'kode_harga_juals' => $data['kodeharga'],
                'kode' => $kodetransaksi,
                'tipe_penjualan' => 'Manual',
                'kategori' => $data['divisi'],
                'id_konsumens' => $data['konsumen'],
                'no_plat' => $data['noplat'],
                'sopir' => $data['sopir'],
                'keterangan' => $data['keterangan'],
                'biaya_tambahan' => $data['biayatambahan'],
                'pembayaran' => $data['pembayaran'],
                'bruto' => $request->bruto,
                'waktu_timbang_bruto' => $data['waktubruto'],
                'status' => 'Belum Selesai',
                "tanggal" =>  \Carbon\Carbon::now(),
                "created_at" =>  \Carbon\Carbon::now(),
                "updated_at" => \Carbon\Carbon::now()
            ]);

            DB::commit();

            return $kode;
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }

    public function requestdatapenjualan(Request $request){
        $jasa_timbangs = DB::table('jasa_timbangs')->whereBetween('status',['Belum Selesai','Menunggu Pembayaran'])->where('tipe_penjualan','Manual')->orderBy('created_at','desc')->get();

        if ($jasa_timbangs->count()){
            $data = "";

            foreach($jasa_timbangs as $penjualan){
                $encrypt = Crypt::encrypt($penjualan->id);

                $konsumen = DB::table('konsumens')->where('id',$penjualan->id_konsumens)->first();

                $data .= '<div class="col-md-6 col-12" onclick="">'.
                    '<div class="card-detail">'.
                    '<div class="card-header">'.
                    '<h2 class="card-title col-md-12 text-center">'.$konsumen->nama.' - '.$penjualan->kategori.'</h2>'.
                    '</div>'.
                    '<div class="card-content">'.
                    '<div class="card-body">'.
                    '<div class="row">';

                    $data .= '<div class="col-sm-12 col-md-12 mb-2">' .
                      '<button type="button" class="btn bg-gradient-success waves-effect waves-light ml-1" onclick="window.open(\'/penjualan/jasa-timbang-manual/detil/' . $encrypt . '\',\'_self\')"> Input Data Timbangan </button>' .
                      '<button type="button" class="btn bg-primary ml-1" style="color:white;" onclick="f_printchecker('. $penjualan->id .')"> <i class="feather icon-printer" data-toggle="tooltip" title="Print Timbangan"></i> </button>' .
                      '</div>' ;

                    $data .= '<div class="col-md-4 pb-2">'.
                    '<img src="'.$request->linkgambar.'" width="100%" />'.
                    '</div>'.
                    '<div class="col-md-8">'.
                    '<div class="browser-info">'.
                    '<b>No.</b> '.$penjualan->kode.' <br />'.
                    '<b>Tgl.</b> '.\Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $penjualan->created_at)->isoFormat('D-M-Y H:mm:ss').' <br />'.
                    '<b>Mobil.</b> '.$penjualan->no_plat.' ('.$penjualan->sopir.') <br />'.
                    '<b>Bruto.</b> '.number_format($penjualan->bruto,2,',','.').' ('.$penjualan->waktu_timbang_bruto.') <br />'.
                    '</div>'.
                    '</div>'.
                    '<div class="col-md-12">'.
                    '<textarea class="form-control mb-2" rows="2" placeholder="Keterangan" disabled>'.$penjualan->keterangan.'</textarea>'.
                    '<table class="table-detil">'.
                    '<thead>'.
                    '<tr>'.
                    '<th>Nama</th>'.
                    '<th>Jumlah</th>'.
                    '<th>Harga</th>'.
                    '<th>Catatan</th>'.
                    '</tr>'.
                    '</thead>'.
                    '<tbody>';

                $jasa_timbang_details = DB::table('jasa_timbang_details')
                    ->where('id_jasa_timbangs',$penjualan->id)
                    ->orderBy('created_at','asc')->get();

                foreach($jasa_timbang_details as $penjualandetail){
                    $data .= '<tr>' .
                        '<td> '.$penjualandetail->nama.' </td>' .
                        '<td> '.number_format($penjualandetail->qty,0,',','.').' </td>' .
                        '<td> '.number_format($penjualandetail->nominal,0,',','.').' </td>' .
                        '<td> '.$penjualandetail->catatan.' </td>' .
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

        $penjualan = DB::table('jasa_timbangs')
            ->join('konsumens','jasa_timbangs.id_konsumens','=','konsumens.id')
            ->select('jasa_timbangs.*','konsumens.nama as namakonsumen')
            ->where('jasa_timbangs.id','=',$id)
            ->orderBy('created_at','desc')
            ->first();

        $produks = DB::table('item_jasa_timbangs')
            ->where('aktif','Active')
            ->orderBy('nama', 'asc')->get();

        if($penjualan->pembayaran == "Cash"){
            $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();
        }else{
            $akuns = DB::table('akuns')->where('kategori','Piutang Usaha')->get();
        }

        return view('apps.penjualan.jasa-timbang-manual.detil',[ 'penjualan' => $penjualan, 'produks' => $produks, 'akuns' => $akuns ]);
    }

    public function listdetil(Request $request){
        $jasa_timbangs = DB::table('jasa_timbang_details')
            ->where('id_jasa_timbangs',$request->id)
            ->orderBy('created_at','asc')
            ->get();
        return datatables()::of($jasa_timbangs)
            ->addColumn('action', function ($jasa_timbangs) {
                $class = "";

                if(Auth::user()->status == "Staff"){
                  $class = "hidden";
                }

                return '
                  <div class="fonticon-container">
                    <span class="fonticon-wrap '.$class.'" onclick="f_edittemp('.$jasa_timbangs->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
                    <span class="fonticon-wrap '.$class.'" onclick="f_deletetemp('.$jasa_timbangs->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
                  </div>
                ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function store_detil(Request $request){

        DB::beginTransaction();

        try{
            $idtabel = DB::table('jasa_timbang_details')->insertGetId([
                'id_jasa_timbangs' => $request->idpenjualan,
                'nama' => $request->produk,
                'nominal' => $request->harga,
                'qty' => $request->qty,
                'total' => $request->total,
                'catatan' => $request->catatan,
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

    public function update_detil(Request $request){

        DB::beginTransaction();
        try{

            DB::table('jasa_timbang_details')->where('id',$request->id_temp)->update([
                'qty' => $request->qty,
                'total' => $request->total,
                'catatan' => $request->catatan,
                "updated_at" => \Carbon\Carbon::now()
            ]);

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }

    public function requestdata_detil(Request $request){
        $temp = DB::table('jasa_timbang_details')->where('id',$request->id_temp)->get();

        if ($temp->count()){
            return 'ada|'. $temp[0]->nama . "|" . $temp[0]->qty . "|" . $temp[0]->total . "|" . $temp[0]->nominal . "|" . $temp[0]->catatan;
        }else{
            return 'gak ada|';
        }
    }

    public function requesttotal_detil(Request $request){
        $temp = DB::table('jasa_timbang_details')->select(DB::raw('sum(total) as nominal_total'), DB::raw('sum(qty) as total_jual_akhir'))->where('id_jasa_timbangs',$request->idpenjualan)->get();

        if ($temp->count()){
            return 'ada|'. $temp[0]->nominal_total ."|". $temp[0]->total_jual_akhir;
        }else{
            return 'gak ada|';
        }
    }

    public function drop_detil(Request $request){
        DB::beginTransaction();

        try{

            DB::table('jasa_timbang_details')->where('id',$request->id)->delete();

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

            $sisa = 0;

            if($request->pembayaran == "Credit") {
                $sisa = $request->totalakhir;
            }

            DB::table('jasa_timbangs')->where('id',$request->idpenjualan)->update([
                'biaya_tambahan' => $request->biayatambahan,
                'subtotal' => $request->subtotal,
                'diskon' => $request->diskon,
                'pajak' => $request->pajak,
                'grandtotal' => $request->totalakhir,
                'kode_akun' => $request->akunpembayaran,
                'keterangan' => $request->keterangan,
                'bruto' => $request->bruto,
                'tara' => $request->tara,
                'netto' => $request->netto,
                'waktu_timbang_bruto' => $request->waktubruto,
                'waktu_timbang_tara' => $request->waktutara,
                'sisa' => $sisa,
                'status' => $request->action,
                "updated_at" => \Carbon\Carbon::now()
            ]);

            if($request->action == "Selesai"){
                $akunpenjualan = "4101";
                $akunpembayaran = $request->akunpembayaran;
                $akunbiayatambahan = "4104";
                $akunpotongan = "4103";
                $akunpajak = "2501";

                $penjualan = DB::table('jasa_timbangs')->where('id',$request->idpenjualan)->first();

                $konsumen = DB::table('konsumens')->where('id',$penjualan->id_konsumens)->first();

                // create head jurnal
                $idjurnal = DB::table('jurnals')->insertGetId([
                    'kode' => 'JO-'.$request->kodepenjualan,
                    'keterangan' => 'Jurnal Jasa Timbang dengan Kode Transaksi '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                    'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                        'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                        'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                    'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                        'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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

            }

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

        return view('apps.penjualan.jasa-timbang-manual.list-penjualan',[ 'konsumens' => $konsumens ]);
    }

    public function list_datapenjualan(Request $request){
        $jasa_timbangs = DB::table('jasa_timbangs')
            ->join('konsumens','jasa_timbangs.id_konsumens','=','konsumens.id')
            ->select('jasa_timbangs.*','konsumens.nama as namakonsumen')
            ->where(function($query) use ($request)
            {

                if($request->client != "All"){
                    $query->where('jasa_timbangs.id_konsumens','=',$request->client);
                }

                $query->where('jasa_timbangs.tipe_penjualan','=','Manual');
                $query->where('jasa_timbangs.status','=','Selesai');

            })
            ->orderBy('updated_at','desc')
            ->get();
        return datatables()::of($jasa_timbangs)
            ->addColumn('action', function ($jasa_timbangs) {
                $encrypt = Crypt::encrypt($jasa_timbangs->id);

                $count = DB::table('bayar_piutang_jasas')
                    ->where('id_jasa_timbangs',$jasa_timbangs->id)
                    ->count();

                $class = "";
                $class2 = "";
                $class3 = "";

                if($count > 0){
                  $class = "hidden";
                }

                if(Auth::user()->status == "Staff" || Auth::user()->status == "Kasir"){
                  $class = "hidden";
                  $class3 = "hidden";
                }

                if(Auth::user()->status == "Staff" || Auth::user()->status == "Kasir"){
                  if($jasa_timbangs->akses_edit == "Y"){
                    $class2 = "";
                  }else if($jasa_timbangs->akses_edit == "N"){
                    $class2 = "hidden";
                  }
                }

                return '
                    <div class="fonticon-container">
                      <span class="fonticon-wrap" onclick="f_datadetil(' . $jasa_timbangs->id . ')"><i class="feather icon-eye" data-toggle="tooltip" title="Lihat Detil Penjualan"></i></span>
                      <span class="fonticon-wrap" onclick="window.open(\'/penjualan/jasa-timbang/print-data/' . $encrypt . '\',\'_blank\')"><i class="feather icon-printer" data-toggle="tooltip" title="Cetak Jasa Timbang"></i></span>
                      <span class="fonticon-wrap '.$class3.'" onclick="f_aksesedit(' . $jasa_timbangs->id . ')"><i class="feather icon-upload" data-toggle="tooltip" title="Berikan Staff Akses Edit"></i></span>
                      <span class="fonticon-wrap '.$class2.'" onclick="window.open(\'/penjualan/jasa-timbang-manual/edit-detil/' . $encrypt . '\',\'_blank\')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data Jasa Timbang"></i></span>
                      <span class="fonticon-wrap '.$class.'" onclick="f_delete('.$jasa_timbangs->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
                    </div>
                ';
            })
            ->addIndexColumn()
            ->make(true);
    }

    public function index_belumselesai(){
      $konsumens = DB::table('konsumens')
        ->orderBy('nama', 'asc')
        ->where('aktif','=','Active')
        ->get();

      return view('apps.penjualan.jasa-timbang-manual.list-belumselesai',[ 'konsumens' => $konsumens ]);
    }

    public function list_belumselesai(Request $request){
      $jasa_timbangs = DB::table('jasa_timbangs')
        ->join('konsumens','jasa_timbangs.id_konsumens','=','konsumens.id')
        ->select('jasa_timbangs.*','konsumens.nama as namakonsumen')
        ->where(function($query) use ($request)
        {

          if($request->client != "All"){
            $query->where('jasa_timbangs.id_konsumens','=',$request->client);
          }

          $query->where('jasa_timbangs.tipe_penjualan','=','Manual');
          $query->where('jasa_timbangs.status','=','Belum Selesai');

        })
        ->orderBy('updated_at','desc')
        ->get();
      return datatables()::of($jasa_timbangs)
        ->addColumn('action', function ($jasa_timbangs) {
          $encrypt = Crypt::encrypt($jasa_timbangs->id);

          return '
              <div class="fonticon-container">
                <span class="fonticon-wrap" onclick="window.open(\'/penjualan/jasa-timbang/print-data/' . $encrypt . '\',\'_blank\')"><i class="feather icon-printer" data-toggle="tooltip" title="Cetak Jasa Timbang"></i></span>
              </div>
          ';
        })
        ->addIndexColumn()
        ->make(true);
    }

    public function drop_penjualan(Request $request){
        DB::beginTransaction();

        try{
            $penjualanlama = DB::table('jasa_timbangs')->where('id',$request->id)->first();


            // hapus jurnal penjualan
            $jurnallama = DB::table('jurnals')->where('kode','JO-'.$penjualanlama->kode)->first();

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

            // hapus data jurnal
            DB::table('jurnals')->where('id',$jurnallama->id)->delete();
            DB::table('jurnal_detils')->where('id_jurnals',$jurnallama->id)->delete();

            // hapus data penjualan
            DB::table('jasa_timbang_details')->where('id_jasa_timbangs',$request->id)->delete();
            DB::table('jasa_timbangs')->where('id',$request->id)->delete();

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }

    public function index_edit_detil($param){
        $id = Crypt::decrypt($param);

        $penjualan = DB::table('jasa_timbangs')
            ->join('konsumens','jasa_timbangs.id_konsumens','=','konsumens.id')
            ->select('jasa_timbangs.*','konsumens.nama as namakonsumen')
            ->where('jasa_timbangs.id','=',$id)
            ->orderBy('created_at','desc')
            ->first();

        $produks = DB::table('item_jasa_timbangs')
          ->where('aktif','Active')
          ->orderBy('nama', 'asc')->get();

        if($penjualan->pembayaran == "Cash"){
          $akuns = DB::table('akuns')->where('kategori','Kas & Bank')->get();
        }else{
          $akuns = DB::table('akuns')->where('kategori','Piutang Usaha')->get();
        }

        return view('apps.penjualan.jasa-timbang-manual.edit-detil',[ 'penjualan' => $penjualan, 'produks' => $produks, 'akuns' => $akuns ]);
    }

    public function proses_edit_detil(Request $request){
        DB::beginTransaction();

        try{

            $detils = DB::table('jasa_timbang_details')->where('id_jasa_timbangs',$request->idpenjualan)->get();

            $sisa = 0;

            if($request->pembayaran == "Credit"){
                $getpenjualan = DB::table('jasa_timbangs')->where('id',$request->idpenjualan)->first();

                $sisalama = $getpenjualan->sisa;
                $grandtotallama = $getpenjualan->grandtotal;

                $terbayarlama = $grandtotallama - $sisalama;

                $sisa = $request->totalakhir - $terbayarlama;

            }

            DB::table('jasa_timbangs')->where('id',$request->idpenjualan)->update([
                'biaya_tambahan' => $request->biayatambahan,
                'subtotal' => $request->subtotal,
                'diskon' => $request->diskon,
                'pajak' => $request->pajak,
                'grandtotal' => $request->totalakhir,
                'sisa' => $sisa,
                'bruto' => $request->bruto,
                'tara' => $request->tara,
                'netto' => $request->netto,
                'waktu_timbang_bruto' => $request->waktubruto,
                'waktu_timbang_tara' => $request->waktutara,
                'kode_akun' => $request->akunpembayaran,
                'keterangan' => $request->keterangan,
                'status' => $request->action,
                "updated_at" => \Carbon\Carbon::now()
            ]);

            $jurnallama = DB::table('jurnals')->where('kode','JO-'.$request->kodepenjualan)->first();

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

            $akunpenjualan = "4101";
            $akunpembayaran = $request->akunpembayaran;
            $akunbiayatambahan = "4104";
            $akunpotongan = "4103";
            $akunpajak = "2501";

            $penjualan = DB::table('jasa_timbangs')->where('id',$request->idpenjualan)->first();

            $konsumen = DB::table('konsumens')->where('id',$penjualan->id_konsumens)->first();

            // create head jurnal
            $idjurnal = DB::table('jurnals')->insertGetId([
                'kode' => 'JO-'.$request->kodepenjualan,
                'keterangan' => 'Jurnal Jasa Timbang dengan Kode Transaksi '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                    'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                    'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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
                    'keterangan' => 'Transaksi Jasa Timbang '.$request->kodepenjualan.' (Konsumen : '.$konsumen->nama.')',
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

            DB::commit();

            return 'berhasil';
        }catch (Exception $e){
            DB::rollBack();

            return 'gagal';
        }
    }

    public function get_data(Request $request){
      $penjualan = DB::table('jasa_timbangs')
        ->join('konsumens','jasa_timbangs.id_konsumens','=','konsumens.id')
        ->select('jasa_timbangs.*','konsumens.nama as namakonsumen')
        ->where('jasa_timbangs.id','=',$request->data)
        ->orderBy('created_at','desc')
        ->first();

      return get_object_vars($penjualan);
    }

    public function ubah_metode_pembayaran(Request $request){
      DB::beginTransaction();

      try{

        DB::table('jasa_timbangs')->where('id',$request->idpenjualan)->update([
          'pembayaran' => $request->pembayaran,
          "updated_at" => \Carbon\Carbon::now()
        ]);

        DB::commit();

        return 'berhasil';
      }catch (Exception $e){
        DB::rollBack();

        return 'gagal';
      }
    }

    public function akses_edit(Request $request){
      DB::beginTransaction();

      try{

        DB::table('jasa_timbangs')->where('id',$request->id)->update([
          'akses_edit' => 'Y',
          "updated_at" => \Carbon\Carbon::now()
        ]);

        DB::commit();

        return 'berhasil';
      }catch (Exception $e){
        DB::rollBack();

        return 'gagal';
      }
    }
}
