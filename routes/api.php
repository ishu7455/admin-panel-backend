<?php

use App\Http\Controllers\admin\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\MicrosoftController;
use App\Http\Controllers\FileController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/auth/microsoft/redirect', [MicrosoftController::class, 'redirect']);
Route::get('/auth/microsoft/callback', [MicrosoftController::class, 'callback']);
Route::get('/get-roles', [UserController::class, 'getRoles']);
Route::post('/create-or-update-user', [UserController::class, 'store']);
Route::get('/users', [UserController::class, 'index']);
Route::get('/get-user/{id}', [UserController::class, 'getUser']);
Route::get('/delete-user/{id}', [UserController::class, 'delete']);
Route::post('/file', [FileController::class, 'storeOrUpdate']);
Route::get('/get-file/{id}', [FileController::class, 'getFile']);
Route::get('/get-files-users', [FileController::class, 'getUsers']);
Route::get('/get-categories', [FileController::class, 'getcategories']);
Route::get('/doc-checklists/{categoryId}', [FileController::class, 'getByCategory']);
Route::post('/checklists/upload', [FileController::class, 'upload']);











