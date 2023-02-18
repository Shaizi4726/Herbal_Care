@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Edit Category</h5>
    <div class="card-body">
      <form method="post" action="{{route('category.update',$category->id)}}">
        @csrf 
        @method('PATCH')
        <div class="form-group">
          <label for="inputName" class="col-form-label">Name <span class="text-danger">*</span></label>
          <input id="inputName" type="text" name="name" placeholder="Enter title"  value="{{$category->name}}" class="form-control">
          @error('name')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        @php
            $coupons = DB::table('coupons')->where('effect','category')->orderBy('id','DESC')->get();
        @endphp
        <div class="form-group" id='coupon_id'>
          <label for="coupon_id">Coupon</label>
          <select name="coupon_id" class="form-control">
            <option value="">--Select any coupon--</option>
            @foreach($coupons as $key=>$coupon)             
              <option value='{{$coupon->id}}'>{{$coupon->code}}</option>              
            @endforeach
          </select>
        </div>  
        
        <div class="form-group">
          <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
          <select name="status" class="form-control">
              <option value="active" {{(($category->status=='active')? 'selected' : '')}}>Active</option>
              <option value="inactive" {{(($category->status=='inactive')? 'selected' : '')}}>Inactive</option>
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
@endpush
@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>

@endpush