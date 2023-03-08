function sort(el, slug, subslug) {
  let content = $(el).html();
  let value = $(el).attr('data');

  $('.sort-list-item').removeClass('selected');
  $(el).addClass('selected');
  $('#selected-sort').html(content);
  $('#sorting-list').addClass('collapse');

  /* AJAX request for sorting products */
  $.ajax({
    type: 'get',
    url: '/sort',
    data: {
      slug: slug,
      subslug: subslug,
      value: value
    },
    success: function(response) {
      $('#products-catalog').html(response);
    },
    error: function(error) {
      $('#products-catalog').html("An error occured while sorting");
    }                
  }); 
}