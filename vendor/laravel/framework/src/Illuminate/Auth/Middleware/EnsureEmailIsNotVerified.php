<?php

namespace Illuminate\Auth\Middleware;

use Closure;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\URL;

class EnsureEmailIsNotVerified
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $redirectToRoute
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse|null
     */
    public function handle($request, Closure $next, $redirectToRoute = null)
    {
      if (! $request->user() ||
        $request->user()->hasVerifiedEmail()) {
        return $request->expectsJson()
                ? abort(403, 'Your email address is verified.')
                : Redirect::guest(URL::route($redirectToRoute ?: 'home'));
      }

      return $next($request);
    }
}
