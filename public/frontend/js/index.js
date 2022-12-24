var responsiveSlider = function() {
  var slider = document.getElementById("slider");
  var sliderWidth = slider.offsetWidth;
  var slideList = document.getElementById("carousel-wrap");
  var count = 1;
  var items = slideList.querySelectorAll("li").length;
  var prev = document.getElementById("slide-prev");
  var next = document.getElementById("slide-next");

  window.addEventListener('resize', function() {
    sliderWidth = slider.offsetWidth;
  });

  var prevSlide = function() {
    if(count > 1) {
      count -= 2;
      slideList.style.left = '-' + count * sliderWidth + 'px';
      count++;
    }

    else if(count == 1) {
      count = items - 1;
      slideList.style.left = '-' + count * sliderWidth + 'px';
      count++;
    }
  };

  var nextSlide = function() {
    if(count < items) {
      slideList.style.left = '-' + count * sliderWidth + 'px';
      count++;
    }

    else if (count == items) {
      slideList.style.left = '0px';
      count = 1;
    }
  };

  next.addEventListener('click', function() {
    nextSlide();
  });

  prev.addEventListener('click', function() {
    prevSlide();
  });

  setInterval(function() {
    nextSlide();
  }, 4000);
};

var totalAmount = 0;

function shopList() {
  let form = $("[name='product-form']:checked").val();
  let price = $("[name='price-input']").val();
  let size = $("[name='product-size']:checked").val();
  let quant = $("[name='quantity']").val();
  let amount = price * quant;
 
  let row = document.getElementById(`${form}-${size}-quant`);
  
  tableRow: {
    if (row !== null) {
      break tableRow;
    }
    $('#shopping-list-table > tbody').append(`<tr><td>${form}</td>
    <td>${size}</td>
    <td id = "${form}-${size}-quant">${quant}</td>
    <td>${price}</td>
    <td id = "${form}-${size}-amnt">AED ${amount.toFixed(2)}</td></tr>`);
    totalAmount += amount;
  }

  if (row !== null) {
    let quantity = Number(row.innerHTML) + Number(quant);
    row.innerHTML = quantity;
    document.getElementById(`${form}-${size}-amnt`).innerHTML = `AED ${(price * quantity).toFixed(2)}`;
    totalAmount += amount;
  }
  $("#list-total").html(`AED ${totalAmount.toFixed(2)}`);
  let button = $("#modal-cart-button");
  button.show();
}

var el = document.getElementById('modal-container');
var modal;
var form;

function showModal(...args) {
  form = args[4][0];
  document.getElementById(args[0]).disabled = true;
  args[6] = args[6].toFixed(2);
  args[7] = args[7].toFixed(2);
  var createModal = () => {
    modal = document.createElement('div');
    modal.setAttribute('class', 'modal');
    modal.setAttribute('id', 'modal' + args[0]);
    modal.innerHTML = `
      <button type="button" class="btn close" id="close-btn" onclick="closeModal(${args[0]})"><i class="fa-solid fa-xmark"></i></button>
      <div class="modal-content">
        <div class="exzoom" id="exzoom">
          <div class="exzoom_img_box">
            <ul class="exzoom_img_ul">
              <li><img src="${args[1]}" alt="product-photo"></li>
              ${
                args[2].map(item =>
                `<li><img src="images${item}" alt=""></li>`
              ).join('')}
            </ul>
          </div>
          <div class="exzoom_nav"></div>
          <!-- Nav Buttons -->
          <p class="exzoom_btn">
            <a href="javascript:void(0);" class="exzoom_prev_btn"> < </a>
            <a href="javascript:void(0);" class="exzoom_next_btn"> > </a>
          </p>
        </div>
        <div class="modal-details-container">
          <div class="product-modal-detail">
            <h1 class="title">${args[3]}</h1>

            <form id="modal-form">
              <input type="hidden" name="id" value="${args[0]}">
              <div class="forms modal-radio" id="forms">
                ${createForms(args[4])}
              </div>
              <div class="prices" id="price">
                <h3>AED ${args[6]} - AED ${args[7]}</h3>
              </div>
              <div class="sizes modal-radio" id="sizes"></div>
              <input type="hidden" name="price-input" id="price-input" value="">
              <div class="qty-manage" id="qty-manage">
                <input type="button" value="-" class="qty-minus minus qty-control" field="quantity" disabled>
                <input type="number" name="quantity" value="1" min="1" class="qty">
                <input type="button" value="+" class="qty-plus plus qty-control" field="quantity">
              </div>
              <input type="button" id="modal-submit" class="btn btn-submit" value="Add to List" onclick="shopList()">
            </form>

            <form "  action="/add-to-cart" data="${args[0]}" id="modal-cart-form">
              <button id="modal-cart-button" class="modal-cart-button">
                <span class="add-to-cart">Add to cart</span>
                <span class="added">Added</span>
                <i class="fas fa-shopping-cart"></i>
                <i class="fas fa-box"></i>
              </button>
            </form>
            
            <a href="/product-detail/${args[0]}" class="modal-view-link btn" id="modal-view-link"><i class="fa-solid fa-circle-info" id="product-details-icon"></i>VIEW PRODUCT DETAILS</a>
          </div>

          <div class="modal-shopping-list" id="modal-shopping-list">
              <table id="shopping-list-table">
                <caption>Shopping List</caption>
                <thead>
                    <tr>
                      <th id="list-frm">Form</th>
                      <th id="list-sze">Size</th>
                      <th id="list-qty">Quantity</th>
                      <th id="list-prc">Unit Price</th>
                      <th id="list-amt">Amount</th>
                    </tr>
                </thead>
                <tbody id="list-body">
                </tbody>
                <tfoot>
                  <tr>
                    <th colspan="3">Total Amount</th>
                    <th colspan="2" id="list-total"></th>
                  </tr>
                </tfoot>
              </table>
          </div>
        </div>
      </div>
    `;
    el.appendChild(modal);
  };
  createModal();
  body.style.height = "90vh";
  body.style.overflow = "hidden";
  el.style.visibility = "visible";
  el.style.opacity = "1";
  el.style.transform = "scale(1)";
  $('#list-form').html(form);


  var exzoom = function(){
    $("#exzoom").exzoom({
      "autoPlay": false,
    });
  };
  exzoom();
  if (args[3].length == 0) {
    $(".exzoom_btn").hide();
    $(".exzoom_nav").hide();
  }
  createSizes(form, args[5]);
  if($("[name|='product-size']:checked").val() == undefined) {
    $(".plus").prop('disabled', true);
    $('#modal-submit').hide();
    $("input.qty").prop('disabled', true);
  }
  Price(args[0]);
  $(function() {
    $("[name|='product-form']").change(() => {
      var form = $("[name|='product-form']:checked").val();
      $('#list-form').html(form);
      createSizes(form, args[5]);
      if($("[name|='product-size']:checked").val() == undefined) {
        $("#price").html(`<h3>AED ${args[6]} - AED ${args[7]}</h3>`);
        $("#list-unit-price").html('');
        $(".plus").prop('disabled', true);
        $('#modal-submit').hide();
        $("input.qty").val('1');
        $("input.qty").prop('disabled', true)
        if ($('input.qty').val() == 1)
          $('.minus').prop('disabled', true);
      }
      Price(args[0]);
    })

    $("#modal-cart-button:eq(0)").hide();

    $('input.qty').change(() => {
      if ($('input.qty').val() > 1)
        $('.minus').prop('disabled', false);
      else
        $('.minus').prop('disabled', true);
    })
  })

  $('.plus').click(function(e) {
    let $input = $('.plus').prev('input.qty');
    let val = parseInt($input.val());
    $input.val( val+1 ).change();
  });
  
  $('.minus').click(function(e) {
    let $input = $('.minus').next('input.qty');
    var val = parseInt($input.val());
    if (val > 1) {
      $input.val( val-1 ).change();
    }
  });

  $("#modal-cart-form").submit(function(e) {
    e.preventDefault();
  
    var form = $("#modal-cart-form");
    var actionUrl = form.attr('action');
    let id = form.attr('data');
    
    cartAdd(actionUrl, id);
    
  });
}

function createForms(forms) {
  var formsInput;
  forms.map((item, key) => {
    if (key == 0) {
      formsInput = `<input type="radio" id="${item}" name="product-form" value="${item}" checked>
      <li><label for="${item}">${item}</label></li>`;
    }
    else
     formsInput += `<input type="radio" id="${item}" name="product-form" value="${item}">
     <li><label for="${item}">${item}</label></li>`;
  });
  return formsInput;
}

function createSizes(form, sizes) {
  if(document.getElementById("sizes-menu"))
    document.getElementById("sizes-menu").remove();
  var sizeMenu = document.createElement('div');
  sizeMenu.setAttribute('class', form + '-sizes sizes-list');
  sizeMenu.setAttribute('id', 'sizes-menu');
    var sizesInput = ``;
      sizes[form].map(size => {
        sizesInput += `<input type="radio" id="${form}${size}" name="product-size" class="product-size" value="${size}">
        <li class="size-item"><label for="${form}${size}">${size}</label></li>`;
    });
    sizeMenu.innerHTML = sizesInput;
    document.getElementById("sizes").appendChild(sizeMenu);
};

function Price(id) {
  $(function () {
    $("[name|='product-size']").change(() => {
      var form = $("[name='product-form']:checked").val();
      var size = $("input[name|='product-size']:checked").val();
      $('.plus').prop('disabled', false);
      $('#modal-submit').show();
      $('input.qty').val(1);
      $('input.qty').prop('disabled', false);
      $.ajax({
        type: 'get',
        url: '/get-product-price',
        data: { 
          id: id,         
          size: size,
          form: form
        },
        success: function(resp) {   
          resp = Number(resp).toFixed(2);                                   
          $("#price").html(`<h3>AED ${resp}</h3>`);
          $('#price-input').val(resp);
        },
        error: function(resp) {
          alert('error');
        }                
      }); 
    });
  })
}

function closeModal(a) {
  document.getElementById(a).disabled = false;
  body.style.height = "auto";
  body.style.overflow = "auto";
  el.style.transform = "scale(0)";
  el.style.opacity = "0";
  modal.remove();
}

function cartAdd(url, id) {
  const cartList = {}
  const formArr = [];
  const priceArr = [];
  const sizeArr = [];
  const quantArr = [];
  $("#shopping-list-table tr:gt(0)").each(function () {
    let this_row = $(this);
    let form = $.trim(this_row.find('td:eq(0)').html());
    let size = $.trim(this_row.find('td:eq(1)').html());
    let quantity = $.trim(this_row.find('td:eq(2)').html());
    let price = $.trim(this_row.find('td:eq(3)').html());
    
    formArr.push(form);
    priceArr.push(price);
    sizeArr.push(size);
    quantArr.push(quantity);
  });
  formArr.pop();
  priceArr.pop();
  sizeArr.pop();
  quantArr.pop();

  cartList['form'] = formArr;
  cartList['price'] = priceArr;
  cartList['size'] = sizeArr;
  cartList['quantity'] = quantArr;

  $.ajax({
    type: 'get',
    url: url,
    data: {        
      id: id,
      cart: cartList,
    },
    success: function() {
      let button = $("#modal-cart-button")[0];
      button.classList.add('clicked');
      $("#list-body").empty();
      setTimeout(() => {
        document.location.reload();
      }, 2500);
    },
    error: function() {
      alert("Please add item to shopping list.")
    }                
  }); 
}

function fav(e) {
  e.innerHTML = `<i class="fa-solid fa-heart fav"></i>`;
}