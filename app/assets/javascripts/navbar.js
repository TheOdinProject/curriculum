document.addEventListener('turbolinks:load', function() {
  var logoText = document.querySelector('.logo__text')
  var navToggle = document.querySelector('.navbar-toggler')
  var modalClose = document.querySelector('.close')

  var userDropdown = document.querySelector('.dropdown')

  // Clears Logo text in modal
  navToggle.addEventListener('click', function() {
    logoText.classList.toggle('expanded')
  })

  // Restores Logo Text on modal close
  modalClose.addEventListener('click', function() {
    logoText.classList.toggle('expanded');
  })

  // Open User Dropdown on Hover, hide on mouseout
  userDropdown.addEventListener('mouseover', function() {
    userDropdown.classList.add('show')
  })
  userDropdown.addEventListener('mouseout', function() {
    userDropdown.classList.remove('show')
  })

})