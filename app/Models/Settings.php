<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class Settings extends Model
{
    protected $fillable=['short_des','description','photo','address','phone','email','logo'];
}
