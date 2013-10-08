# A Taste of Testing Ruby with RSpec

By now you've had some experience writing actual programs using Ruby.  Presumably, you've been making sure they work by manually entering certain things in the command line over and over again.  This was probably especially frustrating with some of the more complex exercises during the Algorithms and Data Structures section.  

As you should recall from the Web Development 101 section, testing with RSpec lets you automate most of these activities.  It also allows you to make sure your program's interfaces with the public are functioning properly.  It allows you to have confidence in your code and not to worry about changing things that may break stuff because you'll know immediately what broke and can much more easily determine why.  If you end up contributing to an open-source project, they'll want you to include specs to test whatever features you've created.

At the most basic level, RSpec is a "Domain Specific Language" (DSL, meaning it just does a very specific thing) written in Ruby that is designed to help you test your Ruby code.  You use it by including the `rspec` gem, which is really just a package containing 3 other gems -- `rspec-core`, `rspec-expectations` and `rspec-mocks`.  It's configured so that, once you've got the gem included, if you've laid out your project folders in the right places, you can just execute the specs directly from the command line.  If you did the Test-First project in the Web Development 101 section, you should already be quite familiar with it. 

We will cover testing in more depth in the section on Rails, but you'll want to get a good base built in testing "plain old" Ruby first.  It will also help you with the final project since you might otherwise find yourself endlessly entering data into the command line and using the debugger.

## Homework Assignment

1. Go back to the Web Development 101 section and do the RSpec section if you haven't aready.
2. Read the [Wikipedia Page on Test Driven Development](http://en.wikipedia.org/wiki/Test-driven_development).
2. Watch [this video walkthrough](http://www.youtube.com/watch?v=JhR9Ib1Ylb8&feature=relmfu) of writing some RSpec tests for a small bit of sample code in the Test-Driven Development (TDD) fashion. 
3. Take a glance at the [Relish RSpec official documentation](https://www.relishapp.com/rspec/rspec-core/v/2-4/docs).  It will be a good resource for when you're scratching your head later.

## Test Yourself (heh, heh.)
TODO

## Additional Resources
* [Better Specs](http://betterspecs.org) shows tons of examples of what you should and shouldn't do with RSpec.
* The [RSpec Cheat Sheet](http://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf) should help you avoid Googling every new bit of syntax.
