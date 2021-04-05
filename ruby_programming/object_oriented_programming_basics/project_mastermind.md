### Introduction

If you've never played Mastermind, a game where you have to guess your opponent's secret code within a certain number of turns (like hangman with colored pegs), check it out on <a href="http://en.wikipedia.org/wiki/Mastermind_(board_game)">Wikipedia</a>.  Each turn you get some feedback about how good your guess was -- whether it was exactly correct or just the correct color but in the wrong space.

### Assignment

Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer's random code.

<div class="lesson-content__panel" markdown="1">
  1. Think about how you would set this problem up!
  2. Build the game assuming the computer randomly selects the secret colors and the human player must guess them.  Remember that you need to give the proper feedback on how good the guess was each turn!
  3. Now refactor your code to allow the human player to choose whether they want to be the creator of the secret code or the guesser.
  4. Build it out so that the computer will guess if you decide to choose your own secret colors.  You may choose to implement a computer strategy that follows the rules of the game or you can modify these rules.
  5. If you choose to modify the rules, you can provide the computer additional information about each guess.  For example, you can start by having the computer guess randomly, but keep the ones that match exactly.  You can add a little bit more intelligence to the computer player so that, if the computer has guessed the right color but the wrong position, its next guess will need to include that color somewhere.
  6. If you want to follow the rules of the game, you'll need to research strategies for solving Mastermind, such as this [post](https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind).
  7. Post your solution below!
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Not directly helpful, but here are some [Ruby game libraries](https://www.ruby-toolbox.com/categories/game_libraries) for fun.
