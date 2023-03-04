$('.order-data').on('click', function() {
  let order = $(this).attr('data-order');
  window.location.href = "/order-data?id=" + order;
});

$('#order-data').on('click', function() {
  let order = $('#order-id-input').val().toUpperCase();
  window.location.href = "/order-data?id=" + order;
});

$('#all-checkbox').on('click', function() {
  if(this.checked)
    $('.item-checkbox').prop('checked', true);
  else
    $('.item-checkbox').prop('checked', false);
});