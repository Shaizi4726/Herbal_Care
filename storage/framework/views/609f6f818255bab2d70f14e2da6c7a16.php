<?php if (isset($component)) { $__componentOriginal71c6471fa76ce19017edc287b6f4508c = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => $__env->getContainer()->make(Illuminate\View\Factory::class)->make('mail::message'),'data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('mail::message'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
# Order Confirmation

<?php if($order->cname): ?>
Respected **<?php echo e($order->cname); ?>**!
<?php else: ?>
Dear **<?php echo e($order->fname . ' ' . $order->lname); ?>**
<?php endif; ?>

Thank you for placing an order with **HerbalCare**. We are thrilled to provide you with the finest quality naturals.

Your order has been received and is currently being processed. Your order details are attached as a pdf file with this email.

If you have any questions or concerns, please don't hesitate to reach out to us. We are always here to help.

Thank you once again for choosing **HerbalCare**.

Regards,<br>
<?php echo e(config('app.name')); ?>

 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal71c6471fa76ce19017edc287b6f4508c)): ?>
<?php $component = $__componentOriginal71c6471fa76ce19017edc287b6f4508c; ?>
<?php unset($__componentOriginal71c6471fa76ce19017edc287b6f4508c); ?>
<?php endif; ?><?php /**PATH D:\XAMPP\htdocs\herbalcare\resources\views/emails/orders/confirmed.blade.php ENDPATH**/ ?>