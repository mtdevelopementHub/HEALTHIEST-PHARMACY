<?php

namespace App\Console\Commands;

use App\Models\Rider;
use Illuminate\Console\Command;

class AddRiders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'add:riders';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $riders = [

            [
                'name' => 'Zaid Khan',
                'contact_number' => '0321-5467898',
                'destination' => 'A-45 Karimabad, Karachi',
                'order_no' => 'HP-00001',
                'price' => 850,
            ],
            [
                'name' => 'Syed Hasan',
                'contact_number' => '0300-7841255',
                'destination' => 'B-98 North Nazimabad, Karachi',
                'order_no' => 'HP-00002',
                'price' => 2240,
            ],
            [
                'name' => 'Muhammad Ali',
                'contact_number' => '0345-7841256',
                'destination' => 'A-85 Gulshan-e-Iqbal, Karachi',
                'order_no' => 'HP-00003',
                'price' => 550,
            ],
            [
                'name' => 'Jawwad Qamar',
                'contact_number' => '0336-7841255',
                'destination' => 'R-122 Saddar, Karachi',
                'order_no' => 'HP-00004',
                'price' => 1150,
            ],
            [
                'name' => 'Faheem Ashfaq',
                'contact_number' => '0315-9645122',
                'destination' => 'A-150 Korangi, Karachi',
                'order_no' => 'HP-00005',
                'price' => 2500,
            ],
            [
                'name' => 'Taimur Wasi',
                'contact_number' => '0320-3545565',
                'destination' => 'B-52 Gulistan-e-Johar, Karachi',
                'order_no' => 'HP-00006',
                'price' => 1780,
            ],
        ];


        foreach ($riders as $rider) {

            Rider::create([
                'name' => $rider['name'],
                'contact_number' => $rider['contact_number'],
                'destination' => $rider['destination'],
                'order_no' => $rider['order_no'],
                'price' => $rider['price'],
            ]);

        }

        $this->info("Riders added.");
    }
}
