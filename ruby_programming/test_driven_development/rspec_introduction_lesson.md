### Introduction
In the previous lesson, we established the utility of [test-driven development](https://en.wikipedia.org/wiki/Test-driven_development) (TDD) in maintaining your code and sanity. In this lesson, we'll introduce you to your new best friend, the [RSpec](http://rspec.info/) testing framework. RSpec is one of the most popular testing frameworks, having been downloaded over [100 million times](https://rubygems.org/gems/rspec) and having been ported for use in [Rails development](https://rubygems.org/gems/rspec-rails).

### Learning Outcomes
*Look through these now and use them to guide your learning. By the end of this lesson, expect to:*

* Know what RSpec is
* Know how to install RSpec
* Understand basic RSpec syntax:
  * `describe` 
  * `it`

### Introduction to RSpec

#### What is RSpec, and why RSpec?

At the most basic level, RSpec is a Ruby-written Domain Specific Language, or, for the rest of us, a language specialized for a particular task. In this case, the task is testing Ruby code. The `rspec` gem comes packaged with all you need to get started, including five gems: `rspec-core`, `rspec-expectations`, `rspec-mocks`, `rspec-rails`, and `rspec-support`.

At this point, you may be wondering, *Why RSpec? Surely, there are other frameworks out there*, and you'd be right. There are. In fact, at one point, Ruby came bundled with [Test::Unit]((https://github.com/test-unit/test-unit)) and later [Minitest](https://github.com/seattlerb/minitest) as part of its standard library, the latter of which lives on in Rails. If you tend to be pessimistic (I'm sorry, I meant *realistic*), then the [Wrong](https://github.com/sconover/wrong) testing framework might be your cup of tea. Or perhaps you're hungry and in the mood for something more substantial, in which case a side of [Bacon](https://github.com/chneukirchen/bacon) might be what you need. At the end of the day, it doesn't matter which framework you choose as long as you cultivate your testing skills.

The reason we choose RSpec is for its ***transparency***. Just like Ruby itself, RSpec was written to be pleasant to read and write. It's easy to write Rspec tests that are clear and understandable. This might seem like a simple reason to choose a framework, but the simplicity of this choice is a proxy for deeper and more fundamental goals to programming. First, transparency means that testing is easier to adopt as a beginner. The sooner you adopt testing, the sooner you can be sure that your application works as intended. Second, transparency means that the intentions and targets of your tests are clear to you and to your collaborators. Not only is this helpful in developing and testing for edge cases, but it can also make it much easier to ***maintain*** a test suite as your application grows. An evolving and well-maintained test suite provides your application with a safety net as it too evolves and grows. A well-maintained test suite ensures that your code can meet regressions with aplomb and can remain adaptable to inevitable change. 

TLDR: RSpec is easy to learn, easy to write, and easy to maintain.

But enough proselytizing. Strap your helmet and buckle up; we're going to jump right in.

#### Installing RSpec

Boot up your terminal and punch in `gem install rspec` to install RSpec. Once that's done, you can verify your version of RSpec with `rspec --version`, which will output the current version of each of the packaged gems. Take a minute also to hit `rspec --help` and look through the various options available.

Finally, `cd` into a project directory that you wish to configure for use with RSpec and type `rspec --init` to initialize RSpec within the project. This will generate two files, `.rspec` and `spec/spec_helper.rb`, such that your project might look like:

```
project
  |__lib
  |   |__script.rb
  |
  |__spec
  |   |__spec_helper.rb
  |
  |__.spec
```
That's it. Within two steps, you're up and running with RSpec. That was so hard, wasn't it?

#### Basic syntax
How 'bout a test to see the syntax? Create a new directory called "ruby_testing", change into it, and initiate RSpec.
```
$ mkdir ruby_testing
$ cd ruby_testing
$ rspec --init
```

As expected, the output will read:

```bash
  create   .rspec
  create   spec/spec_helper.rb
```

Run the tests with `rspec`, which will return "No examples found." That really shouldn't surprise you, because we haven't written any tests yet. If you're still shocked...maybe take a short break, or come say hello to us in our [Ruby Gitter](https://gitter.im/TheOdinProject/Ruby) room.

```
No examples found.


Finished in 0.00037 seconds (files took 0.21108 seconds to load)
0 examples, 0 failures
```

Let's add our first test. Let's say we want to create a calculator with a few methods that we want to test. True to TDD, we will write the tests prior to the code. The `spec/` folder is where all your tests will live. Using `touch` on the command line or through your text editor, create `calculator_spec.rb` within the `spec/` folder and add the following lines:

```ruby
#spec/calculator_spec.rb

RSpec.describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
  end
end
```

Let's go line by line.

First, `describe` is an RSpec keyword that defines an "Example Group", or a collection of tests. It takes a class or a string as an argument and is passed a block. `describe` blocks can be nested, such as on the second line of our test above. When describing a class, the following syntax is also valid:

```ruby
#spec/calculator_spec.rb

describe Calculator do
  #...
end

```

The `it` keyword defines an individual example (aka, test). `it` takes a string argument and is also passed a block. This block is where our expectations of a method are expressed. In this particular case, when we pass 5 and 2 to the `#add` method, we expect it to return 7. This is concisely expressed in our expectation clause, which uses one of RSpec's equality [matchers](https://relishapp.com/rspec/rspec-expectations/v/3-7/docs/built-in-matchers/equality-matchers), `eql`:

```
expect(calculator.add(5, 2)).to eql(7)
```

Simple, isn't it? One more time, from the top:
1. `describe` the class
2. `describe` the method example group. Conventionally, the string argument for instance methods are written as "#method", while string arguments for class methods are written as ".method".
3. Write your test case/example with `it`. 
4. Write your expectation using `expect`.  The `expect` method is also chained with `.to` for positive expectations, or `.to_not`/`.not_to` for negative expectations. We prefer `.not_to`. Also, limit one expect clause per test case.

#### Passing code

Let's move on. Run `rspec` from the directory root, and watch the output.

```
An error occurred while loading ./spec/calculator_spec.rb.
Failure/Error:
  describe Calculator do
    describe "#add" do
      it "returns the sum of two numbers" do
        calculator = Calculator.new
        expect(calculator.add(5, 2)).to eql(7)
      end
    end
  end

NameError:
  uninitialized constant Calculator
# ./spec/calculator_spec.rb:1:in `<top (required)>'
No examples found.


Finished in 0.0004 seconds (files took 0.16461 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples
```

So our first test returned an error. This is unsurprising. `NameError` is essentially telling us that RSpec looked for a `Calculator` class, but couldn't find one. So let's create it. From your project root, create a `lib/` folder, and inside, `calculator.rb` with your class. We'll also go ahead and begin the `#add` method, otherwise RSpec will give us a similar error as the previous one when it looks for it:

```ruby
#lib/calculator.rb

class Calculator
  def add(a,b)
  end
end
```

Finally, we must also tell the spec where the `Calculator` class is being defined. This is easily done with `require`:

```ruby
#spec/calculator_spec.rb
require './lib/calculator'

describe Calculator do
  #...
end
```

If you were to run ` rspec` this time, you'd get your first failure! 

```
F

Failures:

  1) Calculator#add returns the sum of two numbers
     Failure/Error: expect(calculator.add(5, 2)).to eql(7)
     
       expected: 7
            got: nil
     
       (compared using eql?)
     # ./spec/calculator_spec.rb:7:in `block (3 levels) in <top (required)>'

Finished in 0.28565 seconds (files took 0.6273 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/calculator_spec.rb:5 # Calculator#add adds two numbers together
```

Our first failure is denoted by the `F` at the top of the output. Congratulations! You've made it to the "red" portion of the "red-green-factor" cycle of TDD. RSpec also provides a list of all the failures, with the expected vs. actual output of the method being tested. At the bottom of your output, RSpec also points to the line of the failing test, which in this case is where our `it` block started.

Getting this method to "green" shouldn't be too difficult. RSpec clearly provides a reason for the failure: it expected the output to be `7` when we provided the method with `(5, 2)` as the parameters. Instead, it returned `nil`. Why might that be? Well, our `#add` *does* take two parameters...but it does nothing with them! Add the minimum amount of code necessary to get your test to pass:

```ruby
#lib/calculator.rb

class Calculator
  def add(a,b)
    a + b         #=> add this
  end
end
```

Then, run the test again to get a single dot, letting you know that your test has passed:

```
.

Finished in 0.0032 seconds (files took 0.14864 seconds to load)
1 example, 0 failures
```

At this point, refactoring isn't necessary. The `#add` method is essentially a one line method. As you progress in your Ruby learning, however, you might find your methods getting more complex, and you might find that you have to make extra efforts to abide by [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) principles. When that time comes, using RSpec and the "red-green-refactor" cycle will allow you to code with confidence, knowing that your classes and their behaviors continue to meet your specified expectations.

### Assignments
It's time to put your newfound knowledge to good use. Let's break our `Calculator` test.

1. Let's implement a new test case for your `#add` method, written out for you below. Run the test to see the failure. Write the minimum code necessary to get both tests to pass, then refactor if necessary. 

```ruby
#spec/calculator_spec.rb

describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      #removed for brevity
    end

    #add this
    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end
end
```

2. Write a test for a new `Calculator` method (`#multiply`, `#subtract`, or `#divide`) using a new `describe` block. Include at least one `it` block with an appropriate expectation clause. Get it to pass, and refactor if necessary.
3. In the terminal, try running your failing or passing tests with `rspec --format documentation`. What's different?
4. RSpec reads command line configurations from `.rspec`, one of the two files generated when RSpec is initialized in a project. If you liked the output you got with `--format documentation`, you can use the `.rspec` file to hold that flag. In doing so, you won't have to type it in every time you run your test suite. Open the file in your text editor and, on a new line, add `--format documentation`. For more information on configuring RSpec, see the docs [here](https://relishapp.com/rspec/rspec-core/v/3-7/docs/configuration).

### Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* Briefly look over RSpec's other [matchers](https://relishapp.com/rspec/rspec-expectations/v/3-7/docs/built-in-matchers/equality-matchers), if you haven't done so already. 
* Briefly look over the RSpec styling and syntax recommended by [BetterSpecs](http://www.betterspecs.org/) and read through the first six guidelines.
* The [RSpec Cheat Sheet](http://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf) should help you avoid Googling every new bit of syntax.