<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $data = $this->resource->map( function ($order) {

            return [
                'id' => $order->id,
                'order_number' => $order->order_number,
                'name' => $order->name,
                'email' => $order->email,
                'contact_no' => $order->contact_no,
                'user_id' => $order->user_id,
                'pharmacy_id' => $order->pharmacy_id,
                'medicine_id' => $order->medicine_id,
                'quantity' => $order->quantity,
                'price' => $order->price,
                'address' => $order->address,
                'status' => $order->status,
                'payment_method' => $order->payment_method,
                'lead_time' => $order->lead_time,
                'description' => $order->description,
                'created_at' => $order->created_at,
                'updated_at' => $order->updated_at,
                'pharmacy' => $order->pharmacy->name ?? '',
                'medicine' => $order->medicine->name ?? '',
            ];

        });

        return [
            'status' => true,
            'message' => 'List of Orders.',
            'orders' => $data,
        ];
    }
}
