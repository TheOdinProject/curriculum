### Introduction
We're making a Tic Tac Toe game you can play in your browser!

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Set up your project with a HTML, CSS and Javascript files and get the Git repo all set up.
2. You're going to store the gameboard as an array inside of a Gameboard object, so start there!  Your players are also going to be stored in objects... and you're probably going to want an object to control the flow of the game itself.
   1. Your main goal here is to have as little global code as possible.  Try tucking everything away inside of a module or factory.  Rule of thumb: if you only ever need ONE of something (gameBoard, displayController), use a module.  If you need multiples of something (players!), create them with factories.
3. Set up your HTML and write a JavaScript function that will render the contents of the gameboard array to the webpage (for now you can just manually fill in the array with `"X"`s and `"O"`s)
4. Build the functions that allow players to add marks to a specific spot on the board, and then tie it to the DOM, letting players click on the gameboard to place their marker. Don't forget the logic that keeps players from playing in spots that are already taken!
   1. Think carefully about where each bit of logic should reside. Each little piece of functionality should be able to fit in the game, player or gameboard objects.. but take care to put them in "logical" places.  Spending a little time brainstorming here can make your life much easier later!
5. Build the logic that checks for when the game is over!  Should check for 3-in-a-row and a tie.
6. Clean up the interface to allow players to put in their names, include a button to start/restart the game and add a display element that congratulates the winning player!
7. Optional - If you're feeling ambitious create an AI so that a player can play against the computer!
   1. Start by just getting the computer to make a random legal move.
   2. Once you've gotten that, work on making the computer smart.  It is possible to create an unbeatable AI using the minimax algorithm (read about it [here](https://en.wikipedia.org/wiki/Minimax), some googling will help you out with this one)
   3. If you get this running _definitely_ come show it off in the chatroom.  It's quite an accomplishment!
</div>

### Student Solutions
To add your solution to the list below, edit this [file](https://github.com/TheOdinProject/javascript_curriculum/blob/master/organizing-js/tic-tac-toe-project.md) (located on The Odin Project's "curriculum" github repository). See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for more instructions.

- Add your solution below this line!
- [Javier Machin's solution](https://github.com/Javier-Machin/js-tic-tac-toe) - [View in browser](https://javier-machin.github.io/js-tic-tac-toe/)
- [leosoaivan's solution](https://github.com/leosoaivan/js-tictactoe) - [View in browser](http://leosoaivan.com/js-tictactoe)
- [nmac's solution (with minimax)](https://github.com/nmacawile/js-tic-tac-toe) - [Game](https://htmlpreview.github.io/?https://github.com/nmacawile/js-tic-tac-toe/blob/master/index.html)
- [Johan Morin's Solution](https://github.com/MorrisMalone/tic-tac-toe) - [View in Browser](https://morrismalone.github.io/tic-tac-toe/)
- [brxck's solution](https://github.com/brxck/tic-tac-toe-js) - [View in Browser](http://brockmcelroy.com/tic-tac-toe-js/)
- [theghall's solution](https://github.com/theghall/odin-tic-tac-toe) - [View in Browser](https://theghall.github.io/odin-tic-tac-toe/)
- [Andrew's Solution](https://github.com/andrewr224/Tic-Tac-Toe-JS) - [View in Browser](https://andrewr224.github.io/Tic-Tac-Toe-JS/)
- [mindovermiles262's Solution](https://github.com/mindovermiles262/tictactoejs) - [View in Browser](https://mindovermiles262.github.io/tictactoejs/)
- [Jonathan Yiv's solution](https://github.com/JonathanYiv/web-tic-tac-toe) - [View in browser](https://jonathanyiv.github.io/web-tic-tac-toe/)
- [Rob Hitt's solution](https://github.com/robhitt/tic-tac-toe-js) - [View in browser](https://robhitt.github.io/tic-tac-toe-js/)
- [walnutdust's solution](https://github.com/walnutdust/tic-tac-toe) - [View in browser](https://walnutdust.github.io/tic-tac-toe/)
- [Jmoore30's solution](https://github.com/jmooree30/JS-Tic-Tac-Toe) - [View in browser](https://jmooree30.github.io/JS-Tic-Tac-Toe/)
- [Ezequiel Espinoza's solution](https://github.com/ezeaspie/tictactoe) - [View in browser](https://ezeaspie.github.io/tictactoe/index.html)
- [codyloyd's solution](https://github.com/codyloyd/plainJS-tic-tac-toe) - [View in browser](http://codyloyd.com/plainJS-tic-tac-toe/)
- [Rémy's solution](https://codepen.io/beumsk/pen/ZevLbx) - [View in browser](https://codepen.io/beumsk/full/ZevLbx)
- [Nick's solution](https://sinclairnick.github.io/tictactoe/) - [View in browser](https://sinclairnick.github.io/tictactoe/)
- [Caner Sezgin's solution](https://github.com/casedo/Tic-Tac-Toe) - [View in browser](http://bit.ly/ticTacToe)
- [Katineto's solution](https://github.com/Katineto/tic-tac-toe) - [View in browser](https://katineto.github.io/tic-tac-toe/)
- [sampsonmao's solution](https://github.com/sampsonmao/tic-tac-toe) - [View in browser](https://sampsonmao.github.io/tic-tac-toe/)
