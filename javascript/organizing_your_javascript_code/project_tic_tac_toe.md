### Introduction

We're making a Tic Tac Toe game you can play in your browser!

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Set up your project with HTML, CSS and JavaScript files and get the Git repo all set up.
1. You’re going to store the gameboard as an array inside of a Gameboard object, so start there! Your players are also going to be stored in objects, and you’re probably going to want an object to control the flow of the game itself.
   1. Your main goal here is to have as little global code as possible. Try tucking as much as you can inside factories. If you only need a single instance of something (e.g. the gameboard, the displayController etc.) then wrap the factory inside an IIFE (module pattern) so it cannot be reused to create additional instances.
   1. In this project, think carefully about where each bit of logic should reside. Each little piece of functionality should be able to fit in the game, player or gameboard objects. Take care to put them in “logical” places. Spending a little time brainstorming here can make your life much easier later!
   1. If you’re having trouble, [Building a house from the inside out](https://www.ayweb.dev/blog/building-a-house-from-the-inside-out) is a great article that lays out a highly applicable example both of how you might approach tackling this project as well as how you might organize and structure your code.
1. Focus on getting a working game in the console first. Make sure you include logic that checks for when the game is over! You should be checking for all winning 3-in-a-rows and ties. Try to avoid thinking about the DOM and your HTML/CSS until your game is working. Don't worry about taking user input at this point either. You can call your functions and pass arguments to them to play the game yourself and check if everything is working as intended.
1. Once you have a working console game, create an object that will handle the display/DOM logic. Write a function that will render the contents of the gameboard array to the webpage (for now, you can always just fill the gameboard array with `"X"`s and `"O"`s just to see what's going on).
1. Write the functions that allow players to add marks to a specific spot on the board by interacting with the appropriate DOM elements (e.g. letting players click on a board square to place their marker). Don't forget the logic that keeps players from playing in spots that are already taken!
1. Clean up the interface to allow players to put in their names, include a button to start/restart the game and add a display element that shows the results upon game end!

</div>
