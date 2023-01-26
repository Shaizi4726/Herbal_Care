// Mobile Menu Overlay
var catMenu = document.getElementById("mob-cat-menu");
var body = document.querySelector("body");

function showMenu() {
  body.style.height='90vh';
  body.style.overflow='hidden';
  if (! catMenu.classList.contains("collapse"))
    catMenu.classList.toggle("collapse");
  let el = document.getElementById('mob-nav');
  el.style.width = '100%';
}

function closeMenu(){
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
var mobHeader = document.getElementById("search");
var desCatMenu = document.getElementById("desktop-cat-menu");
var mobCartButton = document.getElementById("mob-cart-btn");
var mobFavButton = document.getElementById("mob-fav-button");
var menuButton = document.getElementById("menu-button");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
    mobHeader.classList.add("sticky");
    desCatMenu.classList.add("cat-sticky")
    mobCartButton.classList.add("mob-sticky");
    mobFavButton.classList.add("mob-sticky");
    menuButton.classList.add("mob-sticky");
  } else {
    header.classList.remove("sticky");
    mobHeader.classList.remove("sticky");
    desCatMenu.classList.remove("cat-sticky");
    mobCartButton.classList.remove("mob-sticky");
    mobFavButton.classList.remove("mob-sticky");
    menuButton.classList.remove("mob-sticky");
  }
}