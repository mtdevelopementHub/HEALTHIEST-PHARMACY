<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Http\Requests\OrderRequest;
use App\Http\Resources\OrderResource;
use App\Models\Medicine;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function __construct(private \App\Libraries\Customer\Order $order)
    {
        //
    }

    public function list(Request $request)
    {
        try {
            $orders = Order::where('user_id', $request->user()->id)->get();

            return new OrderResource($orders);

        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage(),
            ]);
        }
    }

    public function create(OrderRequest $request)
    {
        try {
            $medicine = Medicine::findOrFail($request->medicine_id);

            $medicine->update([
                'quantity' => $medicine->quantity - $request->quantity
            ]);

            $order = Order::create([
                'name' => $request->name,
                'email' => $request->email,
                'contact_no' => $request->contact_no,
                'user_id' => $request->user()->id,
                'pharmacy_id' => $medicine->pharmacy_id,
                'medicine_id' => $request->medicine_id,
                'quantity' => $request->quantity,
                'price' => $request->quantity * $request->price,
                'address' => $request->address,
                'status' =>  'Placed',
                'payment_method' => $request->payment_method,
                'lead_time' => 40,
                'description' => 'The pharmacy is preparing and packing your medicine.'
            ]);

            if (!$order->exists()) {
                return response()->json(['status' => true, 'message' => 'Oops something went wrong! Could not place order.'], 422);
            }

            return response()->json([
                'status' => true,
                'message' => 'Your order has been successfully placed.',
                'order' => $order
            ]);

        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage(),
            ]);
        }
    }

    public function updateStatus(Request $request, $id)
    {
        try {
            $order = Order::findOrFail($id);            

            $data = $this->order->updateOrderStatus($order);
        
            $order->update([
                'status' => $data['status'],
                'lead_time' => $data['lead_time'],
                'description' => $data['description'],
            ]);

            return response()->json([
                'status' => true,
                'message' => $order->status == 'Delivered' ? 'Your medicine has been successfully delivered.' : 'Updated order status.',
                'order' => $order
            ]);

        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage(),
            ]);
        }
    }

    public function editStatus(Request $request, $id)
    {
        try {
            $order = Order::findOrFail($id);
            
            $order->update([
                'status' => 'Delivered',
                'lead_time' => 0,
                'description' => 'Your order is completed.',
            ]);

            return response()->json([
                'status' => true,
                'description' => 'Your order is delivered.',
                'order' => $order
            ]);

        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage(),
            ]);
        }
    }
}
