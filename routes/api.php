<?php

use App\Http\Controllers\admin\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\MicrosoftController;
use App\Http\Controllers\CheckListController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\NoteController;

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

Route::middleware('auth:api')->group(function () {

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
Route::post('/checklists/update-custom', [FileController::class, 'updateCustom']);
Route::post('/checklists/add-multiple', [FileController::class, 'addMultiple']);
Route::get('/custom-doc-checklists/{applicantId}', [FileController::class, 'getCustomChecklist']);
Route::get('/get-applicants', [FileController::class, 'applicant']);
Route::delete('/checklists/custom-delete/{id}', [FileController::class, 'destroyCustomDoc']);
Route::get('/custom-checklists/{applicantId}', [CheckListController::class, 'getCustomChecklist']);
Route::post('/checklists/custom-toggle-status/{id}', [ChecklistController::class, 'toggleStatus']);
Route::post('/checklists/add-multiple-checklist', [ChecklistController::class, 'addMultiple']);
Route::delete('/checklists/custom-list-delete/{id}', [ChecklistController::class, 'destroyCustomDoc']);
Route::get('/checklists/{categoryId}', [ChecklistController::class, 'getByCategory']);
Route::post('/checklists/toggle-status', [ChecklistController::class, 'UpdateChecklistStatus']);
Route::post('/notes/add-multiple-notes', [NoteController::class, 'addMultiple']);




});














