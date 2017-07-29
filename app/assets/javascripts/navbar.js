document.addEventListener('turbolinks:load', function() {
  var logo = document.querySelector('.navbar-brand')
  var logoText = document.querySelector('.logo__text')
  var logoImg = document.querySelector('.logo__img')

  var navToggle = document.querySelector('.navbar-toggler')
  var modalClose = document.querySelector('.close')

  // Clears Logo text in modal
  navToggle.addEventListener('click', function() {
    logoText.classList.toggle('expanded')
    logoImg.classList.toggle('expanded', false)
    logo.classList.toggle('expanded', false)
  })

  // Restores Logo Text on modal close
  modalClose.addEventListener('click', function() {
    logoText.classList.toggle('expanded');
  })
})