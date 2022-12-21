@php
    $Product = DB::table('products')->where('id', $id)->first();
    $Images = DB::table('images')->where('product_id', $id)->get();
@endphp



<section class="modal-container"  id="modal-{{ $id }}">
    <div class="modal">
        <button type="button" class="btn close" id="close-btn" onclick="closeModal('{{ $id }}')"><i class="fa-solid fa-xmark"></i></button>
        <div class="exzoom" id="exzoom-{{ $id }}">
            <div class="exzoom_img_box">
            <ul class="exzoom_img_ul">
                <li><img src="{{ $Product->photo }}" alt="product-photo"></li>
                @foreach ($Images as $img)
                <li><img src="/images{{ $img->image }}" alt=""></li>
                @endforeach
            </ul>
            </div>
            <div class="exzoom_nav"></div>
            <!-- Nav Buttons -->
            <p class="exzoom_btn">
            <a href="javascript:void(0);" class="exzoom_prev_btn"> < </a>
            <a href="javascript:void(0);" class="exzoom_next_btn"> > </a>
            </p>
        </div>
    </div>
</section>