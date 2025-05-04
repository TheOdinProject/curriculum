### Introduction

At this point, you've written tests for older projects of yours, and have completed a plethora of other test-writign assignments to familiarize yourself with RSpec. You're now ready to create a new project with TDD in mind!

### Project: TDD Connect Four

Hopefully most people will have played [Connect Four](http://en.wikipedia.org/wiki/Connect_Four) at some point. It's a basic game where each player takes turns dropping pieces into the cage. Players win if they manage to get 4 of their pieces consecutively in a row, column, or along a diagonal.

The game rules are fairly straightforward and you'll be building it on the command line like you did with the other games.  If you want to spice up your game pieces, look up the [unicode miscellaneous symbols](http://en.wikipedia.org/wiki/List_of_Unicode_characters#Miscellaneous_Symbols) on Wikipedia.  The Ruby part of this should be well within your capability by now so it shouldn't tax you much to think about it.

The major difference here is that you'll be doing this TDD-style.  So figure out what needs to happen, write a (failing) test for it, then write the code to make that test pass, then see if there's anything you can do to refactor your code and make it better.

Only write exactly enough code to make your test pass.  Oftentimes, you'll end up having to write two tests in order to make a method do anything useful.  That's okay here.  It may feel a bit like overkill, but that's the point of the exercise.  Your thoughts will probably be something like "Okay, I need to make this thing happen.  How do I test it?  Okay, wrote the test, how do I code it into Ruby?  Okay, wrote the Ruby, how can I make this better?"  You'll find yourself spending a fair bit of time Googling and trying to figure out exactly how to test a particular bit of functionality.  That's also okay... You're really learning RSpec here, not Ruby, and it takes some getting used to.

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Build Connect Four!  Just be sure to keep it TDD.

</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Stack Overflow has an [RSpec Mock Object example](http://stackoverflow.com/questions/3622604/rspec-mock-object-example).
- Youtube has a [helpful video by Sandi Metz about Ruby testing](https://www.youtube.com/watch?v=URSWYvyc42M).
- Tutorials Point has an article about [RSpec Writing Specs](https://www.tutorialspoint.com/rspec/rspec_writing_specs.htm).
