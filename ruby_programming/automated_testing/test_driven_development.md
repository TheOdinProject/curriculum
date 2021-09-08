### Introduction

So far you’ve been learning how to test code that you’ve written, but there’s a popular development process that flips that concept on its head. Rather than writing code, manually testing it until you get it working, then writing a test to make sure it stays working; you can write the test **before** the code, so that you don’t have to waste *any* time manually testing. Test Driven Development is the name of this inverted development process.

### Learning Outcomes
Look through these now and use them to guide your learning. By the end of this lesson, expect to:

- Learn what Test Driven Development is
- Learn the advantages of Test Driven Development
- Learn how to write code TDD style

### What is TDD, and why do it?

Test Driven Development (TDD) just means, in its simplest definition, that you write the tests for a method *before* the method itself. This can seem like a *really* strange concept, especially when you first try doing it, but like anything else in programming (and life more broadly) the more you do it the more normal it will feel, and the better you will get at it.

Following Test Driven Development is especially useful when you’re still learning about testing, as it will help you learn how to write code that’s *easy* to test from the outset, rather than having to rewrite methods to make them testable.

Another benefit of writing code TDD style is that it *guarantees* that your code will be tested. When writing code with the intention of testing it after the fact, it’s very easy to put testing on the back burner for so long that it never happens, and testing *before* you write the code in question removes that temptation. As was mentioned in the introduction, TDD’ing a project means that you don’t have to manually test much if any functionality, and that time that you would’ve spent manually testing can add up quickly on a large project. One last benefit to the TDD approach is that it can help you better plan the design, and catch bugs earlier in the process because your tests are *driving* your development.

We should mention here though that not *everyone* agrees that TDD is the way to go. There are plenty of developers that write tests after the code is written. While you are free to decide how you want to write your tests in the applications you build, we strongly encourage you to follow TDD for now.

#### Red Green Refactor

When you first write your test in Test Driven Development it is in what’s known as the `red` state, because when running the test it will fail and the output will be red. Once you’ve written a method that passes the test you are in the `green` state, as now the test passes and its output will be green. Once you’re passing your test you can `refactor` the method, using the test to ensure that your method is still working as intended after your refactor.

<img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/ab4656dabe528812c252eb7393452251a744e57b/ruby_programming/automated_testing/test_driven_development/imgs/00.png" alt="Diagram showing the red-green-refactor cycle">

This development cycle is known as red-green-refactor, and it’s at the heart of the TDD process. When following TDD you will iterate over each unit of work needed for your project with these three steps until you’re done!

One key aspect of the red-green-refactor cycle that *isn’t* in the name, is that the code you write to go from `red` to `green` should be the **minimum** amount required to pass the test. If you find that the functionality you’re adding actually does *more* than is being tested, that is a sign that your method is likely doing too much, or possibly that your tests aren’t testing all of the right functionality.

#### TDD Examples
Let’s walk through a TDD approach to a basic class.

Given the general problem:

Create a `Square` class that takes an integer on initialization for the length of each side, and has an `#area` method and a `#perimeter` method which returns (as you probably guessed) the area and perimeter of the square respectively.

Start by making a directory to house this example, and then `lib` and `spec` directories to house the class and the specs respectively. Next, create the spec and class files. Lastly, open the example directory in your text editor so that you can start this TDD style!

~~~ bash
mkdir tdd-lesson
cd tdd-lesson
mkdir lib
mkdir spec
touch lib/square.rb
touch spec/square_spec.rb
code .
~~~

Now, how might you want to TDD the creation of this class? Well, you know that you need to `describe` a class called `Square`, and that you'll need to describe its `#area` method, so start with setting all that up in a `square_spec.rb` file:

~~~rb
require_relative '../lib/square'

describe Square do
  describe "#area" do

  end
end
~~~

Since `Square` will be initialized with a side length, do that initialization in a couple of different `context` blocks so that you can initialize differently sized squares to test the method:

~~~rb
require_relative '../lib/square'

describe Square do
  describe "#area" do
    context 'when side length is 4' do
      let(:size_4_square) { described_class.new(4) }
    end

    context 'when side length is 6' do
      let(:size_6_square) { described_class.new(6) }
    end
  end
end
~~~

Next add an `it` block to each of the contexts to actually test that the method works as you expect:

~~~rb
require_relative '../lib/square'

describe Square do
  describe "#area" do
    context 'when side length is 4' do
      let(:size_4_square) { described_class.new(4) }

      it 'returns 16' do
        expect(size_4_square.area).to eq(16)
      end
    end

    context 'when side length is 6' do
      let(:size_6_square) { described_class.new(6) }

      it 'returns 36' do
        expect(size_6_square.area).to eq(36)
      end
    end
  end
end
~~~

Alright, that should have you set up to test `#area`, now run the tests by entering `rspec` in the terminal!

<img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/ab4656dabe528812c252eb7393452251a744e57b/ruby_programming/automated_testing/test_driven_development/imgs/01.png" alt="screenshot of the error given when running the test suite at this time, it is a NameError: uninitialized constant Square. The text is red.">

The result should be like the *red* failure/error above, since you haven’t implemented `Square` at all yet. This is the `red` stage of the red-green-refactor cycle mentioned earlier, so the next step is making it `green` by implementing the expected functionality! Do that in our `lib/square.rb` file now:

~~~rb
class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end
end
~~~

And now if you run the test suite again you should get a nice *green* output indicating no failures! Try it by entering `rspec` in the terminal again:

<img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/ab4656dabe528812c252eb7393452251a744e57b/ruby_programming/automated_testing/test_driven_development/imgs/02.png" alt="screenshot showing that the two tests are now passing. The text is green.">

Success! You are now on the green stage of the red-green-refactor cycle! Now you can refactor knowing that you can use the test to make sure to keep the existing functionality that you’ve built, maybe do:

~~~rb
class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length ** 2
  end
end
~~~

Yeah, that’s a little cleaner! And you can run `rspec` again to make sure the tests still pass:

<img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/ab4656dabe528812c252eb7393452251a744e57b/ruby_programming/automated_testing/test_driven_development/imgs/02.png" alt="screenshot showing that the two tests are still passing. The text is green.">

Looks like you’re good! Now do the `#perimeter` method! First write the test:

~~~rb
require_relative '../lib/square'

describe Square do

  # omitted for brevity

  describe "#perimeter" do
    context 'when side length is 4' do
      let(:size_4_square) { described_class.new(4) }

      it 'returns 16' do
        expect(size_4_square.perimeter).to eq(16)
      end
    end

    context 'when side length is 6' do
      let(:size_6_square) { described_class.new(6) }

      it 'returns 24' do
        expect(size_6_square.perimeter).to eq(24)
      end
    end
  end
end
~~~

Run the test to make sure it fails like you expect:

<img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/ab4656dabe528812c252eb7393452251a744e57b/ruby_programming/automated_testing/test_driven_development/imgs/03.png" alt="screenshot showing that now two tests are passing and two are failing in the test suite. The error given is a NoMethodError: undefined method `perimeter` for #<Square:0x000055f96bad77e8 @side_length=6>. The text is red.">

Now write the minimum functionality required to make the tests pass:

~~~rb
class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length ** 2
  end

  def perimeter
    @side_length * 4
  end
end
~~~

Then run the tests to make sure they pass:

<img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/ab4656dabe528812c252eb7393452251a744e57b/ruby_programming/automated_testing/test_driven_development/imgs/04.png" alt="screenshot showing that now all four tests are passing in the test suite. The text is green.">

Since this seems like it doesn’t need any refactoring we’re all done!

### Assignment

TODO: Exercise: Finishing TDD'ing a few more methods in the example class used in the content

TODO: Exercise: TDD a value object

TODO: Exercise: TDD a class that has a collaborator which doesn't exist yet using mocks

### Additional Resources

Read ["TDD is Dead. Long Live Testing"](http://david.heinemeierhansson.com/2014/tdd-is-dead-long-live-testing.html) by DHH for an anti-TDD viewpoint

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- What does it mean for code to be test **driven**?
- List four different advantages of TDD.
- What is the 3 part development cycle used for TDD?
- How much code should be written when going from the `red` state to the `green` state of the red-green-refactor cycle?