@extends('admin_panel.layouts.master')

@section('main-content')

<div class="card">
  <h5 class="card-header">Edit Product</h5>
  <div class="card-body">
    <form method="post" id="main-form" action="{{route('product.update',$product->id)}}">
      @csrf 
      @method('PATCH')
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Plu Code <span class="text-danger">*</span></label>
        <input id="inputTitle" type="text" name="plu" placeholder="Enter Plu"  value="{{$product->plu}}" class="form-control">
        @error('plu')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Name <span class="text-danger">*</span></label>
        <input id="inputTitle" type="text" name="name" placeholder="Enter Name"  value="{{$product->name}}" class="form-control">
        @error('name')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
        
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Scientific Name/ Boltical Name </label>
        <input id="inputTitle" type="text" name="sci_name" placeholder="Enter Scientific Name"  value="{{$product->sci_name}}" class="form-control">
        @error('sci_name')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>

      <div class="form-group">
        <label for="other_name" class="col-form-label">Other name </label>
        <textarea id="other_name" name="other_name" placeholder="Enter Other Name"  value="{{$product->other_name}}" class="form-control">{{$product->other_name}}</textarea>
        @error('other_name')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="benefit" class="col-form-label">Benefit</label>
        <textarea class="form-control" id="benefits" name="benefits" value="{{$product->benefits}}">{{$product->benefits}}</textarea>
        @error('benefits')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>     
      <div class="form-group">
        <label for="description" class="col-form-label">Description</label>
        <textarea class="form-control" id="description" name="description" value="{{$product->description}}">{{$product->description}}</textarea>
        @error('description')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="precautions" class="col-form-label">Precautions</label>
        <textarea class="form-control" id="precautions" name="precautions" value="{{$product->precautions}}">{{$product->precautions}}</textarea>
        @error('precautions')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
          <label for="coupon_id">Coupon</label>
          {{-- {{$coupons}} --}}
          <div class="coupon">
            <select name="coupon_id" id="coupon_id" class="form-control">
              <option value="">--Select Coupon--</option>
              @foreach($coupons as $coupon)
              <option value="{{$coupon->id}}">{{$coupon->code}}</option>
              @endforeach
            </select>
          </div>         
        </div>
        <div class="form-group">
          <div id="category">
            <label for="category_id">Category</label>
            {{-- {{$categories}} --}}
            <select name="cat_id" id="category_id" class="form-control category_id">
              <option value="">--Select category--</option>
              @foreach($categories as $category)
              <option value="{{$category->id}}">{{$category->name}}</option>
              @endforeach
            </select>
          
            <div class="form-group d-none child_cat_div" id="child_cat_div">
              <label for="child_cat_id">Sub Category</label>
              <select name="subcat_id" id="child_cat_id" class="form-control child_cat_id">
                <option value="">--Select any category--</option>
                {{-- @foreach($subcategories as $key=>$subcategory)
                  <option value='{{$subcategory->id}}'>{{$subcategory->name}}</option>
                @endforeach --}}
              </select> 
              
            </div>
            <a href="javascript:void(0);" class="category_button" title="Add field">Add</a><br> 
          </div>
          <input type="hidden" id="cat_count" name="cat_count" value="">
          <input type="hidden" id="subcat_count" name="subcat_count" value="">          
        </div>
        
      <div class="form-group">
        <label for="brand_id">Brand</label>
        <select name="brand_id" class="form-control">
            <option value="">--Select Brand--</option>
            @foreach($brands as $brand)
            <option value="{{$brand->id}}" {{(($product->brand_id==$brand->id)? 'selected':'')}}>{{$brand->name}}</option>
            @endforeach
        </select>
      </div>

      <div class="form-group">
        <label for="promotion">promotion</label>
        <select name="promotion" class="form-control">
          <option value="">--Select promotion--</option>
          <option value="default" {{(($product->promotion=='default')? 'selected':'')}}>Default</option>
          <option value="new" {{(($product->promotion=='new')? 'selected':'')}}>New</option>
          <option value="trending" {{(($product->promotion=='trending')? 'selected':'')}}>Trending</option>
        </select>
      </div>
      <div class="form-group">
        <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger">*</span></label>
        <div class="input-group">
            <span class="input-group-btn">
              <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary text-white">
                <i class="fas fa-image"></i> Choose
              </a>
            </span>
          <input id="thumbnail" class="form-control" type="text" name="photo" value="{{$product->photo}}">
        </div>
        <div id="holder" style="margin-top:15px;max-height:100px;"></div>
          @error('photo')
            <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        
        <div class="form-group">
          <label for="inputPrice" class="col-form-label">Min Price <span class="text-danger">*</span></label>
          <input id="inputPrice" type="number" name="minprice" value="{{$product->minprice}}" class="form-control">
          @error('minprice')
            <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        @php
          $forms = DB::table('product_forms')->get();
        @endphp

        <div class="controls">
          <label class="control-label">Size Wise Price: </label>                                
          <div class="control-group">
            
            <div class="field_wrapper">
              <div class="abc">
                <input type="text" name="flu[]" id="flu" placeholder="flu" style="width:120px;"/> 
                <input type="select" class="form_id" name="form_id[]" id="form" placeholder="form_id" style="width:120px;"/>
                <input type="text" name="sku[]" id="sku" placeholder="sku" style="width:120px;" />                                    
                <input type="text" name="size[]" id="size" placeholder="size" style="width:120px;"/>
                <input type="float"  name="price[]" id="price" placeholder="price" style="width:120px;"/>
                <input id="discount" type="numberfloat" name="discount[]" min="0" max="100" placeholder="Enter discount" style="width:120px;"/>
                <input type="float" name="stock[]" id="stock" placeholder="stock" style="width:120px;"/>
                <a href="javascript:void(0);" class="add_button1" title="Add field">Add</a><br>
              </div>
            </div>
          </div>
        </div>
      <div class="widget-title"  ><span class="icon"><i class="icon-info-sign"></i></span>
        <h5> Product Attributes List</h5>
      </div>
      
      <form method="post" action="{{url('/admin/product/edit-attributes/'.$product->id)}}" >
        {{csrf_field()}}
          <table class="table table-bordered" id="product-dataTable" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th>Flu</th>
                <th>SKU</th>
                <th>Form</th>
                <th>Size</th>
                <th>Price</th>
                <th>Discount</th>
                <th>Stock</th>                                    
                <th>Action</th>
              </tr>
            </thead>  
                
            <body>
              @foreach($product['attrs'] as $attribute)
                <tr>
                  <td><input type="hidden" name="idAttr[]" value="{{$attribute->id}}">{{$attribute->flu}}</td>
                  <td>{{$attribute->sku}}</td>                                        
                  <td>{{$attribute->form->name}}</td>
                  <td>{{$attribute->size}} </td>
                  <td><input type="float" name="price[]" value="{{$attribute->price}}" style="width:80px;"></td>
                  <td><input type="float" name="discount[]" value="{{$attribute->discount}}" style="width:80px;"></td>
                  <td><input type="number" name="stock[]" value="{{$attribute->stock}}" style="width:80px;"></td>
                        
                  <td class="center">
                    <input type="submit" value="Update" class="btn btn-primary btn-mini">
                </form>                                                                                   
                <form method="get" action="{{url('admin/product/delete-attributes',[$attribute->id])}}">
                  @csrf
                  @method('delete')
                  <button class="btn btn-danger btn-sm dltBtn" data-id="{{$attribute->id}}" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>  
                </form>
              </td>                        
            </tr>                    
          @endforeach
                    
        </body>
      </table>

      <div class="form-group">
        <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger"></span></label>
        <div class="input-group">
            <span class="input-group-btn">
              <input type="file" form="main-form" id="input-file-now-custom-3" class="form-control m-2" name="images[]" multiple>
            </span>          
        </div>
      </div>
      <form method="post" action="{{url('/admin/product/edit-attributes/'.$product->id)}}" >
        {{csrf_field()}}
        <table class="table table-bordered" id="product-dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>              
              <th>Id</th>
              <th>image</th>                            
              <th>Action</th>
            </tr>
          </thead>
          <body>
            @foreach($product['images'] as $image)
              <tr>
                <!-- <td><input type="hidden" name="idAttr[]" value="{{$attribute->id}}">{{$attribute->id}}</td> -->
                <td>{{$image->id}}</td>                                    
                <td>{{$image->name}} </td>                        
                <td class="center">
              </form>                                                                                   
              <form method="get" action="{{url('admin/product/delete-images',[$image->id])}}">
                @csrf
                @method('delete')
                <button class="btn btn-danger btn-sm dltBtn" data-id="{{$attribute->id}}" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>  
              </form>
            </td>                        
          </tr>                    
        @endforeach                         
      </body>
    </table>

      <div class="form-group">
        <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
        <select name="status" form="main-form" class="form-control">
          <option value="active" {{(($product->status=='active')? 'selected' : '')}}>Active</option>
          <option value="inactive" {{(($product->status=='inactive')? 'selected' : '')}}>Inactive</option>
        </select>
        @error('status')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group mb-3">
          <button class="btn btn-success" form="main-form" type="submit">Update</button>
      </div>
    
    </div>
</div>

@endsection

@push('styles')
<link rel="stylesheet" href="{{asset('admin_panel/summernote/summernote.min.css')}}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
@endpush
@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{asset('admin_panel/summernote/summernote.min.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

<script>
  $('#lfm').filemanager('image');

  $(document).ready(function() {
    $('#other_name').summernote({
      placeholder: "Write other_name.....",
        tabsize: 2,
        height: 100
    });
  });

  $(document).ready(function() {
    $('#description').summernote({
      placeholder: "Write detail description.....",
        tabsize: 2,
        height: 100
    });
  });

  $(document).ready(function() {
    $('#benefits').summernote({
      placeholder: "Write benefit.....",
        tabsize: 2,
        height: 100
    });
  });
  $(document).ready(function() {
    $('#precautions').summernote({
      placeholder: "Write precautions.....",
        tabsize: 2,
        height: 100
    });
  });
  // $('select').selectpicker();
  
</script>

<script type="text/javascript">
  $(document).ready(function() {
    $(".btn-success").click(function(){ 
        var html = $(".clone").html();
        $(".increment").after(html);
    });
    $("body").on("click",".btn-danger",function(){ 
        $(this).parents(".control-group").remove();
    });
  });


  $(document).ready(function() {
    var max_fields = 15;
    var wrapper = $(".brand");
    var add_button = $(".brand_button");

    var x = 1;
    $(add_button).click(function(e) {
        e.preventDefault();
        if (x < max_fields) {
          x++;
          $(wrapper).append(`<div><br><select name="brand_id${x}" id="brand_id${x}" class="form-control">
          <option value="">--Select Brand--</option>@foreach($brands as $brand)
          <option value="{{$brand->id}}">{{$brand->name}}</option>@endforeach</select>
          <a href="#" class="delete">Delete</a></div>`);//add input box
          $("#brand_count").val(x);
        } else {
          alert('You Reached the limits')
        }
    });

    $(wrapper).on("click", ".delete", function(e) {
      e.preventDefault();
      $(this).parent('div').remove();
      x--;
    })
  });

  $(document).ready(function() {
    var max_fields = 15;
    var x = 1;
    var wrapper = $("#category");
    var add_button = $(".category_button");
    
    $(add_button).click(function(e) {
      e.preventDefault();
      if (x < max_fields) {
        x++;
        $(wrapper).append(`<div class="category${x}"><br><label for="cat_id">Category</label>
        <select name="cat_id${x}" id="category_id${x}" class="form-control category_id${x}">
          <option value="">--Select category--</option>
          @foreach($categories as $category)
          <option value="{{$category->id}}">{{$category->name}}</option>
          @endforeach
        </select>
        
        <div class="form-group d-none child_cat_div${x}" id="child_cat_div${x}">
          <label for="subcat_id${x}">Sub Category</label>
          <select name="subcat_id${x}" id="child_cat_id${x}" class="form-control child_cat_id${x}">
            <option value="">--Select any category--</option>
            {{-- @foreach($subcategories as $key=>$subcategory)
              <option value='{{$subcategory->id}}'>{{$subcategory->name}}</option>
            @endforeach --}}
          </select>
        </div> <a href="#" class="delete">Delete</a></div>`);
        $("#cat_count").val(x);
        $("#subcat_count").val(x);
        
      } else {
        alert('You Reached the limits')
      }
      $(`.category_id${x}`).change(function (){         
        var category_id=$(this).val();
        if(category_id !=null){         
          // Ajax call
          $.ajax({        
            url:`/admin/category/"+category_id+"/child`,
            data:{
              _token:"{{csrf_token()}}",
              id:category_id
            },
            type:"GET",
            success:function(response){       
              if(typeof(response) !='object'){
                response=$.parseJSON(response)            
              }
              var html_option="<option value=''>----Select sub category----</option>"
              if(response.status){
                var data=response.data;
                if(response.data){
                  $(`.child_cat_div${x}`).removeClass('d-none');
                  $.each(data,function(id,name){
                    html_option +="<option value='"+id+"'>"+name+"</option>"
                  });
                }
                else{ 
                }
              }
              else{
                
                $(`.child_cat_div${x}`).addClass('d-none');
              }
              $(`.child_cat_id${x}`).html(html_option);
            }
          });
        }
        else{
        }
        
      })
    });
    $(wrapper).on("click", ".delete", function(e) {
      e.preventDefault();
      $(this).parent('div').remove();
      x--;
    })
  });
 
  $('.category_id').change(function (){ 
        
    var category_id=$(this).val();
    console.log(category_id);
    if(category_id !=null){
      //alert(category_id);
      // Ajax call
      $.ajax({        
        url:"/admin/category/"+category_id+"/child",
        data:{
          _token:"{{csrf_token()}}",
          id:category_id
        },
        type:"GET",
        success:function(response){       
          if(typeof(response) !='object'){
            response=$.parseJSON(response)            
          }
          var html_option="<option value=''>----Select sub category----</option>"
          if(response.status){
            var data=response.data;
            if(response.data){
              $('.child_cat_div').removeClass('d-none');
              $.each(data,function(id,name){
                html_option +="<option value='"+id+"'>"+name+"</option>"
              });
            }
            else{ 
            }
          }
          else{
            
            $('.child_cat_div').addClass('d-none');
          }
          $('.child_cat_id').html(html_option);
        }
      });
    }
    else{
    }
    
  })


  $(document).ready(function() {
    var max_fields = 15;
    var wrapper = $(".abc");
    var add_button = $(".add_button1");

    var x = 1;
    $(add_button).click(function(e) {
        e.preventDefault();
        if (x < max_fields) {
            x++;
            $(wrapper).append(`<div>
            <input type="text" name="flu[]" id="flu" placeholder="flu" style="width:120px;margin-right:5px; margin-top:5px;"/>
            <input type="select" class="form_id" name="form_id[]" id="form" placeholder="form_id" style="width:120px;"/>
            <input type="text" name="sku[]" id="sku" placeholder="sku" style="width:120px; margin-right:5px; margin-top:5px;" required />
            <input type="text" name="size[]" id="size" placeholder="size" style="width:120px; margin-right:5px margin-top:5px;" required/>
            <input type="text" name="price[]" id="price" placeholder="price" style="width:120px; margin-right:5px margin-top:5px;" required/>
            <input id="discount" type="number" name="discount[]" min="0" max="100" placeholder="Enter discount" style="width:120px;"required/>
            <input type="text" name="stock[]" id="stock" placeholder="stock" style="width:120px; margin-right:5px margin-top:5px;" required/>
            <a href="#" class="delete">Delete</a></div>`);//add input box
           
        } else {
            alert('You Reached the limits')
        }
    });

    $(wrapper).on("click", ".delete", function(e) {
      e.preventDefault();
      $(this).parent('div').remove();
      x--;
    })
  });

  
</script>
@endpush
