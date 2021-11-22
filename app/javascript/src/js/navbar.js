document.addEventListener('DOMContentLoaded', () => {
  const logoText = document.querySelector('.logo__text');
  const navToggle = document.querySelector('.navbar-toggler');
  const modalClose = document.querySelector('.close');

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
});
