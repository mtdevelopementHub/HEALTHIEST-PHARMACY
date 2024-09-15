<?php

namespace App\Observers;

use App\Models\Pharmacy;
use App\Jobs\SavePharmacyCoordinates;

class PharmacyObserver
{
    public function __construct(private \App\Libraries\Customer\Pharmacy $pharmacyModule)
    {
        //
    }

    /**
     * Handle the Pharmacy "created" event.
     */
    public function created(Pharmacy $pharmacy): void
    {
        //
    }

    /**
     * Handle the Pharmacy "updated" event.
     */
    public function updated(Pharmacy $pharmacy): void
    {
        //
    }

    /**
     * Handle the Pharmacy "deleted" event.
     */
    public function deleted(Pharmacy $pharmacy): void
    {
        //
    }

    /**
     * Handle the Pharmacy "restored" event.
     */
    public function restored(Pharmacy $pharmacy): void
    {
        //
    }

    /**
     * Handle the Pharmacy "force deleted" event.
     */
    public function forceDeleted(Pharmacy $pharmacy): void
    {
        //
    }

    /**
     * Handle the Pharmacy "force deleted" event.
     */
    public function saved(Pharmacy $pharmacy): void
    {
        SavePharmacyCoordinates::dispatch($pharmacy, $this->pharmacyModule);
    }
}
