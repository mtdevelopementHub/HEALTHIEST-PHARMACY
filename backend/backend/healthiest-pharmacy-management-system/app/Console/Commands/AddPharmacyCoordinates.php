<?php

namespace App\Console\Commands;

use App\Libraries\Customer\Pharmacy;
use Illuminate\Console\Command;

class AddPharmacyCoordinates extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'add:pharmacy-coordinates';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function __construct(protected Pharmacy $pharmacy_module)
    {
        parent::__construct();
    }
    
    public function handle()
    {
        $pharmacies = \App\Models\Pharmacy::whereNull('latitude')->orWhere('latitude', '')->get();


        if ($pharmacies->count()) {

            foreach ($pharmacies as $pharmacy)
            {
                $coordinates = $this->pharmacy_module->savePharmacyCoordinates($pharmacy->location ?? 'Karachi');

                $pharmacy->latitude = $coordinates['latitude'] ?? '';
                $pharmacy->longitude = $coordinates['longitude'] ?? '';
                $pharmacy->save();
            }
        }

    }
}
