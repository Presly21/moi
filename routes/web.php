<?php

use App\Http\Controllers\authcontroller;
use App\Http\Controllers\DashbaordController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/',[authcontroller::class,'login']);
Route::post('login',[authcontroller::class,'AuthLogin']);
Route::get('logout',[authcontroller::class,'logout']);
Route::get('forgot-password',[authcontroller::class,'forgotpassword']);
Route::post('forgot-password',[authcontroller::class,'PostForgotPassword']);
Route::get('admin/dashbaord', function () {
    return view('admin.dashbaord');
});
Route::get('admin/admin/list', function () {
    return view('admin.admin.list');
});

Route::group(['middleware' =>'admin'],function(){
    Route::get('admin/dashbaord',[DashbaordController::class,'dashbaord']);
});
Route::group(['middleware' =>'teacher'],function(){
    Route::get('teacher/dashbaord',[DashbaordController::class,'dashbaord']);
});
Route::group(['middleware' =>'student'],function(){
    Route::get('student/dashbaord',[DashbaordController::class,'dashbaord']);
});
Route::group(['middleware' =>'parent'],function(){
    Route::get('parent/dashbaord',[DashbaordController::class,'dashbaord']);
});

