<?php

namespace App\Providers;

// use App\Models\User;
// use App\Observers\UserObserver;
use App\Models\Order;
use App\Models\Pharmacy;
use App\Observers\OrderObserver;
use App\Observers\PharmacyObserver;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Pharmacy::observe(PharmacyObserver::class);
        Order::observe(OrderObserver::class);
        // User::observe(UserObserver::class);
    }
}
