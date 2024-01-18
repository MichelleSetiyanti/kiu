<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group([
  'prefix' => 'timbangan'
], function() {
  Route::post('process', 'TimbanganController@processData');
});

Route::group([
  'prefix' => 'crud'
], function(){
  Route::get('getVendor', 'MasterData\VendorController@getVendorApi');
  Route::get('getMuatan', 'MasterData\MuatanController@getMuatanApi');
  Route::get('getMuatanDetil', 'MasterData\MuatanDetilController@getMuatanDetilApi');
  Route::get('getKendaraan', 'MasterData\KendaraanController@getKendaraanApi');

  Route::patch('setActVendor/{id}', 'MasterData\VendorController@setAct');
  Route::patch('setActMuatan/{id}', 'MasterData\MuatanController@setAct');
  Route::patch('setActMuatanDetil/{id}', 'MasterData\MuatanDetilController@setAct');
  Route::patch('setActKendaraan/{id}', 'MasterData\KendaraanController@setAct');
});


Route::group([
  'prefix' => 'auth'
], function () {
  Route::post('login', 'AuthController@login');
  Route::post('register', 'AuthController@register');

  Route::group([
    'middleware' => 'auth:api'
  ], function() {
      Route::get('logout', 'AuthController@logout');
      Route::get('user', 'AuthController@user');
  });

});

