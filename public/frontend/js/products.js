window.onload =
  $(function() {
    $('#sub-category-filter').change(() => {
      let subCat = $('#sub-category-filter').val();
      
      /* AJAX request for adding shopping list items to cart */
      $.ajax({
        type: 'get',
        url: '/filter',
        data: {        
          query: subCat,
        },
        success: function(response) {
          console.log(response);
          $('#products-catalog').html(response);
        },
        error: function() {
          alert("An error occured while applying filter")
        }                
      }); 
    });
  });
