/* eslint-disable no-use-before-define */
async function enableDarkMode() {
  const userSelection = checkStorage();
  toggleIcons(userSelection);
  if (userSelection) {
    await loadStylesheet();
  }
  document.querySelectorAll(
    '.dark-mode-button',
  ).forEach((button) => button.addEventListener('click', toggleOption));
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
  toggleIcons(!isDarkModeEnabled);
}

function toggleIcons(isDarkModeEnabled) {
  if (isDarkModeEnabled) {
    document.querySelector('#dark-mode-sun').style.display = 'block';
    document.querySelector('#dark-mode-moon').style.display = 'none';
  } else {
    document.querySelector('#dark-mode-sun').style.display = 'none';
    document.querySelector('#dark-mode-moon').style.display = 'block';
  }
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
