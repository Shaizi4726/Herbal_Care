$('.order-data').on('click', function() {
  let order = $(this).attr('data-order');
  window.location.href = "/order-data?id=" + order;
});

$('#order-data').on('click', function() {
  let order = $('#order-id-input').val().toUpperCase();
  window.location.href = "/order-data?id=" + order;
})