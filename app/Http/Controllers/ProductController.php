<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductsAttribute;
use App\Models\ProductCategory;
use App\Models\ProductForm;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Brand;
use App\Models\Image;
use App\Imports\ProductsImport;
use Illuminate\Support\Facades\File;

use Illuminate\Support\Str;

class ProductController extends Controller
{
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index()
  {
    $products = Product::paginate(10);
    return view('backend.product.index')->with('products',$products);
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function create()
  {
      $brand=Brand::get();
      $category=Category::get();
      $subcategory=SubCategory::get();
      $product_category=ProductCategory::get();
     
      // return $category;
      return view('backend.product.create')->with('product_categories',$product_category)
      ->with('categories',$category)->with('brands',$brand)->with('subcategories',$subcategory);
  }

  /**
   * Store a newly created resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\Response
   */
  public function store(Request $request)
  {                    
      $this->validate($request,[
          'plu'=>'required|numeric',
          'name'=>'string|required',
          'slug'=>'string|required',
          'sci_name'=>'string|nullable',
          'other_name'=>'string|nullable',
          'benefits'=>'string|nullable',
          'description'=>'string|nullable', 
          'dprecautions'=>'string|nullable',                 
          'photo'=>'required',
          'promotion'=>'required|in:default,new,trending',
          'minprice'=>'numeric|nullable',
          'photo.*'=>'image|mimes:jpg,jpeg,png,gif|max:1024|required',
          'coupon_id'=>'nullable|exists:coupons,id',            
          'status'=>'required|in:active,inactive'
          
      ]);
      $data=$request->all();        
      $slug=Str::slug($request->name);
      $count=Product::where('slug',$slug)->count();        
      $data['slug']=$slug;
      $status=Product::create($data);
          $categories = [];
          $categories[] = $request->cat_id;
          for($i=2; $i<=$request->cat_count; $i++){
              $cat= 'cat_id'.$i;
              $categories[] = $request->$cat;
          }
          foreach ($categories as $product_cat) {
              $category = new ProductCategory;
              $category['product_id']=$status->id;           
              $category['category_id']=$product_cat;
              $category->save();
          }        
          if($request->hasFile("images")){
              $files=$request->file("images");
              foreach($files as $file){
                  $imageName=time().'_'.$file->getClientOriginalName();
                  $request['product_id']=$status->id;
                  $request['plu']=$status->plu;
                  $request['image']=$imageName;
                  $file->move(\public_path("/images"),$imageName);
                  Image::create($request->all());
              }
          }            
          for($i=0; $i<count($request->form); $i++){
              $attribute = new ProductsAttribute;
              $attribute['product_id']=$status->id;           
              $attribute['plu']=$request->plu;
              $attribute['sku']= $request->sku[$i];
              $attribute['form']=$request->form[$i];
              $attribute['size']=$request->size[$i];
              $attribute['price']=$request->price[$i];
              $attribute['discount']=$request->discount[$i];
              $attribute['stock']=$request->stock[$i];
              //dd($request->all());
              $attribute->save();                             
          }
          if($status){
              request()->session()->flash('success','Product Successfully added');
          }
          else{
              request()->session()->flash('error','Please try again!!');
          }
          return redirect()->route('product.index');

  
      }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function show($id)
  {
      return view('products.import');
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function edit($id)
  {
      $brand=Brand::get();
      $product=Product::findOrFail($id);
      $category=Category::get();
      $items=Product::where('id',$id)->get();
      $attribute=ProductsAttribute::where('id',$id)->get();
      $image=Image::where('id',$id);
      // return $items;
      return view('backend.product.edit')->with('product',$product)
          ->with('brands',$brand)
          ->with('categories',$category)
          ->with('items',$items)
          ->with('attributes',$attribute)
          ->with('image',$image);
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function update(Request $request, $id)
  {
      //dd($request->all());
      $product=Product::findOrFail($id);
      // $this->validate($request,[
      //     'title'=>'string|required',
      //     'scientific'=>'string|nullable',
      //     'other_name'=>'string|nullable',
      //     'benafit'=>'string|nullable',
      //     'description'=>'string|nullable',
      //     'photo'=>'string|required',
      //     'minprice'=>'numeric|required',
      //     // 'cat_id'=>'required|exists:categories,id',
      //     // 'child_cat_id'=>'nullable|exists:categories,id',
      //     'is_featured'=>'sometimes|in:1',
      //     'brand_id'=>'nullable|exists:brands,id',
      //     'status'=>'required|in:active,inactive',
      //     'condition'=>'required|in:default,new,trending',
      //     'plu'=>'required|numeric'
      // ]);
      
      $data=$request->all();
      
      
      $data['is_featured']=$request->input('is_featured',0);
      $size=$request->input('size');
              
      $status=$product->fill($data)->save();
      
      $categories = [];
      
          $categories[] = $request->cat_id;
          for($i=2; $i<=$request->cat_count; $i++){
              $cat= 'cat_id'.$i;
              $categories[] = $request->$cat;
          }
          
          if($categories[0] != null)
          foreach ($categories as $product_cat) {
              $category = new ProductCategory;
              $category['product_id']=$id;           
              $category['category_id']=$product_cat;
              $category->save();
          }
          // dd($request->sku[0]);
    
          if($request->sku[0] != null)        
          for($i=0; $i<count((array)$request->form); $i++){
              $attribute = new ProductsAttribute;
              $attribute['product_id']=$id;           
              $attribute['plu']=$request->plu;
              $attribute['sku']= $request->sku[$i];
              $attribute['form']=$request->form[$i];
              $attribute['size']=$request->size[$i];
              $attribute['price']=$request->price[$i];
              $attribute['discount']=$request->discount[$i];
              $attribute['stock']=$request->stock[$i];
              $attribute['is_featured']=$request->is_featured; 
              
              $attribute->save();                             
          }  

          
      if($status){
          
          request()->session()->flash('success','Product Successfully updated');
      }
      else{
          request()->session()->flash('error','Please try again!!');
      }
      return redirect()->route('product.index');
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function destroy($id)
  {
      $product=Product::findOrFail($id);
      $status=$product->delete();
      
      if($status){
          request()->session()->flash('success','Product successfully deleted');
      }
      else{
          request()->session()->flash('error','Error while deleting product');
      }
      return redirect()->route('product.index');
  }
  public function addImage(Request $request, $id=null){
      $productDetails = Product::find($id);
      $path='images/';
          
          if($request->hasFile("images")){
              
              $files=$request->file("images");
              //dd($files);
              foreach($files as $file){
                  $imageName=time().'_'.$file->getClientOriginalName();
                  $request['product_id']=$productDetails->id;
                  $request['plu']=$productDetails->plu;
                  $request['image']=$imageName;
                  $file->move(\public_path("/images"),$imageName);
                  Image::create($request->all());
  
              }
      

          return redirect('/admin/product/add-images/'.$id)->with('success','Product Attributes has been added successfully!');        
  }
          return view('backend.product.image')->with(compact('productDetails'));
  }

  //delete Category
  public function deleteCategory($id, Request $request){
      $productCategory=ProductCategory::where('category_id',  $id)->where('product_id', $request->productId)->delete();
      //$status=$productCategory->delete();
      
      
      if($productCategory){
          request()->session()->flash('success','Product successfully deleted');
      }
      else{
          request()->session()->flash('error','Error while deleting product');
      }
  
      //return redirect()->back();
  }
      public function deleteImage($id){
          $product=Image::findOrFail($id);
          $status=$product->delete();
  //        dd($product);
          
          if($status){
              request()->session()->flash('success','Product successfully deleted');
          }
          else{
              request()->session()->flash('error','Error while deleting product');
          }
      //    return view('backend.product.add_attributes')->with(compact('productDetails'));
          return redirect()->back();
      }

      public function deleteAttribute($id){
          $product=ProductsAttribute::findOrFail($id);
          $status=$product->delete();
  //        dd($product);
          
          if($status){
              request()->session()->flash('success','Product successfully deleted');
          }
          else{
              request()->session()->flash('error','Error while deleting product');
          }
      
          return redirect()->back();
      }
  
      public function editAttributes(Request $request, $id = null){
          if($request->isMethod('post')){
              $data = $request->all();
              //echo "<pre>"; print_r($data); die;
              foreach($data['idAttr'] as $key => $attr){
                  ProductsAttribute::where(['id'=>$data['idAttr'][$key]])->update(['price'=>$data['price'][$key],
                  'discount'=>$data['discount'][$key],'stock'=>$data['stock'][$key]]);
              }
              
              return redirect()->back()->with('flash_message_success','Products Attributes has been update successfully');
          }
      }

      public function getProductForm(Request $request){
          $data = $request->all();
          $proFrr = explode("-",$data['idTitle']);
          $proFor = ProductForm::where(['id' => $proFrr[0], 'title' => $proFrr[1]])->first();  
          // echo "<pre>"; print_r($proFrr);die;      
          return $proFor->title;        
          //return back();
          
  
      }
      

}
