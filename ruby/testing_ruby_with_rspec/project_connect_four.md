### Introduction

A good way to get familiar with and begin contributing to a new project is to write tests for it.  It's also the best way to become familiar with a new code base, something you'll have to do when you start working.  It's pretty common for test code to ultimately take up twice as many lines of code as the actual project code!

You still may feel shaky on RSpec at this point (which is totally normal), so let's go back in time and write tests for some of the code you've already done to build up a bit of muscle memory.  If you've written a good batch, submit them below and we'll include them as part of the original project description to help future students!

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Clone our [ruby testing repo](https://github.com/TheOdinProject/ruby_testing) and complete the lessons in the spec folder.
  1. Watch this [helpful video by Sandi Metz](https://www.youtube.com/watch?v=URSWYvyc42M) to learn more about Ruby testing.
  1. Go back to the [Caesar Cipher Project](/lessons/ruby-caesar-cipher) and write tests for your code.  It shouldn't take more than a half-dozen tests to cover all the possible cases. As always, use the git workflow you learned in [Revisiting Rock Paper Scissors](https://www.theodinproject.com/lessons/foundations-revisiting-rock-paper-scissors) to work on a new feature so you can work on your new code without fear.
  1. Write tests for your [Tic Tac Toe project](/lessons/ruby-tic-tac-toe). In this situation, it's not quite as straightforward as just coming up with inputs and making sure the method returns the correct thing. You'll need to make sure the tests that determine victory or loss conditions are correctly assessed.
      1. Start by writing tests to make sure players win when they should, e.g. when the board reads X X X across the top row, your `#game_over` method (or its equivalent) should trigger.
      1. Test each of your critical methods to make sure they function properly and handle edge cases.
      1. Use mocks/doubles to isolate methods to make sure that they're sending back the right outputs.

</div>

### Project: TDD Connect Four

Hopefully most people will have played [Connect Four](http://en.wikipedia.org/wiki/Connect_Four) at some point. It's a basic game where each player takes turns dropping pieces into the cage. Players win if they manage to get 4 of their pieces consecutively in a row, column, or along a diagonal.

The game rules are fairly straightforward and you'll be building it on the command line like you did with the other games.  If you want to spice up your game pieces, look up the [unicode miscellaneous symbols](http://en.wikipedia.org/wiki/List_of_Unicode_characters#Miscellaneous_Symbols) on Wikipedia.  The Ruby part of this should be well within your capability by now so it shouldn't tax you much to think about it.

The major difference here is that you'll be doing this TDD-style.  So figure out what needs to happen, write a (failing) test for it, then write the code to make that test pass, then see if there's anything you can do to refactor your code and make it better.

Only write exactly enough code to make your test pass.  Oftentimes, you'll end up having to write two tests in order to make a method do anything useful.  That's okay here.  It may feel a bit like overkill, but that's the point of the exercise.  Your thoughts will probably be something like "Okay, I need to make this thing happen.  How do I test it?  Okay, wrote the test, how do I code it into Ruby?  Okay, wrote the Ruby, how can I make this better?"  You'll find yourself spending a fair bit of time Googling and trying to figure out exactly how to test a particular bit of functionality.  That's also okay... You're really learning RSpec here, not Ruby, and it takes some getting used to.

### Assignment continued

<div class="lesson-content__panel" markdown="1">

  1. Build Connect Four!  Just be sure to keep it TDD.

</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Stack Overflow has an [RSpec Mock Object example](http://stackoverflow.com/questions/3622604/rspec-mock-object-example).
- Tutorials Point has an article about [RSpec Writing Specs](https://www.tutorialspoint.com/rspec/rspec_writing_specs.htm).
