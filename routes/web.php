<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes([
  'register' => false,
  'verify' => false
]);

Route::get('/change-password', function () {
  return view('auth.change-password');
});

Route::group(['prefix' => 'mutasi'], function () {

  Route::group(['prefix' => 'masuk'], function () {
    Route::get('/', 'Mutasi\MasukController@index');
    Route::get('/list', 'Mutasi\MasukController@list');

    Route::post('/store', 'Mutasi\MasukController@store');
    Route::post('/update', 'Mutasi\MasukController@update');
    Route::post('/request-data', 'Mutasi\MasukController@requestdata');
    Route::post('/drop', 'Mutasi\MasukController@drop');

    Route::post('/getstok', 'Mutasi\MasukController@getstok');
  });

  Route::group(['prefix' => 'keluar'], function () {
    Route::get('/', 'Mutasi\KeluarController@index');
    Route::get('/list', 'Mutasi\KeluarController@list');

    Route::post('/store', 'Mutasi\KeluarController@store');
    Route::post('/update', 'Mutasi\KeluarController@update');
    Route::post('/request-data', 'Mutasi\KeluarController@requestdata');
    Route::post('/drop', 'Mutasi\KeluarController@drop');
  });

  Route::group(['prefix' => 'gudang-toko'], function () {
    Route::get('/', 'Mutasi\GudangTokoController@index');
    Route::get('/list', 'Mutasi\GudangTokoController@list');

    Route::post('/store', 'Mutasi\GudangTokoController@store');
    Route::post('/update', 'Mutasi\GudangTokoController@update');
    Route::post('/request-data', 'Mutasi\GudangTokoController@requestdata');
    Route::post('/drop', 'Mutasi\GudangTokoController@drop');
  });

  Route::group(['prefix' => 'toko-gudang'], function () {
    Route::get('/', 'Mutasi\TokoGudangController@index');
    Route::get('/list', 'Mutasi\TokoGudangController@list');

    Route::post('/store', 'Mutasi\TokoGudangController@store');
    Route::post('/update', 'Mutasi\TokoGudangController@update');
    Route::post('/request-data', 'Mutasi\TokoGudangController@requestdata');
    Route::post('/drop', 'Mutasi\TokoGudangController@drop');

    Route::post('/getstok', 'Mutasi\TokoGudangController@getstok');
  });
});

Route::group(['prefix' => 'master'], function () {

  Route::group(['prefix' => 'user'], function () {
    Route::get('/', 'MasterData\UserController@index');
    Route::get('/list', 'MasterData\UserController@list');

    Route::post('/store', 'MasterData\UserController@store');
    Route::post('/update', 'MasterData\UserController@update');
    Route::post('/update-password', 'MasterData\UserController@updatepassword');
    Route::post('/request-data', 'MasterData\UserController@requestdata');
    Route::post('/drop', 'MasterData\UserController@drop');
  });

  Route::group(['prefix' => 'konsumen'], function () {
    Route::get('/', 'MasterData\KonsumenController@index');
    Route::get('/list', 'MasterData\KonsumenController@list');

    Route::post('/store', 'MasterData\KonsumenController@store');
    Route::post('/update', 'MasterData\KonsumenController@update');
    Route::post('/request-data', 'MasterData\KonsumenController@requestdata');
    Route::post('/drop', 'MasterData\KonsumenController@drop');

    Route::post('/get-kode', 'MasterData\KonsumenController@getkode');
    Route::post('/get-group', 'MasterData\KonsumenController@getgroup');
  });

  Route::group(['prefix' => 'kategori-barang'], function () {
    Route::get('/', 'MasterData\KategoriBarangController@index');
    Route::get('/list', 'MasterData\KategoriBarangController@list');

    Route::post('/store', 'MasterData\KategoriBarangController@store');
    Route::post('/update', 'MasterData\KategoriBarangController@update');
    Route::post('/request-data', 'MasterData\KategoriBarangController@requestdata');
    Route::post('/drop', 'MasterData\KategoriBarangController@drop');
  });

  Route::group(['prefix' => 'barang-beli'], function () {
    Route::get('/', 'MasterData\BarangBeliController@index');
    Route::get('/list', 'MasterData\BarangBeliController@list');

    Route::post('/store', 'MasterData\BarangBeliController@store');
    Route::post('/update', 'MasterData\BarangBeliController@update');
    Route::post('/request-data', 'MasterData\BarangBeliController@requestdata');
    Route::post('/drop', 'MasterData\BarangBeliController@drop');

    Route::post('/get-kode', 'MasterData\BarangBeliController@getkode');
  });
});

Route::group(['prefix' => 'accounting'], function () {

  Route::group(['prefix' => 'akun'], function () {
    Route::get('/', 'Accounting\AkunController@index');
    Route::get('/list', 'Accounting\AkunController@list');

    Route::post('/store', 'Accounting\AkunController@store');
    Route::post('/update', 'Accounting\AkunController@update');
    Route::post('/request-data', 'Accounting\AkunController@requestdata');
    Route::post('/drop', 'Accounting\AkunController@drop');
  });

  Route::group(['prefix' => 'input-jurnal'], function () {
    Route::get('/', 'Accounting\JournalController@index_input');
    Route::get('/list', 'Accounting\JournalController@list_input');

    Route::post('/store', 'Accounting\JournalController@store_temp');
    Route::post('/update', 'Accounting\JournalController@update_temp');
    Route::post('/request-data', 'Accounting\JournalController@requestdata_temp');
    Route::post('/drop', 'Accounting\JournalController@drop_temp');

    Route::post('/proses', 'Accounting\JournalController@proses_input');
  });

  Route::group(['prefix' => 'daftar-jurnal'], function () {
    Route::get('/', 'Accounting\JournalController@index_list');
    Route::get('/list', 'Accounting\JournalController@list_jurnal');
    Route::get('/list-detil', 'Accounting\JournalController@list_detil');

    Route::post('/drop', 'Accounting\JournalController@drop_jurnal');
  });
});

Route::group(['prefix' => 'pembelian'], function () {

  Route::group(['prefix' => 'pembelian-umum'], function () {

    // home pembelian

    Route::get('/', 'Pembelian\PembelianUmumController@index');
    Route::post('/store', 'Pembelian\PembelianUmumController@store');
    Route::post('/request-data-pembelian', 'Pembelian\PembelianUmumController@requestdatapembelian');

    // input data timbangan

    Route::get('/detil/{param}', 'Pembelian\PembelianUmumController@index_detil');
    Route::get('/list-detil', 'Pembelian\PembelianUmumController@listdetil');

    Route::post('/store-detil', 'Pembelian\PembelianUmumController@store_detil');
    Route::post('/update-detil', 'Pembelian\PembelianUmumController@update_detil');
    Route::post('/input-tara', 'Pembelian\PembelianUmumController@input_tara');
    Route::post('/drop-detil', 'Pembelian\PembelianUmumController@drop_detil');
    Route::post('/request-data-detil', 'Pembelian\PembelianUmumController@requestdata_detil');
    Route::post('/request-total-detil', 'Pembelian\PembelianUmumController@requesttotal_detil');

    Route::post('/proses-detil', 'Pembelian\PembelianUmumController@proses_detil');

    // list pembelian

    Route::get('/list-pembelian', 'Pembelian\PembelianUmumController@index_list');
    Route::get('/list-data-pembelian', 'Pembelian\PembelianUmumController@list_datapembelian');

    Route::post('/drop', 'Pembelian\PembelianUmumController@drop_pembelian');

    // edit data timbangan

    Route::get('/edit-detil/{param}', 'Pembelian\PembelianUmumController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Pembelian\PembelianUmumController@proses_edit_detil');

    Route::post('/ubah-metode-pembayaran', 'Pembelian\PembelianUmumController@ubah_metode_pembayaran');

    Route::post('/akses-edit', 'Pembelian\PembelianUmumController@akses_edit');

    Route::post('/ubah-jadi-kredit', 'Pembelian\PembelianUmumController@ubah_jadi_kredit');

    Route::get('/edit-kasir/{param}', 'Pembelian\PembelianUmumController@index_edit_kasir');
  });

  Route::group(['prefix' => 'pembelian-khusus'], function () {

    // home pembelian

    Route::get('/', 'Pembelian\PembelianKhususController@index');
    Route::post('/store', 'Pembelian\PembelianKhususController@store');
    Route::post('/request-data-pembelian', 'Pembelian\PembelianKhususController@requestdatapembelian');

    // input data timbangan

    Route::get('/detil/{param}', 'Pembelian\PembelianKhususController@index_detil');
    Route::get('/list-detil', 'Pembelian\PembelianKhususController@listdetil');

    Route::post('/store-detil', 'Pembelian\PembelianKhususController@store_detil');
    Route::post('/update-detil', 'Pembelian\PembelianKhususController@update_detil');
    Route::post('/input-tara', 'Pembelian\PembelianKhususController@input_tara');
    Route::post('/drop-detil', 'Pembelian\PembelianKhususController@drop_detil');
    Route::post('/request-data-detil', 'Pembelian\PembelianKhususController@requestdata_detil');
    Route::post('/request-total-detil', 'Pembelian\PembelianKhususController@requesttotal_detil');

    Route::post('/proses-detil', 'Pembelian\PembelianKhususController@proses_detil');

    // list pembelian

    Route::get('/list-pembelian', 'Pembelian\PembelianKhususController@index_list');
    Route::get('/list-data-pembelian', 'Pembelian\PembelianKhususController@list_datapembelian');

    Route::post('/drop', 'Pembelian\PembelianKhususController@drop_pembelian');

    // edit data timbangan

    Route::get('/edit-detil/{param}', 'Pembelian\PembelianKhususController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Pembelian\PembelianKhususController@proses_edit_detil');
  });

  Route::group(['prefix' => 'pembelian-keliling'], function () {

    // home pembelian

    Route::get('/', 'Pembelian\PembelianKelilingController@index');
    Route::post('/store', 'Pembelian\PembelianKelilingController@store');
    Route::post('/request-data-pembelian', 'Pembelian\PembelianKelilingController@requestdatapembelian');

    // input data timbangan

    Route::get('/detil/{param}', 'Pembelian\PembelianKelilingController@index_detil');
    Route::get('/list-detil', 'Pembelian\PembelianKelilingController@listdetil');

    Route::post('/store-detil', 'Pembelian\PembelianKelilingController@store_detil');
    Route::post('/update-detil', 'Pembelian\PembelianKelilingController@update_detil');
    Route::post('/input-tara', 'Pembelian\PembelianKelilingController@input_tara');
    Route::post('/drop-detil', 'Pembelian\PembelianKelilingController@drop_detil');
    Route::post('/request-data-detil', 'Pembelian\PembelianKelilingController@requestdata_detil');
    Route::post('/request-total-detil', 'Pembelian\PembelianKelilingController@requesttotal_detil');

    Route::post('/proses-detil', 'Pembelian\PembelianKelilingController@proses_detil');

    // list pembelian

    Route::get('/list-pembelian', 'Pembelian\PembelianKelilingController@index_list');
    Route::get('/list-data-pembelian', 'Pembelian\PembelianKelilingController@list_datapembelian');

    Route::post('/drop', 'Pembelian\PembelianKelilingController@drop_pembelian');

    // edit data timbangan

    Route::get('/edit-detil/{param}', 'Pembelian\PembelianKelilingController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Pembelian\PembelianKelilingController@proses_edit_detil');

    // list uang pegangan
    Route::get('/uang-pegangan', 'Pembelian\PembelianKelilingController@index_uangpegangan');
  });

  Route::group(['prefix' => 'pembelian-manual'], function () {

    // home pembelian

    Route::get('/', 'Pembelian\PembelianManualController@index');
    Route::post('/store', 'Pembelian\PembelianManualController@store');
    Route::post('/request-data-pembelian', 'Pembelian\PembelianManualController@requestdatapembelian');

    // input data timbangan

    Route::get('/detil/{param}', 'Pembelian\PembelianManualController@index_detil');
    Route::get('/list-detil', 'Pembelian\PembelianManualController@listdetil');

    Route::post('/store-detil', 'Pembelian\PembelianManualController@store_detil');
    Route::post('/update-detil', 'Pembelian\PembelianManualController@update_detil');
    Route::post('/input-tara', 'Pembelian\PembelianManualController@input_tara');
    Route::post('/drop-detil', 'Pembelian\PembelianManualController@drop_detil');
    Route::post('/request-data-detil', 'Pembelian\PembelianManualController@requestdata_detil');
    Route::post('/request-total-detil', 'Pembelian\PembelianManualController@requesttotal_detil');

    Route::post('/proses-detil', 'Pembelian\PembelianManualController@proses_detil');

    // list pembelian

    Route::get('/list-pembelian', 'Pembelian\PembelianManualController@index_list');
    Route::get('/list-data-pembelian', 'Pembelian\PembelianManualController@list_datapembelian');

    Route::post('/drop', 'Pembelian\PembelianManualController@drop_pembelian');

    // edit data timbangan

    Route::get('/edit-detil/{param}', 'Pembelian\PembelianManualController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Pembelian\PembelianManualController@proses_edit_detil');

    // generate dan cek password

    Route::get('/generate-password', 'Pembelian\PembelianManualController@index_password');
    Route::get('/list-password', 'Pembelian\PembelianManualController@list_password');

    Route::post('/store-password', 'Pembelian\PembelianManualController@store_password');
    Route::post('/drop-password', 'Pembelian\PembelianManualController@drop_password');

    Route::post('/cek-password', 'Pembelian\PembelianManualController@cek_password');

    Route::get('/edit-kasir/{param}', 'Pembelian\PembelianManualController@index_edit_kasir');
  });

  Route::group(['prefix' => 'hutang'], function () {
    Route::get('/', 'Pembelian\HutangController@index');
    Route::get('/list', 'Pembelian\HutangController@list');

    Route::post('/pelunasan', 'Pembelian\HutangController@pelunasan');
  });

  Route::group(['prefix' => 'hutang-sebagian'], function () {
    Route::get('/', 'Pembelian\HutangSebagianController@index');
    Route::get('/list', 'Pembelian\HutangSebagianController@list');

    Route::post('/pelunasan', 'Pembelian\HutangSebagianController@pelunasan');
  });

  Route::group(['prefix' => 'cancel-pelunasan'], function () {
    Route::get('/', 'Pembelian\CancelPelunasanController@index');
    Route::get('/list', 'Pembelian\CancelPelunasanController@list');

    Route::post('/pelunasan', 'Pembelian\CancelPelunasanController@pelunasan');
  });

  Route::group(['prefix' => 'hutang-customer'], function () {
    Route::get('/', 'Pembelian\HutangCustomerController@index');
    Route::get('/list', 'Pembelian\HutangCustomerController@list');

    Route::get('/list-data', 'Pembelian\HutangCustomerController@index_list');
    Route::get('/list-data-history', 'Pembelian\HutangCustomerController@listdatahistory');

    Route::post('/pelunasan', 'Pembelian\HutangCustomerController@pelunasan');

    Route::post('/cancel-data', 'Pembelian\HutangCustomerController@cancel_data');

    Route::get('/print-data/{param}', 'Pembelian\HutangCustomerController@print_data');
  });

  Route::get('/print-data/{param}', 'Pembelian\PembelianUmumController@print_data');

  Route::group(['prefix' => 'pinjaman-penampung'], function () {
    Route::get('/', 'Pembelian\PinjamanPenampungController@index');
    Route::get('/list', 'Pembelian\PinjamanPenampungController@list');

    Route::post('/store', 'Pembelian\PinjamanPenampungController@store');
    Route::post('/update', 'Pembelian\PinjamanPenampungController@update');
    Route::post('/request-data', 'Pembelian\PinjamanPenampungController@requestdata');
    Route::post('/drop', 'Pembelian\PinjamanPenampungController@drop');

    Route::post('/getpinjamanpenampung', 'Pembelian\PinjamanPenampungController@getpinjamanpenampung');

    Route::get('/print-data/{param}', 'Pembelian\PinjamanPenampungController@print_data');
  });

  Route::group(['prefix' => 'pengembalian-pinjaman-penampung'], function () {
    Route::get('/', 'Pembelian\PengembalianPinjamanPenampungController@index');
    Route::get('/list', 'Pembelian\PengembalianPinjamanPenampungController@list');

    Route::post('/store', 'Pembelian\PengembalianPinjamanPenampungController@store');
    Route::post('/update', 'Pembelian\PengembalianPinjamanPenampungController@update');
    Route::post('/request-data', 'Pembelian\PengembalianPinjamanPenampungController@requestdata');
    Route::post('/drop', 'Pembelian\PengembalianPinjamanPenampungController@drop');
  });
});

Route::group(['prefix' => 'penjualan'], function () {

  Route::get('/print-invoice/{param}', 'Payment\PelunasanController@print_invoice');

  Route::get('/hitung-ulang-stok', 'Penjualan\PenjualanUmumController@hitung_ulang_stok');

  Route::group(['prefix' => 'surat-jalan'], function () {
    Route::get('/', 'Penjualan\SuratJalanController@index');
    Route::get('/list', 'Penjualan\SuratJalanController@list');

    Route::post('/store', 'Penjualan\SuratJalanController@store');

    Route::get('/print/{param}', 'Penjualan\SuratJalanController@print');
  });

  Route::group(['prefix' => 'invoice'], function () {
    Route::get('/', 'Penjualan\InvoiceController@index');
    Route::get('/list', 'Penjualan\InvoiceController@list');

    Route::post('/store', 'Penjualan\InvoiceController@store');
    Route::post('/store-kas', 'Penjualan\InvoiceController@store_kas');
    Route::post('/ceklimit', 'Penjualan\InvoiceController@ceklimit');

    Route::get('/print/{param}', 'Penjualan\InvoiceController@print');

    Route::get('/print-simple/{param}', 'Penjualan\InvoiceController@print_simple');

    Route::get('/print-kwitansi/{param}', 'Penjualan\InvoiceController@print_kwitansi');
  });

  Route::group(['prefix' => 'penjualan-umum'], function () {

    // home penjualan

    Route::get('/', 'Penjualan\PenjualanUmumController@index');
    Route::post('/store', 'Penjualan\PenjualanUmumController@store');
    Route::post('/request-data-penjualan', 'Penjualan\PenjualanUmumController@requestdatapenjualan');

    // input data timbangan

    Route::get('/detil/{param}', 'Penjualan\PenjualanUmumController@index_detil');
    Route::get('/list-detil', 'Penjualan\PenjualanUmumController@listdetil');

    Route::post('/store-detil', 'Penjualan\PenjualanUmumController@store_detil');
    Route::post('/update-detil', 'Penjualan\PenjualanUmumController@update_detil');
    Route::post('/input-tara', 'Penjualan\PenjualanUmumController@input_tara');
    Route::post('/drop-detil', 'Penjualan\PenjualanUmumController@drop_detil');
    Route::post('/request-data-detil', 'Penjualan\PenjualanUmumController@requestdata_detil');
    Route::post('/request-total-detil', 'Penjualan\PenjualanUmumController@requesttotal_detil');

    Route::post('/proses-detil', 'Penjualan\PenjualanUmumController@proses_detil');

    // list penjualan

    Route::get('/list-penjualan', 'Penjualan\PenjualanUmumController@index_list');
    Route::get('/list-data-penjualan', 'Penjualan\PenjualanUmumController@list_datapenjualan');

    Route::post('/drop', 'Penjualan\PenjualanUmumController@drop_penjualan');

    // edit data timbangan

    Route::get('/edit-detil/{param}', 'Penjualan\PenjualanUmumController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Penjualan\PenjualanUmumController@proses_edit_detil');

    Route::post('/ubah-metode-pembayaran', 'Penjualan\PenjualanUmumController@ubah_metode_pembayaran');

    Route::post('/akses-edit', 'Penjualan\PenjualanUmumController@akses_edit');
  });


  Route::group(['prefix' => 'piutang-sebagian'], function () {
    Route::get('/', 'Penjualan\PiutangSebagianController@index');
    Route::get('/list', 'Penjualan\PiutangSebagianController@list');

    Route::post('/pelunasan', 'Penjualan\PiutangSebagianController@pelunasan');
  });

  Route::group(['prefix' => 'cancel-pelunasan'], function () {
    Route::get('/', 'Penjualan\CancelPelunasanController@index');
    Route::get('/list', 'Penjualan\CancelPelunasanController@list');

    Route::post('/pelunasan', 'Penjualan\CancelPelunasanController@pelunasan');
  });

  Route::group(['prefix' => 'piutang-customer'], function () {
    Route::get('/', 'Penjualan\PiutangCustomerController@index');
    Route::get('/list', 'Penjualan\PiutangCustomerController@list');

    Route::get('/list-data', 'Penjualan\PiutangCustomerController@index_list');
    Route::get('/list-data-history', 'Penjualan\PiutangCustomerController@listdatahistory');

    Route::post('/pelunasan', 'Penjualan\PiutangCustomerController@pelunasan');

    Route::get('/cetak-kwitansi', 'Penjualan\PiutangCustomerController@cetakKuitansi');


    Route::get('/print-preview/{param}', 'Penjualan\PiutangCustomerController@print_data_preview')->name('print-preview');


    Route::post('/cancel-data', 'Penjualan\PiutangCustomerController@cancel_data');

    Route::get('/print-data/{param}', 'Penjualan\PiutangCustomerController@print_data');
  });

  Route::group(['prefix' => 'pinjaman-konsumen'], function () {
    Route::get('/', 'Penjualan\PinjamanKonsumenController@index');
    Route::get('/list', 'Penjualan\PinjamanKonsumenController@list');

    Route::post('/store', 'Penjualan\PinjamanKonsumenController@store');
    Route::post('/update', 'Penjualan\PinjamanKonsumenController@update');
    Route::post('/request-data', 'Penjualan\PinjamanKonsumenController@requestdata');
    Route::post('/drop', 'Penjualan\PinjamanKonsumenController@drop');

    Route::post('/getpinjamankonsumen', 'Penjualan\PinjamanKonsumenController@getpinjamankonsumen');
  });

  Route::group(['prefix' => 'pengembalian-pinjaman-konsumen'], function () {
    Route::get('/', 'Penjualan\PengembalianPinjamanKonsumenController@index');
    Route::get('/list', 'Penjualan\PengembalianPinjamanKonsumenController@list');

    Route::post('/store', 'Penjualan\PengembalianPinjamanKonsumenController@store');
    Route::post('/update', 'Penjualan\PengembalianPinjamanKonsumenController@update');
    Route::post('/request-data', 'Penjualan\PengembalianPinjamanKonsumenController@requestdata');
    Route::post('/drop', 'Penjualan\PengembalianPinjamanKonsumenController@drop');
  });

  Route::group(['prefix' => 'jasa-timbang'], function () {

    // home penjualan

    Route::get('/', 'Penjualan\JasaTimbangController@index');
    Route::post('/store', 'Penjualan\JasaTimbangController@store');
    Route::post('/request-data-penjualan', 'Penjualan\JasaTimbangController@requestdatapenjualan');

    // input data timbangan

    Route::get('/detil/{param}', 'Penjualan\JasaTimbangController@index_detil');
    Route::get('/list-detil', 'Penjualan\JasaTimbangController@listdetil');

    Route::post('/store-detil', 'Penjualan\JasaTimbangController@store_detil');
    Route::post('/update-detil', 'Penjualan\JasaTimbangController@update_detil');
    Route::post('/input-tara', 'Penjualan\JasaTimbangController@input_tara');
    Route::post('/drop-detil', 'Penjualan\JasaTimbangController@drop_detil');
    Route::post('/request-data-detil', 'Penjualan\JasaTimbangController@requestdata_detil');
    Route::post('/request-total-detil', 'Penjualan\JasaTimbangController@requesttotal_detil');

    Route::post('/proses-detil', 'Penjualan\JasaTimbangController@proses_detil');

    // list penjualan

    Route::get('/list-penjualan', 'Penjualan\JasaTimbangController@index_list');
    Route::get('/list-data-penjualan', 'Penjualan\JasaTimbangController@list_datapenjualan');

    Route::get('/list-belumselesai', 'Penjualan\JasaTimbangController@index_belumselesai');
    Route::get('/list-data-belumselesai', 'Penjualan\JasaTimbangController@list_belumselesai');

    Route::post('/drop', 'Penjualan\JasaTimbangController@drop_penjualan');

    // edit data timbangan

    Route::get('/edit-detil/{param}', 'Penjualan\JasaTimbangController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Penjualan\JasaTimbangController@proses_edit_detil');

    Route::post('/ubah-metode-pembayaran', 'Penjualan\JasaTimbangController@ubah_metode_pembayaran');

    Route::post('/get-data', 'Penjualan\JasaTimbangController@get_data');

    Route::post('/akses-edit', 'Penjualan\JasaTimbangController@akses_edit');

    Route::get('/print-data/{param}', 'Penjualan\JasaTimbangController@print_data');
  });


  Route::group(['prefix' => 'jasa-timbang-manual'], function () {

    // home penjualan

    Route::get('/', 'Penjualan\JasaTimbangManualController@index');
    Route::post('/store', 'Penjualan\JasaTimbangManualController@store');
    Route::post('/request-data-penjualan', 'Penjualan\JasaTimbangManualController@requestdatapenjualan');

    // input data timbangan

    Route::get('/detil/{param}', 'Penjualan\JasaTimbangManualController@index_detil');
    Route::get('/list-detil', 'Penjualan\JasaTimbangManualController@listdetil');

    Route::post('/store-detil', 'Penjualan\JasaTimbangManualController@store_detil');
    Route::post('/update-detil', 'Penjualan\JasaTimbangManualController@update_detil');
    Route::post('/input-tara', 'Penjualan\JasaTimbangManualController@input_tara');
    Route::post('/drop-detil', 'Penjualan\JasaTimbangManualController@drop_detil');
    Route::post('/request-data-detil', 'Penjualan\JasaTimbangManualController@requestdata_detil');
    Route::post('/request-total-detil', 'Penjualan\JasaTimbangManualController@requesttotal_detil');

    Route::post('/proses-detil', 'Penjualan\JasaTimbangManualController@proses_detil');

    // list penjualan

    Route::get('/list-penjualan', 'Penjualan\JasaTimbangManualController@index_list');
    Route::get('/list-data-penjualan', 'Penjualan\JasaTimbangManualController@list_datapenjualan');

    Route::get('/list-belumselesai', 'Penjualan\JasaTimbangManualController@index_belumselesai');
    Route::get('/list-data-belumselesai', 'Penjualan\JasaTimbangManualController@list_belumselesai');

    Route::post('/drop', 'Penjualan\JasaTimbangManualController@drop_penjualan');

    // edit data timbangan

    Route::get('/edit-detil/{param}', 'Penjualan\JasaTimbangManualController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Penjualan\JasaTimbangManualController@proses_edit_detil');

    Route::post('/ubah-metode-pembayaran', 'Penjualan\JasaTimbangManualController@ubah_metode_pembayaran');

    Route::post('/get-data', 'Penjualan\JasaTimbangManualController@get_data');

    Route::post('/akses-edit', 'Penjualan\JasaTimbangManualController@akses_edit');
  });

  Route::group(['prefix' => 'penjualan-kontainer'], function () {

    // home penjualan

    Route::get('/', 'Penjualan\PenjualanContainerController@index');
    Route::post('/store', 'Penjualan\PenjualanContainerController@store');
    Route::post('/request-data-penjualan', 'Penjualan\PenjualanContainerController@requestdatapenjualan');

    // input data timbangan

    Route::get('/detil/{param}', 'Penjualan\PenjualanContainerController@index_detil');
    Route::get('/list-detil', 'Penjualan\PenjualanContainerController@listdetil');

    Route::post('/store-detil', 'Penjualan\PenjualanContainerController@store_detil');
    Route::post('/update-detil', 'Penjualan\PenjualanContainerController@update_detil');
    Route::post('/input-tara', 'Penjualan\PenjualanContainerController@input_tara');
    Route::post('/drop-detil', 'Penjualan\PenjualanContainerController@drop_detil');
    Route::post('/request-data-detil', 'Penjualan\PenjualanContainerController@requestdata_detil');
    Route::post('/request-total-detil', 'Penjualan\PenjualanContainerController@requesttotal_detil');

    Route::post('/proses-detil', 'Penjualan\PenjualanContainerController@proses_detil');

    // list penjualan

    Route::get('/list-penjualan', 'Penjualan\PenjualanContainerController@index_list');
    Route::get('/list-data-penjualan', 'Penjualan\PenjualanContainerController@list_datapenjualan');

    Route::post('/drop', 'Penjualan\PenjualanContainerController@drop_penjualan');

    // edit data timbangan

    Route::get('/edit-detil/{param}', 'Penjualan\PenjualanContainerController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Penjualan\PenjualanContainerController@proses_edit_detil');

    Route::group(['prefix' => 'update-surat-jalan'], function () {
      Route::get('/', 'Penjualan\UpdateSuratJalanController@index');
      Route::get('/list', 'Penjualan\UpdateSuratJalanController@list');

      Route::post('/update', 'Penjualan\UpdateSuratJalanController@update');
    });
  });

  Route::group(['prefix' => 'penjualan-manual'], function () {

    // home penjualan

    Route::get('/', 'Penjualan\PenjualanManualController@index');
    Route::post('/store', 'Penjualan\PenjualanManualController@store');
    Route::post('/request-data-penjualan', 'Penjualan\PenjualanManualController@requestdatapenjualan');

    // input data timbangan

    Route::get('/detil/{param}', 'Penjualan\PenjualanManualController@index_detil');
    Route::get('/list-detil', 'Penjualan\PenjualanManualController@listdetil');

    Route::post('/store-detil', 'Penjualan\PenjualanManualController@store_detil');
    Route::post('/store-detil-invoice', 'Penjualan\PenjualanManualController@store_detil_invoice');
    Route::post('/update-detil', 'Penjualan\PenjualanManualController@update_detil');
    Route::post('/update-detil-invoice', 'Penjualan\PenjualanManualController@update_detil_invoice');
    Route::post('/input-tara', 'Penjualan\PenjualanManualController@input_tara');
    Route::post('/drop-detil', 'Penjualan\PenjualanManualController@drop_detil');
    Route::post('/drop-detil-invoice', 'Penjualan\PenjualanManualController@drop_detil_invoice');
    Route::post('/request-data-detil', 'Penjualan\PenjualanManualController@requestdata_detil');
    Route::post('/request-total-detil', 'Penjualan\PenjualanManualController@requesttotal_detil');

    Route::post('/proses-detil', 'Penjualan\PenjualanManualController@proses_detil');

    // list penjualan

    Route::get('/list-penjualan', 'Penjualan\PenjualanManualController@index_list');
    Route::get('/list-data-penjualan', 'Penjualan\PenjualanManualController@list_datapenjualan');

    Route::post('/drop', 'Penjualan\PenjualanManualController@drop_penjualan');

    // edit data timbangan

    Route::get('/edit-invoice/{param}', 'Penjualan\PenjualanManualController@index_edit_invoice');
    Route::post('/proses-edit-invoice', 'Penjualan\PenjualanManualController@proses_edit_invoice');

    Route::get('/edit-detil/{param}', 'Penjualan\PenjualanManualController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Penjualan\PenjualanManualController@proses_edit_detil');

    Route::post('/update-konsumen', 'Penjualan\PenjualanManualController@update_konsumen');

    Route::post('/update-tanggal', 'Penjualan\PenjualanManualController@update_tanggal');
    Route::get('/history-harga', 'Penjualan\PenjualanManualController@historyharga');


    // generate dan cek password

    Route::get('/generate-password', 'Penjualan\PenjualanManualController@index_password');
    Route::get('/list-password', 'Penjualan\PenjualanManualController@list_password');

    Route::post('/store-password', 'Penjualan\PenjualanManualController@store_password');
    Route::post('/drop-password', 'Penjualan\PenjualanManualController@drop_password');

    Route::post('/cek-password', 'Penjualan\PenjualanManualController@cek_password');
  });

  Route::group(['prefix' => 'piutang'], function () {
    Route::get('/', 'Penjualan\PiutangController@index');
    Route::get('/list', 'Penjualan\PiutangController@list');

    Route::post('/pelunasan', 'Penjualan\PiutangController@pelunasan');
  });

  Route::group(['prefix' => 'piutang-jasa-timbang'], function () {
    Route::get('/', 'Penjualan\PiutangJasaTimbangController@index');
    Route::get('/list', 'Penjualan\PiutangJasaTimbangController@list');

    Route::post('/pelunasan', 'Penjualan\PiutangJasaTimbangController@pelunasan');
  });

  Route::group(['prefix' => 'dp-konsumen'], function () {
    Route::get('/', 'Penjualan\DPKonsumenController@index');
    Route::get('/list', 'Penjualan\DPKonsumenController@list');

    Route::post('/store', 'Penjualan\DPKonsumenController@store');
    Route::post('/update', 'Penjualan\DPKonsumenController@update');
    Route::post('/request-data', 'Penjualan\DPKonsumenController@requestdata');
    Route::post('/drop', 'Penjualan\DPKonsumenController@drop');

    Route::post('/getdpkonsumen', 'Penjualan\DPKonsumenController@getdpkonsumen');
  });

  Route::group(['prefix' => 'pengembalian-dp-konsumen'], function () {
    Route::get('/', 'Penjualan\PengembalianDPKonsumenController@index');
    Route::get('/list', 'Penjualan\PengembalianDPKonsumenController@list');

    Route::post('/store', 'Penjualan\PengembalianDPKonsumenController@store');
    Route::post('/update', 'Penjualan\PengembalianDPKonsumenController@update');
    Route::post('/request-data', 'Penjualan\PengembalianDPKonsumenController@requestdata');
    Route::post('/drop', 'Penjualan\PengembalianDPKonsumenController@drop');
  });

  Route::get('/print-data/{param}', 'Penjualan\PenjualanUmumController@print_data');

  Route::get('/print-surat-jalan/{param}', 'Penjualan\PenjualanUmumController@print_surat_jalan');
});

Route::group(['prefix' => 'jasa'], function () {

  Route::group(['prefix' => 'dropshipper'], function () {
    Route::get('/', 'Jasa\DropshipperController@index');
    Route::get('/list', 'Jasa\DropshipperController@list');

    Route::post('/store', 'Jasa\DropshipperController@store');
    Route::post('/update', 'Jasa\DropshipperController@update');
    Route::post('/request-data', 'Jasa\DropshipperController@requestdata');
    Route::post('/request-data-utangdp', 'Jasa\DropshipperController@requestdata_utangdp');
    Route::post('/drop', 'Jasa\DropshipperController@drop');

    Route::post('/update-pembelian', 'Jasa\DropshipperController@update_pembelian');
    Route::post('/update-penjualan', 'Jasa\DropshipperController@update_penjualan');

    Route::post('/cancel-update-pembelian', 'Jasa\DropshipperController@cancel_update_pembelian');
    Route::post('/cancel-update-penjualan', 'Jasa\DropshipperController@cancel_update_penjualan');


    Route::group(['prefix' => 'detil-biaya'], function () {
      // input data timbangan

      Route::get('/detil/{param}', 'Jasa\DetilBiayaController@index_detil');
      Route::get('/list-detil', 'Jasa\DetilBiayaController@listdetil');

      Route::post('/store-detil', 'Jasa\DetilBiayaController@store_detil');
      Route::post('/update-detil', 'Jasa\DetilBiayaController@update_detil');
      Route::post('/drop-detil', 'Jasa\DetilBiayaController@drop_detil');
      Route::post('/bayar', 'Jasa\DetilBiayaController@bayar');
      Route::post('/request-data-detil', 'Jasa\DetilBiayaController@requestdata_detil');
      Route::post('/request-total-detil', 'Jasa\DetilBiayaController@requesttotal_detil');
      Route::post('/batalkanpelunasan', 'Jasa\DetilBiayaController@batalkanpelunasan');
    });
  });

  Route::group(['prefix' => 'dp-penampung'], function () {
    Route::get('/', 'Jasa\DPPenampungController@index');
    Route::get('/list', 'Jasa\DPPenampungController@list');

    Route::post('/store', 'Jasa\DPPenampungController@store');
    Route::post('/update', 'Jasa\DPPenampungController@update');
    Route::post('/request-data', 'Jasa\DPPenampungController@requestdata');
    Route::post('/drop', 'Jasa\DPPenampungController@drop');
  });

  Route::group(['prefix' => 'komisi'], function () {
    Route::get('/', 'Jasa\KomisiController@index');
    Route::get('/list', 'Jasa\KomisiController@list');

    Route::post('/store', 'Jasa\KomisiController@store');
    Route::post('/update', 'Jasa\KomisiController@update');
    Route::post('/request-data', 'Jasa\KomisiController@requestdata');
    Route::post('/drop', 'Jasa\KomisiController@drop');
  });

  Route::group(['prefix' => 'surat-jalan'], function () {
    Route::get('/', 'Jasa\SuratJalanController@index');
    Route::get('/list', 'Jasa\SuratJalanController@list');

    Route::post('/store', 'Jasa\SuratJalanController@store');
    Route::post('/update', 'Jasa\SuratJalanController@update');
    Route::post('/request-data', 'Jasa\SuratJalanController@requestdata');
    Route::post('/drop', 'Jasa\SuratJalanController@drop');

    Route::get('/print/{param}', 'Jasa\SuratJalanController@print');
  });

  Route::group(['prefix' => 'update-surat-jalan'], function () {
    Route::get('/', 'Jasa\UpdateSuratJalanController@index');
    Route::get('/list', 'Jasa\UpdateSuratJalanController@list');

    Route::post('/update', 'Jasa\UpdateSuratJalanController@update');
  });
});

Route::group(['prefix' => 'pinjaman-karyawan'], function () {

  Route::group(['prefix' => 'pengajuan'], function () {
    Route::get('/', 'PinjamanKaryawan\PengajuanController@index');
    Route::get('/list', 'PinjamanKaryawan\PengajuanController@list');

    Route::post('/store', 'PinjamanKaryawan\PengajuanController@store');
    Route::post('/update', 'PinjamanKaryawan\PengajuanController@update');
    Route::post('/request-data', 'PinjamanKaryawan\PengajuanController@requestdata');
    Route::post('/drop', 'PinjamanKaryawan\PengajuanController@drop');

    Route::post('/getpinjamankaryawan', 'PinjamanKaryawan\PengajuanController@getpinjamankaryawan');

    Route::get('/print-data/{param}', 'PinjamanKaryawan\PengajuanController@print_data');
  });

  Route::group(['prefix' => 'approve-pengajuan'], function () {
    Route::get('/', 'PinjamanKaryawan\ApprovePengajuanController@index');
    Route::get('/list', 'PinjamanKaryawan\ApprovePengajuanController@list');

    Route::post('/approve', 'PinjamanKaryawan\ApprovePengajuanController@approve');
    Route::post('/tolak', 'PinjamanKaryawan\ApprovePengajuanController@tolak');
  });

  Route::group(['prefix' => 'pengembalian-pinjaman'], function () {
    Route::get('/', 'PinjamanKaryawan\PengembalianPinjamanController@index');
    Route::get('/list', 'PinjamanKaryawan\PengembalianPinjamanController@list');

    Route::post('/store', 'PinjamanKaryawan\PengembalianPinjamanController@store');
    Route::post('/update', 'PinjamanKaryawan\PengembalianPinjamanController@update');
    Route::post('/request-data', 'PinjamanKaryawan\PengembalianPinjamanController@requestdata');
    Route::post('/drop', 'PinjamanKaryawan\PengembalianPinjamanController@drop');

    Route::post('/getpinjamankaryawan', 'PinjamanKaryawan\PengembalianPinjamanController@getpinjamankaryawan');
  });
});

Route::group(['prefix' => 'ijin-cuti-karyawan'], function () {

  Route::group(['prefix' => 'pengajuan'], function () {
    Route::get('/', 'IjinCutiKaryawan\PengajuanController@index');
    Route::get('/list', 'IjinCutiKaryawan\PengajuanController@list');

    Route::post('/store', 'IjinCutiKaryawan\PengajuanController@store');
    Route::post('/update', 'IjinCutiKaryawan\PengajuanController@update');
    Route::post('/request-data', 'IjinCutiKaryawan\PengajuanController@requestdata');
    Route::post('/drop', 'IjinCutiKaryawan\PengajuanController@drop');
  });

  Route::group(['prefix' => 'approve-pengajuan'], function () {
    Route::get('/', 'IjinCutiKaryawan\ApprovePengajuanController@index');
    Route::get('/list', 'IjinCutiKaryawan\ApprovePengajuanController@list');

    Route::post('/approve', 'IjinCutiKaryawan\ApprovePengajuanController@approve');
    Route::post('/tolak', 'IjinCutiKaryawan\ApprovePengajuanController@tolak');
  });
});

Route::group(['prefix' => 'asset'], function () {

  Route::group(['prefix' => 'post-jurnal'], function () {
    Route::get('/', 'Asset\PostJurnalController@index');
    Route::get('/list', 'Asset\PostJurnalController@list');

    Route::post('/approve', 'Asset\PostJurnalController@approve');
  });

  Route::group(['prefix' => 'pengeluaran-asset'], function () {
    Route::get('/', 'Asset\PengeluaranAssetController@index');
    Route::get('/list', 'Asset\PengeluaranAssetController@list');

    Route::post('/store', 'Asset\PengeluaranAssetController@store');
    Route::post('/update', 'Asset\PengeluaranAssetController@update');
    Route::post('/request-data', 'Asset\PengeluaranAssetController@requestdata');
    Route::post('/drop', 'Asset\PengeluaranAssetController@drop');
  });

  Route::group(['prefix' => 'penyusutan-asset'], function () {
    Route::get('/', 'Asset\PenyusutanAssetController@index');
    Route::get('/list', 'Asset\PenyusutanAssetController@list');

    Route::post('/store', 'Asset\PenyusutanAssetController@store');
    Route::post('/update', 'Asset\PenyusutanAssetController@update');
    Route::post('/request-data', 'Asset\PenyusutanAssetController@requestdata');
    Route::post('/drop', 'Asset\PenyusutanAssetController@drop');
  });

  Route::group(['prefix' => 'proses-penyusutan'], function () {
    Route::get('/', 'Asset\ProsesPenyusutanController@index');
    Route::get('/list', 'Asset\ProsesPenyusutanController@list');

    Route::post('/store', 'Asset\ProsesPenyusutanController@store');
  });
});

Route::group(['prefix' => 'config-absensi'], function () {

  Route::group(['prefix' => 'global'], function () {
    Route::get('/', 'ConfigAbsensi\GlobalController@index');
    Route::post('/update', 'ConfigAbsensi\GlobalController@update');
    Route::post('/request-data', 'ConfigAbsensi\GlobalController@requestdata');
  });

  Route::group(['prefix' => 'perkaryawan'], function () {
    Route::get('/', 'ConfigAbsensi\PerkaryawanController@index');
    Route::get('/list', 'ConfigAbsensi\PerkaryawanController@list');

    Route::post('/store', 'ConfigAbsensi\PerkaryawanController@store');
    Route::post('/update', 'ConfigAbsensi\PerkaryawanController@update');
    Route::post('/request-data', 'ConfigAbsensi\PerkaryawanController@requestdata');
    Route::post('/drop', 'ConfigAbsensi\PerkaryawanController@drop');
  });

  Route::group(['prefix' => 'template'], function () {
    Route::get('/', 'ConfigAbsensi\TemplateController@index');
    Route::get('/list', 'ConfigAbsensi\TemplateController@list');

    Route::post('/store', 'ConfigAbsensi\TemplateController@store');
    Route::post('/update', 'ConfigAbsensi\TemplateController@update');
    Route::post('/request-data', 'ConfigAbsensi\TemplateController@requestdata');
    Route::post('/drop', 'ConfigAbsensi\TemplateController@drop');
  });

  Route::group(['prefix' => 'shift'], function () {
    Route::get('/', 'ConfigAbsensi\ShiftController@index');
    Route::get('/list', 'ConfigAbsensi\ShiftController@list');

    Route::post('/store', 'ConfigAbsensi\ShiftController@store');
    Route::post('/update', 'ConfigAbsensi\ShiftController@update');
    Route::post('/request-data', 'ConfigAbsensi\ShiftController@requestdata');
    Route::post('/drop', 'ConfigAbsensi\ShiftController@drop');
  });

  Route::group(['prefix' => 'mesin'], function () {
    Route::get('/', 'ConfigAbsensi\MesinController@index');
    Route::get('/list', 'ConfigAbsensi\MesinController@list');

    Route::post('/store', 'ConfigAbsensi\MesinController@store');
    Route::post('/update', 'ConfigAbsensi\MesinController@update');
    Route::post('/request-data', 'ConfigAbsensi\MesinController@requestdata');
    Route::post('/drop', 'ConfigAbsensi\MesinController@drop');
  });

  Route::group(['prefix' => 'import'], function () {
    Route::get('/', 'ConfigAbsensi\ImportController@index_upload');
    Route::get('/list', 'ConfigAbsensi\ImportController@list_upload');
    Route::get('/list-detail', 'ConfigAbsensi\ImportController@list_upload_detail');

    Route::post('/upload-file', 'ConfigAbsensi\ImportController@upload_file');
    Route::post('/drop', 'ConfigAbsensi\ImportController@drop_upload_data');
  });

  Route::group(['prefix' => 'tarik-absen'], function () {
    Route::get('/', 'ConfigAbsensi\TarikAbsensiController@index');
    Route::get('/list', 'ConfigAbsensi\TarikAbsensiController@list');

    Route::post('/store', 'ConfigAbsensi\TarikAbsensiController@store');
  });
});

Route::group(['prefix' => 'laporan-absensi'], function () {

  Route::group(['prefix' => 'data-presensi'], function () {
    Route::get('/list-detail', 'LaporanAbsensi\LaporanController@list_presensi');
  });

  Route::group(['prefix' => 'laporan'], function () {
    Route::get('/', 'LaporanAbsensi\LaporanController@index');
    Route::get('/list-detail', 'LaporanAbsensi\LaporanController@list_detail');
  });

  Route::group(['prefix' => 'laporan-rekap'], function () {
    Route::get('/', 'LaporanAbsensi\LaporanController@index_rekap');
    Route::get('/list-detail', 'LaporanAbsensi\LaporanController@list_detail_rekap');
  });
});


Route::group(['prefix' => 'payroll'], function () {

  Route::group(['prefix' => 'bulk-payroll'], function () {

    // home payroll

    Route::get('/', 'Payroll\BulkPayrollController@index');
    Route::post('/store', 'Payroll\BulkPayrollController@store');
    Route::post('/request-data-payroll', 'Payroll\BulkPayrollController@requestdatapayroll');

    // input data

    Route::get('/detil/{param}', 'Payroll\BulkPayrollController@index_detil');
    Route::get('/list-detil', 'Payroll\BulkPayrollController@listdetil');

    Route::post('/store-detil', 'Payroll\BulkPayrollController@store_detil');
    Route::post('/update-detil', 'Payroll\BulkPayrollController@update_detil');
    Route::post('/input-tara', 'Payroll\BulkPayrollController@input_tara');
    Route::post('/drop-detil', 'Payroll\BulkPayrollController@drop_detil');
    Route::post('/request-data-detil', 'Payroll\BulkPayrollController@requestdata_detil');
    Route::post('/request-total-detil', 'Payroll\BulkPayrollController@requesttotal_detil');

    Route::post('/proses-detil', 'Payroll\BulkPayrollController@proses_detil');

    // list payroll

    Route::get('/list-payroll', 'Payroll\BulkPayrollController@index_list');
    Route::get('/list-data-payroll', 'Payroll\BulkPayrollController@list_datapayroll');

    Route::get('/list-approve-payroll', 'Payroll\BulkPayrollController@index_approvelist');
    Route::get('/list-data-approve-payroll', 'Payroll\BulkPayrollController@list_approvedatapayroll');

    Route::post('/approve', 'Payroll\BulkPayrollController@approve_payroll');
    Route::post('/reject', 'Payroll\BulkPayrollController@reject_payroll');
    Route::post('/drop', 'Payroll\BulkPayrollController@drop_payroll');

    // view data

    Route::get('/view-detil/{param}', 'Payroll\BulkPayrollController@index_view_detil');

    // edit data

    Route::get('/edit-detil/{param}', 'Payroll\BulkPayrollController@index_edit_detil');
    Route::post('/proses-edit-detil', 'Payroll\BulkPayrollController@proses_edit_detil');

    Route::get('/list-detil-print', 'Payroll\BulkPayrollController@listdetilprint');

    Route::get('/print-data/{param}', 'Payroll\BulkPayrollController@print_data');
  });
});

Route::group(['prefix' => 'kas'], function () {

  Route::group(['prefix' => 'giro-cek'], function () {
    Route::get('/', 'Kas\GiroCekController@index');
    Route::get('/list', 'Kas\GiroCekController@list');

    Route::post('/store', 'Kas\GiroCekController@store');
    Route::post('/update', 'Kas\GiroCekController@update');
    Route::post('/request-data', 'Kas\GiroCekController@requestdata');
    Route::post('/drop', 'Kas\GiroCekController@drop');
  });
});

Route::group(['prefix' => 'report'], function () {

  Route::group(['prefix' => 'total-penjualan'], function () {
    Route::get('/', 'Report\TotalPenjualanController@index');
    Route::get('/list-detil', 'Report\TotalPenjualanController@list_detil');
  });

  Route::group(['prefix' => 'so-stock-kurang'], function () {
    Route::get('/', 'Report\SoStockKurangController@index');
    Route::get('/list', 'Report\SoStockKurangController@list');
  });

  Route::group(['prefix' => 'toko-gudang'], function () {
    Route::get('/', 'Report\TokoGudangController@index');
    Route::get('/list', 'Report\TokoGudangController@list');
  });

  Route::group(['prefix' => 'gudang-toko'], function () {
    Route::get('/', 'Report\GudangTokoController@index');
    Route::get('/list', 'Report\GudangTokoController@list');
  });

  Route::group(['prefix' => 'giro-cek'], function () {
    Route::get('/', 'Report\GiroCekController@index');
    Route::get('/list', 'Report\GiroCekController@list');
  });

  Route::group(['prefix' => 'stok-barang-beli'], function () {
    Route::get('/', 'Report\StockBarangController@index');
    Route::get('/list', 'Report\StockBarangController@list');
  });

  Route::group(['prefix' => 'mutasi-masuk'], function () {
    Route::get('/', 'Report\MutasiController@index_masuk');
    Route::get('/list', 'Report\MutasiController@list_masuk');
  });

  Route::group(['prefix' => 'mutasi-keluar'], function () {
    Route::get('/', 'Report\MutasiController@index_keluar');
    Route::get('/list', 'Report\MutasiController@list_keluar');
  });

  Route::group(['prefix' => 'mutasi-barang'], function () {
    Route::get('/', 'Report\MutasiBarangController@index');
    Route::get('/list-detil', 'Report\MutasiBarangController@list_detil');
  });

  Route::group(['prefix' => 'pelunasan-hutang'], function () {
    Route::get('/', 'Report\HutangController@index');
    Route::get('/list', 'Report\HutangController@list');
  });

  Route::group(['prefix' => 'laporan-piutang'], function () {
    Route::get('/', 'Report\LaporanPiutangController@index');
    Route::get('/list', 'Report\LaporanPiutangController@list');
  });

  Route::group(['prefix' => 'pelunasan-piutang'], function () {
    Route::get('/', 'Report\PiutangController@index');
    Route::get('/list', 'Report\PiutangController@list');
  });

  Route::group(['prefix' => 'cancel-pelunasan-hutang'], function () {
    Route::get('/', 'Report\CancelHutangController@index');
    Route::get('/list', 'Report\CancelHutangController@list');
  });

  Route::group(['prefix' => 'cancel-pelunasan-piutang'], function () {
    Route::get('/', 'Report\CancelPiutangController@index');
    Route::get('/list', 'Report\CancelPiutangController@list');
  });

  Route::group(['prefix' => 'pembelian'], function () {
    Route::get('/', 'Report\PembelianController@index');
    Route::get('/list', 'Report\PembelianController@list');
    Route::get('/list-detil', 'Report\PembelianController@list_detil');
    Route::get('/list-uangpegangan', 'Report\PembelianController@list_uangpegangan');
  });

  Route::group(['prefix' => 'bulk-payroll'], function () {
    Route::get('/', 'Report\BulkPayrollController@index');
    Route::get('/list', 'Report\BulkPayrollController@list');
    Route::get('/list-detil', 'Report\BulkPayrollController@list_detil');
  });

  Route::group(['prefix' => 'lap-bulk-payroll'], function () {
    Route::get('/', 'Report\BulkPayrollController@index_details');
    Route::get('/list', 'Report\BulkPayrollController@list_details');
  });

  Route::group(['prefix' => 'trash-pembelian'], function () {
    Route::get('/', 'Report\TrashPembelianController@index');
    Route::get('/list', 'Report\TrashPembelianController@list');
    Route::get('/list-detil', 'Report\TrashPembelianController@list_detil');
    Route::get('/list-detils', 'Report\TrashPembelianController@list_detils');
    Route::get('/list-uangpegangan', 'Report\TrashPembelianController@list_uangpegangan');
  });

  Route::group(['prefix' => 'dropshipper'], function () {
    Route::get('/', 'Report\DropshipperController@index');
    Route::get('/list', 'Report\DropshipperController@list');
    Route::get('/list-dp', 'Report\DropshipperController@list_dp');
  });

  Route::group(['prefix' => 'pembelian-umum'], function () {
    Route::get('/', 'Report\PembelianUmumController@index');
    Route::get('/list-detil', 'Report\PembelianUmumController@list_detil');
  });

  Route::group(['prefix' => 'rekap-penjualan'], function () {
    Route::get('/', 'Report\RekapPenjualanController@index');
    Route::get('/list-detil', 'Report\RekapPenjualanController@list_detil');
  });

  Route::group(['prefix' => 'kartu-piutang-penampung'], function () {
    Route::get('/', 'Report\KartuPiutangPenampungController@index');
    Route::get('/list-detil', 'Report\KartuPiutangPenampungController@list_detil');
  });

  Route::group(['prefix' => 'kartu-piutang-konsumen'], function () {
    Route::get('/', 'Report\KartuPiutangKonsumenController@index');
    Route::get('/list-detil', 'Report\KartuPiutangKonsumenController@list_detil');
  });

  Route::group(['prefix' => 'kartu-piutang-karyawan'], function () {
    Route::get('/', 'Report\KartuPiutangKaryawanController@index');
    Route::get('/list-detil', 'Report\KartuPiutangKaryawanController@list_detil');
  });

  Route::group(['prefix' => 'pembelian-logam'], function () {
    Route::get('/', 'Report\PembelianLogamController@index');
    Route::get('/list-detil', 'Report\PembelianLogamController@list_detil');
  });

  Route::group(['prefix' => 'laporan-kantor'], function () {
    Route::get('/', 'Report\LaporanKantorController@index');
    Route::get('/list-detil', 'Report\LaporanKantorController@list_detil');
  });

  Route::group(['prefix' => 'laporan-lr-perdivisi'], function () {
    Route::get('/', 'Report\LabaRugiPerdivisiController@index');
    Route::get('/list-detil', 'Report\LabaRugiPerdivisiController@list_detil');
  });

  Route::group(['prefix' => 'pembelian-harian'], function () {
    Route::get('/date/{param}', 'Report\PembelianHarianController@index');
    Route::get('/date-masuk/{param}', 'Report\PembelianHarianController@index_masuk');
    Route::get('/date-hasil-timbang/{param}', 'Report\PembelianHarianController@index_hasil_timbang');
  });

  Route::group(['prefix' => 'laba-rugi-supplier-dropshipper'], function () {
    Route::get('/', 'Report\LabaRugiSupplierDropshipperController@index');
    Route::get('/list-detil', 'Report\LabaRugiSupplierDropshipperController@list_detil');
  });

  Route::group(['prefix' => 'penjualan'], function () {
    Route::get('/', 'Report\PenjualanController@index');
    Route::get('/list', 'Report\PenjualanController@list');
    Route::get('/list-detil', 'Report\PenjualanController@list_detil');
  });

  Route::group(['prefix' => 'trash-penjualan'], function () {
    Route::get('/', 'Report\TrashPenjualanController@index');
    Route::get('/list', 'Report\TrashPenjualanController@list');
    Route::get('/list-detil', 'Report\TrashPenjualanController@list_detil');
    Route::get('/list-detils', 'Report\TrashPenjualanController@list_detils');
  });

  Route::group(['prefix' => 'rekap-pinjaman-penampung'], function () {
    Route::get('/', 'Report\RekapPinjamanPenampung@index');
    Route::get('/list', 'Report\RekapPinjamanPenampung@list');
  });

  Route::group(['prefix' => 'rekap-pinjaman-konsumen'], function () {
    Route::get('/', 'Report\RekapPinjamanKonsumen@index');
    Route::get('/list', 'Report\RekapPinjamanKonsumen@list');
  });

  Route::group(['prefix' => 'rekap-pinjaman-karyawan'], function () {
    Route::get('/', 'Report\RekapPinjamanKaryawan@index');
    Route::get('/list', 'Report\RekapPinjamanKaryawan@list');
  });

  Route::group(['prefix' => 'pengeluaran-operasional'], function () {
    Route::get('/', 'Report\PengeluaranController@index_operasional');
    Route::get('/list', 'Report\PengeluaranController@list_operasional');
  });

  Route::group(['prefix' => 'pengeluaran-asset'], function () {
    Route::get('/', 'Report\PengeluaranAssetController@index_operasional');
    Route::get('/list', 'Report\PengeluaranAssetController@list_operasional');
  });

  Route::group(['prefix' => 'pendapatan-lainlain'], function () {
    Route::get('/', 'Report\PendapatanLainLainController@index');
    Route::get('/list', 'Report\PendapatanLainLainController@list');
  });

  Route::group(['prefix' => 'dp-penampung'], function () {
    Route::get('/', 'Report\DPPenampungController@index');
    Route::get('/list', 'Report\DPPenampungController@list');
  });

  // accouting

  Route::group(['prefix' => 'laba-rugi-dropshipper'], function () {
    Route::get('/', 'Report\LabaRugiDropshipperController@index');
    Route::post('/get-data', 'Report\LabaRugiDropshipperController@get_data');
  });

  Route::group(['prefix' => 'laba-rugi'], function () {
    Route::get('/', 'Report\LabaRugiController@index');
    Route::post('/get-data', 'Report\LabaRugiController@get_data');
  });

  Route::group(['prefix' => 'neraca'], function () {
    Route::get('/', 'Report\NeracaController@index');
    Route::post('/get-data', 'Report\NeracaController@get_data');
  });

  Route::group(['prefix' => 'keseluruhan-jurnal'], function () {
    Route::get('/', 'Report\KeseluruhanJurnalController@index');
    Route::get('/list-detil', 'Report\KeseluruhanJurnalController@list_detil');
  });

  Route::group(['prefix' => 'bukubesar-rinci'], function () {
    Route::get('/', 'Report\BukuBesarRinciController@index');
    Route::get('/list-detil', 'Report\BukuBesarRinciController@list_detil');
  });
});

Route::post('/setting', 'PengaturanController@insertOrUpdate');

Route::get('/light-mode', 'PengaturanController@lightmode');

Route::get('/dark-mode', 'PengaturanController@darkmode');

// Route url
Route::get('/', function () {
  return redirect('home');
});

Route::get('/home', 'DashboardController@home');

Auth::routes();

Route::post('/login/validate', 'Auth\LoginController@validate_api');
