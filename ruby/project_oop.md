# Project: OOP with Ruby
<!-- *Estimated Time: 6-8 hours* -->

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
* [Solution from Teaflavored](https://github.com/Teaflavored/Project-Odin-Ruby-Programming/tree/master/Tic%20Tac%20Toe)
* [Solution from Afshinator](https://github.com/afshinator/playground/tree/master/ticTacToe)
* [Solution from ctcyu](https://github.com/ctcyu/ruby_sandbox/blob/master/tictac.rb)
* [Solution from Jamie (submitted Arp-14,2014)](https://github.com/Jberczel/odin-projects/tree/master/TicTacToe)
* [Solution from Chris](https://github.com/krzysieko/theodinproject/blob/master/oop_with_ruby/tictactoe.rb)
* [Solution from Anh Le](https://github.com/LaDilettante/studying-odin-project/blob/master/3_ruby_programming/project_oop/tic_tac_toe.rb)
* [Solution from Donald](https://github.com/donaldali/odin-ruby/tree/master/project_oop/tictactoe)
* [Solution from Alan Russell](https://github.com/ajrussellaudio/tic-tac-toe)
* [Solution from Marina Sergeyeva](https://github.com/imousterian/OdinProject/blob/master/Project2_3_Ruby_TicTacToe/tictactoe.rb)
* [Solution from TomTom](https://github.com/tim5046/projectOdin/blob/master/IntermediateRuby/ticTacToe.rb)
* [Solution from Sahil](https://github.com/sahilda/the_odin_project/tree/master/oop)
* [Solution from Tommy Noe](https://github.com/thomasjnoe/tic-tac-toe/blob/master/tic_tac_toe.rb)
* [Solution from Peter Hurford (with AI)](https://github.com/peterhurford/tictactoe)
* [Solution from Michael Alexander](https://github.com/betweenparentheses/ruby-oop-projects/blob/master/tictactoe.rb)
* [Solution from Steve Mitchell](https://github.com/Ixpata/tic-tac-toe/blob/master/tic_tac_toe.rb)
* [Solution from Adrian Badarau](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/tic-tac-toe.rb)
* [Solution from James MacIvor](https://github.com/RobotOptimist/tictactoe/blob/master/tictactoe.rb)
* [Solution from Arman Ghassemi](https://github.com/ArmanG/TicTacToe.git)
* [Solution from Gray Olson](https://github.com/termhn/TicTacToe-Ruby)
* [Solution from Hawkeye](https://github.com/Hawkeye000/tic-tac-toe)
* [Solution from Roman] (https://github.com/RomanADavis/tic_tac_toe)
* [Solution from Aleksandar Rodić](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Project:%20OOP%20with%20Ruby/lib/tictactoe.rb)
* [Solution from Vidul (with AI)](https://github.com/viparthasarathy/tic_tac_toe/blob/master/game.rb)
* [Solution from John Quarles](https://github.com/johnwquarles/Ruby-OOP-TicTacToe-and-MasterMind/blob/master/TicTacToe.rb)
* [Solution from Artur Janik](https://github.com/ArturJanik/oopproject1/blob/master/p1-tictactoe.rb)
* [Solution from Dan Molloy](https://github.com/danmolloy/tictactoe)
* [Solution from Hunter Ducharme](https://github.com/hgducharme/Playground/blob/master/odin_projects/ruby_programming/OOP_ruby/tic_tac_toe/tic_tac_toe.rb)
* [Solution from Angela Woods](https://github.com/insomniacode/odin_oop_ruby/tree/master/tic_tac_toe)
* [Solution from Kate McFaul](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/oop_with_ruby/tic_tac_toe.rb)
* [Solution from Lara Finnegan](https://github.com/lcf0285/tic_tac_toe)
* [Solution from Dominik Stodolny](https://github.com/dstodolny/tictactoe/blob/master/tictactoe.rb)
* *Put Your Solution Above This Line!*


## Project 2: Mastermind

If you've never played Mastermind, a game where you have to guess your opponent's secret code within a certain number of turns (like hangman with colored pegs), check it out on <a href="http://en.wikipedia.org/wiki/Mastermind_(board_game)">Wikipedia</a>.  Each turn you get some feedback about how good your guess was -- whether it was exactly correct or just the correct color but in the wrong space.

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
* [Solution from Donald](https://github.com/donaldali/odin-ruby/tree/master/project_oop/mastermind)
* [Solution from Alan Russell](https://github.com/ajrussellaudio/mastermind)
* [Solution from Marina Sergeyeva](https://github.com/imousterian/OdinProject/blob/master/Project2_3_Ruby_TicTacToe/mastermind.rb)
* [Solution from TomTom (no AI)](https://github.com/tim5046/projectOdin/blob/master/IntermediateRuby/mastermind1.rb)
* [Solution from Sahil](https://github.com/sahilda/the_odin_project/tree/master/oop)
* [Solution from Teaflavored (no AI)](https://github.com/Teaflavored/Project-Odin-Ruby-Programming/tree/master/Mastermind)
* [Solution from Michael Alexander](https://github.com/betweenparentheses/ruby-oop-projects/blob/master/mastermind.rb)
* [Solution from Adrian Badarau (no AI)] (https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/mastermind.rb)
* [Solution from Arman Ghassemi](https://github.com/ArmanG/Mastermind)
* [Solution from James MacIvor includes AI](https://github.com/RobotOptimist/mastermind)
* [Solution from Hawkeye includes AI](https://github.com/Hawkeye000/mastermind)
* [Solution from Roman (no AI)](https://github.com/RomanADavis/mastermind)
* [Solution from Aleksandar Rodić](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Project:%20OOP%20with%20Ruby/lib/mastermind.rb)
* [Solution from Vidul](https://github.com/viparthasarathy/mastermind/blob/master/mastermind.rb)
* [Solution from John Quarles](https://github.com/johnwquarles/Ruby-OOP-TicTacToe-and-MasterMind/blob/master/MasterMind.rb)
* [Solution from Artur Janik (no AI)](https://github.com/ArturJanik/oopproject2)
* [Solution from Kate McFaul (includes AI)](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/oop_with_ruby/mastermind.rb)
* [Solution from Dominik Stodolny (AI)](https://github.com/dstodolny/mastermind)
* Put Your Solution Above This Line!

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* Not directly helpful, but here are some [Ruby game libraries](https://www.ruby-toolbox.com/categories/game_libraries) for fun.
