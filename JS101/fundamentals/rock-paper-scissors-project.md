We're going to make a simple implementation of grade-school classic "rock paper scissors".  If you don't know what that is check the [wikipedia article](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors) or [this](https://www.wikihow.com/Play-Rock,-Paper,-Scissors) ridiculous step-by-step.  For the moment we're just going to play the game from the browser console, but we will revisit it and add a front end later so don't forget to keep the code on GitHub! You might notice some 'view in browser' links in the student solutions - this is coming in a later lesson.  When you get there don't forget to come back and add  your link!

## Your assignment

1. Start a new git repo for your project.
2. Create a blank HTML document with a script tag.  This game is going to be played
    completely from the console, so don't worry about putting anything else in there.
3. Your game is going to play against the computer, so begin with a function called `computerPlay` that will randomly return either 'Rock', 'Paper' or 'Scissors'.  We'll use this function in the game to make the computer's play.
4. Write a function that plays a single round of Rock Paper Scissors.  The function should take two parameters - the `playerSelection` and `computerSelection` - and then return a string that declares the winner of the round like so: `"You Lose! Paper beats Rock"`
   1. make your function case insensitive (so users can input `rock`, `ROCK`, `RocK` or any other variation)

   2. __Important note:__ you want to `return` the results of this function call, _not_ `console.log()` them.  To test this function console.log the results:

      ~~~javascript
      function playRound(playerSelection, computerSelection) {
      	// your code here!
      }

      const playerSelection = 'rock'
      const computerSelection = computerPlay()
      console.log(playRound(playerSelection, computerSelection))
      ~~~

      ​
5. Write a NEW function called `game()`.  Use the previous function _inside_ of this one to play a 5 round game that keeps score and reports a winner or loser at the end.
   1. At this point you should still just be using `console.log()` to display the results of each round and the winner at the end.
   2. use `prompt()` to get input from the user. [Read the docs here if you need to.](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt)
   3. Feel free to re-work your previous functions if you need to.  Specifically, you might want to change the return value to something more useful.
   4. Feel free to create more "helper" functions if you think it would be useful.

## Student Solutions

Send us your solution so we can show others! Submit a link to the Github repo with your files in it by using any of the methods listed on the contributing page.  See the Google Homepage project for examples.

- Add your solution below this line!
- [Nate Dimock's solution](https://github.com/Flakari/rock-paper-scissors) - [View in browser](https://flakari.github.io/rock-paper-scissors/)
- [ThirtyThreeB's solution](https://github.com/ThirtyThreeB/rock-paper-scissors) - [View in browser](https://thirtythreeb.github.io/rock-paper-scissors/)
- [PongtheGreat's solution](https://github.com/PongtheGreat/RPS) - [View in browser](https://pongthegreat.github.io/RPS/)
- [codyloyd's solution](https://github.com/codyloyd/odin-rock-paper-scissors) - [GUI version!](http://codyloyd.com/odin-rock-paper-scissors/)
- [Tshepo Mohlamonyan's solution](https://github.com/blavkboy/rock_paper_scissors.git)
- g0-0py's solutions: [Console](https://github.com/g0-0py/Rock-Paper-Scissors) - [View in browser](https://g0-0py.github.io/Rock-Paper-Scissors/)  |  [GUI](https://github.com/g0-0py/Rock-Paper-Scissors-GUI) - [View in browser](https://g0-0py.github.io/Rock-Paper-Scissors-GUI/)
- [Kimberlee's solution](https://github.com/KimDube/web-development/tree/master/rock-paper-scissors) - [View in browser](https://kimdube.github.io/web-development/rock-paper-scissors/)
- [SamJamCul's solution](https://github.com/SamJamCul/rock-paper-scissors) - [View in browser](https://samjamcul.github.io/rock-paper-scissors/)
- [Djokole's solution](https://github.com/djokole/RPS) - [View in browser](https://djokole.github.io/RPS/)
- [artkol's solution](https://github.com/artkol/simple-rps-game) - [View in browser](https://artkol.github.io/simple-rps-game/)
- [Shanemcc94's solution](https://github.com/shanemcc94/rock-paper-scissors) - [View in browser](https://shanemcc94.github.io/rock-paper-scissors/)
- [dejanmijatovic's solution](https://github.com/Anhatel/rock-paper-scissors)
- [technicolor1's solution](https://github.com/technicolor1/odin-rockpaperscissors) - [View in browser](https://technicolor1.github.io/odin-rockpaperscissors/)
