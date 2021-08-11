### Introduction

In this lesson we will learn all about RSpec, a testing framework for Ruby that provides tools to help you structure and write automated tests.

In the Ruby sphere there are a [few different options](https://www.ruby-toolbox.com/categories/testing_frameworks.html) when it comes to testing frameworks. But RSpec is by far the most popular, having at the time of writing over half a billion downloads since it was created.

RSpec's popularity is largely owed to its rich, expressive syntax which makes writing readable and maintainable tests a breeze.

This lesson is designed to be a guide through all the basic RSpec features you will need to know to get started writing your own automated tests. To get the most out this lesson, please follow along with all the examples.

### Learning Outcomes

- How to install RSpec
- What is an example group and how do you define one?
- What is an `it` block for?
- What is an expectation?
- What is a matcher?
- What are the 3 phases of a test?
- When should a teardown phase be used?

### Project Setup and Installing RSpec

To kick things off, we need to create a new project where we can install RSpec and start using it.

Fire up a terminal, create a new directory and then navigate into it:

~~~bash
$ mkdir odin_rspec
$ cd odin_rspec
~~~

Create a lib directory and `todo_list.rb` file

~~~bash
$ mkdir lib && touch lib/todo_list.rb
~~~

Open up the `todo_list.rb` file in your favourite text editor and paste the following code into it. This will be the code we will be writing tests for throughout the first part of this lesson.

~~~ruby
# lib/todo_list.rb

class TodoList

  attr_reader :tasks

  def initialize(name, tasks = [])
    @name = name
    @tasks = tasks
  end

  def name
    "#{@name} (#{remaining_tasks})"
  end

  def add_task(task)
    @tasks << task
  end

  def complete_task(task)
    tasks.delete(task)
  end

  def completed?
    tasks.empty?
  end

  private

  def remaining_tasks
    if tasks.size == 1
      "1 task"
    else
      "#{tasks.size} tasks"
    end
  end

end
~~~

Now that we have the code we will write tests for in place, it's time to install and setup RSpec. Back in your terminal, make sure you are in the root directory of the `odin_rspec` project and create a `Gemfile`

~~~ruby
$ touch Gemfile
~~~

Gems are Ruby libraries written by other other programmers and allow us to easily add ready made functionality to our projects. In our case we want to add RSpec to our project.

Paste the following into the `Gemfile`:

~~~ruby
source 'https://rubygems.org'

gem 'rspec', '3.10'
~~~

Back in the terminal, we will run bundle install to make the RSpec gem available to our project:

~~~ruby
$ bundle install
~~~

Next run the RSpec install script, which will create a couple of files for us. We will explain what these do a little later.

~~~ruby
$ rspec --init
  create   .rspec
  create   spec/spec_helper.rb
~~~

Open up the `.rspec` file which was just created, it should only include this code at the moment:

~~~ruby
--require spec_helper
~~~

Add the following to the file and then save it:

~~~ruby
--require spec_helper
--format documentation
--order rand
~~~

The Last thing we need to do is create the file where the tests will live for our `TodoList` class.

In RSpec these are commonly called *spec* files because their filename is appended with `_spec.rb`.

~~~ruby
$ touch spec/todo_list_spec.rb
~~~

Finally, to verify everything is setup correctly, run `$ rspec` which should include the following in its output:

~~~ruby
0 examples, 0 failures
~~~

That's it, we're up and running with RSpec. The final folder structure of the project looks like this:

~~~bash
.
├── .rspec
├── Gemfile
├── Gemfile.lock
├── lib
│   └── todo_list.rb
└── spec
    ├── todo_list_spec.rb
    └── spec_helper.rb
~~~

The `Gemfile` is where we list the outside dependencies needed for our project to run correctly. In our project, we only need the RSpec gem so we can write and run RSpec tests.

The `Gemfile.lock` was automatically generated after we ran the bundle install command earlier. It locks your gems down to specific versions so the project always uses the same versions no matter what machine the project is installed on.

This is all you really need to know about Gemfile's for now, but we will include a link in the additional resources if you want to learn more about them.

The lib directory is where our actual executable source code lives. In our case the todo list class.

The spec directory is where we put all of our test files. We don't want to mix our test code with our source code as that would get messy very quickly and make it hard to discern the test code from the source code. Therefore it is best practice to put the test code in separate files within a different directory.

Finally the `rspec --init` command we ran earlier generated a couple of files for us. The first of these was the  `.rspec` file, this is where we would add extra command line configuration for when we run the `rspec` command to execute our tests. Things like the format of the output RSpec produces in the terminal and if the tests should be run in a random order or not for example.

The second file was the `spec_helper.rb` file, this is where we would add configuration that needs to be shared among many test files. We won't be doing anything more with either of these files during this lesson. But for completion sake, it's good to know what they are for.

### Structure of a RSpec test file

Open up the `todo_list_spec.rb` file we created earlier. The first thing we need to do is require a couple of dependencies. The first is the `spec_helper` file RSpec generated for us.

The second file is the `todo_list.rb` file in lib so we can create an instance of the `TodoList` class in the our test file so we can invoke its methods and test what they do.

~~~ruby
# spec/todo_list_spec.rb

require "spec_helper"
require "todo_list"
~~~

#### Example Groups

Now let's create the top level example group. Example groups serve two purposes, they are how we organize our test file by grouping related tests together and they allow us to *describe* the behaviour we are testing within them.

We define an example group using the `describe` method. In the case of the following example group we are creating an example group for all the tests related to the `TodoList` Class.

~~~ruby
# spec/todo_list_spec.rb

require "spec_helper"
require "todo_list"

RSpec.describe TodoList do

end
~~~

Example groups can be nested within each other. This allows us to be more granular with grouping related tests together. We will see how that works by creating a nested example group where we can put all the tests for the `#name` method on the `TodoList` class.

~~~ruby
# spec/todo_list_spec.rb

require "spec_helper"
require "todo_list"

RSpec.describe TodoList do

  describe "name" do

  end
end
~~~

The describe method takes an argument that can either be a class name or a string. Typically you will pass the name of the class you are testing to the outer most example group and use strings for the nested example groups.

We will get into why you'd want to use a class name for some example groups and strings for others later on. For now, the most important thing to note is that the argument is used to provide a label that describes the behaviour we will test within the example group.

In our case the the top level example group describes all the tests within it will be for the `TodoList` class.

The nested example group describes all tests within it will be for the `name` method on the `TodoList` class.

Structuring your test files and providing descriptive labels like this makes it easy for you to read the test file and determine what is being tested within it.

The describe method also takes a block ( `do..end`). As we have already seen, nested example groups can go within the block. But we can also put individual examples within the block. Or in other words, our actual tests.

#### It blocks

`it` blocks are used to define the individual examples within our example groups. Much like the describe method,  `it` is also a method that accepts an argument that allows us to express what we expect to happen in that individual test, for example `it "returns the users name"`.

However unlike the `describe` method, the argument **must** always be a string and we cannot nest anything within an `it` block. This is because `it` blocks are reserved for our actual test code.

Let's create a few `it` blocks which we can use to test the `name` method of the todo list:

~~~ruby
# spec/todo_list_spec.rb

require "spec_helper"
require "todo_list"

RSpec.describe TodoList do

  describe "name" do
    it "returns the name with 0 tasks remaining" do
    end

    it "returns the name with 1 task remaining" do
    end

    it "returns the name with 2 tasks remaining" do
    end
  end
end
~~~

To see all the structuring we have been doing in action we need to execute our tests. To execute the tests, open the terminal and run the `$ rspec` command from the root directory of the `odin_rspec` project directory.

The output, as shown in the code snippet below uses the arguments we passed to our example groups and `it` blocks to output the structure of our tests to the terminal.

~~~bash
TodoList
  name
    returns the name with 1 task remaining
    returns the name with 0 tasks remaining
    returns the name with 2 tasks remaining

Finished in 0.00247 seconds (files took 0.1574 seconds to load)
3 examples, 0 failures
~~~

#### Test Order

You may have noticed the tests are not displaying in order we wrote them in. When we set up the project earlier, we configired the tests to execute in a random order by adding the `--order rand` line to the `.rspec` file.

We did this because each of our tests should be deterministic, meaning that they should be independent of each other and execute the same way every-time no matter what order they are in.

If the tests did execute in the same order every-time. It would be possible to write tests that depend on that order to succeed. This would eventually lead to a very brittle and hard to maintain test suite.

#### Pending Tests

The output also shows us our three individual `it` blocks in green. In testing terms green means the test is passing. But that's not quite right, we aren't testing anything in our examples yet.

By default RSpec will treat empty `it` blocks as passing tests. Let's instead set them to pending to signify that they still need to completed.

There are a [few different ways to set it blocks to pending in RSpec](https://relishapp.com/rspec/rspec-core/v/3-10/docs/pending-and-skipped-examples/skip-examples). But for our purposes we are going to add an x to the start of each it block to set them to pending:

~~~ruby
# spec/todo_list_spec.rb

require "spec_helper"
require "todo_list"

RSpec.describe TodoList do

  describe "name" do
    xit "returns the name with 0 tasks remaining" do
    end

    xit "returns the name with 1 task remaining" do
    end

    xit "returns the name with 2 tasks remaining" do
    end
  end
end
~~~

Run the test suite once again using the `$ rspec` command. You should now get output that looks something like the following terminal output, with the `it` blocks output now colored in yellow. Yellow signals a test is pending and needs to be completed.

~~~bash
Pending: (Failures listed here are expected and do not affect your suite's status)

  1) TodoList name returns the name with 0 tasks remaining
     # Temporarily skipped with xit
     # ./spec/todo_list_spec.rb:6

  2) TodoList name returns the name with 2 tasks remaining
     # Temporarily skipped with xit
     # ./spec/todo_list_spec.rb:12

  3) TodoList name returns the name with 1 task remaining
     # Temporarily skipped with xit
     # ./spec/todo_list_spec.rb:9

Finished in 0.00179 seconds (files took 0.06131 seconds to load)
3 examples, 0 failures, 3 pending
~~~

### Making Expectations

Now that we have the basic structure in place, its time to write some actual test code. To test something in RSpec we make *expectations* about what the code does.

To demonstrate this, let's write the test for the first `it` block. Remove the x from the `it` method to stop it from being a pending test and put the following within the block:

~~~ruby
# spec/todo_list_spec.rb

it "returns the name with 0 tasks remaining" do
  todo_list = TodoList.new("My List")

  expect(todo_list.name).to eq("My List (0 tasks)")
end
~~~

You can probably guess what this does just from reading the code, it expects the the name of the todo list we created to equal `"My List (0 tasks)"`.

Run the test suite with the `$ rspec` command in your terminal. You should see that the output for the test we just filled in is now green. That means we've just wrote our first proper passing test 🎉

~~~bash
TodoList
  name
    returns the name with 2 tasks remaining (PENDING: Temporarily skipped with xit)
    returns the name with 1 task remaining (PENDING: Temporarily skipped with xit)
    returns the name with 0 tasks remaining

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) TodoList name returns the name with 2 tasks remaining
     # Temporarily skipped with xit
     # ./spec/todo_list_spec.rb:13

  2) TodoList name returns the name with 1 task remaining
     # Temporarily skipped with xit
     # ./spec/todo_list_spec.rb:10

Finished in 0.00179 seconds (files took 0.06131 seconds to load)
3 examples, 0 failures, 2 pending

Randomized with seed 3657
~~~

#### Parts of an Expectation

An RSpec expectation is made up of two distinct parts. The first part is the actual value we want to make the expectation on: `expect(todo_list.name).to`

The second part is a matcher, which is used to verify that the actual value **matches** our expected value: `eq("My List (0 tasks)")`

These two parts together make up a full expectation in RSpec:

~~~ruby
expect(actual_value).to eq(expected_value)
~~~

#### Negative Expectations

Suppose you want to expect something is not to equal to something else. RSpec has you covered. You can use the `expect(actual_value).not_to` expectation, which does the opposite of `expect(actual_value).to` and will fail if the expectation **does** match.

To see this in action, let's add a negative expectation to the first test case we created for the name method. In this expectation we will expect the todo list name **not to** equal `"Barrys List (0 tasks)"`

~~~ruby
# spec/todo_list_spec.rb

it "returns the name with 0 tasks remaining" do
  todo_list = TodoList.new("My List")

  expect(todo_list.name).to eq("My List (0 tasks)")
  expect(todo_list.name).not_to eq("Barrys List (0 tasks)")
end
~~~

Run your tests once again with `$ rspec` .  The first test case should still be passing.

#### Failing Tests

So far we've seen pending and passing tests, but what does a failing test look like? to find out. Remove the `x` from the second test cases  `it` method we wrote earlier and put the following within its block:

~~~ruby
# spec/todo_list_spec.rb

it "returns the name with 1 task remaining" do
  todo_list = TodoList.new("My List")

  expect(todo_list.name).to eq("My List (1 task)")
end
~~~

We are expecting the todo list name to display that it has one task. Run the tests to find out if our expectation is correct: `$ rspec`

~~~bash
1) TodoList name returns the name with 1 task remaining
     Failure/Error: expect(todo_list.name).to eq("My List (1 task)")

       expected: "My List (1 task)"
            got: "My List (0 tasks)"

       (compared using ==)
     # ./spec/todo_list_spec.rb:15:in `block (3 levels) in <top (required)>'
~~~

As you have probably been anticipating, this test did indeed fail. The output is coloured red which signifies a failing test.

The output also displays some useful information indicating what went wrong. There are two important parts of the output in-particular that will help you debug why it failed.

The first part, is the output showing what the test expected and what it got instead. This is usually enough to let you know what went wrong and where to start with fixing the test.

~~~ruby
expected: "My List (1 task)"
got: "My List (0 tasks)"
~~~

Another useful part of the output is the line number it failed on. In larger, more complicated test files where the expected and got output doesn't provide enough of a clue as to what went wrong. This will provide a useful place to start when tracking down why the test failed

~~~ruby
# ./spec/todo_list_spec.rb:16:in `block (3 levels) in <top (required)>'
~~~

Let's quickly fix this test to get it working. We just need to pass in a tasks array which contains one task:

~~~ruby
# spec/todo_list_spec.rb

it "returns the name with 1 task remaining" do
  todo_list = TodoList.new("My List", ["task 1"])

  expect(todo_list.name).to eq("My List (1 task)")
end
~~~

Run the tests again with `$ rspec`. We should now have 2 passing tests and one pending test remaining.

### Matchers

So far we have been using `eq` matcher in our expectations. But RSpec has a wide selection of different matchers we can use to make the tests more expressive in all sorts of different scenarios.

We'll cover a few matchers that you are likely to find the most useful here. But we encourage you to have a browse through the [RSpec matchers documentation](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers) to see what other matchers are at your disposal.

#### The Eq Matcher

The `eq` matcher is the most versatile and commonly used matcher. It will likely be the matcher you use the most. It simply compares the actual value against the expected value and will return true if it **matches**. Otherwise it will return false.

Lets see this matcher in action once again by finishing off the tests for the todo list name method:

~~~ruby
# spec/todo_list_spec.rb

it "returns the name with 2 tasks remaining" do
  todo_list = TodoList.new("My List", ["task 1", "task 2"])

  expect(todo_list.name).to eq("My List (2 tasks)")
end
~~~

Run all the tests in the terminal once again with `$ rspec` to see all of our todo list name method tests now passing.

#### The Be Matcher

We'll often need to test predicate methods in our classes that return either true or false. We could use the `eq` matcher to test these methods.

But RSpec has a more expressive `be` matcher which is better suited to the job and will make the tests much nicer to read as you can expect the result to *be true* or *be false* rather than equal to true or equal to false which doesn't quite read as well.

To demonstrate the `be` matcher, we are going write a test for another one of the `TodoList` methods. Specifically the `completed?` method.

First we need an example group where we can group the tests for the `completed?` method together.

~~~ruby
# spec/todo_list_spec.rb

require "spec_helper"
require "todo_list"

RSpec.describe TodoList do

  # omitted for brevity

  describe "completed?" do

  end
end
~~~

Next we will write the individual test cases for the `completed?` method. There are only two cases that we care about.

What does the method return when the list is completed and what does it return when the list is not completed:

~~~ruby
# spec/todo_list_spec.rb

describe "completed?" do
  it "returns true when all tasks are completed" do
  end

  it "returns false when all tasks are not completed" do
  end
end
~~~

Now lets see how to use that `be` matcher we have been hyping up by writing the expectation for the first test case:

~~~ruby
# spec/todo_list_spec.rb

it "returns true when all tasks are completed" do
  todo_list = TodoList.new("My List", [])

  expect(todo_list.completed?).to be(true)
end
~~~

And to finish off the tests for the `completed?` method, we will write the test for when the todo list is not completed:

~~~ruby
# spec/todo_list_spec.rb

it "returns false when all tasks are not completed" do
  todo_list = TodoList.new("My List", ["Incomplete task"])

  expect(todo_list.completed?).to be(false)
end
~~~

Finally run all the tests once again with `$ rspec` and everything should still be passing.

#### The Include Matcher

The include matcher functions much like the  `include?` method you've already been using with Ruby collections. It passes the expectation if the actual value *includes* the expected value.

To see how the include matcher works, we will write some tests for yet another one of the todo lists methods. This time the `add_task` method.

Write the following test and make sure it works by running the tests with the   `$ rspec` command in the terminal.

~~~ruby
# spec/todo_list_spec.rb

require "spec_helper"
require "todo_list"

RSpec.describe TodoList do

  # omitted for brevity

  describe "add_task" do
    it "adds a task to the list" do
      todo_list = TodoList.new("My List", ["Existing task"])

      todo_list.add_task("New task")

      expect(todo_list.tasks).to include("New task")
    end
  end
end
~~~

In this test, we are adding a new task to a todo list which already contains an existing task. However we don't care about the existing task. We only care that the list *includes* the new task we've added.

The `include` matcher is perfect for situations like this, where we only care about a certain part of the actual value.

You've likely noticed that the tests for the `add_task` method look quite a bit different from the tests we've been writing previously. That's a pretty good cue to have a deeper look at the different parts of an individual test.

### Anatomy of a Test

Each test is generally made up of three distinct phases, these are:

1. **Arrange**
2. **Act**
3. **Assert**

Lets write a test for the `complete_task` method to examine each of these phases in more detail:

~~~ruby
# spec/todo_list_spec.rb

require "spec_helper"
require "todo_list"

RSpec.describe TodoList do

  # omitted for brevity

  describe "complete_task" do
    it "marks a task as completed" do
      # arrange
      todo_list = TodoList.new("My List", ["Incomplete Task"])

      # act
      todo_list.complete_task("Incomplete Task")

      # assert
      expect(todo_list.tasks).not_to include("Incomplete Task")
    end
  end
end
~~~

1. **Arrange** - First we need to arrange the right conditions in our example so we can test the correct behaviour. For the arrange phase In our `complete_task` test, we initialised a new todo list with an uncompleted task so we can test the complete behaviour on this task. This phase is also commonly known as the setup phase.

2. **Act** - In the second phase we *act*, or in other words we invoke the behaviour that we are testing. In the act phase of our test we invoke the `complete_task` method, passing in the name of the task we created in the arrange phase to complete it.

3. **Assert** - In the final phase we assert that the behaviour did what we expected it to do. In the assert phase of our test we made an expectation that the todo list no longer included the task which we just completed.

#### Style

Some of our earlier tests combined the act and assert phases. For instance, in our `completed?` method tests. We both acted and asserted in the expectation:

~~~ruby
# spec/todo_list_spec.rb

it "returns true when all tasks are completed" do
  # arrange
  todo_list = TodoList.new("My List", [])

  # act and assert
  expect(todo_list.completed?).to be(true)
end
~~~

This test could be rewritten to make the different phases clearer:

~~~ruby
# spec/todo_list_spec.rb

it "returns true when all tasks are completed" do
  # arrange
  todo_list = TodoList.new("My List", [])

  # act
  result = todo_list.completed?

  # assert
  expect(result).to be(true)
end
~~~

Which version of these you use is up to you. Many find the terser syntax of the first version more readable. It's also a common practice to separate each phase using a newline so it is easy to distinguish the different phases from each other at a glance.

#### Teardown Phase

There is an extra phase which is sometimes needed when we need to undo something that was done in the arrange or act phases to change the global state in our system. This phase is called the teardown phase.

To see how this phase works, create a new file in the lib directory named `counter.rb` and paste the following code into it:

~~~ruby
# lib/counter.rb

$global_counter = 0

class Counter

  def count
    $global_counter
  end

  def increment!
    $global_counter += 1
  end

  def reset!
    $global_counter = 0
  end

end
~~~

Next, create a new test file for the `Counter` class in the spec directory named `counter_spec.rb` and enter the following test code into it:

~~~ruby
# spec/counter_spec.rb

require "spec_helper"
require "counter"

RSpec.describe Counter do

  describe "increment!" do
    it "increments the counter by one" do
      counter = Counter.new

      counter.increment!

      expect(counter.count).to eq(1)
    end

    it "increments the counter by two" do
      counter = Counter.new

      counter.increment!
      counter.increment!

      expect(counter.count).to eq(2)
    end
  end

end
~~~

In the test file, we have two tests for the `increment!` method. One for asserting it increments the count by one, and another to assert it increments the count by 2.

If we run these tests now we will see one of two failures depending on the order the tests are executed in. Recall that by default RSpec executes tests in a random order.

If the increment by one test was run first, the increment by two test will fail for the following reason:

~~~ruby
1) Counter increment! increments the counter by two
     Failure/Error: expect(counter.count).to eq(2)

       expected: 2
            got: 3
~~~

 If the increment by two test was run first, then the increment by one test will fail for this reason:

~~~ruby
1) Counter increment! increments the counter by one
     Failure/Error: expect(counter.count).to eq(1)

       expected: 1
            got: 3
~~~

If we run the tests a few times we will see both of these test failures eventually as the random order changes.

The problem is that both our tests expect the count to start from zero. But both of our tests are also changing the state of our system by incrementing the `$global_count`.

These state changes in the system are hanging around and *leaking* between our two tests. Meaning that the global count is only zero for the first test to be executed.

This is where the teardown phase comes into play, we need to clean up after each test by resetting the global count back zero after the test has been executed. This will ensure the state changes made in one test will not affect the other test.

Luckily our counter class has a handy `reset!` method which we can use to do this. Add the following teardown phases to the counter tests:

~~~ruby
# spec/counter_spec.rb

require "spec_helper"
require "counter"

RSpec.describe Counter do

  describe "increment!" do
    it "increments the counter by one" do
      # arrange
      counter = Counter.new

      # act
      counter.increment!

      # assert
      expect(counter.count).to eq(1)

      # teardown
      counter.reset!
    end

    it "increments the counter by two" do
      # arrange
      counter = Counter.new

      # act
      counter.increment!
      counter.increment!

      # assert
      expect(counter.count).to eq(2)

      # teardown
      counter.reset!
    end
  end

end
~~~

Now when we run the tests suite, both of these tests will pass every-time. No matter which order they are executed in.

This counter class was a contrived example to demonstrate the teardown phase. You won't have to use the teardown phase all that often because you would not normally do something like this with a global variable in a real system.

But later on in the curriculum you will be working with things that persist data such as databases and the file system. The teardown phase will come in useful when you need to clean up the persisted data between your tests.

### Conclusion

We've covered a lot of ground here, you now know all of the basic building blocks of how to write tests using RSpec. In the coming lessons we will explore what we should test.

But before that, in the next lesson we will explore a few more RSpec features that allow us to share common code between our tests.

We will once again be using the `odin_rspec` project we set up in this lesson to demonstrate those features so make sure to keep that project around.

### Assignment
<div class="lesson-content__panel" markdown="1">
1. TODO: Matcher exercises in the testing repo
</div>

### Additional Resources

- [https://www.rubyguides.com/2018/09/ruby-gems-gemfiles-bundler/](https://www.rubyguides.com/2018/09/ruby-gems-gemfiles-bundler/)
