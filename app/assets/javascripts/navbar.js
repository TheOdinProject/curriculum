document.addEventListener('DOMContentLoaded', function() {
  var logo = document.querySelector('.navbar-brand')
  var logoText = document.querySelector('.logo-text')
  var logoImg = document.querySelector('.logo-img')

  var navToggle = document.querySelector('.navbar-toggler')

  navToggle.addEventListener('click', function() {
    logoText.classList.toggle('expanded')
    logoImg.classList.toggle('expanded')
    logo.classList.toggle('expanded')
  })

  // Collapses the navbar if a click is made outside it
  document.addEventListener('click', function(event) {
    var navbar = document.querySelector('.navbar-collapse')
    var collapseButton = document.querySelector('.navbar-toggler-icon + .close')

    var navbarOpened = navbar.classList.contains('show')
    var linkClicked = event.target.tagName.toLowerCase() === 'a'

    if (navbarOpened && !linkClicked) collapseButton.click()
  })
})
