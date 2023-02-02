<?php

namespace Illuminate\Foundation\Auth;

use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Auth\Events\Verified;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\verify;

trait VerifiesEmails
{
  use RedirectsUsers;

  /**
   * Show the email verification notice.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\RedirectResponse|\Illuminate\View\View
   */
  public function show(Request $request)
  {
    return $request->user()->hasVerifiedEmail()
        ? redirect($this->redirectPath())
        : view('auth.verify');
  }

  /**
   * Mark the authenticated user's email address as verified.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
   *
   * @throws \Illuminate\Auth\Access\AuthorizationException
   */
  public function verify(Request $request)
  {
      if (! hash_equals((string) $request->route('id'), (string) $request->user()->getKey())) {
          throw new AuthorizationException;
      }

      if (! hash_equals((string) $request->route('hash'), sha1($request->user()->getEmailForVerification()))) {
          throw new AuthorizationException;
      }

      if ($request->user()->hasVerifiedEmail()) {
          return $request->wantsJson()
              ? new JsonResponse([], 204)
              : redirect($this->redirectPath());
      }

      if ($request->user()->markEmailAsVerified()) {
          event(new Verified($request->user()));
      }

      if ($response = $this->verified($request)) {
          return $response;
      }

      return $request->wantsJson()
          ? new JsonResponse([], 204)
          : redirect($this->redirectPath())->with('verified', true);
  }

  /**
   * The user has been verified.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return mixed
   */
  protected function verified(Request $request)
  {
      //
  }

  /**
   * Resend the email verification notification.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
   */
  public function resend(Request $request)
  {
      if ($request->user()->hasVerifiedEmail()) {
          return $request->wantsJson()
              ? new JsonResponse([], 204)
              : redirect($this->redirectPath());
      }

      $request->user()->sendEmailVerificationNotification();

      return $request->wantsJson()
          ? new JsonResponse([], 202)
          : back()->with('resent', true);
  }

  /**
    * Send a verify email otp to the given user.
    *
    * @param  \Illuminate\Http\Request  $request
    * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
  */
  public function sendVerifyEmailLink(Request $request)
  {
    /* We will send the email verification link to this user. Once we have attempted
      to send the link, we will examine the response then see the message we
      need to show to the user. Finally, we'll send out a proper response. 
    */

    $response = $this->broker()->sendVerifyLink(
      $this->credentials($request)
    );

    return $response == Password::VERIFY_LINK_SENT
      ? $this->sendVerifyLinkResponse($request, $response)
      : $this->sendVerifyLinkFailedResponse($request, $response);
  }

  /**
    * Get the needed authentication credentials from the request.
    *
    * @param  \Illuminate\Http\Request  $request
    * @return array
  */
  protected function credentials(Request $request)
  {
    return $request->only('email');
  }

  /**
    * Get the response for a successful password reset link.
    *
    * @param  \Illuminate\Http\Request  $request
    * @param  string  $response
    * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
  */
  protected function sendVerifyLinkResponse(Request $request, $response)
  {
    return $request->wantsJson()
      ? new JsonResponse(['message' => trans($response)], 200)
      : back()->with('status', trans($response));
  }

  /**
   * Get the response for a failed password reset link.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  string  $response
   * @return \Illuminate\Http\RedirectResponse
   *
   * @throws \Illuminate\Validation\ValidationException
  */
  protected function sendVerifyLinkFailedResponse(Request $request, $response)
  {
    if ($request->wantsJson()) {
      throw ValidationException::withMessages([
        'email' => [trans($response)],
      ]);
    }

    return back()
      ->withInput($request->only('email'))
      ->withErrors(['email' => trans($response)]);
  }

  /**
   * Get the broker to be used during password reset.
   *
   * @return \Illuminate\Contracts\Auth\PasswordBroker
   */
  public function broker()
  {
    return Verify::broker();
  }
}
