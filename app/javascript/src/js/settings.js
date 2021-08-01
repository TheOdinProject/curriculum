/* eslint-disable */

document.addEventListener('turbolinks:load', (element) => {
  Array.from(document.querySelectorAll('.settings-card')).forEach((element) => {
    const toggler = element.querySelector('.settings-card__edit-button--open');
    const settingsViewForm = element.querySelector('.settings-view--hidden');
    const settingsView = element.querySelector('.settings-view');

    if (toggler) {
      toggler.addEventListener('click', () => {
        switchViews();
      });
    }

    $(settingsViewForm).on('ajax:success', (event) => {
      const data = event.detail[0];

      document.querySelector('.learning_goal').innerHTML = data.learning_goal;
      document.querySelector('.username').innerHTML = data.username;
      document.querySelector('.email').innerHTML = data.email;
      switchViews();
    });

    function switchViews() {
      settingsView.classList.toggle('settings-view--hidden');
      settingsView.classList.toggle('settings-view');

      settingsViewForm.classList.toggle('settings-view--hidden');
      settingsViewForm.classList.toggle('settings-view');

      toggler.classList.toggle('settings-card__edit-button--open');
      toggler.classList.toggle('settings-card__edit-button--close');
    }
  });
});
