<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductsAttribute;
use App\Models\ProductForm;
use App\Models\Category;
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
        $products=Product::getAllProduct();
        // return $products;
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
        $category=Category::where('is_parent',1)->get();
        // return $category;
        return view('backend.product.create')->with('categories',$category)->with('brands',$brand);
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
            'title'=>'string|required',
            'scientific'=>'string|required',
            'summary'=>'string|required',
            'benafit'=>'string|nullable',
            'description'=>'string|nullable',
            'plu'=>'nullable|numeric',
            'photo'=>'required',
            'photo.*'=>'image|mimes:jpg,jpeg,png,gif|max:1024|required',
            // 'photo'=>'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'cat_id'=>'required|exists:categories,id',
            'child_cat_id'=>'nullable|exists:categories,id',
            'brand_id'=>'nullable|exists:brands,id',            
            'is_featured'=>'sometimes|in:1',
            'status'=>'required|in:active,inactive',
            'condition'=>'required|in:default,new,trending'
            
        ]);
        $data=$request->all();
        //dd($data);
        $slug=Str::slug($request->title);
        $count=Product::where('slug',$slug)->count();
        // if($count>0){
        //     $slug=$slug.'-'.date('ymdis').'-'.rand(0,999);
        // }
        $data['slug']=$slug;
        $data['is_featured']=$request->input('is_featured',0);
        
/*        $size=$request->input('size');
        if($size){
            $data['size']=implode(',',$size);
        }
        else{
            $data['size']='';
        }
        // return $size;
        // return $data;
        $status=Product::create($data);
        $product = Product::createForSizes(
            $request->only('name', 'sizes', 'prices')
        );
    
        return $product 
            ? redirect()->route('some.route')
            : redirect()->route('some.other.route');
            
*/
        $status=Product::create($data);
        
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
        $category=Category::where('is_parent',1)->get();
        $items=Product::where('id',$id)->get();
        $image=Image::where('id',$id);
        // return $items;
        return view('backend.product.edit')->with('product',$product)
            ->with('brands',$brand)
            ->with('categories',$category)
            ->with('items',$items)
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
        $product=Product::findOrFail($id);
        $this->validate($request,[
            'title'=>'string|required',
            'scientific'=>'string|required',
            'summary'=>'string|required',
            'benafit'=>'string|nullable',
            'description'=>'string|nullable',
            'photo'=>'string|required',
            'cat_id'=>'required|exists:categories,id',
            'child_cat_id'=>'nullable|exists:categories,id',
            'is_featured'=>'sometimes|in:1',
            'brand_id'=>'nullable|exists:brands,id',
            'status'=>'required|in:active,inactive',
            'condition'=>'required|in:default,new,trending',
            'plu'=>'nullable|numeric'
        ]);
        
        $data=$request->all();
       
        $data['is_featured']=$request->input('is_featured',0);
        $size=$request->input('size');
        // if($size){
        //     $data['size']=implode(',',$size);
        // }
        // else{
        //     $data['size']='';
        // }
                
        // return $data;
        
        $status=$product->fill($data)->save();
        
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

        public function addAttributes(Request $request, $id=null){
        

            $productDetails = Product::with('attributes')->where(['id'=>$id])->first();
            $form = ProductForm::with('attributesForm')->get();
            
    
      //      $productDetails =json_decode(json_encode($productDetails));
     //       echo "<pre>"; print_r($productDetails);die;
    
            if($request->isMethod('post')){
                $data =$request->all();
                $plu=$data['plu'];
                
                foreach($data['sku'] as $key=>$val){
                    
                    if(!empty($val)){
                        
                        //sku duplicate check
                        $attrCountSKU=ProductsAttribute::where('sku',$val)->count();
                        if($attrCountSKU>0){
                            return redirect('/admin/product/add-attributes/'.$id)->with('Error',
                            'SKU already exists! Please add another SKU');
                        }
                        
                        $attribute = new ProductsAttribute;                        
                        $attribute->product_id=$id;
                        $attribute->plu=$plu;
                        $attribute->sku= $val;
                        $attribute->form=$data['form'][$key];
                        $attribute->size=$data['size'][$key];
                        $attribute->price=$data['price'][$key];
                        $attribute->discount=$data['discount'][$key];
                        $attribute->stock=$data['stock'][$key];
                        $attribute->is_featured=true;    
                        $attribute->save();
                    }
                }
        
                return redirect('/admin/product/add-attributes/'.$id)->with('success','Product Attributes has been added successfully!');
            }
            
            return view('backend.product.add_attributes')->with(compact('productDetails'))->with('forms',$form);
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
