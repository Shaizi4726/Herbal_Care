<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class Gift extends Model
{
    protected $fillable=['title','slug','description','photo','status'];
}
