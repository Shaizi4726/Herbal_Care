function filterQuery (...args) {
  let products = args[0],
  subCat = args[1],
  promotion = args[2];

  /* AJAX request for adding shopping list items to cart */
  $.ajax({
    type: 'get',
    url: '/filter',
    data: {
      products: products,       
      sub_cat: subCat,
      promotion: promotion
    },
    success: function(response) {
      $('#products-catalog').html(response);
    },
    error: function() {
      alert("An error occured while applying filter")
    }                
  }); 
}