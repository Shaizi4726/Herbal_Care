<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class Notification extends Model
{
    protected $fillable=['data','type','notifiable','read_at'];
}
