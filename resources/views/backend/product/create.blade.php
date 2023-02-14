@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Add Product</h5>
    
    <div class="card-body">
      <form method="post" action="{{route('product.store')}}" enctype="multipart/form-data">
        {{csrf_field()}}
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Plu Code <span class="text-danger">*</span></label>
          <input id="inputTitle" type="text" name="plu" placeholder="Enter Plu"  value="{{old('plu')}}" class="form-control">
          @error('title')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Name <span class="text-danger">*</span></label>
          <input id="inputTitle" type="text" name="title" placeholder="Enter Name"  value="{{old('title')}}" class="form-control">
          @error('title')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Scientific Name</label>
          <input id="inputTitle" type="text" name="sci_name" placeholder="Enter Scientific Name"  value="{{old('sci_name')}}" class="form-control">
          @error('sci_name')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="other_name" class="col-form-label">Other Name </label>
          <textarea class="form-control" id="other_name" name="other_name">{{old('other_name')}}</textarea>
          @error('other_name')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="benefit" class="col-form-label">Benefit</label>
          <textarea class="form-control" id="benefit" name="benefit">{{old('benefit')}}</textarea>
          @error('benefit')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="description" class="col-form-label">Description</label>
          <textarea class="form-control" id="description" name="description">{{old('description')}}</textarea>
          @error('description')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="dprecautions" class="col-form-label">Precautions</label>
          <textarea class="form-control" id="precautions" name="precautions">{{old('precautions')}}</textarea>
          @error('precautions')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="category_id">Category</label>
          {{-- {{$categories}} --}}
          <select name="category_id" class="form-control">
              <option value="">--Select category--</option>
             @foreach($categories as $category)
              <option value="{{$category->id}}">{{$category->name}}</option>
             @endforeach
          </select>
        </div>      
        <div class="form-group">
          <label for="brand_id">Brand</label>
          {{-- {{$brands}} --}}
          <select name="brand_id" class="form-control">
              <option value="">--Select Brand--</option>
             @foreach($brands as $brand)
              <option value="{{$brand->id}}">{{$brand->name}}</option>
             @endforeach
          </select>
        </div>
        <div class="form-group">
          <label for="promotion">Promotion</label>
          <select name="promotion" class="form-control">
              <option value="">--Select Promotion--</option>
              <option value="popular">Popular</option>
              <option value="new">New</option>
              <option value="trending">Trending</option>
          </select>
        </div>
        <div class="form-group">
          <label for="minprice" class="col-form-label">Min Price <span class="text-danger">*</span></label>
          <input id="minprice" type="number" name="minprice" value="{{old('minprice')}}" class="form-control">
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
                <input type="select" class="title" name="form[]" id="form" placeholder="form" style="width:120px;"/>
                <input type="text" name="sku[]" id="sku" placeholder="sku" style="width:120px;" required/>                                    
                <input type="text" name="size[]" id="size" placeholder="size" style="width:120px;"required/>
                <input type="float"  name="price[]" id="price" placeholder="price" style="width:120px;"required/>
                <input id="discount" type="numberfloat" name="discount[]" min="0" max="100" placeholder="Enter discount" style="width:120px;"required/>
                <input type="float" name="stock[]" id="stock" placeholder="stock" style="width:120px;"required/>
                <a href="javascript:void(0);" class="add_button1" title="Add field">Add</a><br>
              </div>
            </div>
          </div>
        </div>

       <div class="form-group">
          <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger">*</span></label>
          <div class="input-group">
              <span class="input-group-btn">
                  <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary">
                  <i class="fa fa-picture-o"></i> Choose
                  </a>
              </span>
          <input id="thumbnail" class="form-control" type="text" name="photo" value="{{old('photo')}}">
        </div>
        <div id="holder" style="margin-top:15px;max-height:100px;"></div>
          @error('photo')
            <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger"></span></label>
          <div class="input-group">
              <span class="input-group-btn">
                <input type="file" id="input-file-now-custom-3" class="form-control m-2" name="images[]" multiple>
              </span>          
          </div>
        </div>
        
        <div class="form-group">
          <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
          <select name="status" class="form-control">
              <option value="active">Active</option>
              <option value="inactive">Inactive</option>
          </select>
          @error('status')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group mb-3">
          <button type="reset" class="btn btn-warning">Reset</button>
          <button class="btn btn-success" type="submit">Submit</button>
        </div>
      </form>
    </div>
</div>

@endsection

@push('styles')
<link rel="stylesheet" href="{{asset('backend/summernote/summernote.min.css')}}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
@endpush
@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

<script>
    $('#lfm').filemanager('image');

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

    $(document).ready(function() {
      $('#benefit').summernote({
        placeholder: "Write benefit.....",
          tabsize: 2,
          height: 150
      });
    });
    $(document).ready(function() {
      $('#precautions').summernote({
        placeholder: "Write precautions.....",
          tabsize: 2,
          height: 150
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
    var wrapper = $(".abc");
    var add_button = $(".add_button1");

    var x = 1;
    $(add_button).click(function(e) {
        e.preventDefault();
        if (x < max_fields) {
            x++;
            $(wrapper).append('<div><input type="select" class="title" name="form[]" id="form" placeholder="form" style="width:120px;"/><input type="text" name="sku[]" id="sku" placeholder="sku" style="width:120px; margin-right:5px; margin-top:5px;" required /><input type="text" name="size[]" id="size" placeholder="size" style="width:120px; margin-right:5px" required/><input type="text" name="price[]" id="price" placeholder="price" style="width:120px; margin-right:4px" required/><input id="discount" type="number" name="discount[]" min="0" max="100" placeholder="Enter discount" style="width:120px;"required/><input type="text" name="stock[]" id="stock" placeholder="stock" style="width:120px; margin-right:4px" required/><a href="#" class="delete">Delete</a></div>');//add input box
           
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
