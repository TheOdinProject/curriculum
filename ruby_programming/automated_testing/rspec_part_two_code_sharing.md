### Introduction

In this lesson we will be exploring some of the tools RSpec provides for sharing code among multiple tests. Specifically, we will be looking at hook, let and subject helper methods. These methods are frequently used in RSpec test suites so it's important to know how they work and when to use them.

We will once again be working from the `odin_rspec` project we set up in the previous lesson. To get the most out this lesson, please follow along with all the examples.

### Learning Outcomes

- What is a before hook and what phase of a test should you use it for?
- What is an after hook and phase of a test should you use it for?
- What is a let variable for?
- What is a subject for?

### Hooks

We will often have the same arrange, act and teardown code in multiple test cases. RSpec provides a way of sharing this code by using hook methods that allow us to run code before and after our tests.

#### Before Hooks

Before hooks run **before** the tests are executed. We could put any code we wished into them, but they are best used to share the same arrange phase and on some occasions the same act phase code between multiple tests.

To see this in action, create a new file in the lib directory of your `odin_rspec` project named `user.rb` and paste the following code into it:

~~~ruby
# lib/user.rb

class User
  attr_reader :name, :email, :age

  def initialize(name, email, age)
    @name = name
    @email = email
    @age = age
  end

  def retired?
    age >= 65
  end
end
~~~

Next, create a test file for the user class in the spec directory named `user_spec.rb` and write the following tests for the `User` class to exercise the name, email and age attributes:

~~~ruby
# spec/user_spec.rb

require "spec_helper"
require "user"

RSpec.describe User do

  describe "name" do
    it "returns the users name" do
      user = User.new("David", "david@example.com", 30)

      expect(user.name).to eq("David")
    end
  end

  describe "email" do
    it "returns the users email" do
      user = User.new("David", "david@example.com", 30)

      expect(user.email).to eq("david@example.com")
    end
  end

  describe "age" do
    it "returns the users age" do
      user = User.new("David", "david@example.com", 30)

      expect(user.age).to eq(30)
    end
  end

end
~~~

Run the tests to make sure everything is wired together correctly. We can run just the tests for this user class by passing the test file name to the `rspec` command: `$rspec spec/user_spec.rb` .

Examine the test file again, we need to create a new user object with the same attributes in the arrange phase of all of the tests. Which is quite a bit of duplication between the tests.

To reduce this duplication, we could instead use a before hook to execute the arrange phase code and make the tests much more concise.

In our case, we can include a before hook that will create a new `User` instance and assign that instance to a `@user` instance variable that we can use in each of our tests:

~~~ruby
# spec/user_spec.rb

require "spec_helper"
require "user"

RSpec.describe User do

  before do
    @user = User.new("David", "david@example.com", 30)
  end

  describe "name" do
    it "returns the users name" do
      expect(@user.name).to eq("David")
    end
  end

  describe "email" do
    it "returns the users email" do
      expect(@user.email).to eq("david@example.com")
    end
  end

  describe "age" do
    it "returns the users age" do
      expect(@user.age).to eq(30)
    end
  end

end
~~~

By default, before hooks run *before* each test in the same example group. We can see this a bit more clearly by including a puts statement in our before hook:

~~~ruby
# spec/user_spec.rb

before do
  puts "running the before hook"
  @user = User.new("David", "david@example.com", 30)
end
~~~

Now, when we run our tests again we should see "running the before hook" printed to the screen three times, once for each of our tests.

Alternatively, we can pass an `:all` argument to the before method. This will make the before hook run only once before all the tests.

Change the before hook to the following and run the tests. The puts statement will only print once in the terminal, proving the before block was only executed once.

~~~ruby
# spec/user_spec.rb

before(:all) do
  puts "running the before hook"
  @user = User.new("David", "david@example.com", 30)
end
~~~

However, it is a good rule of thumb to avoid using the `:all` argument and stick to the default before hook behaviour of running before each individual test.

When the before hook runs before each test, it ensures each of the tests start with a fresh object to work with and state changes to the object will not leak to other tests. Potentially causing hard to debug test failures.

#### After Hook

After hooks are run after our tests have executed. They are best used for the teardown phase so we can clean up **after** our tests and get the state of the system back to what it was before the test was executed.

Using the counter example we used to demonstrate the teardown phase in the previous less, we can refactor the counter tests to use an after hook for the teardown phase and reset the count between each of the tests.

We will also move the arrange phase code of creating the count into a before hook and assign it to an instance variable to show both hooks working together:

~~~ruby

# spec/counter_spec.rb

require "spec_helper"
require "counter"

RSpec.describe Counter do

  describe "increment!" do

    before do
      @counter = Counter.new
    end

    after do
      @counter.reset!
    end

    it "increments the counter by one" do
      @counter.increment!

      expect(@counter.count).to eq(1)
    end

    it "increments the counter by two" do
      @counter.increment!
      @counter.increment!

      expect(@counter.count).to eq(2)
    end
  end

end
~~~

Run the counter tests with `$ rspec spec/counter_spec.rb` to make sure everything is still working.

### Let and Subject Variables

Using instance variables in before hooks like we have been doing has some big drawbacks that can lead to slower and less stable test suites.

- Before hooks are run for every test in the same example group. Some of those tests may not need that instance variable.
- Instance variables return nil if they are not assigned, it's fairly easy and a common mistake to misspell an instance variable and end up with a no method error for nil class in Ruby. You've probably seen this error a few times already while working through the OOP section.
- Instance variables can leak between tests and even between test files. Which could potentially cause all sorts of havoc in our test suite.

Thankfully RSpec provides a more idiomatic and safer way of creating variables that can be used in multiple tests, The `let` method.

Returning to the user example we used to demonstrate before hooks earlier. Instead of using instance variables we could instead use a `let` variable. Remove the before block and create a let variable just under the top level example group. Also rename the instance variables in the tests from `@user` to just `user` :

~~~ruby
# spec/user_spec.rb

require "spec_helper"
require "user"

RSpec.describe User do
  let(:user) { User.new("David", "david@example.com", 30) }

  describe "name" do
    it "returns the users name" do
      expect(user.name).to eq("David")
    end
  end

  describe "email" do
    it "returns the users email" do
      expect(user.email).to eq("david@example.com")
    end
  end

  describe "age" do
    it "returns the users age" do
      expect(user.age).to eq(30)
    end
  end

end
~~~

Make sure everything is still passing by running the user tests with `$ rspec spec/user_spec.rb`.

The let method takes a symbol argument which is the name of the variable and is what we use to invoke the variable within our test cases. In our code, we named our let variable `user`.

It also takes a block, the result of the block is what will be returned when we invoke the let variable. In our code, this is an instance of the `User` class.

The let method is lazily evaluated, which means it doesn't execute until we invoke it in our tests. There is another version of the let method: `let!`. This version executes immediately before our tests like a before hook does.

But this version of the let variable will be more useful later in the course when we are writing tests for Rails apps and need to create database records before our tests and assign it to a variable we can use later.

#### Subject

As you have seen time and time again throughout this guide, we need to initialize new instances of the class we are testing and assign it to a variable in the arrange phase of almost all of our tests.

Because this is such a common pattern, RSpec provides an even more specialised method just for creating an instance we can use in all of our tests. The `subject` helper method.

Refactoring the previous user example to use a `subject` instead of a `let` variable is incredibly easy. We just replace the `let` method call with `subject`:

~~~ruby
# spec/user_spec.rb

require "spec_helper"
require "user"

RSpec.describe User do
  subject(:user) { User.new("David", "david@example.com", 30) }

  # omitted for brevity...
end
~~~

If we run our tests after making this change, they should all still  pass.

Subject and let variables have very similar syntax. They both accept a name argument in the form of a symbol and they both accept a block. Functionally, they work pretty much the same.

However there are some subtle differences. The name argument is optional, we could have omitted it and used an *unnamed subject* instead. But we would then have to reference the subject using using a `subject` method call.

Using a named subject makes our tests much more readable and is considered the best practice way of using subjects. The contrast between these two approaches is shown below:

~~~ruby
# Using an unnamed subject
describe "age" do
  subject { User.new("David", "david@example.com", 30) }

  it "returns the users age" do
    expect(subject.age).to eq(30)
  end
end

# Using a named subject
describe "age" do
  subject(:user) { User.new("David", "david@example.com", 30) }

  it "returns the users age" do
    expect(user.age).to eq(30)
  end
end
~~~

The main difference between subject and let is what they mean to the human reader.

Subject is meant to be used for the *subject* of the test file or in other words the instance of the object under test. Using the `subject` method makes it easy to identify where the instance is being created for the reader.

Let variables on the other hand, can be used for any generic data that needs to be shared.

#### So when should you use let?

The rule here is as simple as using `let` variables for anything other than creating the object under test since that should be reserved for `subject`.

One common use case is using let variables for the arguments we pass to the instance created in the subject.

Back in our user tests, lets extract all the arguments we are passing into [`User.new`](http://user.new) in the subject out into let variables:

~~~ruby
# spec/user_spec.rb

require "spec_helper"
require "user"

RSpec.describe User do
  subject(:user) { User.new(name, email, age) }

  let(:name) { "David" }
  let(:email) { "david@example.com" }
  let(:age) { 30 }

	# omitted for brevity...

end
~~~

Run the user tests with `$ rspec spec/user_spec.rb` and they should all still be passing.

This may seem like an unnecessary refactor since it was working fine before and this just seems to have added more lines of code. However, using the let variables to name the arguments that we are passing to [`User.new`](http://user.new) adds some clarity to what those arguments represent and improves the readability of the tests.

But a far more interesting reason for making this refactor is that it allows us to create user instances with different arguments so we can then test the various different outcomes those different arguments will produce.

An example is the best way of getting a clear understanding of this, we are going to write a test for the previously untested `retired?` method on the user class. As a reminder this is what that method looks like:

~~~ruby
# lib/user.rb

def retired?
  age >= 65
end
~~~

This method looks simple enough, but there are 3 possible paths we need to cover with test cases:

1. When the users age is less than 65
2. When the users age is equal to 65
3. When the users age is greater than 65

To write these test cases, we are going to introduce a new piece of RSpec syntax. The `context` method:

~~~ruby
# spec/user_spec.rb

require "spec_helper"
require "user"

RSpec.describe User do
  subject(:user) { User.new(name, email, age) }

  let(:name) { "David" }
  let(:email) { "david@example.com" }
  let(:age) { 30 }

  # omitted for brevity...

  describe "retired?" do
    context "when the user is 65" do
      it "returns true" do
      end
    end

    context "when the user is older than 65" do
      it "returns true" do
      end
    end

    context "when the user is younger than 65" do
      it "returns false" do
      end
    end
  end

end
~~~

The `context` method is just an alias for the `describe` method we have already gotten very familiar with. Meaning, both methods function the exact same and can be used interchangeably.  However they differ in what they represent to the human reader.

Whereas `describe` is used to represent example groups for *things* such as classes and methods. Context on the other hand, outlines and represents example groups around different states, For example the age state in our user class. Like when a user is 65, when a user is older than 65 and so on.

In other words, It gives *context* about certain conditions in our test so we can test what happens when those conditions are in place. The simple rule of when to use context is when we want to test the outcomes our methods will produce under different conditions.

Fill in the expectations for each of the test cases:

~~~ruby
# spec/user_spec.rb

require "spec_helper"
require "user"

RSpec.describe User do
  subject(:user) { User.new(name, email, age) }

  let(:name) { "David" }
  let(:email) { "david@example.com" }
  let(:age) { 30 }

  # omitted for brevity...

  describe "retired?" do
    context "when the user is 65" do
      it "returns true" do
        expect(user.retired?).to be(true)
      end
    end

    context "when the user is older than 65" do
      it "returns true" do
        expect(user.retired?).to be(true)
      end
    end

    context "when the user is younger than 65" do
      it "returns false" do
        expect(user.retired?).to be(false)
      end
    end
  end

end
~~~

If we run our tests now with `$ rspec spec/user_spec.rb` we will get two failures:

~~~bash
Failures:

  1) User retired? when the user is 65 returns true
     Failure/Error: expect(user.retired?).to be(true)

       expected true
            got false
     # ./spec/user_spec.rb:32:in `block (4 levels) in <top (required)>'

  2) User retired? when the user is older than 65 returns true
     Failure/Error: expect(user.retired?).to be(true)

       expected true
            got false
     # ./spec/user_spec.rb:38:in `block (4 levels) in <top (required)>'
~~~

This is because we are defaulting the users age to 30 in the age let variable defined in the top example group `let(:age) { 30 }` . Therefore only the test case for the user being younger than 65 is passing at the moment.

However, we can override the age let variable in our contexts to create the correct conditions that will allow our failing tests to pass:

~~~ruby
# spec/user_spec.rb

require "spec_helper"
require "user"

RSpec.describe User do
  subject(:user) { User.new(name, email, age) }

  let(:name) { "David" }
  let(:email) { "david@example.com" }
  let(:age) { 30 }

  # omitted for brevity...

  describe "retired?" do
    context "when the user is 65" do
      let(:age) { 65 }

      it "returns true" do
        expect(user.retired?).to be(true)
      end
    end

    context "when the user is older than 65" do
      let(:age) { 66 }

      it "returns true" do
        expect(user.retired?).to be(true)
      end
    end

    context "when the user is younger than 65" do
      it "returns false" do
        expect(user.retired?).to be(false)
      end
    end
  end

end
~~~

If we run our tests now everything will be passing 🎉

The mechanics of how this works is simpler than it looks. If there are multiple let variables with the same name in our test file, then our test case will use the let variable that is defined closet to it.

In our code we have an age let variable in the top example group and other let variables named age within the context example groups as well.

When the test case for when the user is 65 is executed for example, it will use the let variable that is closest to it. In other words, it will use the let variable that is defined within the same example group: `let(:age) { 65 }`.

### Conclusion

Hooks, lets and subjects are incredibly powerful. They can help greatly with crafting well structured and easy to understand tests by cutting down on duplication and unnecessary noise within a test suite.

However, it is easy to overuse them and end up with test files that the reader will need to repeatedly bounce around between hooks, lets and the actual tests to get a full picture of what the tests are doing. Making it a chore to read and reason about what's going on in the individual test cases.

These code sharing tools are best only when they improve the overall readability and clarity of your tests. Most of the time, it is best for clarity sake to have the arrange and teardown code in the test block that uses it. Much like we did with the original todo list example.

### Assignment
<div class="lesson-content__panel" markdown="1">
1. TODO: Hook exercises in the testing repo
1. TODO: Subject exercises in the testing repo
1. TODO: Let exercises in the testing repo
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

- [https://mixandgo.com/learn/let-vs-instance-variables-in-rspec](https://mixandgo.com/learn/let-vs-instance-variables-in-rspec)
