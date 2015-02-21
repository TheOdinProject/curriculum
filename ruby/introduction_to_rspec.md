# A Taste of Testing Ruby with RSpec
<!-- *Estimated Time: 1 hr* -->

By now you've had some experience writing actual programs using Ruby.  Presumably, you've been making sure they work by manually entering certain things in the command line over and over again.  This was probably especially frustrating with some of the more complex projects you just did during the Algorithms and Data Structures lesson.  

As you should recall from the Web Development 101 course, testing with RSpec lets you automate most of these activities.  It also allows you to make sure your program's interfaces with the public are functioning properly.  It allows you to have confidence in your code and not to worry about changing things that may break stuff because you'll know immediately what broke and can much more easily determine why.  If you end up contributing to an open-source project, they'll want you to include specs to test whatever features you've created.

At the most basic level, RSpec is a "Domain Specific Language" (DSL, meaning it just does a very specific thing) written in Ruby that is designed to help you test your Ruby code.  You use it by including the `rspec` gem, which is really just a package containing 3 other gems -- `rspec-core`, `rspec-expectations` and `rspec-mocks`.  It's configured so that, once you've got the gem included, if you've laid out your project folders in the right places, you can just execute the specs directly from the command line.  If you did the Test-First project in the Web Development 101 course, you should already be quite familiar with it. 

We will cover testing in more depth in the Rails course, but you'll want to get a good base built in testing "plain old" Ruby first.  It will also help you with the final project since you might otherwise find yourself endlessly entering data into the command line and using the debugger.

It's difficult to find good resources to teach RSpec for free.  There are some decent paid resources (listed in the "Additional Resources" section below) but the free ones are very dispersed.  The way you'll likely learn it is by knowing you want to do something and then Googling around for how to test it, or going through a tutorial where someone is using it.

## Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* How do you run an RSpec test suite?
* How do you write a basic RSpec test?
* What aspects of your methods should you test?
* What is a stub?
* What is a mock?
* What is a double?
* How are they different?
* When would you use them?

## Your Assignment

1. Go back to the Web Development 101 course and do the [RSpec section](/web-development-101/testing-basics) if you haven't already.
2. Watch [this video walkthrough](http://www.youtube.com/watch?v=JhR9Ib1Ylb8&feature=relmfu) of writing some RSpec tests for a small bit of sample code in the Test-Driven Development (TDD) fashion. 
3. Read [this blog entry introduction to RSpec](http://blog.teamtreehouse.com/an-introduction-to-rspec) from Treehouse for a slightly more formal grounding in the basics.
3. Take a glance at the [Relish RSpec official documentation](https://www.relishapp.com/rspec/rspec-core/v/2-4/docs).  It will be a good resource for when you're scratching your head later.
3. Glance through [Better Specs](http://betterspecs.org), which shows tons of examples of what you should and shouldn't do with RSpec.
4. (Optional) [This RSpec Tutorial from TutsPlus](http://net.tutsplus.com/tutorials/ruby/ruby-for-newbies-testing-with-rspec/) will give you another example walkthrough of tests being written.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [Peep Code's RSpec Lessons](https://peepcode.com/products/rspec-i) are not free but are a good place to take a step forward into better understanding.
* [The RSpec Book](http://www.amazon.com/The-RSpec-Book-Behaviour-Development/dp/1934356379) is THE book on RSpec.
* The [RSpec Cheat Sheet](http://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf) should help you avoid Googling every new bit of syntax.
* Read the [Wikipedia Page on Test Driven Development](http://en.wikipedia.org/wiki/Test-driven_development) for context on TDD if you're still feeling unfamiliar.
