<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Register User
Route::view('user/register', 'frontend.pages.register')->name('user.register.form');
Route::view('/register', 'frontend.pages.register')->name('register.form');
Route::view('/signup', 'frontend.pages.register')->name('signup.form');
Route::post('user/register','Auth\RegisterController@registerSubmit')->name('register.submit');

// Verify Email
Route::view('/email/verify', 'auth.verify-email')->middleware('auth')->withoutMiddleware('account.verified')->name('verification.notice');
Route::view('/verify/email', 'auth.verify-email')->middleware('auth')->withoutMiddleware('account.verified')->name('verify.email');
Route::get('/email/verify/{id}/{hash}', 'Auth\VerificationController@emailVerification')->middleware(['auth', 'signed'])->name('verification.verify');
Route::post('/email/verification-notification', 'Auth\VerificationController@resendEmailVerification')->middleware(['auth', 'throttle:6,1'])->name('verification.resend');

// Login User
Route::get('/login','FrontendController@login')->name('login.form');
Route::get('/signin','FrontendController@login')->name('signin.form');
Route::get('user/login','FrontendController@login')->name('user.login.form');
Route::post('user/login','FrontendController@loginSubmit')->name('login.submit');
Route::get('user/logout','FrontendController@logout')->name('user.logout');
Route::get('/logout','FrontendController@logout')->name('logout');

// Reset password
Route::view('password-reset', 'auth.passwords.old-reset')->name('password.reset');
Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
Route::post('password/reset', 'Auth\ResetPasswordController@reset')->name('password.update');
Route::get('password-resets', 'FrontendController@PassResetForm')->name('password.resets');

Route::get('/autocomplete-search', 'FrontendController@autocomplete_search')->name('search-suggestion');

// Frontend Main Pages
Route::get('/','FrontendController@home')->name('home')->middleware('account.verified');
Route::get('/home', 'FrontendController@home')->middleware('account.verified');
Route::view('/about-us','frontend.pages.about-us')->name('about-us')->middleware('account.verified');
Route::view('/contact','frontend.pages.contact')->name('contact')->middleware('account.verified');
Route::get('product-detail/{slug}','FrontendController@product_detail')->name('product-detail')->middleware('account.verified');
Route::match(['get','post'], '/product/search', 'FrontendController@product_search')->name('product.search')->middleware('account.verified');
Route::match(['get','post'], '/sort','FrontendController@productSort')->name('product-sort')->middleware('account.verified');
Route::get('/product-cat/{slug}','FrontendController@productCat')->name('product-cat')->middleware('account.verified');
Route::get('/product-cat/{slug}/{subslug}','FrontendController@productSubCat')->name('product-subcat')->middleware('account.verified');
Route::get('/products','FrontendController@products')->name('products')->middleware('account.verified');
Route::view('/checkout', 'frontend.pages.checkout')->name('checkout');
Route::view('/faq', 'frontend.pages.faq')->name('faq');
Route::view('/privacy-policy', 'frontend.pages.privacy-policy')->name('privacy-policy');
Route::view('/terms-and-conditions', 'frontend.pages.terms-and-conditions')->name('terms-and-conditions');

// Create Modal
Route::get('/create-modal','ModalController@create_modal')->name('create-modal')->middleware('account.verified');
Route::get('/create-sizes','ModalController@create_sizes')->name('create-sizes')->middleware('account.verified');

// Cart section
Route::get('/cart-add', 'CartController@cart_add')->name('add-to-cart');
Route::get('cart-delete/{id}','CartController@cartDelete')->name('cart-delete');
Route::get('cart-update','CartController@cart_update')->name('cart.update');

Route::view('/cart', 'frontend.pages.cart')->name('cart');

Route::get('/states', 'StateController@getStates');
Route::get('/cities', 'CityController@getCities');

Route::get('/apply-coupon','CouponController@coupon_apply')->name('coupon-apply');

// Wishlist
Route::get('/wishlist', 'WishlistController@wishlist')->name('wishlist');
Route::get('wishlist-add/','WishlistController@wishlist_add')->name('add-to-wishlist')->middleware('user');
Route::get('wishlist-delete/','WishlistController@wishlist_delete')->name('wishlist-delete');
Route::post('/order','OrderController@store')->name('order');
Route::get('/income','OrderController@incomeChart')->name('product.order.income');

// Order invoices
Route::get('sale/{id}/order/{download?}', 'OrderController@sale_invoice')->name('sale.pdf');
Route::get('tax/{id}/order/{download?}', 'OrderController@tax_invoice')->name('tax.pdf');

// Order Track
Route::view('/order/track', 'frontend.pages.order-track')->name('order.track');
Route::get('/track/order', 'OrderController@track_order')->name('track.order');

// Order Details
Route::get('/orders-detail', 'OrderController@user_orders')->name('orders-detail');
Route::get('/order-data', 'OrderController@order_details')->name('order-data');

// Return item or order
Route::get('/order-return', 'OrderController@return_order')->name('order-return');

// cancel item or order
Route::get('/order-cancel', 'OrderController@cancel_order')->name('order-cancel');

// Product Review
Route::resource('/review','ProductReviewController');
Route::post('product/{slug}/review', 'ProductReviewController@store')->name('review.store');
// Coupon
Route::post('/coupon-store', 'CouponController@couponStore')->name('coupon-store');
// Payment
Route::match(['get','post'], '/stripe', 'StripeController@payment')->name('stripe.post');

//ProductAttribute
Route::match(['get','post'], '/admin/product/edit-attributes/{id}','ProductController@editAttributes')->name('editAttribute');

Route::match(['get','post'], 'admin/product/delete-attributes/{id}','ProductController@deleteAttribute')->name('delete-attribute');
//Add Product Image
Route::match(['get','post'], 'admin/product/delete-images/{id}','ProductController@deleteImage')->name('delete-image');
//Delete category
Route::match(['get','post'], 'admin/product/delete-category/{id}','ProductController@deleteCategory')->name('delete-category');
//Delete Brand
Route::match(['get','post'], 'admin/product/delete-brand/{id}','ProductController@deleteBrand')->name('delete-brand');

// Backend section start
Route::group(['prefix'=>'/admin','middleware'=>['auth','admin']],function(){
    Route::get('/','AdminController@index')->name('admin');
    Route::view('/file-manager', 'admin_panel.layouts.file-manager')->name('file-manager');
    // user route
    Route::resource('users','UsersController');
    // Banner
    Route::resource('banner','BannerController');
    // Brand
    Route::resource('brand','BrandController');
    // Profile
    Route::get('/profile','AdminController@profile')->name('admin-profile');
    Route::post('/profile/{id}','AdminController@profileUpdate')->name('profile-update');
    // Category
    Route::resource('/category','CategoryController');
    // CSubcategory
    Route::resource('/subcategory','SubCategoryController');
    //Country
    Route::resource('/country','CountryController');
    //State
    Route::resource('/state','StateController');
    //Form
    Route::resource('/form','FormController');
    // Product
    Route::resource('/product','ProductController');
    //import product
    Route::resource('/productImport','ProductImportController');

    // Order
    Route::resource('/order','OrderController');
    // city
    Route::resource('/city','CityController');
    // Coupon
    Route::resource('/coupon','CouponController');
    // Settings
    Route::get('settings','AdminController@settings')->name('settings');
    Route::post('setting/update','AdminController@settingsUpdate')->name('settings.update');

    // Notification
    Route::get('/notification/{id}','NotificationController@show')->name('admin.notification');
    Route::get('/notifications','NotificationController@index')->name('all.notification');
    Route::delete('/notification/{id}','NotificationController@delete')->name('notification.delete');
    // Password Change
    Route::get('change-password', 'AdminController@changePassword')->name('change.password.form');
    Route::post('change-password', 'AdminController@changPasswordStore')->name('change.password');
});

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
  \UniSharp\LaravelFilemanager\Lfm::routes();
});

Route::get('/email', 'MailController@send_mail')->name('send_mail');