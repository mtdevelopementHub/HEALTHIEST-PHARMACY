<?php

use App\Http\Controllers\Api\Customer\Auth\AuthController;
use App\Http\Controllers\Api\Customer\CustomerController;
use App\Http\Controllers\Api\Customer\OrderController;
use App\Http\Controllers\Api\Seller\MedicineController;
use App\Http\Controllers\Api\Seller\PharmacyController;
use App\Http\Controllers\Api\Seller\RiderController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API - v1 Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Auth Routes

Route::prefix('customer')->controller(AuthController::class)->name('customer.')->group(function () {

    Route::post('/register', 'register')->name('register');
    Route::post('/login', 'login')->name('login');
});

Route::prefix('seller')->controller(\App\Http\Controllers\Api\Seller\Auth\AuthController::class)->name('seller.')->group(function () {

    Route::post('/register', 'register')->name('register');
    Route::post('/login', 'login')->name('login');
});

// Production Routes

Route::middleware('auth:sanctum')->group(function () {  

    Route::prefix('pharmacy')->controller(PharmacyController::class)->name('pharmacy.')->group(function () {

        Route::get('/list', 'list')->name('list');
        Route::post('/add', 'add')->name('add');
        Route::get('/edit/{id}', 'edit')->name('edit');
        Route::post('/update/{id}', 'update')->name('update');
        Route::get('/delete/{id}', 'delete')->name('delete');
        Route::get('/orders/{id}', 'orders')->name('order.list');
    });

    Route::prefix('medicine')->controller(MedicineController::class)->name('medicine.')->group(function () {

        Route::get('/list/{id}', 'list')->name('list');
        Route::post('/add/{id}', 'add')->name('add');
        Route::get('/edit/{id}', 'edit')->name('edit');
        Route::post('/update/{id}/{pharmacy_id}', 'update')->name('update');
        Route::get('/delete/{id}', 'delete')->name('delete');
        Route::post('/edit-status', 'editStatus')->name('edit.status');
        Route::get('/prescriptions/{id}', 'prescriptions')->name('prescription.list');             
    });

    Route::prefix('customer')->name('customer.')->group(function () {

        Route::controller(CustomerController::class)->group(function () {
            Route::get('/default-medicines', 'defaultMedicines')->name('default.medicines');
            Route::get('/search-medicines/{text}', 'searchMedicines')->name('search.medicines');
            Route::get('/category-medicines/{id}', 'categoryMedicines')->name('category.medicines');
            Route::get('/nearest-medicines', 'nearestMedicines')->name('nearest.medicines');
            Route::post('/add-prescription/{id}', 'addPrescription')->name('add.prescription');
            Route::get('/view-medicine/{id}', 'viewMedicine')->name('view.medicines');
            Route::post('/search-nearest-medicines/{text}', 'searchNearestMedicines')->name('search.nearest.medicines');
            Route::post('/add-medicine-quantity/{id}', 'addMedicineQuantity')->name('add.medicine.quantity');
            Route::get('/test', 'test')->name('test');            
        });

        Route::prefix('order')->controller(OrderController::class)->name('order.')->group(function () {
            Route::get('/list', 'list')->name('list');
            Route::post('/create', 'create')->name('create');
            Route::post('/edit-status/{id}', 'editStatus')->name('edit.status');
            Route::post('/update-status/{id}', 'updateStatus')->name('update.status');
        });
        
    });

    Route::prefix('seller')->controller(RiderController::class)->name('seller.')->group(function () {

        Route::get('/riders/{id}', 'list')->name('riders');
        Route::post('/add-rider/{id}', 'add')->name('add.rider');
        Route::get('/delete-rider/{id}', 'delete')->name('delete.rider');
    });

    // Logout Route
    Route::controller(AuthController::class)->group(function () {
        Route::post('/logout', 'logout')->name('logout');
    });
});