$('#order-track').on('click', function(event) {
  id = $('#order-id-input').val();

  /* AJAX request for order data */
  $.ajax({
    type: 'get',
    url: '/track/order',
    data: {id: id},
    success: function(response) {
      console.log(response);
    },
    error: function() {
      alert("An error occured while adding to wishlist");
    }                
  }); 
});