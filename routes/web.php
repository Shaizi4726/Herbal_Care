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
Route::get('password-resets', 'FrontendController@PassResetForm')->name('password.resets');

// Frontend Main Pages
Route::get('/','FrontendController@home')->name('home')->middleware('account.verified');
Route::get('/home', 'FrontendController@home')->middleware('account.verified');
Route::get('/about-us','FrontendController@aboutUs')->name('about-us')->middleware('account.verified');
Route::get('/contact','FrontendController@contact')->name('contact')->middleware('account.verified');
Route::get('product-detail/{slug}','FrontendController@product_detail')->name('product-detail')->middleware('account.verified');
Route::match(['get','post'],'/product/search','FrontendController@productSearch')->name('product.search')->middleware('account.verified');
Route::match(['get','post'],'product-sort/','FrontendController@productSort')->name('product-sort')->middleware('account.verified');
Route::get('/product-cat/{slug}','FrontendController@productCat')->name('product-cat')->middleware('account.verified');
Route::get('/product-cat/{slug}/{subslug}','FrontendController@productSubCat')->name('product-subcat')->middleware('account.verified');
Route::get('/product-brand/{slug}','FrontendController@productBrand')->name('product-brand')->middleware('account.verified');

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

Route::get('/checkout','CartController@checkout')->name('checkout');
// Wishlist
Route::get('/wishlist', 'WishlistController@wishlist')->name('wishlist');
Route::get('wishlist-add/','WishlistController@wishlist_add')->name('add-to-wishlist')->middleware('user');
Route::get('wishlist-delete/','WishlistController@wishlist_delete')->name('wishlist-delete');
Route::post('/order','OrderController@store')->name('order');
Route::get('/income','OrderController@incomeChart')->name('product.order.income');
// Route::get('/user/chart','AdminController@userPieChart')->name('user.piechart');
Route::get('/product-grids','FrontendController@productGrids')->name('product-grids');
Route::get('/product-lists','FrontendController@productLists')->name('product-lists');
Route::match(['get','post'],'/sort','FrontendController@productSort')->name('shop.filter');

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

// NewsLetter
Route::post('/subscribe','FrontendController@subscribe')->name('subscribe');
// Product Review
Route::resource('/review','ProductReviewController');
Route::post('product/{slug}/review','ProductReviewController@store')->name('review.store');
// Coupon
Route::post('/coupon-store','CouponController@couponStore')->name('coupon-store');
// Payment
// Route::get('payment', 'PayPalController@payment')->name('payment');
// Route::get('cancel', 'PayPalController@cancel')->name('payment.cancel');
// Route::get('payment/success', 'PayPalController@success')->name('payment.success');
Route::match(['get','post'], '/stripe', 'StripeController@payment')->name('stripe.post');
Route::get('cancel', 'PayPalController@cancel')->name('payment.cancel');
Route::get('payment/success', 'PayPalController@success')->name('payment.success');
//ProductAttribute
Route::match(['get','post'], 'admin/product/add-attributes/{id}','ProductController@addAttributes');
Route::match(['get','post'], 'admin/product/edit-attributes/{id}','ProductController@editAttributes');
Route::match(['get','post'], 'admin/product/delete-attributes/{id}','ProductController@DeleteAttribute')->name('delete-attribute');
//Add Product Image
Route::match(['get','post'], 'admin/product/add-images/{id}','ProductController@addImage');
Route::match(['get','post'], 'admin/product/delete-images/{id}','ProductController@deleteImage')->name('delete-image');
//Delete category
Route::match(['get','post'], 'admin/product/delete-category/{id}','ProductController@deleteCategory')->name('delete-category');
Route::match(['get','post'], '/get-product-price','FrontendController@getProductPrice');
Route::match(['get','post'], '/get-product-form','ProductController@getProductForm');
Route::match(['get','post'], '/get-product-size','FrontendController@getProductSize');
// Backend section start
Route::group(['prefix'=>'/admin','middleware'=>['auth','admin']],function(){
    Route::get('/','AdminController@index')->name('admin');
    Route::get('/file-manager',function(){
        return view('admin_panel.layouts.file-manager');
    })->name('file-manager');
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
    // Ajax for sub category
    Route::get('/category/{id}/child','CategoryController@getChildByParent');

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




// User section start
Route::group(['prefix'=>'/user','middleware'=>['user']],function(){
    Route::get('/','UserDashboardController@index')->name('user');
     // Profile
     Route::get('/profile','UserDashboardController@profile')->name('user-profile');
     Route::post('/profile/{id}','UserDashboardController@profileUpdate')->name('user-profile-update');
    //  Order
    Route::get('/order',"UserDashboardController@orderIndex")->name('user.order.index');
    Route::get('/order/show/{id}',"UserDashboardController@orderShow")->name('user.order.show');
    Route::delete('/order/delete/{id}','UserDashboardController@userOrderDelete')->name('user.order.delete');
    // Product Review
    Route::get('/user-review','UserDashboardController@productReviewIndex')->name('user.productreview.index');
    Route::delete('/user-review/delete/{id}','UserDashboardController@productReviewDelete')->name('user.productreview.delete');
    Route::get('/user-review/edit/{id}','UserDashboardController@productReviewEdit')->name('user.productreview.edit');
    Route::patch('/user-review/update/{id}','UserDashboardController@productReviewUpdate')->name('user.productreview.update');
    
    // Post comment
    Route::get('user-post/comment','UserDashboardController@userComment')->name('user.post-comment.index');
    Route::delete('user-post/comment/delete/{id}','UserDashboardController@userCommentDelete')->name('user.post-comment.delete');
    Route::get('user-post/comment/edit/{id}','UserDashboardController@userCommentEdit')->name('user.post-comment.edit');
    Route::patch('user-post/comment/udpate/{id}','UserDashboardController@userCommentUpdate')->name('user.post-comment.update');
    
    // Password Change
    Route::get('change-password', 'UserDashboardController@changePassword')->name('user.change.password.form');
    Route::post('change-password', 'UserDashboardController@changPasswordStore')->name('change.password');

});

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
    \UniSharp\LaravelFilemanager\Lfm::routes();
});

Route::get('/email', 'MailController@send_mail')->name('send_mail');