@extends('admin.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Update Blog</h5>
    
    <div class="card-body">
      <form method="post" action="{{ route('blogs.update', ['blog' => $blog->id]) }}" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="form-group">
          <label for="title" class="col-form-label">Title<span class="text-danger">*</span></label>
          <input id="title" type="text" name="title" placeholder="Enter Title" value="{{ $blog->title }}" class="form-control">
          @error('name')
            <span class="text-danger">{{ $message }}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="post" class="col-form-label">Post</label>
          <textarea class="form-control" id="post" name="post">{{ $blog->post }}</textarea>
          @error('post')
            <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        
        <div class="form-group">
          <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
          <select name="status" class="form-control">
              <option value="active" @selected(old('status') == $blog->status)>Active</option>
              <option value="inactive" @selected(old('status') == $blog->status)>Inactive</option>
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
    $('#post').summernote({
      placeholder: "Write post body...",
        tabsize: 2,
        height: 100
    });
  });
  
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
