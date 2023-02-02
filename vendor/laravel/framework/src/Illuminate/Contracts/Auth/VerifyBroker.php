<?php

namespace Illuminate\Contracts\Auth;

use Closure;

interface VerifyBroker
{
    /**
     * Constant representing a successfully sent verify link.
     *
     * @var string
     */
    const VERIFY_LINK_SENT = 'verification.sent';

    public function sendVerifyLink(array $credentials);
}
