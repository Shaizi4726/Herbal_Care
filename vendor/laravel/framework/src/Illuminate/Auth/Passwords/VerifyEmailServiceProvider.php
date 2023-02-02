<?php

namespace Illuminate\Auth\Passwords;

use Illuminate\Contracts\Support\DeferrableProvider;
use Illuminate\Support\ServiceProvider;

class VerifyEmailServiceProvider extends ServiceProvider implements DeferrableProvider
{
    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->registerVerifyBroker();
    }

    /**
     * Register the verify broker instance.
     *
     * @return void
     */
    protected function registerVerifyBroker()
    {
        $this->app->singleton('auth.verify', function ($app) {
            return new PasswordBrokerManager($app);
        });

        $this->app->bind('auth.verify.broker', function ($app) {
            return $app->make('auth.verify')->broker();
        });
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return ['auth.verify', 'auth.verify.broker'];
    }
}
