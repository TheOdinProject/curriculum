function toggleNav() {
  var logo = document.querySelector('.navbar-brand')
  var logoText = document.querySelector('.logo-text')
  var logoImg = document.querySelector('.logo-img')

  var navToggle = document.querySelector('.navbar-toggler')

  logoText.classList.toggle('expanded')
  logoImg.classList.toggle('expanded')
  logo.classList.toggle('expanded')
}

function fixIOSSpacing() {
  console.log("Firing fixIOSSpacing"); 
  var spacer = document.querySelector('.ios-bottom-padding');
  var expandedNav = document.querySelector('.navbar-brand.expanded');

  // If navbar overlay is closed, remove white spacer at bottom
  if(!expandedNav) {
    console.log("need to remove spacer");
    if(spacer) {
      spacer.parentNode.removeChild(spacer);
    }
  } else {
    console.log("Listening for scroll");
    window.addEventListener('scroll', function(e) {
      if(!spacer && expandedNav) {
        console.log("No spacer and nav is expanded so add spacer");
        spacer = document.createElement('div');
        spacer.className = 'ios-bottom-padding';
        spacer.style.height = '80px';
        spacer.style.position = 'fixed';
        spacer.style.bottom = '0';
        spacer.style.width = '100%';
        spacer.style.background = 'white';
        spacer.style.zIndex = '2';

        var body = document.querySelector('body');
        console.log("Body height", body.clientHeight);
        body.appendChild(spacer);
      }
    });
  }
}

document.addEventListener('turbolinks:load', function(e) {
  var documentWidth = document.documentElement.clientWidth;
  var toggler = document.querySelector('button.navbar-toggler');
      
  toggler.addEventListener('click', function(e) {
    toggleNav();

    if(documentWidth < 480) {
      fixIOSSpacing();
    }
  });

});