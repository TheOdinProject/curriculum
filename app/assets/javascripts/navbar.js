document.addEventListener('turbolinks:load', function() {
  var logoText = document.querySelector('.logo__text')
  var navToggle = document.querySelector('.navbar-toggler')
  var modalClose = document.querySelector('.close')

  var userDropdown = document.querySelector('.dropdown')

  // Clears Logo text in modal
  if(navToggle && logoText) {
    navToggle.addEventListener('click', function() {
      logoText.classList.toggle('expanded')
    })
  }
  
  // Restores Logo Text on modal close
  if(modalClose) {
    modalClose.addEventListener('click', function() {
      logoText.classList.toggle('expanded');
    })
  }
  
  // Open User Dropdown on Hover, hide on mouseout
  if(userDropdown) {
    userDropdown.addEventListener('mouseover', function() {
      userDropdown.classList.add('show')
    })
    userDropdown.addEventListener('mouseout', function() {
      userDropdown.classList.remove('show')
    })
  }

})