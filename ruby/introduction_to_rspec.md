By now you've had some experience writing actual programs using Ruby.  Presumably, you've been making sure they work by manually entering certain things in the command line over and over again.  This was probably especially frustrating with some of the more complex projects you just did during the Algorithms and Data Structures lesson.  

As you should recall from the Web Development 101 course, testing with RSpec lets you automate most of these activities.  It also allows you to make sure your programs' interfaces with the public are functioning properly.  It allows you to have confidence in your code and to not worry about changing things that may break stuff because you'll know immediately what broke and can more easily determine why.  If you end up contributing to an open-source project, they'll want you to include specs to test whatever features you've created.

At the most basic level, RSpec is a "Domain Specific Language" (DSL, meaning it just does a very specific thing) written in Ruby that is designed to help you test your Ruby code.  You use it by including the `rspec` gem, which is really just a package containing 3 other gems -- `rspec-core`, `rspec-expectations` and `rspec-mocks`.  It's configured so that, once you've got the gem included, if you've laid out your project folders in the right places, you can just execute the specs directly from the command line.  If you did the Test-First project in the Web Development 101 course, you should already be quite familiar with it.

We will cover testing in more depth in the Rails course, but you'll want to get a good base built in testing "plain old" Ruby first.  It will also help you with the final project since you might otherwise find yourself endlessly entering data into the command line and using the debugger.

It's difficult to find good resources to teach RSpec for free.  There are some decent paid resources (listed in the "Additional Resources" section below) but the free ones are very dispersed.  The way you'll likely learn it is by knowing you want to do something and then Googling around for how to test it, or going through a tutorial where someone is using it.

### Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* How do you run an RSpec test suite?
* How do you write a basic RSpec test?
* What aspects of your methods should you test?
* What is a stub?
* What is a mock?
* What is a double?
* How are they different?
* When would you use them?

### Your Assignment

1. Go back to the Web Development 101 course and do the [RSpec section](/web-development-101/testing-basics) if you haven't already.
2. Get started writing your own tests by reading [this 3-part series](https://semaphoreci.com/community/series/learn-rspec) and following the tutorial in part 1.
3. Take a glance at the [Relish RSpec official documentation](https://www.relishapp.com/rspec/rspec-core/v/3-5/docs/).  It will be a good resource for when you're scratching your head later.
4. Glance through [Better Specs](http://www.betterspecs.org/), which shows tons of examples of what you should and shouldn't do with RSpec.

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [This Tutorials Point guide](https://www.tutorialspoint.com/rspec/index.htm) is another beginners tutorial but covers a wider range of rspec features.
* [The RSpec Book](http://www.amazon.com/The-RSpec-Book-Behaviour-Development/dp/1934356379) is THE book on RSpec, but at this point it's a little out-dated.
* [RSpec::Core Cheat Sheet](http://www.rubypigeon.com/posts/rspec-core-cheat-sheet/) and [RSpec::Expectations Cheat Sheet](http://www.rubypigeon.com/posts/rspec-expectations-cheat-sheet/) explain the basics in a simple way.
* The [RSpec Cheat Sheet](http://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf) should help you avoid Googling every new bit of syntax.
* Read the [Wikipedia Page on Test Driven Development](http://en.wikipedia.org/wiki/Test-driven_development) for context on TDD if you're still feeling unfamiliar.
* Check out [This Blog Post](https://8thlight.com/blog/uncle-bob/2013/05/27/TheTransformationPriorityPremise.html) for some more insight on OOP
