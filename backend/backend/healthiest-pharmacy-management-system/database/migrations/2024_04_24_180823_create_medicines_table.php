<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('medicines', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('dosage')->nullable();
            $table->double('price')->default(0);
            $table->boolean('status')->default(0);
            $table->text('formula')->nullable();
            $table->text('image')->nullable();
            $table->foreignId('category_id')->nullable()->constrained('medicine_categories');
            $table->foreignId('pharmacy_id')->nullable()->constrained('pharmacies');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('medicines');
    }
};