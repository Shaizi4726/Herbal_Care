@extends('backend.layouts.master')
@section('main-content')
  <div class="card">
    <h5 class="card-header">Edit Coupon</h5>
    <div class="card-body">
      <form method="post" action="{{route('coupon.update',$coupon->id)}}">
        @csrf 
        @method('PATCH')
          <div class="form-group">
            <label for="inputTitle" class="col-form-label">Coupon Code <span class="text-danger">*</span></label>
            <input id="inputTitle" type="text" name="code" placeholder="Enter Coupon Code"  value="{{$coupon->code}}" class="form-control">
            @error('code')
              <span class="text-danger">{{$message}}</span>
            @enderror
          </div>
          
          @php
            $products = DB::table('products')->where('status', 'active')->get();
            $users= DB::table('users')->where('status', 'active')->get();
          @endphp
          <div class="form-group">
            <label for="product-title" class="col-form-label">Product Name </label>
            <select id="product-title" name="product_id" class="form-control" >
              <option value="">---Select Product ---</option>
              @foreach($products as $product)
                <option name="product_id" value="{{$product->id}}">{{$product->title}}</option>
              @endforeach
            </select>
            @error('product_id')
              <span class="text-danger">{{$message}}</span>
            @enderror
          </div>
          
          <div class="form-group">
            <label for="user-fname" class="col-form-label">User Name </label>
            <select id="user" name="user_id" class="form-control" >
              <option value="">---Select User ---</option>
              @foreach($users as $user)
                <option name="user_id" value="{{$user->id}}">{{$user->fname}}&nbsp;{{$user->lname}}</option>
              @endforeach
            </select>
            @error('user_id')
              <span class="text-danger">{{$message}}</span>
            @enderror
          </div>
          <div class="form-group">
            <label for="expiry-date" class="col-form-label">Expiry Date </label>
            <input id="expiry-date" type="date" name="expiry_date" placeholder="Expiry date" value="{{$coupon->expiry_date}}" class="form-control">
            @error('expiry_date')
              <span class="text-danger">{{$message}}</span>
            @enderror
          </div>  
          <div class="form-group">
            <label for="type" class="col-form-label">Type <span class="text-danger">*</span></label>
            <select name="type" class="form-control">
              <option value="fixed" {{(($coupon->type=='fixed') ? 'selected' : '')}}>Fixed</option>
              <option value="percent" {{(($coupon->type=='percent') ? 'selected' : '')}}>Percent</option>
            </select>
            @error('type')
              <span class="text-danger">{{$message}}</span>
            @enderror
          </div>
  
          <div class="form-group">
            <label for="inputTitle" class="col-form-label">Value <span class="text-danger">*</span></label>
            <input id="inputTitle" type="number" name="value" placeholder="Enter Coupon value"  value="{{$coupon->value}}" class="form-control">
            @error('value')
              <span class="text-danger">{{$message}}</span>
            @enderror
          </div>
          
          <div class="form-group">
            <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
            <select name="status" class="form-control">
              <option value="active" {{(($coupon->status=='active') ? 'selected' : '')}}>Active</option>
              <option value="inactive" {{(($coupon->status=='inactive') ? 'selected' : '')}}>Inactive</option>
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
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>

@endpush