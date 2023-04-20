<?php

namespace Illuminate\Contracts\Auth;

interface MustVerifyEmail
{
    /**
     * Determine if the user has verified their email address.
     *
     * @return bool
     */
    public function hasVerifiedEmail();

    /**
     * Mark the given user's email as verified.
     *
     * @return bool
     */
    public function markEmailAsVerified();

    /**
     * Send the email verification notification.
     *
     * @param  string  $password
     * @return void
     */
    public function sendEmailVerificationNotification($password);

    /**
     * Get the email address that should be used for verification.
     *
     * @return string
     */
    public function getEmailForVerification();
}
