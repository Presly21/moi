<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\TodoController;

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('todos/index',[App\Http\Controllers\TodoController::class,'index'])->name('todos.index');
Route::get('todos/create',[App\Http\Controllers\TodoController::class,'create'])->name('todos.create');
Route::post('todos/store',[App\Http\Controllers\TodoController::class,'store'])->name('todos.store');