<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
class city extends Model
{
    protected $fillable=['name','state_id','country_id','price'];
}
