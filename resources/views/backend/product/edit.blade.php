@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Edit Product</h5>
    <div class="card-body">
      <form method="post" action="{{route('product.update',$product->id)}}">
        @csrf 
        @method('PATCH')
        <div class="form-group">
<<<<<<< HEAD
=======
          <label for="inputTitle" class="col-form-label">Plu Code </label>
          <input id="inputTitle" type="text" name="plu" placeholder="Enter Plu"  value="{{$product->plu}}" class="form-control">
          @error('plu')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          <label for="inputTitle" class="col-form-label">Name <span class="text-danger">*</span></label>
          <input id="inputTitle" type="text" name="title" placeholder="Enter Name"  value="{{$product->title}}" class="form-control">
          @error('title')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Scientific Name/ Boltical Name <span class="text-danger">*</span></label>
          <input id="inputTitle" type="text" name="scientific" placeholder="Enter Scientific Name"  value="{{$product->scientific}}" class="form-control">
          @error('scientific')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Other name <span class="text-danger">*</span></label>
<<<<<<< HEAD
          <input id="inputTitle" type="text" name="summary" placeholder="Enter Other Name"  value="{{$product->summary}}" class="form-control">
          @error('summary')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <!-- <div class="form-group">
          <label for="inputTitle" class="col-form-label">Other Name 1</label>
          <input id="inputTitle" type="text" name="other1" placeholder="Enter Other Name "  value="{{old('other1')}}" class="form-control">
          @error('other1')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Other Name 2</label>
          <input id="inputTitle" type="text" name="other2" placeholder="Enter Other Name"  value="{{old('other2')}}" class="form-control">
          @error('other2')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Other Name 3</label>
          <input id="inputTitle" type="text" name="other3" placeholder="Enter Other Name"  value="{{old('other3')}}" class="form-control">
          @error('other3')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Other Name 4</label>
          <input id="inputTitle" type="text" name="other4" placeholder="Enter Other Name"  value="{{old('other4')}}" class="form-control">
          @error('other4')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Other Name 5</label>
          <input id="inputTitle" type="text" name="other5" placeholder="Enter Other Name"  value="{{old('other5')}}" class="form-control">
          @error('other5')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Other Name 6</label>
          <input id="inputTitle" type="text" name="other6" placeholder="Enter Other Name"  value="{{old('other6')}}" class="form-control">
          @error('other6')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Other Name 7</label>
          <input id="inputTitle" type="text" name="othrt7" placeholder="Enter Other Name"  value="{{old('other7')}}" class="form-control">
          @error('other7')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div> -->

=======
          <input id="inputTitle" type="text" name="other_name" placeholder="Enter Other Name"  value="{{$product->other_name}}" class="form-control">
          @error('other name')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
        <div class="form-group">
        <label for="inputTitle" class="col-form-label">benefit</label>
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
<<<<<<< HEAD


=======
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
        <div class="form-group">
          <label for="is_featured">Is Featured</label><br>
          <input type="checkbox" name='is_featured' id='is_featured' value='{{$product->is_featured}}' {{(($product->is_featured) ? 'checked' : '')}}> Yes                        
        </div>
<<<<<<< HEAD
              {{-- {{$categories}} --}}

        <div class="form-group">
          <label for="cat_id">Category <span class="text-danger">*</span></label>
          <select name="cat_id" id="cat_id" class="form-control">
              <option value="">--Select any category--</option>
              @foreach($categories as $key=>$cat_data)
                  <option value='{{$cat_data->id}}' {{(($product->cat_id==$cat_data->id)? 'selected' : '')}}>{{$cat_data->title}}</option>
              @endforeach
          </select>
        </div>
        @php 
          $sub_cat_info=DB::table('categories')->select('title')->where('id',$product->child_cat_id)->get();
        // dd($sub_cat_info);
        @endphp
        {{-- {{$product->child_cat_id}} --}}
        <div class="form-group {{(($product->child_cat_id)? '' : 'd-none')}}" id="child_cat_div">
          <label for="child_cat_id">Sub Category</label>
          <select name="child_cat_id" id="child_cat_id" class="form-control">
              <option value="">--Select any sub category--</option>
          </select>
        </div>

        <div class="form-group">
          <label for="price" class="col-form-label">Price(NRS) <span class="text-danger">*</span></label>
          <input id="price" type="number" name="price" placeholder="Enter price"  value="{{$product->price}}" class="form-control">
          @error('price')
=======
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
            <select name="cat_id" id="cat-id" class="form-control">
              <option value="">--Select any category--</option>
              @foreach($categories as $key=>$cat_data)
                <option value='{{$cat_data->id}}' id="{{$cat_data->title}}">{{$cat_data->title}}</option>
              @endforeach
            </select>
          </div>
          <a href="javascript:void(0);" class="add_button" id="add-cat-select" title="Add field">Add</a><br>
          <input type="hidden" id="cat-count" name="cat_count" value="">
          @error('title')
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
<<<<<<< HEAD
          <label for="discount" class="col-form-label">Discount(%)</label>
          <input id="discount" type="number" name="discount" min="0" max="100" placeholder="Enter discount"  value="{{$product->discount}}" class="form-control">
          @error('discount')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
<!--        <div class="form-group">
          <label for="size">Size</label>
          <select name="size[]" class="form-control selectpicker"  multiple data-live-search="true">
              <option value="">--Select any size--</option>
              @foreach($items as $item)              
                @php 
                $data=explode(',',$item->size);
                // dd($data);
                @endphp
              <option value="S"  @if( in_array( "S",$data ) ) selected @endif>Gram(gm)</option>
              <option value="M"  @if( in_array( "M",$data ) ) selected @endif>KiloGram(kg)</option>
              <option value="L"  @if( in_array( "L",$data ) ) selected @endif>Large(L)</option>
              <option value="XL"  @if( in_array( "XL",$data ) ) selected @endif>Extra Large(XL)</option>
              @endforeach
          </select>
        </div>-->
        <div class="form-group">
=======
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          <label for="brand_id">Brand</label>
          <select name="brand_id" class="form-control">
              <option value="">--Select Brand--</option>
             @foreach($brands as $brand)
              <option value="{{$brand->id}}" {{(($product->brand_id==$brand->id)? 'selected':'')}}>{{$brand->title}}</option>
             @endforeach
          </select>
        </div>

        <div class="form-group">
<<<<<<< HEAD
          <label for="condition">Condition</label>
          <select name="condition" class="form-control">
              <option value="">--Select Condition--</option>
              <option value="default" {{(($product->condition=='default')? 'selected':'')}}>Default</option>
              <option value="new" {{(($product->condition=='new')? 'selected':'')}}>New</option>
              <option value="hot" {{(($product->condition=='hot')? 'selected':'')}}>Hot</option>
=======
          <label for="promotion">promotion</label>
          <select name="promotion" class="form-control">
              <option value="">--Select promotion--</option>
              <option value="default" {{(($product->promotion=='default')? 'selected':'')}}>Default</option>
              <option value="new" {{(($product->promotion=='new')? 'selected':'')}}>New</option>
              <option value="trending" {{(($product->promotion=='trending')? 'selected':'')}}>Trending</option>
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
          </select>
        </div>

        <div class="form-group">
<<<<<<< HEAD
          <label for="stock">Quantity <span class="text-danger">*</span></label>
          <input id="quantity" type="number" name="stock" min="0" placeholder="Enter quantity"  value="{{$product->stock}}" class="form-control">
          @error('stock')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
=======
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
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
<<<<<<< HEAD
        <div class="form-group">
          <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger"></span></label>
          <div class="input-group">
              <span class="input-group-btn">
                <input type="file" id="input-file-now-custom-3" class="form-control m-2" name="images[]" multiple>                                   
              </span>
          </div>          
=======
        
        <div class="form-group">
          <label for="inputPrice" class="col-form-label">Min Price <span class="text-danger">*</span></label>
          <input id="inputPrice" type="number" name="minprice" value="{{$product->minprice}}" class="form-control">
          @error('minprice')
          <span class="text-danger">{{$message}}</span>
          @enderror
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
        </div>
        <div class="form-group">
          <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
          <select name="status" class="form-control">
            <option value="active" {{(($product->status=='active')? 'selected' : '')}}>Active</option>
            <option value="inactive" {{(($product->status=='inactive')? 'selected' : '')}}>Inactive</option>
        </select>
          @error('status')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group mb-3">
           <button class="btn btn-success" type="submit">Update</button>
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
      $('#description').summernote({
        placeholder: "Write detail Description.....",
          tabsize: 2,
          height: 150
      });
    });

    $(document).ready(function() {
      $('#benefit').summernote({
        placeholder: "Write benafit.....",
          tabsize: 2,
          height: 150
      });
    });

</script>

<script>
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
<<<<<<< HEAD
</script>
@endpush
=======

    $(document).ready(function() {
    var max_fields = 10;
    var wrapper = $(".EditCategory");
    

    var x = 1;
    $("#add-cat-select").click(function(e) {
        e.preventDefault();
        if (x < max_fields) {
          $(wrapper).append(`<div><div class="form-group"><label for="cat_id${x}">Category <span class="text-danger">*</span></label><select name="cat_id${x}" id="cat_id${x}" class="form-control"><option value="">--Select any category--</option>@foreach($categories as $key=>$cat_data)<option value="{{$cat_data->id}}">{{$cat_data->title}}</option>@endforeach</select></div><a href="#" class="delete">Delete</a></div>`); //add input box
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
</script>
@endpush
>>>>>>> d8559f744df9370ca6a4187387e209ef3e2c8800
