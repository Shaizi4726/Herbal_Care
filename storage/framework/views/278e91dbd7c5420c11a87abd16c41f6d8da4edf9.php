<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="height=device-height, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

    <title>HerbalCare || Register</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="<?php echo e(asset('images/favicon.png')); ?>">

    <!-- HerbalCare StyleSheet -->
    <link href="<?php echo e(asset('frontend/css/signin-up.css')); ?>" rel="stylesheet">
  </head>

  <body>
    <section class="shop-signing register">
      <div class="signing-img-container"></div>

      <div class="signing-form-container">
        <div class="flash-error flash-message">
          <p>Something went wrong.</p>
        </div>
        <?php echo $__env->make('frontend.layouts.flash-message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <a href="<?php echo e(route('home')); ?>"><img src="<?php echo e(asset('images/logo_green.png')); ?>" alt="Website Logo" class="signing-web-logo"></a>
        <h1 class="signing-web-title"><a href="<?php echo e(route('home')); ?>">HerbalCare</a></h1>
        <h2>Sign Up</h2>
        

        <!-- Form -->
        <form class="form" method="post" action="<?php echo e(route('register.submit')); ?>" novalidate>
          <?php echo csrf_field(); ?>

          <fieldset class="type-selection">
            <legend>User</legend>
            <div class="form-group">
              <input type="radio" name="cust_type" id="individual" value="individual" checked>
              <label for="individual">Individual</label>
            </div>

            <div class="form-group">
              <input type="radio" name="cust_type" id="company" value="company">
              <label for="company">Company</label>
            </div>

            <?php if($errors->get('cust_type')): ?>
              <div class="error">
                <?php $__errorArgs = ['cust_type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                  <?php echo e($message); ?>

                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
              </div>
            <?php endif; ?>
          </fieldset>

          <fieldset class="details">
            <legend>Details</legend>
            <div class="fl-bl">
              <div class="form-group" id="first-name">
                <input type="text" id="fname" name="fname" placeholder="First Name" value="<?php echo e(old('fname')); ?>">
                <label for="fname">First Name</label>

                <div class="error">
                  The "first name" is required.
                </div>

                <?php if($errors->get('fname')): ?>
                  <div class="error">
                    <?php $__errorArgs = ['fname'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                      <?php echo $message; ?>

                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                  </div>
                <?php endif; ?>
              </div>
              
              <div class="form-group" id="last-name">
                <input type="text" id="lname" name="lname" placeholder="Last Name" value="<?php echo e(old('lname')); ?>">
                <label for="lname">Last Name</label>

                <?php if($errors->get('lname')): ?>
                  <div class="error">
                    <?php $__errorArgs = ['lname'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                      <?php echo $message; ?>

                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                  </div>
                <?php endif; ?>
              </div>
              
              <div class="form-group collapse" id="company-name">
                <input type="text" id="cname" name="cname" placeholder="Company Name" value="<?php echo e(old('cname')); ?>">
                <label for="cname">Company Name</label>
                <?php if($errors->get('cname')): ?>
                  <div class="error">
                    <?php $__errorArgs = ['cname'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                      <?php echo e($message); ?>

                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                  </div>
                <?php endif; ?>
              </div>

              <div class="form-group collapse" id="trn">
                <input type="number" id="trn-no" name="trn_no" placeholder="TRN Number" value="<?php echo e(old('trn_no')); ?>">
                <label for="trn-no">TRN Number</label>

                <?php if($errors->get('trn_no')): ?>
                  <div class="error">
                    <?php $__errorArgs = ['trn_no'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                      <?php echo e($message); ?>

                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                  </div>
                <?php endif; ?>
              </div>
            </div>

            <div class="form-group">
              <input type="email" name="email" id="email" placeholder="someone@domain.com" value="<?php echo e(old('email')); ?>" required>
              <label for="email">Email</label>

              <?php if($errors->get('email')): ?>
                <div class="error">
                  <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                    <?php echo e($message); ?>

                  <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                </div>
              <?php endif; ?>
            </div>

            <div class="fl-bl">
              <div class="form-group">
                <input type="password" name="password" id="password" placeholder="Enter Password">
                <label for="password">Password</label>
              </div>

              <div class="form-group">
                <input type="password" name="password_confirmation" id="confirm-password" placeholder="Confirm Password">
                <label for="confirm-password">Confirm Password</label>
              </div>
            </div>

            <?php if($errors->get('password')): ?>
              <div class="error">
                <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                  <?php echo $message; ?>

                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
              </div>
            <?php endif; ?>
          </fieldset>

          <button type="submit" class="btn signing-btn">Register</button>
        </form>
        <p>Already Registered? <a href="<?php echo e(route('login.form')); ?>" class="btn">Log In</a></p>
        <p>Goto <a href="<?php echo e(route('home')); ?>" class="btn">Homepage</a></p>
        <!--/ End Form -->
      </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script src="<?php echo e(asset('frontend/js/register.js')); ?>"></script>
  </body>
</html>
<?php /**PATH D:\XAMPP\htdocs\herbalcare\resources\views/frontend/pages/register.blade.php ENDPATH**/ ?>