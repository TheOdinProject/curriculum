document.addEventListener('turbolinks:load', function() {
  var logoText = document.querySelector('.logo__text')
  var navToggle = document.querySelector('.navbar-toggler')
  var modalClose = document.querySelector('.close')
  var dropdowns = document.querySelectorAll('.js-dropdown')

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

  // Open Dropdowns on Hover, hide on mouseout
  dropdowns.forEach(function(element) {
   element.addEventListener('mouseover', function() {
     element.classList.add('show')
    })
   element.addEventListener('mouseout', function() {
     element.classList.remove('show')
    })
  })
})
