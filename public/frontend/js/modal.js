/*==================== Product Modal Window ====================*/
var el = document.getElementById('modal-container');
var modal;

function showModal(id, product, sizes, images, forms, minprice, maxprice, auth) {
  let form;
  if(forms[0])
    form = forms[0]['name'];

  document.getElementById(id).disabled = true;
  console.log();
  minprice = minprice.toFixed(2);
  maxprice = maxprice.toFixed(2);

  /*========== Modal Creation ==========*/
  var createModal = () => {
    modal = document.createElement('div');
    modal.setAttribute('class', 'modal');
    modal.setAttribute('id', 'modal' + product['id']);

    modal.innerHTML = `
      <button type="button" class="btn close" id="close-btn" onclick="closeModal(${id})"><i class="fa-solid fa-xmark"></i></button>
      <div class="modal-content">
        <div class="shazoom" id="shazoom">
          <div class="img-box">
            <ul class="img-ul">
              ${
                images.map(item =>
                `<li><img src="images${item}" alt=""></li>`
              ).join('')}
            </ul>
          </div>
          <div class="zoom-nav"></div>
          <!-- Nav Buttons -->
          <p class="zoom-btn">
            <a href="javascript:void(0);" class="zoom-prev-btn"> < </a>
            <a href="javascript:void(0);" class="zoom-next-btn"> > </a>
          </p>
        </div>
        <div class="modal-details-container">
          <div class="product-modal-detail">
            <h1 class="title">${product['name']}</h1>

            <form id="modal-form">
              <input type="hidden" name="id" value="${product['id']}">
              <div class="forms modal-radio" id="forms"></div>
              <div class="prices" id="price">
                ${(() => {
                  if (minprice == maxprice) {
                    return `<h3>AED ${minprice}</h3>`
                  } else {
                    return `<h3>AED ${minprice} - AED ${maxprice}</h3>`
                  }
                })()}
              </div>
              <div class="sizes modal-radio" id="sizes"></div>
              <input type="hidden" name="price-input" id="price-input" value="">
              <div class="qty-manage" id="qty-manage">
                <input type="button" value="-" class="qty-minus minus qty-control" field="quantity" disabled>
                <input type="number" name="quantity" value="1" min="1" class="qty" oninput="this.value = Math.abs(this.value)">
                <input type="button" value="+" class="qty-plus plus qty-control" field="quantity">
              </div>
              <input type="button" id="modal-add-list" class="btn btn-submit add-list" value="Add to List" onclick="shopList()">
              <i id="cart-button-arrow" class="fa-solid fa-right-long"></i>
              <div class="cart-button-div">
                <button form="modal-cart-form" id="modal-cart-button" class="cart-button">
                  <span class="add-to-cart">Add to Cart</span>
                  <span class="added">Added</span>
                  <i class="fas fa-shopping-cart"></i>
                  <i class="fas fa-box"></i>
                </button>
              </div>
            </form>

            <form "  action="/add-to-cart" data="${product['id']}" id="modal-cart-form"></form>
            
            <a href="/product-detail/${product['slug']}" class="modal-view-link btn" id="modal-view-link"><i class="fa-solid fa-circle-info" id="product-details-icon"></i>VIEW PRODUCT DETAILS</a>
          </div>

          <section class="popup-section" id="ch-popup-sec">
            <div id="location-popup" class="ch-popup">
              <button id="page-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="remInnerModal()">Stay on Page</button>
              <button id="shop-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="location.href = '/home'">Continue Shopping</button>
              ${(() => {
                if (auth) {
                  return `<button id="chkt-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="location.href = '/checkout'">Checkout</button>`
                } else {
                  return `<button id="chkt-loc-btn" class="btn btn-submit popup-btn loc-btn" onclick="chOptions()">Checkout</button>`
                }
              })()}
                   
              <button id="guest-chkt-btn" class="btn btn-submit popup-btn chkt-btn collapse" onclick="location.href = '/checkout'">Checkout as Guest</button>
              <button id="login-chkt-btn" class="btn btn-submit popup-btn chkt-btn collapse" onclick="location.href = '/user/login?checkout=1'">Login to Checkout</button>
            </div>
          </section>

          <div class="modal-shopping-list" id="modal-shopping-list">
              <table id="shopping-list-table">
                <caption>Shopping List</caption>
                <thead>
                    <tr>
                      <th id="list-frm">Form</th>
                      <th id="list-sze">Size</th>
                      <th id="list-qty">Qty</th>
                      <th id="list-prc">Price</th>
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

    $(body).on('keydown', function(event) {
      if(event.key == "Escape")
        closeModal(id);
    });
  };
  createModal();

  body.style.height = "90vh";
  body.style.overflow = "hidden";
  el.style.visibility = "visible";
  el.style.opacity = "1";
  el.style.transform = "scale(1)";
  $('#list-form').html(form);

  shazoom();

  /* Hide exzoom navbar and nav buttons when only 1 image */
  if (images.length == 0) {
    $(".zoom-btn").hide();
    $(".zoom-nav").hide();
  }

  createForms(forms);
  createSizes(form, sizes);

  /* Actions when size is not checked */
  if($("[name|='product-size']:checked").val() == undefined) {
    $(".plus").prop('disabled', true);
    $('.add-list').hide();
    $("input.qty").prop('disabled', true);
  }

  Price(product['id']);

  $(function() {
    /* Actions when form is changed */
    $("[name|='product-form']").on('change', () => {
      var form = $("[name|='product-form']:checked")[0];
      form = form.getAttribute('id');
      createSizes(form, sizes);
      if($("[name|='product-size']:checked").val() == undefined) {
        $("#price").html(`<h3>AED ${minprice} - AED ${maxprice}</h3>`);
        $(".plus").prop('disabled', true);
        $('.add-list').hide();
        $("input.qty").val('1');
        $("input.qty").prop('disabled', true)
        $('.minus').prop('disabled', true);
      }
      Price(product['id']);
    })

    /* Enable minus button when value of input quantity is greater than 1 and vice versa */
    $('input.qty').on('change', () => {
      if ($('input.qty').val() > 1)
        $('.minus').prop('disabled', false);
      else
        $('.minus').prop('disabled', true);
    })
  })

  /* Plus button function */
  $('.plus').on('click', function(e) {
    let qtyinput = $(this).prev('input.qty');
    let val = parseInt(qtyinput.val());
    qtyinput.val( val+1 ).trigger('change');
  });
  
  /* Minus button function */
  $('.minus').on('click', function(e) {
    let qtyinput = $(this).next('input.qty');
    var val = parseInt(qtyinput.val());
    if (val > 1) {
      qtyinput.val( val-1 ).trigger('change');
    }
  });

  /* Function when modal shopping list table is submitted */
  $("#modal-cart-form").on('submit', function(e) {
    e.preventDefault();
    let modalForm = $("#modal-cart-form");
    let actionUrl = modalForm.attr('action');
    let id = modalForm.attr('data');
    
    cartAdd(actionUrl, id); 
  });
}

/*==================== Remove modal from DOM ====================*/
function closeModal(a) {
  a.disabled = false;
  body.style.height = "auto";
  body.style.overflow = "auto";
  el.style.transform = "scale(0)";
  el.style.opacity = "0";
  setTimeout(function() {
    modal.remove();
}, 1000);
}

function remInnerModal() {
  let button = $(".cart-button")[0];
  let chModal = $("#ch-popup-sec")[0];
  button.classList.remove('clicked');
  chModal.style.transform = "scale(0)";
}