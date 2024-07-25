<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class MenuServiceProvider extends ServiceProvider
{
  /**
   * Register services.
   *
   * @return void
   */
  public function register()
  {
    //
  }

  /**
   * Bootstrap services.
   *
   * @return void
   */

  public function boot()
  {
    // get all data from menu.json file
    $MenuJson_SuperAdmin = file_get_contents(base_path('resources/json/MenuSuperAdmin.json'));
    $MenuData_SuperAdmin = json_decode($MenuJson_SuperAdmin);
    $MenuJson_Owner = file_get_contents(base_path('resources/json/MenuOwner.json'));
    $MenuData_Owner = json_decode($MenuJson_Owner);
    $MenuJson_Supervisor = file_get_contents(base_path('resources/json/MenuSupervisor.json'));
    $MenuData_Supervisor = json_decode($MenuJson_Supervisor);
    $MenuJson_StaffPabrik = file_get_contents(base_path('resources/json/MenuStaffPabrik.json'));
    $MenuData_StaffPabrik = json_decode($MenuJson_StaffPabrik);
    $MenuJson_StaffKA = file_get_contents(base_path('resources/json/MenuStaffKA.json'));
    $MenuData_StaffKA = json_decode($MenuJson_StaffKA);
    $MenuJson_StaffKB = file_get_contents(base_path('resources/json/MenuStaffKB.json'));
    $MenuData_StaffKB = json_decode($MenuJson_StaffKB);
    $MenuJson_Kasir = file_get_contents(base_path('resources/json/MenuKasir.json'));
    $MenuData_Kasir = json_decode($MenuJson_Kasir);
    $MenuJson_Sales = file_get_contents(base_path('resources/json/MenuSales.json'));
    $MenuData_Sales = json_decode($MenuJson_Sales);

    // Share all menuData to all the views
    \View::share('menuData', [$MenuData_SuperAdmin, $MenuData_Owner, $MenuData_Supervisor, $MenuData_StaffPabrik, $MenuData_StaffKA, $MenuData_StaffKB, $MenuData_Kasir, $MenuData_Sales]);
  }
}
