var myImage = document.querySelector('img');

myImage.onclick = function () {
  var mySrc = myImage.getAttribute ('src');
  if (mySrc === 'images/Abbott_Gribben_Joao_2.jpg') {
    myImage.setAttribute ('src', 'images/Abbott_Gribben_Joao_3.jpg');
  }else{
    myImage.setAttribute ('src', 'images/Abbott_Gribben_Joao_2.jpg')
  }
}
var myButton = document.querySelector('button');
var myHeading = document.querySelector('h1');

function setUserName() {
  var myName = prompt('Please enter your name.');
  localStorage.setItem('name', myName);
  myHeading.textContent = 'Mozilla is cool, ' + myName;
}

if(!localStorage.getItem('name')) {
  setUserName();
} else {
  var storedName = localStorage.getItem('name');
  myHeading.textContent = 'Mozilla is cool, ' + storedName;
}

myButton.onclick = function() {
  setUserName();
}