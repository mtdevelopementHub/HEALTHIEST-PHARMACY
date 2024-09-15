<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Spatie\Permission\Models\Role;

class CreateAdminUser extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'create:admin-user';

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
        $roles = array(
            0 =>
                array(
                    'name' => 'Customer',
                ),
            1 =>
                array(
                    'name' => 'Seller',
            ),
        );

        foreach ($roles as $role) {

            Role::create(['name' => $role['name']]);

        }
    }
}
