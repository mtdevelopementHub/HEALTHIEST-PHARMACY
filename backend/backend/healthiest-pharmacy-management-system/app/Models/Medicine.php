<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Medicine extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'dosage',
        'price',
        'quantity',
        'status',
        'formula',
        'image',
        'category_id',
        'pharmacy_id',
        'is_verified',
        'description'
    ];


    public function category(): BelongsTo
    {
        return $this->belongsTo(MedicineCategory::class, 'category_id');
    }

    public function pharmacy(): BelongsTo
    {
        return $this->belongsTo(Pharmacy::class, 'pharmacy_id');
    }

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class, 'medicine_id');
    }

    public function prescriptions(): HasMany
    {
        return $this->hasMany(Prescription::class, 'medicine_id');
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1)->where('quantity', '>=', 1)->limit(20)->orderBy('name');
    }
}