function updateCartData(id, qty) {
  $.ajax({
    type: 'get',
    url: '/cart-update',
    data: {
      "id": id,
      "qty": qty
    },
    dataType: 'json',
    success: function(resp) {   
      resp[0] = resp[0].toFixed(2);
      resp[1] = resp[1].toFixed(2);
      resp[2] = resp[2].toFixed(2);
      resp[3] = resp[3].toFixed(2);
      $('#' + id + '-total').html("AED " + resp[0]);
      $('#subtotal-value').html("AED " + resp[1]);
      $('#tax-value').html("AED " + resp[2]);
      $('#grand-total-value').html("AED " + resp[3]);
    },
    error: function(resp) {
      alert('error');
    }                
  }); 
}