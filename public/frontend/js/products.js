function sort(el, slug) {
  let content = $(el).html();
  let value = $(el).attr('data');

  $('.sort-list-item').removeClass('selected');
  $(el).addClass('selected');
  $('#selected-sort').html(content);
  $('#sorting-list').addClass('collapse');

  /* AJAX request for adding shopping list items to cart */
  $.ajax({
    type: 'get',
    url: '/sort',
    data: {
      slug: slug,
      value: value
    },
    success: function(response) {
      $('#products-catalog').html(response);
    },
    error: function(error) {
      alert("An error occured while applying filter");
    }                
  }); 
}