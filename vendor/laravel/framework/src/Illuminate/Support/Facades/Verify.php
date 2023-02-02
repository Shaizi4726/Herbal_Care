<?php

namespace Illuminate\Support\Facades;

use Illuminate\Contracts\Auth\VerifyBroker;

/**
 * @method static string sendVerifyLink(array $credentials)
 *
 * @see \Illuminate\Auth\Passwords\VerifyBroker
*/
class Verify extends Facade
{
    /**
     * Constant representing a successfully sent reminder.
     *
     * @var string
     */
    const VERIFY_LINK_SENT = VerifyBroker::VERIFY_LINK_SENT;

    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
      return 'auth.verify';
    }
}
