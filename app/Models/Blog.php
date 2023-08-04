<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
  /**
   * The model's default values for attributes.
   *
   * @var array
   */
  protected $attributes = [
    'status' => 'active'
  ];

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['title', 'slug', 'image', 'post', 'status'];
}
