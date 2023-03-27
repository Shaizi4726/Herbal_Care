<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FixedBanner extends Model
{
   /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'fixed_banners';

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['photo_mobile', 'photo_tablet', 'photo_desktop'];

  /**
   * The model's default values for attributes.
   *
   * @var array
   */
  
}
