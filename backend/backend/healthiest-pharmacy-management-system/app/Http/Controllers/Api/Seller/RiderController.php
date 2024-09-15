<?php

namespace App\Http\Controllers\Api\Seller;

use App\Http\Controllers\Controller;
use App\Models\Rider;
use Illuminate\Http\Request;

class RiderController extends Controller
{
    public function list(Request $request, $id)
    {
        try {
            $riders = Rider::where('pharmacy_id', $id)->get();

            return response()->json([
                'status' => true,
                'message' => 'List of Riders.',
                'riders' => $riders
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function add(Request $request, $id)
    {
        try {
            $rider = Rider::create([
                'name' => $request->name,
                'contact_number' => $request->contact_number,
                'cnic' => $request->cnic,
                'pharmacy_id' => $id,
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Rider successfully added.',
                'rider' => $rider
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function delete(Request $request, $id)
    {
        try {
            $rider = Rider::findOrFail($id);
            $rider->delete();

            return response()->json([
                'status' => true,
                'message' => 'Rider successfully deleted.',
            ]);

        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }
    
}
