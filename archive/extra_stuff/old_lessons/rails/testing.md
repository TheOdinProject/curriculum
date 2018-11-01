You got the chance to dive a bit deeper in the [RSpec lesson of the Ruby Programming course](/ruby-programming/introduction-to-rspec).  If you haven't done that, that's where you should start.  

You've also been exposed to testing during the Ruby on Rails tutorial, which you've been doing throughout the projects of this course.  

All of that amounts to a pretty good foundation in testing, but you're almost certainly still unsure of how exactly you'd go about writing tests for a new application.  Hopefully this lesson will help you get over that hump so you can feel more confident working in a Test-Driven process (or just contributing to open-sourced projects like this one, which requires tests be submitted alongside code).  We'll start by covering some more high level concepts about testing and then dial it into what you're doing with Rails.

### Test Coverage

Backing up to the highest level, what does 100% "test coverage" really mean?  Do you test every method?  Every possible user path?  Every possible way that any logical branch (e.g. an `if` statement) can be run?  You will always need to compromise between an acceptable level of coverage and the complexity (and time) costs of implementing a highly granular test suite.

Some ways of thinking about test coverage (borrowing heavily from [Wikipedia](http://en.wikipedia.org/wiki/Code_coverage)):

* **Function Coverage** -- Has each function or subroutine been called?
* **Statement Coverage** -- Has each statement been executed?
* **Branch Coverage** -- Has each branch of each control structure been executed?
* **Decision Coverage** -- Has every possible decision in the program been tested? Similar but not identical to branch coverage.
* **Condition Coverage** -- Has every boolean sub-expression been both `true` and `false`?
* **State Coverage** -- Has each state in a finite-state machine been reached?
* **Parameter Value Coverage** -- In a method taking parameters, have all the common values for those parameters been tried?

In a web environment, there are also a variety of simulation tests that can be run -- you not only test the methods of your application on a specific level but you can "fire hose test" the whole application by throwing thousands of requests at it per second and see what breaks first.

### Testing Levels

There are a lot of different levels of testing specificity as well:

* **Unit Testing** -- isolating a very specific unit of code (by faking any inputs/outputs/methods inside it) and testing its characteristics.  Is the function working as expected?
* **Integration Testing** -- Verify the interfaces between units.  This can occur on many levels, from small modules to high level architectural components.
* **System Testing** -- Verify that the fully integrated system meets its requirements and without corrupting its environment.
* **Acceptance Testing** -- The system is delivered to the user (or Product Owner in Agile) for acceptance or rejection.

In our Rails applications, you'll most often perform unit tests on individual methods (typically located in your Models or Controllers) and then integration ("feature") tests that simulate the user's interaction with your application (which requires all the components to work together).

### What to Test

Though there are extremes on either end of the spectrum, a good rule of thumb for what to test (for beginners) includes:

1. Anything you would otherwise manually test (e.g. by checking the page to verify it loaded properly)
3. All critical paths the users will take (like signing in and using the app's core functions)
2. Anything that might resonably break later (e.g. if it relies on code that may get changed later or produce unexpected outputs)
4. All critical methods that are run during the critical user paths (often model unit tests)
5. Any bugs you discovered along the way (write a test for the bug that fails, then fix the bug, then your test will pass)

TODO: Happy path and sad path

### Test Driven Development

TDD forces you to write test coverage for each method and feature BEFORE you actually write the application code to make the test pass.  This forces you to build your test coverage while you build the application.  It also helps you think in a more disciplined way about the code you're producing -- if it isn't directly relevant to

### Style

TODO: When to use `#context` vs `#describe`
TODO: Your text description should only describe exactly what's being set up or tested in that block so it reads exactly like a sentence when outputted.

### Points to Ponder

* How do you run an RSpec test suite?
* How do you write a basic RSpec test?
* What aspects of your methods should you test?
* What is a stub?
* What is a mock?
* What is a double?
* How are they different?
* When would you use them?
* How might you test making an API call?
* What is the difference between unit tests and integration (aka feature) tests?
* What are the key components of a good Unit test?
* What are the key components of a good Integration test?
* What should you write for the description of your `#describe` and `#it` blocks?
* What is a "seam"?

### Capybara
jQuery!
`#within` -- Do something within that specific area of the page, e.g.

    within(".completion-wrapper") do
      expect(page).to have_link("", :href => login_path)
    end

### Your Assignment

* Watch [this video from Berkeley's SAAS course by Armando Fox](http://www.youtube.com/watch?v=T4OxVwMFfKo&list=PLjbL0BCR04Q3uDPD3GVZJqV3UnJkOic-o&feature=c4-overview-vl) for a look at how they use TDD in the course.  You don't need to worry about using Cucumber and BDD.  Note that the `#should` syntax is deprecated -- we use the `#expect` syntax instead.
* [This video from the same course will go into fixtures, factories, and test coverage (watch to roughly minute 65)](http://www.youtube.com/watch?v=zfvnF1AyIhc)
* [Glance over the Wikipedia article on Code Coverage](http://en.wikipedia.org/wiki/Code_coverage) goes into the coverage criteria.  The point is -- there's a lot of different ways to measure coverage.
* [The Wikipedia article on Software Testing](http://en.wikipedia.org/wiki/Software_testing#Static_vs._dynamic_testing) will give you an idea of some of the theory behind testing.  The "Static vs Dynamic Testing" and "Testing Levels" sections will be most helpful.
* [Read through the full "Everyday Rails" Testing Series](http://everydayrails.com/2012/03/12/testing-series-intro.html)
* [Read ThoughtBot's "How We Test Rails Applications"](http://robots.thoughtbot.com/how-we-test-rails-applications) for one of the most helpful and concise treatments of testing practices out there.

### Additional Resources

* [RSpec Documentation](https://relishapp.com/rspec/rspec-rails/docs)
* ["How I Test" by Ryan Bates via Railscasts](http://railscasts.com/episodes/275-how-i-test)
* ["Request Specs and Capybara" by Ryan Bates via Railscasts](http://railscasts.com/episodes/257-request-specs-and-capybara)
* ["The Intro to Rails Screencast I Wish I had" from Nettuts](http://www.youtube.com/watch?v=cMcEgOPza8A) does basic Rails stuff but covers testing as well.
* [A 6-part Rails TDD Class (2010) from RubyFocus](http://www.rubyfocus.biz/class_video/2010/07/19/rails_tdd_class_1.html)
* We're trying to avoid paid resources, but [Agile Web Development with Rails 4 covers testing](http://pragprog.com/book/rails4/agile-web-development-with-rails)
* ["Guard" by Ryan Bates via Railscasts](http://railscasts.com/episodes/264-guard) covers Guard, a gem that helps automate automated testing.
* ["Factories not Fixtures" by Ryan Bates via Railscasts](http://railscasts.com/episodes/158-factories-not-fixtures)
* ["An Example using RSpec double, mock and stub"](http://blog.firsthand.ca/2011/12/example-using-rspec-double-mock-and.html)
* [Documentation for RSpec Mocks](https://github.com/rspec/rspec-mocks
)
* [Learn the First Best Practices for Rails and RSpec](https://www.sitepoint.com/learn-the-first-best-practices-for-rails-and-rspec/)

### Cheat Sheets

* [**RSpec Cheat Sheet** from anchor.com](http://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf)
* [**RSpec Capybara Cheat Sheet** from them0nk](https://gist.github.com/them0nk/2166525)
* [RSpec and Capybara cheat sheet from Steve Clarke](https://gist.github.com/steveclarke/2353100)
* [Controller specs cheatsheet by eliotsykes](https://gist.github.com/eliotsykes/5b71277b0813fbc0df56)
* [Feature specs cheatsheet by eliotsykes](https://github.com/eliotsykes/rspec-rails-examples/blob/master/spec/features/subscribe_to_newsletter_spec.rb)
* [The Big List of View Specs by Eliot Sykes](https://eliotsykes.com/view-specs)

### Common Issues That Will Frustrate You

* Should you use `let` or declare an instance variable inside a `before` blocks when you want to use a variable across your tests?  Use `let` (or `let!` to avoid lazy loading)!  Instance variables inside `before` blocks can be annoyingly inconsistent so save yourself the trouble.
* Get familiar with Rails' `reload` command, which lets you reload a model instance from the database.  Let's say you've set the `user` variable inside a `let` (e.g. `let(:user) { User.create(:name => "test_user")}`) and are testing whether your model method actually updated the user properly.  Sometimes you'll need to make sure to `reload` the model instance before testing it! e.g. use `expect(user1.reload.name).to eq("exampleuser")` otherwise `user1` won't reflect the changes you made to it in the database.
