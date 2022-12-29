shazoom();

/* Plus button function */
$('.plus').click(function(e) {
  let $input = $('.plus').prev('input.qty');
  let val = parseInt($input.val());
  $input.val( val+1 ).change();
});

/* Minus button function */
$('.minus').click(function(e) {
  let $input = $('.minus').next('input.qty');
  var val = parseInt($input.val());
  if (val > 1) {
    $input.val( val-1 ).change();
  }
});

/* Function when modal shopping list table is submitted */
$("#modal-cart-form").submit(function(e) {
  e.preventDefault();

  var modalForm = $("#modal-cart-form");
  var actionUrl = modalForm.attr('action');
  let id = modalForm.attr('data');
  
  cartAdd(actionUrl, id); 
});

function showDetail(btn) {
  let data = btn.getAttribute('data-toggle');
  let active = btn.classList.contains('active-details-review');
  $('.details-review-btn').removeClass('active-details-review');
  if (!active)
  btn.classList.add('active-details-review');
  if (data == 'description') {
    document.getElementById('reviews').classList.add('collapse');
    document.getElementById(data).classList.toggle('collapse');
  }
  else {
    document.getElementById('description').classList.add('collapse');
    document.getElementById(data).classList.toggle('collapse');
  }
}