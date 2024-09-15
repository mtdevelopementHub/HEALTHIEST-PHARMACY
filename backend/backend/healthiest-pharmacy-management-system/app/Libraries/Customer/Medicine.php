<?php

namespace App\Libraries\Customer;

use App\Models\Pharmacy;
use Illuminate\Database\Eloquent\Collection;


class Medicine
{
    public function __construct(private \App\Models\Medicine $medicine)
    {
        //
    }
    public function getDefaultMedicines(): Collection
    {
        return $this->medicine::active()->get();
    }


    // Filters

    public function searchMedicines($data): Collection
    {
        $medicines = $this->medicine::where("name", "LIKE", "%{$data}%")
            ->active()
            ->get();

        if ($medicines->isEmpty()) {
            $medicine = $this->medicine::where("name", $data)->where('status', 1)->where('quantity', '>=', 1)->first();

            if ($medicine) {
                $medicines = $this->medicine::where("formula", $medicine->formula)
                    ->active()
                    ->get();
            }
        }

        return $medicines;
    }

    public function getCategoryMedicines($category_id): Collection
    {
        return $this->medicine::where('category_id', $category_id)
            ->active()
            ->get();
    }

    public function searchNearestMedicines($response, $text): Collection
    {        
        $decodedMedicines = json_decode($response, true);

        $medicineIds = array_column($decodedMedicines, 'id');
        
        $medicines = $this->medicine::whereIn('id', $medicineIds)
                            ->where('name', 'LIKE', '%' . $text . '%')
                            ->active()
                            ->get();
        
        if ($medicines->isEmpty()) {
            $medicine = $this->medicine::where('name', $text)->where('status', 1)->where('quantity', '>=', 1)->first();
        
            if ($medicine) {
                $medicines = $this->medicine::where('formula', $medicine->formula)
                                    ->active()
                                    ->get();
            }
        }
        
        return $medicines;
    }

    public function getNearestMedicines($data): array
    {
        return self::searchPharmaciesWithCoordinates($data);
    }



    public static function searchPharmaciesWithCoordinates($data): array
    {
        // $userLatitude = $data['latitude'];
        // $userLongitude = $data['longitude'];
        // $radius = 3000;

        // // Calculate the bounding box coordinates
        // $latDelta = $radius / 111.2;                                        // 1 degree of latitude is approximately 111.2 kilometers
        // $lonDelta = $radius / (111.2 * cos(deg2rad($userLatitude)));

        // $minLat = $userLatitude - $latDelta;
        // $maxLat = $userLatitude + $latDelta;
        // $minLon = $userLongitude - $lonDelta;
        // $maxLon = $userLongitude + $lonDelta;

        // $pharmacies = Pharmacy::verifyPharmacy()
        //     // ->whereBetween('latitude', [$minLat, $maxLat])
        //     // ->whereBetween('longitude', [$minLon, $maxLon])
        //     ->where('latitude', '>=', $minLat)
        //     ->where('latitude', '<=', $maxLat)
        //     ->where('longitude', '>=', $minLon)
        //     ->where('longitude', '<=', $maxLon)
        //     ->get();

        $latitude = $data['latitude'];
        $longitude = $data['longitude'];
    
        $pharmacies = Pharmacy::verifyPharmacy()
            ->select('id','name', 'latitude', 'longitude')
            ->selectRaw(
                '(6371 * acos(cos(radians(?)) * cos(radians(latitude)) * cos(radians(longitude) - radians(?)) + sin(radians(?)) * sin(radians(latitude)))) AS distance',
                [$latitude, $longitude, $latitude]
            )
            ->having('distance', '<', 6) // km radius
            ->orderBy('distance')
            ->get();

        $medicines = [];

        foreach ($pharmacies as $pharmacy) {

            $medicines = array_merge($medicines, $pharmacy->medicines()->where('status', 1)->where('quantity', '>=', 1)->get()->toArray());
        }

        return $medicines;
    }



}