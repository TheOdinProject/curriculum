# Project: OOP with Ruby
*Estimated Time: 6-8 hours*

*Don't forget to use Git to save your projects!*

## Project 1: Tic Tac Toe

Remember Tic Tac Toe? See [Wikipedia](http://en.wikipedia.org/wiki/Tic-tac-toe) if you haven't.  It involves a couple of players, a simple board, checking for victory in a game loop... all the conditions that make it a fun little problem to solve using our newfound OOP sea legs.  Let's build it!

### Your Task:

Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.  

1. Think about how you would set up the different elements within the game... What should be a class? Instance variable?  Method? A few minutes of thought can save you from wasting an hour of coding.
2. Build your game, taking care to not share information between classes any more than you have to.
3. Post your solution below, then check out the example solution provided.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* A [walkthrough of how to build Tic Tac Toe in Ruby](http://codequizzes.wordpress.com/2013/10/25/creating-a-tic-tac-toe-game-with-ruby/) from the codequizzes blog.
* An [example solution on RosettaCode.org](http://rosettacode.org/wiki/Tic-tac-toe#Ruby)
* [Solution from Afshinator](https://github.com/afshinator/playground/tree/master/ticTacToe)
* [Solution from ctcyu](https://github.com/ctcyu/ruby_sandbox/blob/master/tictac.rb)
* *Your Solution Here!*


## Project 2: Mastermind

If you've never played Mastermind, a game where you have to guess your opponent's secret code within a certain number of turns (like hangman with colored pegs), check it out on [Wikipedia](http://en.wikipedia.org/wiki/Mastermind_(board_game\)).  Each turn you get some feedback about how good your guess was -- whether it was exactly correct or just the correct color but in the wrong space.

### Your Task

Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer's random code.

1. Think about how you would set this problem up!
2. Build the game assuming the computer randomly selects the secret colors and the human player must guess them.  Remember that you need to give the proper feedback on how good the guess was each turn!
3. Now refactor your code to allow the human player to choose whether she wants to be the creator of the secret code or the guesser.  
4. Build it out so that the computer will guess if you decide to choose your own secret colors.  Start by having the computer guess randomly (but keeping the ones that match exactly).
5. Next, add a little bit more intelligence to the computer player so that, if the computer has guessed the right color but the wrong position, its next guess will need to include that color somewhere.  Feel free to make the AI even smarter.
5. Post your solution below!

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Solution from Afshinator](https://github.com/afshinator/playground/tree/master/Mastermind)
* [Solution from ctcyu](https://github.com/ctcyu/ruby_sandbox/blob/master/mastermind.rb)
* *Your Solution Here!*

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* Not directly helpful, but here are some [Ruby game libraries](https://www.ruby-toolbox.com/categories/game_libraries) for fun.
