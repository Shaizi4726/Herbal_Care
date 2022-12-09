<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class Message extends Model
{
    public $fillable=['name','message','email','phone','read_at','photo','subject'];
}
