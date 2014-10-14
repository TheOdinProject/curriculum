# Project: Testing Ruby with RSpec
*Estimated Time: 6-10 hours*

*Don't forget to use Git to save your projects!*

## Warmup: Time Traveling

A good way to get familiar with and begin contributing to a new project is to write tests for it.  It's also the best way to become familiar with a new code base, something you'll have to do when you start working.  It's pretty common for test code to ultimately take up twice as many lines of code as the actual project code!

You still may feel shaky on RSpec at this point (which is totally natural), so let's go back in time and write tests for some of the code you've already done to build up a bit of muscle memory.  If you've written a good batch, submit them below and we'll include them as part of the original project description to help future students!

### Your Task

1. Go back to the [Building Blocks Project](/ruby-programming/building-blocks) and write tests for your "Caesar's Cipher" code.  It shouldn't take more than a half-dozen tests to cover all the possible cases.  Do you remember how to make your tests run using `$ rake`?
1. Go back to the [Advanced Building Blocks Project](/ruby-programming/advanced-building-blocks) and write tests for any 6 of the enumerable methods you wrote there.  In this case, identify several possible inputs for each of those functions and test to make sure that your implementation of them actually makes the tests pass.  Be sure to try and cover some of the odd edge cases where you can.
2. Write tests for your [Tic Tac Toe project](/ruby-programming/oop).  In this situation, it's not quite as simple as just coming up with inputs and making sure the method returns the correct thing.  You'll need to make the tests determine victory or loss conditions are correctly assessed.
    
    1. Start by writing tests to make sure a player wins when he or she should, e.g. when the board reads X X X across the top row, your `#game-over` method (or its equivalent) should be triggered.
    2. Test each of your critical methods to make sure they function properly and handle edge cases.  
    3. Try using mocks/doubles to isolate methods and make sure that they're sending you back the right outputs.


## Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* *Your Solution Here!*
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_rspec_testing)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project2_8_Ruby_Rspec)
* 


## Project: TDD Connect Four

Hopefully everyone has played Connect Four at some point (if not, see the [Wikipedia page](http://en.wikipedia.org/wiki/Connect_Four)).  It's a basic game where each player drops pieces into the cage in turn.  A player wins if he or she manages to get 4 of their pieces consecutively in a row, column, or along a diagonal.  

The game rules are fairly straightforward and you'll be building it on the command line like you did with the other games.  If you want to spice up your game pieces, look up the [unicode miscellaneous symbols](http://en.wikipedia.org/wiki/List_of_Unicode_characters#Miscellaneous_Symbols).  The Ruby part of this should be well within your capability by now so it shouldn't tax you much to think about it.

The major difference here is that you'll be doing this TDD-style.  So figure out what needs to happen, write a (failing) test for it, then write the code to make that test pass, then see if there's anything you can do to refactor your code and make it better.  

Only write exactly enough code to make your test pass.  Oftentimes, you'll end up having to write two tests in order to make a method do anything useful.  That's okay here.  It may feel a bit like overkill, but that's the point of the exercise.  Your thoughts will probably be something like "Okay, I need to make this thing happen.  How do I test it?  Okay, wrote the test, how do I code it into Ruby?  Okay, wrote the Ruby, how can I make this better?"  You'll find yourself spending a fair bit of time Googling and trying to figure out exactly how to test a particular bit of functionality.  That's also okay... You're really learning RSpec here, not Ruby, and it takes some getting used to.

### Your Task

1. Build Connect Four!  Just be sure to keep it TDD.

## Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* *Your Solution Here!*
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_rspec_testing/connect_four_tdd)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project2_8_Ruby_Rspec/connect_four)
* [Tommy Noe's solution](https://github.com/thomasjnoe/connect_four)


*How long did these projects take you?  [Let us know!](mailto:curriculum@theodinproject.com)*


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [RSpec Mock example SO question](http://stackoverflow.com/questions/3622604/rspec-mock-object-example)
* 

