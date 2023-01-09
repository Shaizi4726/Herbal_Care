<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class PostTag extends Model
{
    protected $fillable=['title','slug','status'];
}
