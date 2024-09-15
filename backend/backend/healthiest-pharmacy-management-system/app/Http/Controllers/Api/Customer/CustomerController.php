<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Http\Requests\NearestMedicineRequest;
use App\Http\Requests\PrescriptionRequest;
use App\Libraries\Customer\Medicine;
use App\Models\Pharmacy;
use App\Models\Prescription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class CustomerController extends Controller
{
    public function __construct(private Medicine $medicine)
    {
        //
    }

    public function defaultMedicines(Request $request)
    {
        try {
            $medicines = $this->medicine->getDefaultMedicines();

            return response()->json([
                'status' => true,
                'message' => count($medicines) ? 'List of medicines.' : 'No medicines available.',
                'medicines' => count($medicines) ? $medicines : []
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function searchMedicines(Request $request, $text)
    {
        try {
            $medicines = $this->medicine->searchMedicines($text);

            return response()->json([
                'status' => true,
                'message' => count($medicines) ? 'Get searched medicines.' : 'No medicines found based on search result.',
                'medicines' => count($medicines) ? $medicines : []
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function categoryMedicines(Request $request, $id)
    {
        try {
            $medicines = $this->medicine->getCategoryMedicines($id);
            
            return response()->json([
                'status' => true,
                'message' => count($medicines) ? 'Get category medicines.' : 'No medicines found based on this category.',
                'medicines' => count($medicines) ? $medicines : []
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function nearestMedicines(NearestMedicineRequest $request)
    {
        try {
            $medicines = $this->medicine->getNearestMedicines($request->all());
            
            return response()->json([
                'status' => true,
                'message' => count($medicines) ? 'Get medicines of nearest pharmacies.' : 'No medicines found near your location.',
                'medicines' => count($medicines) ? $medicines : []
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function addPrescription(Request $request, $id)
    {
        try {
            $prescription = Prescription::create([
                'medicine_id' => $id,
                'image' => $request->hasFile('image') ? '/storage/' . $request->file('image')->store('prescriptions', 'public') : '',
                'status' => 1
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Prescription successfully addded.',
                'prescription' => $prescription
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function viewMedicine(Request $request, $id)
    {
        try {
            $medicine = \App\Models\Medicine::findOrFail($id);

            return response()->json([
                'status' => true,
                'message' => 'Get medicine record.',
                'medicine' => $medicine,
                'pharmacy' => $medicine->pharmacy->name ?? '',
                'location' => $medicine->pharmacy->location ?? ''
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function searchNearestMedicines(Request $request, $text)
    {
        try {            
            $medicines = $this->medicine->searchNearestMedicines($request->all(), $text);
            
            return response()->json([
                'status' => true,
                'message' => count($medicines) ? 'Get searched medicines.' : 'No medicines found based on search result.',
                'medicines' => count($medicines) ? $medicines : []
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function addMedicineQuantity(Request $request, $id)
    {
        try {
            $medicine = \App\Models\Medicine::findOrFail($id);

            if ($request->quantity > $medicine->quantity) {
                return response()->json([
                    'status' => true,
                    'message' => 'Insufficient stock.',
                    'error' => 'Insufficient stock.'
                ]);
            }

            return response()->json([
                'status' => true,
                'message' => 'Quantity of medicine added.'
            ]);

        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function test(Request $request)
    {
        try {
            $latitude = $request->latitude;
            $longitude = $request->longitude;
        
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
        
            return response()->json($medicines);


        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }
}