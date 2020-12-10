document.addEventListener('turbolinks:load', () => {
  const logoText = document.querySelector('.logo__text');
  const navToggle = document.querySelector('.navbar-toggler');
  const modalClose = document.querySelector('.close');
  const dropdowns = document.querySelectorAll('.js-dropdown');

  // Clears Logo text in modal
  if (navToggle && logoText) {
    navToggle.addEventListener('click', () => {
      logoText.classList.toggle('expanded');
    });
  }

  // Restores Logo Text on modal close
  if (modalClose) {
    modalClose.addEventListener('click', () => {
      logoText.classList.toggle('expanded');
    });
  }

  // Open Dropdowns on Hover, hide on mouseout
  dropdowns.forEach((element) => {
    element.addEventListener('mouseover', () => {
      element.classList.add('show');
    });
    element.addEventListener('mouseout', () => {
      element.classList.remove('show');
    });
  });
});
