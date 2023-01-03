function filterQuery (...args) {
  let slug = args[0],
  subCat = args[1],
  promotion = args[2];

  /* AJAX request for adding shopping list items to cart */
  $.ajax({
    type: 'get',
    url: '/filter',
    data: {
      slug: slug,
      sub_cat: subCat,
      promotion: promotion
    },
    success: function(response) {
      $('#products-catalog').html(response);
    },
    error: function(error) {
      alert("An error occured while applying filter");
    }                
  }); 
}