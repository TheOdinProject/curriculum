document.addEventListener('turbolinks:load', function() {
  var logo = document.querySelector('.navbar-brand')
  var logoText = document.querySelector('.logo-text')
  var logoImg = document.querySelector('.logo-img')

  var navToggle = document.querySelector('.navbar-toggler')

  navToggle.addEventListener('click', function() {
    logoText.classList.toggle('expanded')
    logoImg.classList.toggle('expanded')
    logo.classList.toggle('expanded')
  })
})



document.addEventListener('DOMContentLoaded', function(e) {
  var documentWidth = document.documentElement.clientWidth;
  console.log("document width", documentWidth);
  var documentHeight = document.documentElement.clientHeight;
  console.log("document height", documentHeight);

  if(documentWidth < 480) {
    var navbar = document.querySelector('.navbar-collapse .navbar-nav');
    var style = window.getComputedStyle(navbar);
    navbar.style.height = documentHeight;
    console.log("navbar height", style.getPropertyValue('height'));
  }

})
