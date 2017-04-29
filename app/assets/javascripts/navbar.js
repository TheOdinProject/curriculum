document.addEventListener('DOMContentLoaded', function() {
  const logoText = document.querySelector('.logo-text')
  const logoImg = document.querySelector('.logo-img')

  const navToggle = document.querySelector('.navbar-toggler')

  navToggle.addEventListener('click', () => {
    logoText.classList.toggle('expanded')
    logoImg.classList.toggle('expanded')
  })
})
