@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Add Product</h5>
    <div class="control-group">
        <label class="control-label">Product Name: </label>
        <label class="control-label"><strong>{{$productDetails->title}}</strong></label>
    </div>
    <div class="controls">
        <label class="control-label">Product Code: </label>
        <label class="control-label"><strong>{{$productDetails->id}}</strong></label>   
    </div>
    <div class="card-body">
      <form method="post" action="{{url('/admin/product/add-images/'.$productDetails->id)}}" enctype="multipart/form-data">
        {{csrf_field()}}
       <div class="form-group">
          
        <div id="holder" class="photo"></div>
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
        <div class="form-group mb-3">
          <button class="btn btn-success" type="submit">Submit</button>
        </div>
      </form>
      <table class="table table-bordered" id="product-dataTable" width="100%" cellspacing="0">
            <thead>
                <tr>
                    <th>Product Id</th>
                    <th>Image</th>                                    
                    <th>Action</th>
                </tr>
            </thead>  
            <tfoot>
                <tr>
                    <th>Product Id</th>
                    <th>Image</th>                                    
                    <th>Action</th>
                </tr>
            </tfoot>
            <body>
                @foreach($productDetails['images'] as $image)
                    <tr>
                        <td><input type="hidden" name="idAttr[]" value="{{$image->id}}">{{$image->id}}</td>
                        <td>
                            @if($image->image)
                                @php
                                    $photo=explode(',',$image->photo);
                                @endphp
                                <img src="{{('/images/'.$image->image)}}" class="img-fluid zoom" style="max-width:80px" >
                            @else
                                <img src="{{asset('backend/img/thumbnail-default.jpg')}}" class="img-fluid" style="max-width:80px">
                            @endif
                        </td>
                        <td class="center">
                            <form method="get" action="{{url('admin/product/delete-images',[$image->id])}}">
                                @csrf
                                @method('delete')
                                <button class="btn btn-danger btn-sm dltBtn" data-id="{{$image->id}}" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>  
                            </form>                                            
                        </td>                        
                    </tr>                    
                @endforeach                              
            </body>
        </table>
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

<style>
  .photo{margin-top:15px;max-height:100px;}
</style>
<script>
    $('#lfm').filemanager('image');

    $(document).ready(function() {
      $('#summary').summernote({
        placeholder: "Write summary description.....",
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
      $('#benafit').summernote({
        placeholder: "Write benafit.....",
          tabsize: 2,
          height: 150
      });
    });
    // $('select').selectpicker();

</script>

<script>
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
</script>
@endpush