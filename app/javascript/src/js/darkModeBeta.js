/* eslint-disable no-use-before-define */
async function enableDarkMode() {
  const navbar = document.querySelector('.navbar-nav');
  const userSelection = checkStorage();
  const darkModeButton = createIcon(userSelection);
  navbar.insertBefore(darkModeButton, navbar.lastElementChild);
  if (userSelection) {
    await loadStylesheet();
  }
}

function checkStorage() {
  const darkModeOption = localStorage.getItem('topDarkMode');
  if (darkModeOption === null) {
    localStorage.setItem('topDarkMode', JSON.stringify(false));
    return false;
  }
  return JSON.parse(darkModeOption);
}

async function toggleOption() {
  const isDarkModeEnabled = checkStorage();
  if (isDarkModeEnabled) {
    document.querySelector('#darkModeStyles').remove();
  } else {
    const result = await fetch('https://cdn.jsdelivr.net/gh/TheOdinProject/top-dark-theme@master/darkMode.css');
    const css = await result.text();
    const style = document.createElement('style');
    style.innerText = css;
    style.id = 'darkModeStyles';
    document.querySelector('head').appendChild(style);
  }
  localStorage.setItem('topDarkMode', JSON.stringify(!isDarkModeEnabled));
  swapIcons(!isDarkModeEnabled);
}

function createIcon(darkModeEnabled) {
  let darkModeButton;
  if (darkModeEnabled) {
    // Sun icon
    darkModeButton = document.createRange().createContextualFragment(
      `<li class="nav-item nav-link" id="dark-mode-item" style="flex-direction: row; justify-content: center; padding-right:0">
        <button data-test-id="dark-mode-button">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
          </svg>
        </button>
      </li>`,
    );
  } else {
    // Moon icon
    darkModeButton = document.createRange().createContextualFragment(
      `<li class="nav-item nav-link" id="dark-mode-item" style="flex-direction: row; justify-content: center;padding-right:0">
        <button data-test-id="dark-mode-button">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z" />
          </svg>
        </button>
      </li>`,
    );
  }
  darkModeButton.querySelector('button').addEventListener('click', toggleOption);
  return darkModeButton;
}

function swapIcons(isDarkModeEnabled) {
  const currentButton = document.querySelector('#dark-mode-item');
  const newButton = createIcon(isDarkModeEnabled);
  const navbar = document.querySelector('.navbar-nav');
  navbar.removeChild(currentButton);
  navbar.insertBefore(newButton, navbar.lastElementChild);
}

async function loadStylesheet() {
  const result = await fetch('https://cdn.jsdelivr.net/gh/TheOdinProject/top-dark-theme@master/darkMode.css');
  const css = await result.text();
  const style = document.createElement('style');
  style.innerText = css;
  style.id = 'darkModeStyles';
  document.querySelector('head').appendChild(style);
}

document.addEventListener('DOMContentLoaded', () => enableDarkMode());
