# Testing 101
<!-- *Estimated Time: 2-3 hrs* -->

Testing is one of those things that people often don't think about when they decide to learn about web development but it's critically important to the production of professional quality applications and it will save you tons of time and headache in the end.

Let's say you're building a simple website and you've got a couple of pages linked together with a simple navigation bar at the top.  You make some changes to the code and want to know if the website still works.  So you open up your local version of the webpage and click through each of the buttons on the navigation bar to make sure they each still lead to the right location.  Not too difficult, is it?  It doesn't take too long, and it doesn't seem like such a bad way of doing things.

But now imagine that you've got a dozen pages with a login system and content that's meant to look different depending on which type of user you are logged in as.  You could come up with a checklist of all the buttons you'd have to manually click on and all the times you'd have to login as a different user... but think about how many steps it would take before you were satisfied that your changes didn't accidentally blow up some obscure but necessary function of your website?  Situations like that should yell "automate me!" in your head, and that's exactly what testing does.

On the back end, you will learn RSpec, a language that is written in Ruby and one which will help you execute a broad and flexible script of tests to make sure your application is still working the way that it should.  RSpec's syntax even reads sort of like English, though it still takes some getting used to.  RSpec lets you test specific areas of your application like pulling from and saving to the database or that your helper methods work as expected.  With the help of a few useful gems, you can also test the broad-scale interactions the user will have when traveling from one web page to another.

Although we're covering this topic in the "Back End" section, testing isn't just for the server-side.  On the front end, we'll later learn a language called Jasmine to do a similar sort of thing for Javascript.  That should make sense to you -- the reasons to properly test your code apply whether it's run on a server or in the browser.

### Approaches to Testing

Everyone does testing a little differently.  Some teams still rely heavily on a Quality Assurance (QA) department with people manually executing checklists like we described in the example above.  Some people use an approach called Test Driven Development (TDD) in which they write the (failing) test first and only then do they actually write the code necessary to make it pass, and thus very deliberately build the application out with 100% test coverage.  Others prefer to keep their test suites fairly light and will only write tests for the major interactions on their pages and any bugs that they have to fix along the way (to make sure they don't come back).  

Regardless of how exactly it's done, testing is highly important and you'll be required to do it whatever your job is.  Beginning developers are often tasked to write tests and fix bugs to become familiar with a given code base.  Luckily, we'll cover testing more in the Ruby and Rails and Javascript courses later in the curriculum.

## Points to Ponder

*Look through these now and then use them to test yourself after doing the assignment*


* What exactly does "testing" mean for web applications?
* Why is testing important?
* What is legacy code?
* Why is writing tests particularly powerful for handling legacy code?
* What is RSpec?
* How do you run a RSpec test suite?
* How do you write a basic RSpec test?

## Assignment:

1. Get a real-life perspective on why tests are so important by watching [this video](http://www.youtube.com/watch?v=nBtO1UOK9Hs) by Nell Shamrell.  Some of the vocabulary may be stuff you haven't heard before (like "stubs" and "mocks"), but just absorb the message. 
1. Do the [Introductory RSpec level](http://rspec.codeschool.com/levels/1) from Code School to become more familiar with Ruby's RSpec test framework.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* A [very detailed treatise on test driven development](http://www.agiledata.org/essays/tdd.html) from AgileData.org.
* Sarah Allen's [video on TDD as a teaching tool](http://www.youtube.com/watch?v=KgfdlZuVz7I&list=PLUsjeAGxOpOq9VVgjs7FgvIHMULMrJI_w&index=2)
* A more generic (and shorter) [presentation on TDD](http://www.youtube.com/watch?v=y6yJuPJK67w&list=PLUsjeAGxOpOq9VVgjs7FgvIHMULMrJI_w&index=4)
