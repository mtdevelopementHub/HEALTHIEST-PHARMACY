<?php

namespace App\Libraries\Customer;

use Illuminate\Support\Facades\Http;


class Pharmacy
{
    public function savePharmacyCoordinates($location)
    {
        $response = Http::get('https://nominatim.openstreetmap.org/search', [
            'format' => 'json',
            'q' => $location,
            'limit' => 1
        ]);

        if ($response->successful() && !empty(json_decode($response->body(), true))) {

            $data = json_decode($response->body(), true)[0];
            return [
                'latitude' => $data['lat'],
                'longitude' => $data['lon'],
            ];
        }
    }


}


