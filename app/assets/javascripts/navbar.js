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
