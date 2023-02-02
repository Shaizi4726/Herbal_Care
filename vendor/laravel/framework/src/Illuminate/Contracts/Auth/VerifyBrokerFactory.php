<?php

namespace Illuminate\Contracts\Auth;

interface VerifyBrokerFactory
{
    /**
     * Get a verify broker instance by name.
     *
     * @param  string|null  $name
     * @return mixed
     */
    public function broker($name = null);
}
