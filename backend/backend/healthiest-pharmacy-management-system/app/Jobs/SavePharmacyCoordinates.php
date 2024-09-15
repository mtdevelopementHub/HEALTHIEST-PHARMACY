<?php

namespace App\Jobs;

use App\Models\Pharmacy;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class SavePharmacyCoordinates implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct(private Pharmacy $pharmacy, private $pharmacyModule)
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $response = $this->pharmacyModule->savePharmacyCoordinates($this->pharmacy->location ?? 'Karachi');
        
        $this->pharmacy->latitude = $response['latitude'] ?? '';
        $this->pharmacy->longitude = $response['longitude'] ?? '';
        $this->pharmacy->saveQuietly();
    }
}
