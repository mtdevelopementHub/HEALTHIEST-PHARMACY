<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'status' => true,
            'message' => 'User successfully logged-in.',
            'user' => $this->resource,
            'token' => $this->resource->createToken('authToken')->plainTextToken,
            'roles' => $this->resource->getRoleNames()
        ];
    }
}
