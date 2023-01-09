<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
class Shipping extends Model
{
    protected $fillable=['type','price','status'];
}
