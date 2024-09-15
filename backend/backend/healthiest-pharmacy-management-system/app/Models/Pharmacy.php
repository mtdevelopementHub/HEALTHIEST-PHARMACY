<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Pharmacy extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'contact_number',
        'location',
        'latitude',
        'longitude',
        'user_id',
        'image'
    ];


    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function medicines(): HasMany
    {
        return $this->hasMany(Medicine::class, 'pharmacy_id');
    }

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class, 'pharmacy_id');
    }

    public function riders(): HasMany
    {
        return $this->hasMany(Rider::class, 'pharmacy_id');
    }

    public function scopeVerifyPharmacy($query)
    {
        return $query->whereNotNull('latitude')
            ->orWhere('latitude', '<>', '');
    }
}