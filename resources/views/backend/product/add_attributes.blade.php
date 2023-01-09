@extends('backend.layouts.master')
@section('main-content')
<div class=container>
    <div class="row-fluid">
        <div class="span12">
            <div class="widget-box">
                <div class="widget-title"><span class="icon"><i class="icon-info-sign"></i></span>
                    <h5> Add Product Attributes</h5>
                </div>
                
                <div class="widget-content nopadding">
                    <form enctypes="multipart/form-data" class="form-horizontal" method="post" action="
                    {{url('/admin/product/add-attributes/'.$productDetails->id)}}" name="add_attribute" id="add_attribute" >{{csrf_field()}}
                        <input type="hidden" name="id" value="{{$productDetails->id}}">
                        
                        <div class="control-group">
                            <label class="control-label">Product Name: </label>
                            <label class="control-label"><strong>{{$productDetails->title}}</strong></label>
                        </div>
                        <div class="controls">
                            <label class="control-label">Product Code: </label>
                            <label class="control-label"><strong>{{$productDetails->id}}</strong></label>   
                        </div>
                        <div class="controls">
                            <label class="control-label">Product Price: </label>
                            <label class="control-label"><strong>{{$productDetails->price}}</strong></label>   
                        </div>
                        <div class="controls">
                            <label class="control-label">Form Name: </label>
                            
                            <select name="Form" class="form-control selForm" style="width:150px;">
                                <option value="">--Select Form--</option>
                                @foreach($forms as $form)                                
                                <option value="{{$form->id}}-{{$form->title}}">{{$form->title}}</option>                                
                                @endforeach
                            </select>  
                        </div>
                                                
                        <div class="control-group">
                            <label class="control-label"></label>
                            <div class="field_wrapper">
                                <div class="abc">
                                    <input type="select" class="title" name="form[]" id="form" placeholder="form" style="width:120px;"/>
                                    <input type="text" name="sku[]" id="sku" placeholder="sku" style="width:120px;" required/>                                    
                                    <input type="text" name="size[]" id="size" placeholder="size" style="width:120px;"required/>
                                    <input type="float"  name="price[]" id="price" placeholder="price" style="width:120px;"required/>
                                    <input id="discount" type="numberfloat" name="discount[]" min="0" max="100" placeholder="Enter discount" style="width:120px;"required/>
                                    <input type="float" name="stock[]" id="stock" placeholder="stock" style="width:120px;"required/>
                                IsFeature    <input type="checkbox" name="is_featured" id="is_featured" placeholder="Is Feature" value="1" checked> Yes
                                    <a href="javascript:void(0);" class="add_button" title="Add field">Add</a><br>
                                </div>
                            </div>
                        </div> <br>
                        <div class="form-actions">
                            <input type="submit" value="Add Attributes" class="btn btn-success">
                        </div>

                    </form>
                    <div>
                    <div class="widget-title"><span class="icon"><i class="icon-info-sign"></i></span>
                        <h5> Product Attributes List</h5>
                    </div>
                    <form method="post" action="{{url('/admin/product/edit-attributes/'.$productDetails->id)}}">
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
                            <tfoot>
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
                            </tfoot>
                            <body>
                                @foreach($productDetails['attributes'] as $attribute)
                                    <tr>
                                        <td><input type="hidden" name="idAttr[]" value="{{$attribute->id}}">{{$attribute->id}}</td>
                                        <td>{{$attribute->sku}}</td>                                        
                                        <td>{{$attribute->form}}</td>
                                        <td>{{$attribute->size}} </td>
                                        <td><input type="float" name="price[]" value="{{$attribute->price}}"></td>
                                        <td><input type="float" name="discount[]" value="{{$attribute->discount}}"></td>
                                        <td><input type="number" name="stock[]" value="{{$attribute->stock}}"></td>
                                    
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
                    
                </div>
            </div> 
        </div>
    </div> 
</div>

@endsection
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
    var max_fields = 10;
    var wrapper = $(".abc");
    var add_button = $(".add_button");

    var x = 1;
    $(add_button).click(function(e) {
        e.preventDefault();
        if (x < max_fields) {
            x++;
            $(wrapper).append('<div><input type="select" class="title" name="form[]" id="form" placeholder="form" style="width:120px;"/><input type="text" name="sku[]" id="sku" placeholder="sku" style="width:120px; margin-right:5px; margin-top:5px;" required /><input type="text" name="size[]" id="size" placeholder="size" style="width:120px; margin-right:5px" required/><input type="text" name="price[]" id="price" placeholder="price" style="width:120px; margin-right:4px" required/><input id="discount" type="number" name="discount[]" min="0" max="100" placeholder="Enter discount" style="width:120px;"required/><input type="text" name="stock[]" id="stock" placeholder="stock" style="width:120px; margin-right:4px" required/>IsFeature    <input type="checkbox" name="is_featured" id="is_featured" placeholder="Is Feature" value="1" checked> Yes <a href="#" class="delete">Delete</a></div>'); //add input box
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

$(document).ready(function(){
         $(".selForm").change(function(){
        //    alert("test");
            var idTitle =$(this).val();
        //    alert(idTitle);
            $.ajax({                
                type:'get',                
                url:'/get-product-form',                
                data:{idTitle:idTitle},                
                success:function(resp){                    
                   // alert(resp);
                    var arr =resp.split('#')                                         
                    $(".getTitle").html(arr[0]);
                    $(".title").val(arr[0]);
            //        alert(resp);
                },error:function(){
                    alert("Please Select Form");                    
                }
            });
            
        });
        
    
    });
		
    
</script>