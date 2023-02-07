@extends('backend.layouts.master')

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
        <input id="inputTitle" type="text" name="title" placeholder="Enter Name"  value="{{$product->title}}" class="form-control">
        @error('title')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
        
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Scientific Name/ Boltical Name </label>
        <input id="inputTitle" type="text" name="scientific" placeholder="Enter Scientific Name"  value="{{$product->scientific}}" class="form-control">
        @error('scientific')
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
      <label for="benefit" class="col-form-label">benefit</label>
        <textarea class="form-control" id="benefit" name="benefit" value="{{$product->benafit}}">{{$product->benafit}}</textarea>
        @error('benefit')
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
        <label for="is_featured">Is Featured</label><br>
        <input type="checkbox" name='is_featured' id='is_featured' value='{{$product->is_featured}}' {{(($product->is_featured) ? 'checked' : '')}}> Yes                        
      </div>
      <div class="EditCategory">
        {{-- {{$categories}} --}}
        @php
          $categories = DB::table('categories')->get();
          $product_categories = DB::table('product_categories')->where('product_id', $product->id)->get();
        @endphp
        <div class="modal-shopping-list" id="modal-shopping-list">
          <table id="shopping-list-table">
            <h6>Category List</h6>
            <thead>
              <tr>
                <!-- <th id="s-no">S.No</th> -->
                <th id="cat-id">Id</th>
                <th id="cat-name">Category</th>	
                <th>Action</th>								
              </tr>
            </thead>
              @foreach($product_categories as $prod_cat)
                @php
                  $cat_title = DB::table('categories')->where('id', $prod_cat->category_id)->first();      
                @endphp      
              <tr id="{{$prod_cat->category_id}}-tr">
                <td>{{$prod_cat->category_id}}</td>
                <td class="td-cat-title" value="{{$cat_title->title}}">{{$cat_title->title}}</td>
                <td>
                  <button type="button" onclick="proCatDlt(<?=$product->id?>,<?=$prod_cat->category_id?>)"><i class="fas fa-trash-alt"></i></button>
                </td>
              </tr>
              @endforeach
              <tbody id="list-body">
						</tbody>
          </table>
        </div>
          
        <div class="form-group">
          <label for="cat-id">Category <span class="text-danger">*</span></label>
          <select name="cat_id" id="cat-id" class="control-group">
            <option value="">--Select any category--</option>
            @foreach($categories as $key=>$cat_data)
              <option value='{{$cat_data->id}}' id="{{$cat_data->title}}">{{$cat_data->title}}</option>
            @endforeach
          </select>          
          <a href="javascript:void(0);" class="add_button" id="add-cat-select" title="Add field">Add</a><br>
          <input type="hidden" id="cat-count" name="cat_count" value="">
          @error('title')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
      </div>
      <div class="form-group">
        <label for="brand_id">Brand</label>
        <select name="brand_id" class="form-control">
            <option value="">--Select Brand--</option>
            @foreach($brands as $brand)
            <option value="{{$brand->id}}" {{(($product->brand_id==$brand->id)? 'selected':'')}}>{{$brand->title}}</option>
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
      <div class="controls">
          <label class="control-label">Size Wise Price: </label>                        
      </div>                                
      <div class="control-group">
        <label class="control-label"></label>
        <div class="field_wrapper">
          <div class="abc">
            <input type="select" class="title" name="form[]" id="form" placeholder="form" style="width:120px;"/>
            <input type="text" name="sku[]" id="sku" placeholder="sku" style="width:120px;"/>                                    
            <input type="text" name="size[]" id="size" placeholder="size" style="width:120px;"/>
            <input type="float"  name="price[]" id="price" placeholder="price" style="width:120px;"/>
            <input id="discount" type="numberfloat" name="discount[]" min="0" max="100" placeholder="Enter discount" style="width:120px;"/>
            <input type="float" name="stock[]" id="stock" placeholder="stock" style="width:120px;"/>
            IsFeature  <input type="checkbox" name="is_featured" id="is_featured" placeholder="Is Feature" value="1" checked> Yes
            <a href="javascript:void(0);" class="add_button1" title="Add field">Add</a><br>
          </div>
        </div>
      </div>
      </form>
      <div class="widget-title"  ><span class="icon"><i class="icon-info-sign"></i></span>
        <h5> Product Attributes List</h5>
      </div>
      
      <form method="post" action="{{url('/admin/product/edit-attributes/'.$product->id)}}" >
        {{csrf_field()}}
          <table class="table table-bordered" id="product-dataTable" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th>Product Id</th>
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
              @foreach($product['attributes'] as $attribute)
                <tr>
                  <td><input type="hidden" name="idAttr[]" value="{{$attribute->id}}">{{$attribute->id}}</td>
                  <td>{{$attribute->sku}}</td>                                        
                  <td>{{$attribute->form}}</td>
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
              <th>Plu</th>
              <th>Product Id</th>
              <th>image</th>                            
              <th>Action</th>
            </tr>
          </thead>
          <body>
            @foreach($product['images'] as $image)
              <tr>
                <td><input type="hidden" name="idAttr[]" value="{{$attribute->id}}">{{$attribute->id}}</td>
                <td>{{$image->plu}}</td>                                        
                <td>{{$image->product_id}}</td>
                <td>{{$image->image}} </td>                        
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
<link rel="stylesheet" href="{{asset('backend/summernote/summernote.min.css')}}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />

@endpush
@push('scripts')

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>

<script>
  $(document).ready(function() {
    $('#benefit').summernote({
      placeholder: "Write benefit.....",
        tabsize: 2,
        height: 150
    });
  });
  $(document).ready(function() {
    $('#other_name').summernote({
      placeholder: "Write other_name.....",
      tabsize: 2,
      height: 150
    });
  });
  $(document).ready(function() {
    $('#description').summernote({
      placeholder: "Write detail description.....",
        tabsize: 2,
        height: 150
    });
  });
  var  child_cat_id='{{$product->child_cat_id}}';
    // alert(child_cat_id);
    $('#cat_id').change(function(){
      var cat_id=$(this).val();

      if(cat_id !=null){
          // ajax call
        $.ajax({
          url:"/admin/category/"+cat_id+"/child",
          type:"POST",
          data:{
              _token:"{{csrf_token()}}"
          },
          success:function(response){
            if(typeof(response)!='object'){
                response=$.parseJSON(response);
            }
            var html_option="<option value=''>--Select any one--</option>";
            if(response.status){
                var data=response.data;
                if(response.data){
                    $('#child_cat_div').removeClass('d-none');
                    $.each(data,function(id,title){
                        html_option += "<option value='"+id+"' "+(child_cat_id==id ? 'selected ' : '')+">"+title+"</option>";
                    });
                  }
                  else{
                      console.log('no response data');
                  }
              }
              else{
                  $('#child_cat_div').addClass('d-none');
              }
              $('#child_cat_id').html(html_option);

          }
        });
      }
      else{

      }

    });
    if(child_cat_id!=null){
        $('#cat_id').change();
    }

    $(document).ready(function() {
    var max_fields = 10;
    var wrapper = $(".EditCategory");
    

    var x = 1;
    $("#add-cat-select").click(function(e) {
        e.preventDefault();
        if (x < max_fields) {
          $(wrapper).append(`<div><div class="form-group"><label for="cat_id${x}">Category <span class="text-danger">*</span></label><select name="cat_id${x}" id="cat_id${x}" class="control-group"><option value="">--Select any category--</option>@foreach($categories as $key=>$cat_data)<option value="{{$cat_data->id}}">{{$cat_data->title}}</option>@endforeach</select><a href="#" class="delete">Delete</a></div></div>`); //add input box
          $("#cat-count").val(x);
          x++;
          } 
          else {
            alert('You Reached the limits')
        }
    });

    $(wrapper).on("click", ".delete", function(e) {
      e.preventDefault();
      $(this).parent('div').remove();
      x--;
    })
  });

function proCatDlt(productId, catId){
  $("#" + catId + "-tr").remove();
 
  $.ajax({
    url:'/admin/product/delete-category/' + catId,
    type:"get",
    data:{
        productId:productId
    },
    success:function(response){
        
    }});
  }

  $.each($('.td-cat-title'), (key, value) => {
    let el = document.getElementById(value.innerText);
    if(el !== undefined) {
      // el.setAttribute('disabled', 'disabled');
      el.style.display = 'none';
    }
  });
  $(document).ready(function() {
    var max_fields = 15;
    var wrapper = $(".abc");
    var add_button = $(".add_button1");

    var x = 1;
    $(add_button).click(function(e) {
        e.preventDefault();
        if (x < max_fields) {
            x++;
            $(wrapper).append('<div><input type="select" class="title" name="form[]" id="form" placeholder="form" style="width:120px;"/><input type="text" name="sku[]" id="sku" placeholder="sku" style="width:120px; margin-right:5px; margin-top:5px;"  /><input type="text" name="size[]" id="size" placeholder="size" style="width:120px; margin-right:5px" /><input type="text" name="price[]" id="price" placeholder="price" style="width:120px; margin-right:4px" /><input id="discount" type="number" name="discount[]" min="0" max="100" placeholder="Enter discount" style="width:120px;"/><input type="text" name="stock[]" id="stock" placeholder="stock" style="width:120px; margin-right:4px" />IsFeature    <input type="checkbox" name="is_featured" id="is_featured" placeholder="Is Feature" value="1" checked> Yes <a href="#" class="delete">Delete</a></div>');//add input box
           
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
