<?php

namespace App\Http\Controllers\Laporan;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;
use File;
use Matrix\Exception;
use Illuminate\Support\Facades\Hash;


class SatpamController extends Controller
{
  public $con;

  public function __construct()
  {
    $this->middleware('auth');
    $this->con = mysqli_connect(env("DB_HOST"),env("DB_USERNAME"),env("DB_PASSWORD"),env("DB_DATABASE"));
  }

  public function index(){
    $r_absensisatpam = DB::table('r_absensisatpam')->get();

    return view('apps.laporan.satpam.index', ['r_absensisatpam' => $r_absensisatpam]);
  }

  public function list(){
    $pay = DB::table('r_payrollsatpamdetil')
      ->select('r_payrollsatpamdetil.id','karyawan.nama','r_payrollsatpamdetil.gaji','r_payrollsatpamdetil.lembur','r_payrollsatpamdetil.dpGaji','r_payrollsatpamdetil.sisaGaji')
      ->join('karyawan','karyawan.id','=','r_payrollsatpamdetil.karyawanId')
      ->join('r_payrollsatpam','r_payrollsatpam.id','=','r_payrollsatpamdetil.r_payrollsatpamId')
      ->where("r_payrollsatpam.status","REVISI")
      ->orderBy('r_payrollsatpamdetil.id', 'desc')
      ->get();
    return datatables()::of($pay)
      ->addColumn('action', function ($pay) {
        return '
          <div class="fonticon-container">
            <span class="fonticon-wrap" onclick="f_edit('.$pay->id.')"><i class="feather icon-edit" data-toggle="tooltip" title="Edit Data"></i></span>
            <span class="fonticon-wrap" onclick="f_delete('.$pay->id.')"><i class="feather icon-trash" data-toggle="tooltip" title="Hapus Data"></i></span>
          </div>
        ';
      })
      ->addIndexColumn()
      ->make(true);
  }

  public function tutupLaporan(Request $request){
    mysqli_query($this->con, "update r_payrollsatpam set status='FINAL' where status='REVISI'");

    return "berhasil";
  }

  public function hitungLaporan(Request $request){
    $data = $request->data;
    $r_absensisatpamId = $data[0];
    $dpGaji = $data[1];
    $jamHari = [];

    $sql = mysqli_query($this->con, "select jam from hari where jabatanId='4' order by id asc");
    $num = 0;
    while($data = mysqli_fetch_array($sql)){
      $jamHari[$num] = $data[0];
      $num ++;
    }

    $sql = mysqli_query($this->con, "select id from r_payrollsatpam where status='REVISI'");
    $num = mysqli_num_rows($sql);
    $idr_payrollsatpam;
    $tanggalAwal;
    $tanggalAkhir;
    $hariKerjaSebulan;
    $upahKerja;

    if($num == 0){
      $sql = mysqli_query($this->con, "select judul,tanggalAwal,tanggalAkhir,hariKerja from r_absensisatpam where id='$r_absensisatpamId'");
      $data = mysqli_fetch_array($sql);
      
      $judul = $data[0];
      $tanggalAwal = $data[1];
      $tanggalAkhir = $data[2];
      $hariKerjaSebulan = $data[3];
      
      $bulan = date('m',strtotime($tanggalAwal));
      $sql = mysqli_query($this->con, "select umr from informasigaji where bulan='$bulan'");
      $upahKerja = mysqli_fetch_array($sql)[0];

      mysqli_query($this->con, "insert into r_payrollsatpam values('','$r_absensisatpamId','$judul','$tanggalAwal','$tanggalAkhir','REVISI')");
      
      $sql = mysqli_query($this->con, "select id from r_payrollsatpam where status='REVISI'");
      $idr_payrollsatpam = mysqli_fetch_array($sql)[0];
    }else{
      $idr_payrollsatpam = mysqli_fetch_array($sql)[0];

      $sql = mysqli_query($this->con, "select judul,tanggalAwal,tanggalAkhir,hariKerja from r_absensisatpam where id='$r_absensisatpamId'");
      $data = mysqli_fetch_array($sql);
      
      $judul = $data[0];
      $tanggalAwal = $data[1];
      $tanggalAkhir = $data[2];
      $hariKerjaSebulan = $data[3];
      
      $bulan = date('m',strtotime($tanggalAwal));
      $sql = mysqli_query($this->con, "select umr from informasigaji where bulan='$bulan'");
      $upahKerja = mysqli_fetch_array($sql)[0];

      mysqli_query($this->con, "delete from r_payrollsatpamdetil where r_payrollsatpamId='$idr_payrollsatpam'");
    }

    $gajiPerHari = $upahKerja / $hariKerjaSebulan;
    
    $sql = mysqli_query($this->con, "select id,pin from karyawan where jabatanId='4'");
    while($data = mysqli_fetch_array($sql)){
      $idKaryawan = $data[0];
      $pin = $data[1];
      $gaji = 0;
      $gajiLembur = 0;
      $gajiLemburLibur = 0;

      $sql2 = mysqli_query($this->con, "select totalHariKerja from r_absensisatpamdetil where r_absensisatpamId='$r_absensisatpamId' and karyawanId='$idKaryawan'");
      while($data2 = mysqli_fetch_array($sql2)){
        $totalHariKerja = $data2[0];
        $gaji += $totalHariKerja * $gajiPerHari;
      }

      $sql2 = mysqli_query($this->con, "select masuk,keluar from absensi where masuk between '$tanggalAwal' and '$tanggalAkhir' and pin='$pin'");
      while($data2 = mysqli_fetch_array($sql2)){
        $masuk = $data2[0];
        $keluar = $data2[1];
  
        $hari = date('l', strtotime($masuk));
        $waktu = (strtotime($keluar) - strtotime($masuk)) / 3600;
        $index = 0;
        
        if($hari == "Monday"){
          $index = 0;
        }else if($hari == "Tuesday"){
          $index = 1;
        }else if($hari == "Wednesday"){
          $index = 2;
        }else if($hari == "Thursday"){
          $index = 3;
        }else if($hari == "Friday"){
          $index = 4;
        }else if($hari == "Saturday"){
          $index = 5;
        }else if($hari == "Sunday"){
          $index = 6;
        }
  
        if($index != 6){
          $batasJam = $jamHari[$index];

          if($waktu > $batasJam){
            $lembur = $waktu - $batasJam;
            $sql3 = mysqli_query($this->con, "select total from lembur where jamKerja='$lembur'");
            $gajiLembur += mysqli_fetch_array($sql3)[0];
          }
        }
      }

      $netTerima = $gaji - $dpGaji;
      $gaji = round($gaji);
      $netTerima = round($netTerima);
      $gajiLembur = round($gajiLembur);

      mysqli_query($this->con, "insert into r_payrollsatpamdetil values('','$idr_payrollsatpam','$idKaryawan','$gaji','$gajiLembur','$dpGaji','$sisaGaji')");
    }
  }

  // public function store(Request $request){

  //   parse_str($request->data, $data); // ubah data serialized Jquery jadi Array

  //   DB::beginTransaction();

  //   try{
  //     DB::table('r_absensisatpamdetil')->insert([
  //       'kerja' => $data['kerja'],
  //       'sakit' => $data['sakit'],
  //       'izin' => $data['izin'],
  //       'tanpaKeterangan' => $data['tanpaKeterangan'],
  //       'izinPotongGaji' => $data['izinPotongGaji'],
  //       'cutiDibayar' => $data['cutiDibayar']
  //     ]);

  //     DB::commit();

  //     return 'berhasil';
  //   }catch (Exception $e){
  //     DB::rollBack();

  //     return 'gagal';
  //   }
  // }

  public function update(Request $request){

    parse_str($request->data[0], $data); // ubah data serialized Jquery jadi Array

    DB::beginTransaction();
    try{
      // DB::table('r_absensisatpamdetil')->where('id',$data['id'])->update([
      //   'kerja' => $data['kerja'],
      //   'sakit' => $data['sakit'],
      //   'izin' => $data['izin'],
      //   'tanpaKeterangan' => $data['tanpaKeterangan'],
      //   'izinPotongGaji' => $data['izinPotongGaji'],
      //   'cutiDibayar' => $data['cutiDibayar']
      // ]);

      // DB::commit();

      $idpay = $data['id'];
      $dpGaji = $data['dpGaji1'];
      $potonganBPJS = $data['potonganBPJS1'];
      $potonganBPJSKes = $data['potonganBPJSKes1'];

      $sql = mysqli_query($this->con, "select gaji from r_payrollsatpamdetil where id='$idpay'");
      $gaji = mysqli_fetch_array($sql)[0];

      $netTerima = $gaji - $dpGaji - $potonganBPJS - $potonganBPJSKes;

      mysqli_query($this->con, "update r_payrollsatpamdetil set dpGaji='$dpGaji',potonganBPJS='$potonganBPJS',potonganBPJSKes='$potonganBPJSKes',netTerima='$netTerima' where id='$idpay'");
      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }

  public function requestdata(Request $request){
    $abs = DB::table('r_payrollsatpamdetil')->where('id',$request->id)->get();

    if ($abs->count()){
      return 'ada|'. $abs[0]->dpGaji . "|" . $abs[0]->potonganBPJS . "|" . $abs[0]->potonganBPJSKes;
    }else{
      return 'gak ada|';
    }
  }

  public function drop(Request $request){
    DB::beginTransaction();

    try{
      DB::table('r_absensisatpamdetil')->where('id',$request->id)->delete();

      DB::commit();

      return 'berhasil';
    }catch (Exception $e){
      DB::rollBack();

      return 'gagal';
    }
  }
}
