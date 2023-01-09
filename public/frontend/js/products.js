function filterQuery (...args) {
  let que = args[0],
  subCat = args[1],
  promotion = args[2],
  sortBy = args[3],
  search = args[4];

  /* AJAX request for adding shopping list items to cart */
  $.ajax({
    type: 'get',
    url: '/filter',
    data: {
      query: que,
      sub_cat: subCat,
      promotion: promotion,
      sorting: sortBy,
      search: search
    },
    success: function(response) {
      $('#products-catalog').html(response);
    },
    error: function(error) {
      alert("An error occured while applying filter");
    }                
  }); 
}