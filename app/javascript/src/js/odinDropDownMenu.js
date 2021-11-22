document.addEventListener('DOMContentLoaded', () => {
  const dropdowns = document.querySelectorAll('.odin-dropdown');

  dropdowns.forEach((dropdown) => {
    const button = dropdown.querySelector('.odin-dropdown__toggle');

    button.addEventListener('click', () => {
      const menu = dropdown.querySelector('.odin-dropdown__menu');
      menu.classList.toggle('odin-dropdown__hidden');
    });
  });
});
