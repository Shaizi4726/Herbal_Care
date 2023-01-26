<?php

namespace App\Http\Controllers;
use Auth;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Wishlist;
use App\Models\ProductsAttribute;
class WishlistController extends Controller
{
    protected $product = null;
    public function __construct(Product $product){
        $this->product = $product;
    }

    public function wishlist_add (Request $request) {
      $request->validate([
          'id'      =>  'required',
      ]);

        $product = Product::where('id', $request->id)->first();
        $user_id = auth()->user()->id;

        // $already_wishlist = Wishlist::where('user_id', auth()->user()->id)->where('product_id', $request->id)->first();
        // if($already_wishlist ) {
        //     request()->session()->flash('error','You already placed in wishlist');
        //     return back();
        // }else{
            
            $wishlist = new Wishlist;
            $wishlist->user_id = $user_id;
            $wishlist->product_id = $product->id;
            $wishlist->title = $product->title;
            $wishlist->plu = $product->plu;

            $wishlist->save();

            $products = Product::with('wishlists')->where('id', $product->id)->get();

            $fav_counts = Wishlist::where('user_id', $user_id)->count('product_id');

            return $fav_counts;
            
            request()->session()->flash('success','Product successfully added to wishlist');  
          }  
          
          public function wishlist_delete(Request $request){
            
            $wishlist = Wishlist::where('product_id', $request->id)->delete();
            request()->session()->flash('success','Wishlist successfully removed');
            $user_id = auth()->user()->id;
            $fav_counts = Wishlist::where('user_id', $user_id)->count('product_id');
      
            return $fav_counts;
    }     
}
