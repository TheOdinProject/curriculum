function enableDarkMode() {
    const navbar = document.querySelector('.navbar-nav');
    const darkModeItem = document.createRange().createContextualFragment(
        `<li class="nav-item " style="flex-direction: row; justify-content: center">
          <a class="nav-link" data-test-id="user-login-link">Dark Mode</a>
          <input type="checkbox" style="align-self: center">
        </li>`);

    darkModeItem.querySelector("input").addEventListener('click', async e => {
        if(e.target.checked) {
            const result = await fetch("https://raw.githubusercontent.com/TheOdinProject/top-dark-theme/master/darkMode.css");
            const css = await result.text();
            const style = document.createElement('style');
            style.innerText = css;
            document.querySelector('head').appendChild(style);
        } else {
            console.log('unchecked');
        }
    });

    navbar.appendChild(darkModeItem);
}