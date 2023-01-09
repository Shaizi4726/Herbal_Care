@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Add Product</h5>
    
    <div class="card-body">
      <form method="post" action="{{route('product.store')}}" enctype="multipart/form-data">
        {{csrf_field()}}
<<<<<<< HEAD

=======
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Plu Code</label>
          <input id="inputTitle" type="text" name="plu" placeholder="Enter Plu"  value="{{old('plu')}}" class="form-control">
          @error('title')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Name <span class="text-danger">*</span></label>
          <input id="inputTitle" type="text" name="title" placeholder="Enter Name"  value="{{old('title')}}" class="form-control">
          @error('title')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
<<<<<<< HEAD

=======
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Scientific Name/ Boltical Name <span class="text-danger">*</span></label>
          <input id="inputTitle" type="text" name="scientific" placeholder="Enter Scientific Name"  value="{{old('scientific')}}" class="form-control">
          @error('scientific')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
<<<<<<< HEAD

        <div class="form-group">
          <label for="summary" class="col-form-label">Other Name <span class="text-danger">*</span></label>
          <textarea class="form-control" id="summary" name="summary">{{old('summary')}}</textarea>
          @error('summary')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <!-- <div class="form-group">
          <label for="other1" class="col-form-label">Other Name 1</label>
          <input id="inputTitle" type="text" name="other1" placeholder="Enter Other Name "  value="{{old('other1')}}" class="form-control">
          @error('benefit')
=======
        <div class="form-group">
          <label for="other_name" class="col-form-label">Other Name <span class="text-danger">*</span></label>
          <textarea class="form-control" id="other_name" name="other_name">{{old('summary')}}</textarea>
          @error('other_name')
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
<<<<<<< HEAD
          <label for="other2" class="col-form-label">Other Name 2</label>
          <input id="inputTitle" type="text" name="other2" placeholder="Enter Other Name"  value="{{old('other2')}}" class="form-control">
=======
          <label for="benefit" class="col-form-label">benefit</label>
          <textarea class="form-control" id="benefit" name="benefit">{{old('benefit')}}</textarea>
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          @error('benefit')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
<<<<<<< HEAD
          <label for="other3" class="col-form-label">Other Name 3</label>
          <input id="inputTitle" type="text" name="other3" placeholder="Enter Other Name"  value="{{old('other3')}}" class="form-control">
          @error('benefit')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="other4" class="col-form-label">Other Name 4</label>
          <input id="inputTitle" type="text" name="other4" placeholder="Enter Other Name"  value="{{old('other4')}}" class="form-control">
          @error('benefit')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="other5" class="col-form-label">Other Name 5</label>
          <input id="inputTitle" type="text" name="other5" placeholder="Enter Other Name"  value="{{old('other5')}}" class="form-control">
          @error('benefit')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="other6" class="col-form-label">Other Name 6</label>
          <input id="inputTitle" type="text" name="other6" placeholder="Enter Other Name"  value="{{old('other6')}}" class="form-control">
          @error('benefit')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="other7" class="col-form-label">Other Name 7</label>
          <input id="inputTitle" type="text" name="othrt7" placeholder="Enter Other Name"  value="{{old('other7')}}" class="form-control">
          @error('benefit')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div> -->

        <div class="form-group">
          <label for="benafit" class="col-form-label">benefit</label>
          <textarea class="form-control" id="benafit" name="benafit">{{old('benefit')}}</textarea>
          @error('benefit')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
=======
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          <label for="description" class="col-form-label">Description</label>
          <textarea class="form-control" id="description" name="description">{{old('description')}}</textarea>
          @error('description')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
<<<<<<< HEAD


=======
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
        <div class="form-group">
          <label for="is_featured">Is Featured</label><br>
          <input type="checkbox" name='is_featured' id='is_featured' value='1' checked> Yes                        
        </div>
<<<<<<< HEAD
              {{-- {{$categories}} --}}

        <div class="form-group">
          <label for="cat_id">Category <span class="text-danger">*</span></label>
          <select name="cat_id" id="cat_id" class="form-control">
=======
        <div class="AddCategory">
            {{-- {{$categories}} --}}
          @php
            $categories = DB::table('categories')->get();
          @endphp
          <div class="form-group">
            <label for="cat_id">Category <span class="text-danger">*</span></label>
            <select name="cat_id" id="cat_id" class="form-control">
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
              <option value="">--Select any category--</option>
              @foreach($categories as $key=>$cat_data)
                  <option value='{{$cat_data->id}}'>{{$cat_data->title}}</option>
              @endforeach
<<<<<<< HEAD
          </select>
        </div>

        <div class="form-group d-none" id="child_cat_div">
=======
            </select>
          </div>
          <a href="javascript:void(0);" class="add_button" title="Add field">Add</a><br>
          <input type="hidden" id="cat_count" name="cat_count" value="">
        </div>
        <!-- <div class="form-group d-none" id="child_cat_div">
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          <label for="child_cat_id">Sub Category</label>
          <select name="child_cat_id" id="child_cat_id" class="form-control">
              <option value="">--Select any category--</option>
              {{-- @foreach($parent_cats as $key=>$parent_cat)
                  <option value='{{$parent_cat->id}}'>{{$parent_cat->title}}</option>
              @endforeach --}}
          </select>
<<<<<<< HEAD
        </div>

        <div class="form-group">
          <label for="price" class="col-form-label">Price(NRS) <span class="text-danger">*</span></label>
          <input id="price" type="number" name="price" placeholder="Enter price"  value="{{old('price')}}" class="form-control">
          @error('price')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="discount" class="col-form-label">Discount(%)</label>
          <input id="discount" type="number" name="discount" min="0" max="100" placeholder="Enter discount"  value="{{old('discount')}}" class="form-control">
          @error('discount')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
<!--        <div class="form-group">
          <label for="size">Size</label>
          <select name="size[]" class="form-control selectpicker"  multiple data-live-search="true">
              <option value="">--Select any size--</option>
              <option value="S">gram (g)</option>
              <option value="M">Kg (K)</option>
              <option value="L">Large (L)</option>
              <option value="XL">Extra Large (XL)</option>
          </select>
        </div>
-->
        <div class="form-group">
          <label for="brand_id">Brand</label>
          {{-- {{$brands}} --}}

=======
        </div>        -->
        <div class="form-group">
          <label for="brand_id">Brand</label>
          {{-- {{$brands}} --}}
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          <select name="brand_id" class="form-control">
              <option value="">--Select Brand--</option>
             @foreach($brands as $brand)
              <option value="{{$brand->id}}">{{$brand->title}}</option>
             @endforeach
          </select>
        </div>
<<<<<<< HEAD

        <div class="form-group">
          <label for="condition">Condition</label>
          <select name="condition" class="form-control">
              <option value="">--Select Condition--</option>
              <option value="default">Default</option>
              <option value="new">New</option>
              <option value="hot">Hot</option>
          </select>
        </div>

        <div class="form-group">
          <label for="stock">Quantity <span class="text-danger">*</span></label>
          <input id="quantity" type="number" name="stock" min="0" placeholder="Enter quantity"  value="{{old('stock')}}" class="form-control">
          @error('stock')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <!-- <div class="input-group control-group increment" >
        <span class="input-group-btn">
            <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary">
            <i class="fa fa-picture-o"></i> Choose
            </a>
        </span>
          <input id="thumbnail" class="form-control" type="text" name="photo" value="{{old('photo')}}">
          <div class="input-group-btn"> 
            <button class="btn btn-success" type="button"><i class="glyphicon glyphicon-plus"></i>Add</button>
          </div>
        </div>
        <div class="clone hide">
          <div class="control-group input-group" style="margin-top:10px">
            <span class="input-group-btn">
              <a id="lfm" data-input="thumbnail1" data-preview="holder" class="btn btn-primary">
                <i class="fa fa-picture-o"></i> Choose
              </a>
            </span>
            <input id="thumbnail1" class="form-control" type="text" name="photo" value="{{old('photo')}}">
            <div class="input-group-btn"> 
              <button class="btn btn-danger" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>
            </div>                  
          </div>
        </div> -->
        <div class="form-group">
=======
        <div class="form-group">
          <label for="promotion">Promotion</label>
          <select name="promotion" class="form-control">
              <option value="">--Select Promotion--</option>
              <option value="default">Default</option>
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
       <div class="form-group">
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
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
<<<<<<< HEAD
          <span class="text-danger">{{$message}}</span>
=======
            <span class="text-danger">{{$message}}</span>
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          @enderror
        </div>

        <div class="form-group">
          <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger"></span></label>
          <div class="input-group">
              <span class="input-group-btn">
<<<<<<< HEAD
                <input type="file" id="input-file-now-custom-3" class="form-control m-2" name="images[]" multiple>                                   
              </span>          
          </div>
        </div>        
=======
                <input type="file" id="input-file-now-custom-3" class="form-control m-2" name="images[]" multiple>
              </span>          
          </div>
        </div>
        
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
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
<<<<<<< HEAD
           <button class="btn btn-success" type="submit">Submit</button>
=======
          <button class="btn btn-success" type="submit">Submit</button>
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
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

<<<<<<< HEAD

=======
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
<script>
    $('#lfm').filemanager('image');

    $(document).ready(function() {
<<<<<<< HEAD
      $('#summary').summernote({
        placeholder: "Write summary description.....",
=======
      $('#other_name').summernote({
        placeholder: "Write other_name.....",
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
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
<<<<<<< HEAD
      $('#benafit').summernote({
        placeholder: "Write benafit.....",
=======
      $('#benefit').summernote({
        placeholder: "Write benefit.....",
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          tabsize: 2,
          height: 150
      });
    });
    // $('select').selectpicker();

</script>

<<<<<<< HEAD
<script>
=======
<!-- <script>
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
  $('#cat_id').change(function(){
    var cat_id=$(this).val();
    // alert(cat_id);
    if(cat_id !=null){
      // Ajax call
      $.ajax({
        url:"/admin/category/"+cat_id+"/child",
        data:{
          _token:"{{csrf_token()}}",
          id:cat_id
        },
        type:"POST",
        success:function(response){
          if(typeof(response) !='object'){
            response=$.parseJSON(response)
          }
          // console.log(response);
          var html_option="<option value=''>----Select sub category----</option>"
          if(response.status){
            var data=response.data;
            // alert(data);
            if(response.data){
              $('#child_cat_div').removeClass('d-none');
              $.each(data,function(id,title){
                html_option +="<option value='"+id+"'>"+title+"</option>"
              });
            }
            else{
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
  })
<<<<<<< HEAD
</script>
=======
</script> -->
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800

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
<<<<<<< HEAD
</script>
@endpush
=======


    $(document).ready(function() {
    var max_fields = 10;
    var wrapper = $(".AddCategory");
    var add_button = $(".add_button");

    var x = 1;
    $(add_button).click(function(e) {
        e.preventDefault();
        if (x < max_fields) {
            x++;
            $(wrapper).append(`<div><div class="form-group"><label for="cat_id${x}">Category <span class="text-danger">*</span></label><select name="cat_id${x}" id="cat_id${x}" class="form-control"><option value="">--Select any category--</option>@foreach($categories as $key=>$cat_data)<option value="{{$cat_data->id}}">{{$cat_data->title}}</option>@endforeach</select></div><a href="#" class="delete">Delete</a></div>`); //add input box
            $("#cat_count").val(x);
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
</script>
@endpush
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
