$(function() {
  $('[name|=cust_type]').on('change', function() {
    if(this.value == 'company') {
      $('#company-name').removeClass('collapse');
      $('#trn').removeClass('collapse');
      $('#first-name').addClass('collapse');
      $('#last-name').addClass('collapse');
    }

    else {
      $('#company-name').addClass('collapse');
      $('#trn').addClass('collapse');
      $('#first-name').toggleClass('collapse');
      $('#last-name').toggleClass('collapse');
    }
  });
});

$(window).on('load', function() {
  $('.signing-img-container').css('height', $('.shop-signing').outerHeight());
  setTimeout(function() {
    $('.flash-message').css('opacity', 0);
  }, 5000);
  setTimeout(function() {
    $('.flash-message').remove();
  }, 5500);
});
