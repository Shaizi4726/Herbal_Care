@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Add User</h5>
    <div class="card-body">
      <form method="post" action="{{route('users.store')}}">
        {{csrf_field()}}
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">First Name</label>
          <input id="inputTitle" type="text" name="fname" placeholder="Enter first name"  value="{{old('fname')}}" class="form-control">
        @error('fname')
        <span class="text-danger">{{$message}}</span>
        @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Last Name</label>
          <input id="inputTitle" type="text" name="lname" placeholder="Enter last name"  value="{{old('lname')}}" class="form-control">
        @error('lname')
        <span class="text-danger">{{$message}}</span>
        @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Company Name</label>
          <input id="inputTitle" type="text" name="company" placeholder="Enter company name"  value="{{old('cname')}}" class="form-control">
        @error('cname')
        <span class="text-danger">{{$message}}</span>
        @enderror
        </div>
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">TRN Number</label>
          <input id="inputTitle" type="number" name="trn" placeholder="Enter trn number"  value="{{old('trn_number')}}" class="form-control">
        @error('trn_number')
        <span class="text-danger">{{$message}}</span>
        @enderror
        </div>
        <div class="form-group">
            <label for="inputEmail" class="col-form-label">Email</label>
          <input id="inputEmail" type="email" name="email" placeholder="Enter email" class="form-control">
          @error('email')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
            <label for="inputPassword" class="col-form-label">Password</label>
          <input id="inputPassword" type="password" name="password" placeholder="Enter password" class="form-control">
          @error('password')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
        <label for="inputPhoto" class="col-form-label">Photo</label>
        <div class="input-group">
            <span class="input-group-btn">
                <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary">
                <i class="fa fa-picture-o"></i> Choose
                </a>
            </span>
            <input id="thumbnail" class="form-control" type="text" name="photo" value="{{old('photo')}}">
        </div>
        <img id="holder" style="margin-top:15px;max-height:100px;">
          @error('photo')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <!-- @php 
        $roles=DB::table('users')->select('role')->distinct()->get();
        @endphp -->
        <div class="form-group">
            <label for="role" class="col-form-label">Role</label>
            <select name="role" class="form-control" value="{{old('role')}}">
              <option value="">-----Select Role-----</option>
              @foreach($roles as $role)
                  <option value="{{$role->role}}">{{$role->role}}</option>
              @endforeach
            </select>
          @error('role')
          <span class="text-danger">{{$message}}</span>
          @enderror
          </div>
          <div class="form-group">
            <label for="status" class="col-form-label">Status</label>
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

@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script>
    $('#lfm').filemanager('image');
</script>
@endpush