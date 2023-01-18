<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class Banner extends Model
{
    protected $fillable=['title','slug','description','photo','photo_tablet','photo_mobile','status'];
}
