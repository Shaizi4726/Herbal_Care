<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'payments';

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['order_id', 'payment_method', 'account_no', 'payment_status', 'subtotal', 'tax_amount', 'total_amount'];
  
  /**
   * Get the order that owns the payment.
   */
  public function order()
  {
    return $this->belongsTo(Order::class, 'order_id');
  }
}
