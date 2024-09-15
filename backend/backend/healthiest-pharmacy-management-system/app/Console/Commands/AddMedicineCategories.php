<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\MedicineCategory;

class AddMedicineCategories extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'add:medicine-categories';

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
        $categories = [
            'Liquid', 'Tablet', 'Capsules', 'Topical Medicines', 'Drops', 'Inhalers', 'Injections'
        ];


        foreach ($categories as $category)
        {
            MedicineCategory::firstOrCreate([
                'name' => $category,
            ]);
        }


        $this->info('Medicine categories added.');
    }
}
