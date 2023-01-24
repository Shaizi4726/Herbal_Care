@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Add city</h5>
    <div class="card-body">
      <form method="post" action="{{route('city.store')}}">
        {{csrf_field()}}
        <div class="form-group">
          <label for="country">Country<span>*</span></label>
          <input list="countries" placeholder="Country" name="country" id="country" class="countries-list">
          @php
            $countries = DB::table('countries')->where('status', 'active')->get();
          @endphp
          <datalist id="countries">
            @foreach($countries as $country)
            <option id="{{$country->id}}" value="{{$country->name}}">{{$country->name}}</option>
            @endforeach
          </datalist>
        </div>
      </div>
      <div class="fl-bl">
        <div id="state-div" class="form-group">
          <label for="state">State<span>*</span></label>
          <input list="states" placeholder="State" name="state" id="state" class="states-list">
          <datalist id="states"></datalist>
        </div>
        <div id="city-div" class="form-group">
          <label for="city">City<span>*</span></label>
          <input list="cities" placeholder="City" name="city" id="city" class="cities-list">
          <datalist id="cities"></datalist>
        </div>
      </div>

        <div class="form-group">
          <label for="price" class="col-form-label">Price <span class="text-danger">*</span></label>
        <input id="price" type="number" name="price" placeholder="Enter price"  value="{{old('price')}}" class="form-control">
        @error('price')
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
<style>
  .page-title {
  font-size: 30px;
  color: #2c542f;
  text-align: center;
  margin: 0.2em 0;
}

p {
  font-size: smaller;
  margin: 0 0 1em 1em;
}

.form-container {
  position: relative;
  display: flex;
  justify-content: flex-start;
  width: 90%;
  margin: 1em auto;
  box-shadow: 0 5px 10px 2px rgba(44, 84, 47, 0.5);
}

form {
  margin: 1em 0.5em;
  width: 100%;
}

label {
  display: block;
  font-size: 14px;
}

.form-group {
  display: block;
  flex: 50%;
  margin: 0.2em 0;
}

.form-group input {
  font-size: 14px;
  height: 2em;
  width: 100%;
  padding-left: 0.5em;
}

.fl-bl {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
}

.fl-bl > .form-group:first-child {
  margin-right: 0.5em;
}


.order-summary {
  width: 95vw;
  font-size: 2vw;
  color: #2c542f;
  background-color: #f2f4e6;
  margin: 1em auto;
  padding: 0.3em;
  text-align: justify;
}

.summary-title-container {
  text-align: center;
  font-size: 2vw;
  margin: 0.5em 0;
}

.coupon {
  margin: 0.5em auto;
  border-bottom: 2px solid #2c542f;
  padding: 1em;
  width: 90%;
}

.coupon h4 {
  display: block;
}

.coupon form {
  text-align: center;
  margin: 0.5em;
}

.coupon input {
  font-size: 2vw;
  width: 60vw;
  height: 2em;
  padding-left: 0.5em;
  outline: none;
  border: 1px solid #2c542f;
}

.coupon-btn {
  font-size: 2vw;
  font-weight: bold;
  background-color: #f2f4e6;
  height: 2em;
  width: 10vw;
  margin: -1em;
  border: 1px solid #2c542f;
}

h4, p {
  display: inline-block;
}

.cart-totals {
  width: 90%;
  padding: 1em;
  margin: auto;
}

.cart-total-value {
  margin-bottom: 0.5em;
}

.grand-total {
  font-size: 2.5vw;
  width: 90%;
  padding: 1em;
  margin: auto;
  border-top: 2px solid #2c542f;
}

.btn-checkout {
  font-size: 4vw;
  display: block;
  text-align: center;
  font-weight: bold;
  line-height: 10vw;
  height: 10vw;
  background-color: #2c542f;
  color: #faf9f6;
  width: 100%;
}

@media screen and (min-width: 768px) {
  .page-title {
    font-size: 40px;
  }

  .checkout-sec {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: flex-start;
  }

  .form-container {
    width: 65vw;
    margin: 0 1em 1em;
  }

  .order-summary {
    width: 25vw;
    font-size: 1.1vw;
    margin: 0 1em 0 0;
    box-shadow: 0 5px 10px 2px rgba(44, 84, 47, 0.5);
  }

  .summary-title-container {
    font-size: 1.1vw;
  }

  .coupon input {
    font-size: 1.1vw;
    width: 15vw;
  }

  .coupon-btn {
    font-size: 1.1vw;
    width: 4vw;
  }

  .grand-total {
    font-size: 1.4vw;
  }

  .btn-checkout {
    font-size: 1.6vw;
    line-height: 2.5vw;
    height: 4vw;
  }

  a.btn-checkout {
    color: #faf9f6;
  }
}

</style>
@endpush
@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>
<script>  
  $(function() {
    let cnty = $('#country');
    cnty.val('United Arab Emirates');

    $('#country').on('change', function() {
      let dl= $("#countries")[0];
      $('#state').val('');
      $('#city').val('');
      $('#states').empty();
      $('#cities').empty();
      if(this.value.trim() != ''){
        let opSelected = dl.querySelector(`[value="${this.value}"]`);
        let id = opSelected.getAttribute('id');

        /* AJAX request for adding shopping list items to cart */
        $.ajax({
          type: 'get',
          url: '/states',
          data: {
            id: id,
          },
          success: function (resp) {
            if(resp == '') {
              $('#state-div').hide();
              $('#city-div').hide();
            }
            else {
              $('#state-div').show();
              $('#city-div').show();
              let stDl = $('#states')[0];
              resp.forEach((element) => {
                let option = document.createElement("option");
                option.value = element['name'];
                option.text = element['name'];
                option.setAttribute('id', element['id']);
                option.setAttribute('data-country', id);
                stDl.appendChild(option);
              });
            }
          },
          error: function () {
            alert("An error occured while accessing states")
          }
        });
      }
    });


    $('#state').on('change', function() {
      let dl= $("#states")[0];
      $('#city').val('');
      $('#cities').empty();
      if(this.value.trim() != ''){
        let opSelected = dl.querySelector(`[value="${this.value}"]`);
        let id = opSelected.getAttribute('data-country');
        let st_id = opSelected.getAttribute('id');

        /* AJAX request for adding shopping list items to cart */
        $.ajax({
          type: 'get',
          url: '/cities',
          data: {
            id: id,
            st_id: st_id
          },
          success: function (resp) {
            if(resp == '') {
              $('#city-div').hide();
            }
            else {
              $('#city-div').show();
              let stDl = $('#cities')[0];
              resp.forEach((element) => {
                let option = document.createElement('option');
                option.value = element['name'];
                option.text = element['name'];
                stDl.appendChild(option);
              });
            }
          },
          error: function () {
            alert("An error occured while accessing states")
          }
        });
      }
    });
    cnty.trigger('change');
  });
</script>
@endpush