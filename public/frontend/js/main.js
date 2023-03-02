
/*==================== Exzoom function ====================*/
var shazoom = function () {
  $("#shazoom").exzoom({
    "autoPlay": false
  });
};

/* Plus button function */
$('.plus').on('click', function (e) {
  let qtyinput = $(this).prev('input.qty');
  let val = parseInt(qtyinput.val());
  qtyinput.val(val + 1).trigger('change');
});

/* Minus button function */
$('.minus').on('click', function (e) {
  let qtyinput = $(this).next('input.qty');
  var val = parseInt(qtyinput.val());
  if (val > 1) {
    qtyinput.val(val - 1).trigger('change');
  }
});

$(function () {
  document.oncontextmenu = () => false;;
  document.onselectstart = () => false;
  $('#main-content').on('cut copy', function (event) {
    event.preventDefault();
  });
});


/*==================== Request product price from database ====================*/
function Price(id) {
  $(function () {
    $("[name|='product-size']").on('change', () => {
      var form = $("[name='product-form']:checked").val();
      var size = $("input[name|='product-size']:checked").val();
      $('.plus').prop('disabled', false);
      $('.add-list').show();
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
        success: function (resp) {
          resp = Number(resp).toFixed(2);
          $("#price").html(`<h3>AED ${resp}</h3>`);
          $('#price-input').val(resp);
        },
        error: function (resp) {
          alert('error');
        }
      });
    });
  })
}

/*========== Product Forms Creation ==========*/
function createForms(forms) {
  if(forms[0] == undefined)
    return;

  var formsMenu = document.createElement('div');
  formsMenu.setAttribute('class', 'forms-list');
  formsMenu.setAttribute('id', 'forms-menu');
  var formsInput;
  forms.map((item, key) => {
    if (key == 0) {
      formsInput = `<input type="radio" id="${item['name']}" name="product-form" value="${item['form_id']}" checked>
      <label for="${item['name']}">${item['name']}</label>`;
    }
    else
      formsInput += `<input type="radio" id="${item['name']}" name="product-form" value="${item['form_id']}">
     <label for="${item['name']}">${item['name']}</label>`;
  });
  formsMenu.innerHTML = formsInput;
  document.getElementById('forms').appendChild(formsMenu);
}

/*========== Product Sizes Creation ==========*/
function createSizes(form, sizes) {
  if(form) {
    if (document.getElementById("sizes-menu"))
      document.getElementById("sizes-menu").remove();
    var sizeMenu = document.createElement('div');
    sizeMenu.setAttribute('class', form + '-sizes sizes-list');
    sizeMenu.setAttribute('id', 'sizes-menu');
    var sizesInput = ``;
    sizes[form].map(size => {
      sizesInput += `<input type="radio" id="${form}${size}" name="product-size" class="product-size" value="${size}">
          <label for="${form}${size}">${size}</label>`;
    });
  } else {
    var sizeMenu = document.createElement('div');
    sizeMenu.setAttribute('class', 'sizes-list');
    sizeMenu.setAttribute('id', 'sizes-menu');
    var sizesInput = ``;
    sizes.map(size => {
      sizesInput += `<input type="radio" id="${size}" name="product-size" class="product-size" value="${size}">
        <label for="${size}">${size}</label>`;
    });
  }

  sizeMenu.innerHTML = sizesInput;
  document.getElementById("sizes").appendChild(sizeMenu);
};

/*==================== Shopping List Table ====================*/
var totalAmount = 0;

function shopList() {
  let form = $("[name='product-form']:checked")[0];
  let price = $("[name='price-input']").val();
  let size = $("[name='product-size']:checked").val();
  let quant = $("[name='quantity']").val();
  let amount = price * quant;
  
  if(form) {
    form = form.getAttribute('id');
    let row = document.getElementById(`${form}-${size}-quant`);
  
    tableRow: {
      if (row !== null) {
        let quantity = Number(row.innerHTML) + Number(quant);
        row.innerHTML = quantity;
        document.getElementById(`${form}-${size}-amnt`).innerHTML = `AED ${(price * quantity).toFixed(2)}`;
        totalAmount += amount;
        break tableRow;
      }
      $('#shopping-list-table > tbody').append(`<tr><td>${form}</td>
      <td>${size}</td>
      <td id = "${form}-${size}-quant">${quant}</td>
      <td>${price}</td>
      <td id = "${form}-${size}-amnt">AED ${amount.toFixed(2)}</td></tr>`);
      totalAmount += amount;
    }
  } else {
    let row = document.getElementById(`${size}-quant`);

    tableRow: {
      if (row !== null) {
        let quantity = Number(row.innerHTML) + Number(quant);
        row.innerHTML = quantity;
        document.getElementById(`${size}-amnt`).innerHTML = `AED ${(price * quantity).toFixed(2)}`;
        totalAmount += amount;
        break tableRow;
      }
      $('#shopping-list-table > tbody').append(`<tr><td></td>
      <td>${size}</td>
      <td id = "${size}-quant">${quant}</td>
      <td>${price}</td>
      <td id = "${size}-amnt">AED ${amount.toFixed(2)}</td></tr>`);
      totalAmount += amount;
    }
  }

  $("#list-total").html(`AED ${totalAmount.toFixed(2)}`);
  let cartButton = $(".cart-button-div")[0];
  $("#cart-button-arrow").css('display', 'inline');
  cartButton.style.width = "12.5em";
}

/*========== Add shopping list items to cart ==========*/
function cartAdd(url, id) {
  const cartList = {}
  const formArr = [];
  const priceArr = [];
  const sizeArr = [];
  const quantArr = [];

  /* Store shopping list data in arrays */
  $("#shopping-list-table tr:gt(0)").each(function () {
    let this_row = $(this);
    let form = this_row.find('td:eq(0)').html();
    let size = this_row.find('td:eq(1)').html();
    let quantity = this_row.find('td:eq(2)').html();
    let price = this_row.find('td:eq(3)').html();

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

  /* AJAX request for adding shopping list items to cart */
  $.ajax({
    type: 'get',
    url: url,
    data: {
      id: id,
      cart: cartList
    },
    success: function () {
      let button = $(".cart-button")[0];
      let chModal = $("#ch-popup-sec")[0];
      button.classList.add('clicked');
      $("#list-body").empty();
      body.style.height = "90vh";
      body.style.overflow = "hidden";
      chModal.style.visibility = "visible";
      chModal.style.opacity = "1";
      chModal.style.transform = "scale(1)";
    },
    error: function () {
      alert("An error occured while adding to cart")
    }
  });
}

/*==================== Add product to favorites ====================*/
function fav(ico, id) {
  let el = $(ico).children()[0];
  console.log(el);
  if ($(el).hasClass('fa-regular')) {
    el.classList.remove('fa-regular');
    $(`.${id}-card .fa-heart`).addClass('fa-solid');
    /* AJAX request for adding shopping list items to wishlist */
    $.ajax({
      type: 'get',
      url: '/wishlist-add/',
      data: {id: id},
      success: function(response) {
        $('.fav-qty').html(response);
      },
      error: function() {
        alert("An error occured while adding to wishlist");
      }                
    }); 
  }
  
  else if ($(el).hasClass('fa-solid')) {
    el.classList.remove('fa-solid');
    $(`.${id}-card .fa-heart`).addClass('fa-regular');

    /* AJAX request for adding shopping list items to cart */
    $.ajax({
      type: 'get',
      url: '/wishlist-delete/',
      data: {id: id},
      success: function(response) {
        $('.fav-qty').html(response);
      },
      error: function() {
        alert("An error occured while removing from wishlist");
      }                
    }); 
  }
}

function chOptions() {
  $(".loc-btn").hide();
  $(".chkt-btn").removeClass('collapse');
}