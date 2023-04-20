<?php

namespace Illuminate\Auth\Events;

use Illuminate\Queue\SerializesModels;

class Registered
{
  use SerializesModels;

  /**
   * The authenticated user.
   *
   * @var \Illuminate\Contracts\Auth\Authenticatable
   * @var string
   */
  public $user;
  public $password;

  /**
   * Create a new event instance.
   *
   * @param  \Illuminate\Contracts\Auth\Authenticatable  $user
   * @param  string  $user
   * @return void
   */
  public function __construct($user, $password)
  {
    $this->user = $user;
    $this->password = $password;
  }
}
