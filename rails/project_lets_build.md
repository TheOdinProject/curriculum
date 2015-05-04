# Project: Web Refresher
<!-- *Estimated Time: 5-8 hrs* -->

*Don't forget to use Git to save your projects!*

## Warmup: RestClient

This is really a warmup -- you'll get a chance to poke around HTTP requests from the command line (IRB actually) and also to play around with a new gem called `rest-client`.  This is a useful (and powerful) gem which helps you make HTTP requests.  You can use it to do the basic stuff we're doing here or much more complicated authentication requests.

You may find yourself using Rest Client down the road if you need to communicate with another web service that doesn't have an API library already written out for you (which is pretty rare these days).  Or if you get the inclination to test your own API from the command line later.

### Your Task

1. Make sure that you've got Rest Client installed, do a `$ gem install rest-client`
2. Head into IRB (`$ irb`)
3. `require 'rest-client'`
4. Now you're able to play with the gem.  Read its documentation over in the Github repo [HERE](https://github.com/rest-client/rest-client).  You'll end up doing this a whole lot -- using a new gem and going to its repo to check out the documentation, so get familiar with the process early!
5. Use RestClient to do a Google search and examine the results (you can find the parameters that Google wants in the URL by simply making a search in a normal browser.  Pay attention to the `q=` parameter).

...that's it.  The point is to get familiar with making HTTP requests using your command line, which should prepare you for making them from within a Rails app later.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [zkay's solution](https://github.com/zkay/PersonalProjects/tree/master/Rest)
* [afshinator's solution](https://github.com/afshinator/playground/tree/master/RestPinger)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/rest_client)
* [Arman Ghassemi's solution](https://github.com/ArmanG/Rest-Client)
* [Dominik Stodolny's solution](https://github.com/dstodolny/rest_client)
* [Lara Finnegan's solution](https://github.com/lcf0285/rest-client/blob/master/google_search.rb)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/rest_client)
* [Filipe's solution](https://github.com/panceri/rest-client-demo)
* [Eduardo Frias' solution](https://github.com/feek1g/theodinproject/blob/master/RubyOnRails/restClient/rest_client.rb)
* Add your solution above this line!


## Project: Ruby on Rails Tutorial

In this project, you'll dive right into the tutorial by building the site's static pages.  In the second chapter, you'll get a refresher of the Ruby concepts which will be useful to you along the way.  Even if you're good with Ruby (for instance completing the Ruby course), this is a good chapter to look over to see how some of those concepts are applied to Rails.

### Note: Testing

One aspect of the Ruby on Rails tutorial which we haven't covered deeply is testing.  You got a brief look at it in the [Web Development 101 course](http://www.theodinproject.com/web-development-101/testing-basics) and a good taste of it in the [Ruby course](http://www.theodinproject.com/ruby-programming/#section-testing-ruby-with-rspec) but there are some more moving parts when it becomes applied to Rails.

Michael Hartl does a pretty good job of explaining what's going on during the Rails Tutorial and the syntax of RSpec is relatively straightforward.  If you've been following the curriculum up until now, you should find testing in Rails to be a natural transition from plain Ruby tests (and actually a bit more interesting because you get to play with webpages).

If you don't feel comfortable with testing Ruby yet, it can feel like you're learning two languages at once.  Don't be discouraged if you end up scratching your head a bit... it takes some getting used to.  Luckily RSpec only uses about a dozen different methods again and again and again, the trick is just knowing which order to put them in.

The tutorial covers more specifically the practice of "Test Driven Development", where you actually write the tests FIRST and THEN write the code to make them pass.  That's helpful for many reasons, not least of which is that you get to make sure your test actually fails if the code doesn't work.  It also keeps you honest by making you only write just enough code to make your tests pass (so your code base stays lean and clean).  It can take some getting used to but is a software development practice that is becoming more and more common these days.

90% of you will need to learn Rails testing and this is the best way to do it.  That 90% covers everyone who will be seeking a job as a web developer or who is looking to put together any websites more complicated than simple registration pages.  For the other 10%, you should be okay skipping past the testing but I encourage everyone to give it a shot.  Otherwise you've got no way of knowing if your application is working properly or not.

#### A Simple Test Example

This is an example (listing 3.14) from the tutorial:

```language-ruby
    # spec/requests/static_pages_spec.rb
    require 'spec_helper'

    describe "Static pages" do

      describe "Home page" do

        it "should have the content 'Sample App'" do
          visit '/static_pages/home'
          expect(page).to have_content('Sample App')
        end
      end

      describe "Help page" do

        it "should have the content 'Help'" do
          visit '/static_pages/help'
          expect(page).to have_content('Help')
        end
      end

      describe "About page" do

        it "should have the content 'About Us'" do
          visit '/static_pages/about'
          expect(page).to have_content('About Us')
        end
      end
    end
```

If you read through it, even if you've never seen code before, you should have a gist of what's going on.  This is an "integration" or "feature" spec ("spec" == "specification" == "test"), which means it deals with making sure your higher level user flows (as the user moves from one page to the next) behave as expected.  You'll also get to do "unit tests", which are meant to specifically test narrow pieces of functionality like model methods.  Both are important.

I'll do a brief walkthrough of what's going on in this example just to get your mind warmed up for testing.  Refer back to the previous lessons on testing and additional resources below for better explanations!

First of all, this file is just Ruby code (see the `.rb`).  It uses some new methods that are available because you've included the `rspec` gem in your gemfile, but it's still written in good old Ruby.  The `require 'spec_helper'` in the first line is what gives this spec file (`spec/requests/static_pages_spec.rb`) all the methods and setup it needs to be run by RSpec properly when you run your test suite (e.g. by typing `$ rake` or `$ rspec spec/` on the command line).

When you run the spec file, RSpec stores each `#it` block as a separate test and then runs them in a random order (which is important to make sure you haven't accidentally caused one test to influence another).  So all the stuff inside the `#it` block is what's actually passing or failing if you run the test.

The `#describe` blocks just help break up the specs and bucket related ones together.  Note that `#describe` is the same as the `#context` method you may see at some point... people just use whichever one sounds like better English.

This bucketing of tests is important because you'll often need to go through some order of things before doing a specific test, e.g. "go to the home page", "click login", "fill out login form", "click submit".  By nesting the specs inside `describe` or `context` blocks, you avoid having to repeat all those instructions for each individual spec.

You don't see it here, but you'll also work with the `#before` method.  This lets you perform some logic before actually running the test, like setting variables (with the `#let` method) or creating model objects.

It's also important to note that **each test is completely independent of every other test**.  Your test database gets completely reset each time it moves on to running another test, then RSpec starts from the top and runs the next test.  You should be able to see why that is important -- a test wouldn't be very useful if it got polluted by what your other tests were doing.

Now you can see why you nest tests inside the `#describe` methods and use `#before` methods to set preconditions -- RSpec will rerun that pre-code for every single spec that's nested below it.  If you create an object, e.g. a new User, inside the `#it` block of one of your tests, it won't exist by the time the next test is run.

Back to the tests above, the first test (inside the block for the `#it` method) has just two lines.  The first, `visit '/static_pages/home'`, is just a necessary step to get you into position to run the test.  Because this is an extremely simple spec file, that is inside the `#it` block.  If you ended up running multiple specs that relied on visiting that same page first, you'd see that line abstracted out into a `#before` block, which would be run before each test.

The second line (`expect(page).to have_content('Help')`, or with all parentheses `expect(page).to(have_content('Help'))`) is where the action happens.  `expect(page)` is going to take the current page that we're "on" and wait for some sort of definitive answer about whether the page passes or fails.  `.to(have_content('Help'))` takes that page (note that it's chained onto the `#expect` method) and searches (because of the `#have_content` method) for an HTML tag that has the word "Help".  If it can't find it, it will let RSpec know the test should fail.  You don't actually need to know all the specifics of what's going on behind the scenes for a while, just how to apply them.

If you're already scratching your head, don't worry (like I said, better explanations exist than mine).  The tutorial will cover testing along the way.  Hopefully your mind is warmed up right now and you won't be ambushed by suddenly being confronted with it.

### Your Task

1. If you'd still like a refresher on testing basics, check out [An Introduction to RSpec](http://blog.teamtreehouse.com/an-introduction-to-rspec) from Treehouse.
2. Do [Chapter 3](http://ruby.railstutorial.org/chapters/static-pages#top) of the Ruby on Rails Tutorial to get started building the application.
3. Do [Chapter 4](http://ruby.railstutorial.org/chapters/rails-flavored-ruby#top) of the tutorial to see how Ruby will be used in Rails.
4. Glance back at the [Deployment Lesson](http://www.theodinproject.com/ruby-on-rails/deployment) if you've got lingering questions or issues about the process of deployment.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* [Intro to RSpec](http://www.youtube.com/watch?v=aYXAWgSA5Kw) Video from RailsConf2012 on YouTube.
* [Code School's RSpec Introduction Course](https://www.codeschool.com/courses/testing-with-rspec)
* [Rails Conf 2013 BDD and Acceptance Testing with RSpec & Capybara](https://www.youtube.com/watch?v=BG_DDUD4M9E) This video gives you a nice angle on BDD & TDD in Rails that you won't get from the primary sources.








