/*==================== Image Slider ====================*/
let responsiveSlider = function() {
  let sliderWidth = $('#slider').width();
  let items = $('#slider li').length;
  let count = 1;

  $(window).on('resize', function() {
    sliderWidth = $('#slider').width();
  });
  
  let prevSlide = function() {
    if(count > 1) {
      count -= 2;
      $('#carousel-wrap').css('left', '-' + count * sliderWidth + 'px');
      count++;
    }
    
    else if(count == 1) {
      count = items - 1;
      $('#carousel-wrap').css('left', '-' + count * sliderWidth + 'px');
      count++;
    }
    clearTimeout(sliderInterval);
  };

  let nextSlide = function() {
    if(count < items) {
      $('#carousel-wrap').css('left', '-' + count * sliderWidth + 'px');
      count++;
    }
    
    else if (count == items) {
      $('#carousel-wrap').css('left', '0');
      count = 1;
    }
    clearTimeout(sliderInterval);
  };

  $('#slide-next').on('click', function() {
    nextSlide();
  });

  $('#slide-prev').on('click', function() {
    prevSlide();
  });

  const sliderInterval = setInterval(function() {
    nextSlide();
  }, 6e3);
};

$(window).on('load', function() {
  responsiveSlider();
});