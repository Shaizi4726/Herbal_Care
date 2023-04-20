<x-mail::message>
Dear **{{$full_name}}**!

Thankyou for registration. Your email address and password is

<x-mail::panel>
  ## Email: {{$email}}
  ## Password: {{$password}}
</x-mail::panel>

Please click the button below to verify your email address.

<x-mail::button :url="$url">
Verify Email Address
</x-mail::button>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
