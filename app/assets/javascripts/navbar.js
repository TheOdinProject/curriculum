document.addEventListener('turbolinks:load', function() {
  var logoText = document.querySelector('.logo-text')

  var navToggle = document.querySelector('.navbar-toggler')
  var modalClose = document.querySelector('.close')

  // Clears Logo text in modal
  navToggle.addEventListener('click', function() {
    logoText.classList.toggle('expanded')
  })

  // Restores Logo Text on modal close
  modalClose.addEventListener('click', function() {
    logoText.classList.toggle('expanded');
  })
})