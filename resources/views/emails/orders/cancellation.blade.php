<x-mail::message>
# Order Cancellation

We have received your request for the cancellation of order items. Your otp code to confirm the cancellation request is given below. 

<x-mail::button :url="''">
Button Text
</x-mail::button>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
