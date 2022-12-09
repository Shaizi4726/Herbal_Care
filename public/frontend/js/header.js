// Mobile Menu Overlay

var catMenu = document.getElementById("cat-menu")

function showMenu(){
    if (!catMenu.classList.contains("collapse"))
      catMenu.classList.toggle("collapse");
    let el = document.getElementById('mob-nav');
    el.style.width = '100%';
}

function closeMenu(){
    const body = document.querySelector("body");
    body.style.height='auto';
    body.style.overflow='auto';
    let el = document.getElementById('mob-nav');
    el.style.width = '0';
}

function menu() {
    catMenu.classList.toggle("collapse");
}

// Sticky Header
window.onscroll = function() {myFunction()};
var header = document.getElementById("desktop-menu");
var catMenu = document.getElementById("cat-menu");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
    catMenu.classList.add("cat-sticky")
  } else {
    header.classList.remove("sticky");
    catMenu.classList.remove("cat-sticky");
  }
}


// if ($.fn.slider) {
//     $('#sl2').slider();
// }

// var RGBChange = function () {
//     $('#RGB').css('background', 'rgb(' + r.getValue() + ',' + g.getValue() + ',' + b.getValue() + ')')
// };

// /*scroll to top*/

// $(document).ready(function () {
//     $(function () {
//         $.scrollUp({
//             scrollName: 'scrollUp', // Element ID
//             scrollDistance: 300, // Distance from top/bottom before showing element (px)
//             scrollFrom: 'top', // 'top' or 'bottom'
//             scrollSpeed: 300, // Speed back to top (ms)
//             easingType: 'linear', // Scroll to top easing (see http://easings.net/)
//             animation: 'fade', // Fade, slide, none
//             animationSpeed: 200, // Animation in speed (ms)
//             scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
//             //scrollTarget: false, // Set a custom target element for scrolling to the top
//             scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
//             scrollTitle: false, // Set a custom <a> title if required.
//             scrollImg: false, // Set true to use image
//             activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
//             zIndex: 2147483647 // Z-Index for the overlay
//         });
//     });
// });
