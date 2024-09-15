<?php

namespace App\Libraries\Customer;



class Order
{
    public string $status;
    public int $lead_time;
    public string $description;


    public function updateOrderStatus($order): array
    {
        $this->status = self::updateStatus($order->status, $order->created_at);
        $this->lead_time = self::updateLeadtime($order->status, $order->created_at);
        $this->description = self::updateDescription($order->status, $order->created_at);

        return [
            'status' => $this->status,
            'lead_time' => $this->lead_time,
            'description' => $this->description
        ];
    }

    public static function updateStatus($status, $start_time): string
    {
        switch ($status) {
            case 'Placed':
                $status = 'Pending';
                break;
            case 'Pending':
                $status = 'Delivered';
                break;
        }
        return $status;
    }

    public static function updateLeadtime($status, $start_time): int
    {
        switch ($status) {
            case 'Placed':
                $lead_time = 20;
                break;
            case 'Pending':
                $lead_time = 10;
                break;
        }
        return $lead_time;
    }

    public static function updateDescription($status, $start_time): string
    {
        switch ($status) {
            case 'Placed':
                $description = 'The rider has picked up your order.';
                break;
            case 'Pending':
                $description = 'Your order is nearby, getting ready to be delivered.';
                break;
        }
        return $description;
    }

}

