### Introduction

You'll already be familiar with ruby blocks from working with enumerables in the Ruby section. But there is more depth to blocks than we've covered so this lesson will dive deeper. They're such a fundamental part of Ruby that you should get to know them inside out.

Although you may be familiar with blocks already we will still briefly cover the basics to make sure we cover everything.

### Learning Outcomes

- How is a block like a method?
- How is a block different from a method?
- What are the two ways to declare a block?
- How do you return data from a block?
- What happens if you include a `return` statement in a block?
- Why would you use a block instead of just creating a method?
- What does `yield` do?
- How do you pass arguments to a block from within a method?
- How do you check whether a block was actually passed in?
- What is a proc?
- What's the difference between a proc and a block?
- When would you use a proc instead of a block?
- What is a closure?
- What is a lambda?
- What's different between a lambda and a proc?
- What is a Method (capital "M")?
- What do Methods basically allow you to do that could probably be pretty interesting when you're writing some more advanced programs later on?

### Basics

A brief recap of the basics...

You can think of Ruby blocks as anonymous methods. If you have any experience with any other programming langauges then you may also know them as closures. They allow you as the caller to define some of the behaviour within a method which allow methods to be flexible in how they handle different user requirements and they allow you to pass those blocks around to other methods as arguments. Also interestingly, a block is one of the very few times that something in Ruby isn't itself an object.

A block can be declared as a single-line or multi-line block and Ruby convention is to use `{}` for single-line and `do..end` for multi-line blocks. Arguments can be defined within a block inside pipes `|arg1, arg2|`. You'll already know both forms from working with enumerable methods.

~~~ruby
[1,2,3].each { |num| puts num }

[1,2,3].each do |num|
  puts num
end
~~~


Although you are familiar with how to write blocks, you need to know how to write your own methods that accept blocks.

### Yield

`yield` is a keyword that can be called inside a method to relinquish execution to the accompanying block. Lets imagine you're writing a simple method for your library to allow users of that library to log some information to the terminal. The one key requirement you have is that users should be able to define how that block is presented. Sometimes they may just want to `puts` something, other times they may want to inspect something with `p`. If you tried to write this only using a method it would actually be quite difficult. You'd have to write up front all the possible options the user of your library might want to call and then create the docs to explain it. With blocks we can just relinquish control of the method to the block with yield and allow the user to define how they want to print it.

~~~ruby
def logger
  yield
end

logger { puts 'hello from the block' }

logger do
  p [1,2,3]
end
~~~

The example isn't that useful but hopefully you should see how blocks allow huge flexibility in how code is handled at runtime. Let's see if we can make it more interesting, but still not that useful. You now get given a new requirement that users want a method that allows them to write whatever they want, and it gets printed twice to the terminal. How might you handle this requirement? Well if I told you that you can call yield as many times as you want and each time it yields to the block in the same way you'd probably have a good idea.

~~~ruby
def double_vision
  yield
  yield
end

double_vision { puts "How many fingers am I holding up?" }
~~~

Millenial avocados Batman. That's cool.

We mentioned earlier that blocks can accept arguments. But how do you pass them to the block? No problem! Just pass them as arguments to yield and they'll be passed to the block. If you call yield more than once you can pass a different argument each time.

Where might this be useful? Well think about each time you use `each`. You need to yield each member of the collection to the block. Say you're writing a banking api, it will allow other banks to use your library to handle all the banking matters. One such api is a method that prints all of the transactions to a statement. For our example we'll use the terminal, but it could be a spreadsheet or anything. One issue is that different banks may want to print the transaction with different formats. We can iterate through the transactions and for each one we can yield it to a block that the caller of your method attaches to the method call. They can define how the transactions will be printed to their statement and you can focus on delivering bug free banking transactions

~~~ruby
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  @transactions.each do |transaction|
    yield transaction
  end
end

transaction_statement do |transaction|
  puts "%0.2f" % transaction
end
~~~

If another bank wanted to print their transactions another way it's no problem, they can supply their own block.

What if instead you didn't want the caller to define where the transaction for output, but just the format? Like any method call in Ruby there is a return value. So when you call yield, it returns the last executed value from the block. Using the example above if you instead moved the `puts` from the block to inside the each loop your method would be in control in where the transaction were printed. Maybe you only allow exporting to a csv for example.

~~~ruby
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  @transactions.each do |transaction|
    puts yield transaction
  end
end

transaction_statement do |transaction|
  "%0.2f" % transaction
end
~~~

To explicitly make the connection. The value that you yield to the block is captured by the block and assigned to the named argument of the block. In the case above our block has a `|transaction|` argument so each iteration the value yielded is assigned to that variable name.

If you don't pass a value with yield and the block expects one then the argument is assigned `nil`.

If you're working with hashes you might need to yield the key and value, just make sure your block names two parameters.

~~~ruby
def awesome_method
  hash = {a: 'apple', b: 'banana', c: 'cookie'}

  hash.each do |key, value|
    yield key, value
  end
end

awesome_method { |key, value| puts "#{key}: #{value}" }
~~~

We'll end our exploration of yield by posing a question. What happens if you call yield but the calling method doesn't include a block? We'll cover that in the next section

### Block control

As the person who writes a method and the person who calls a method are often different people how can you be sure they caller will include a block and what happens if they don't?

~~~ruby
def simple_method
  yield
end

simple_method

# => `simple_method': no block given (yield) (LocalJumpError)
~~~

Yep, an error. So what do you do if you want to write a method where the caller will sometimes pass a method and sometimes not?

Enter `block_given?`

You can use this conditional method inside your own to check if a block was given. If it is `block_given?` returns true and any code inside that conditional is executed. If not then your method will ignore it.

~~~ruby
def maybe_block
  if block_given?
    puts "block party"
  end
  puts "executed regardless"
end

maybe_block

# => executed regardless

maybe_block {} # {} is just an empty block

# => block party
# => executed regardless
~~~

You may have already come across this in some of the enumerables. [count](https://ruby-doc.org/core-3.0.0/Enumerable.html#method-i-count) is a method where you can use a block or not. Without any argument it just returns the size of whatever it was called on, with an argument it counts how many times that argument appears in the object count was called on, and with a block it yields to the block and provides a count of how many times the block returns a truthy response. If you toggle to view the source code of count on the ruby docs site you'll see it's written in C, but even glancing over the unfamiliar C syntax you should be able to tell that it checks if a block has been given. With Ruby we just have a more elegant syntax.

### Lambdas

A lambda is a way to write a block and save it to a variable. This can be useful if you find yourself having to write blocks for different methods you're calling which all do the same thing.

There are two ways to create a lambda. One is to use the `lambda` keyword `lambda { "inside the lambda" }`The other way to declare a lambda is `-> {}`. This looks a little funky but you get used to it. The second way is more commonly used so that's what I'll be using for the other examples.

~~~ruby
my_lambda = lambda { puts "my lambda" }

my_other_lambda = -> { puts "hello from the other side" }
~~~

To call a lambda you just just the `call` method.

~~~ruby
my_lambda = -> { puts "high five" }
my_lambda.call

# => high five
~~~

If you want to accept arguments into your lambda you have two options and which option you can use depends on how you declare your lambda. If you use `->` then you can use `()` to name your parameters. If you use `lambda` then you can use the more recognised `||` inside the block.

~~~ruby
my_name = ->(name) { puts "hello #{name}" }

my_age = lambda { |age| puts "I am #{age} years old" }


my_name.call("tim")
my_age.call(78)
~~~

One weird thing to note about lambdas is that there are numerous ways you can call them.

~~~ruby
my_name = ->(name) { puts "hello #{name}" }

my_name.call("tim")
my_name.("tim")
my_name["tim"]
my_name.=== "tim"
~~~

I'd recommend sticking to using `call`

### Procs

A Proc is just an object that you can use to create blocks to be passed around. If this sounds a bit like a lambda then you'd be right. In fact there is no special lambda class. A lambda is just a type of Proc object but with some distinct behaviours which we'll cover shortly.

You declare a new Proc in the same way you instantiate any object in Ruby, using `new`

~~~ruby
a_proc = Proc.new { puts "this is a proc" }

a_proc.call
~~~

Arguments are declared inside `||`

~~~ruby
a_proc = Proc.new { |name, age| puts "name: #{name} --- age: #{age}" }

a_proc.call("tim", 80)
~~~

There isn't much more in creating Procs that you haven't seen with Lambdas. So why use one over the other? Well there are some important differences between them which we'll cover next.

### Procs vs Lambdas

There are some key differences between Procs and Lambdas that can make choosing one over the other more suitable.

#### Arguments

A Proc behaves much like a block with regards to arguments. A proc doesn't care if you give it none, less or more arguments than you specify. It will assign nil to any parameters you name but don't pass through as arguments.

~~~ruby
a_proc = Proc.new { |a, b| puts "a: #{a} --- b: #{b}" }

a_proc.call("apple")

# => a: apple --- b:
~~~

A lambda, on the other hand, does care and will raise an error if you don't honour the number of parameters expected

~~~ruby
a_proc = lambda { |a, b| puts "a: #{a} --- b: #{b}" }

a_proc.call("apple")

# => wrong number of Arguments (given 1, expected 2) (ArgumentError)

a_proc.call("apple", "banana", "cake")

# => wrong number of Arguments (given 3, expected 2) (ArgumentError)
~~~

#### Returning

When you write an explicit return inside a lambda it returns from the lambda block back to the caller

~~~ruby
a_lambda = -> { return 1 }
a_lambda.call

# => 1
~~~

A Proc object returns from the context in which it is called. If you are in the top level context (outside of a class and method) then you'll get an error because you can't return out of the very top level context, as there is no caller to return to.

~~~ruby
a_proc = Proc.new { return }

a_proc.call

# => localJumpError (unexpected return)
~~~

If you try the above in a repl you won't get an error, which is just to do with how they manage the context of code. If you try it in irb then you'd get the expected error.

If you return from a proc inside a method, the method is the context in which it was called and therefore it returns from the method before any of the other code below it is executed.

~~~ruby
def my_method
  a_proc = Proc.new { return }
  my_proc.call
  puts "this line is never reached"
end

my_method
~~~

### Similarities

Although we've covered some big differences between procs and lambdas there are some similarities we need to cover.

#### Default Arguments

Both procs and lambdas support default arguments in the same way Ruby methods do

~~~ruby
my_proc = Proc.new { |name="bob"| puts name }

my_proc.call

# => bob

my_lambda = ->(name="r2d2") { puts name }

my_lambda.call

# => r2d2
~~~

#### method parameters

Both procs and lambdas can be used as arguments to a method

~~~ruby
def my_method(useful_arg)
  useful_arg.call
end

my_lambda = -> { puts "lambda" }
my_proc = Proc.new { puts "proc" }

my_method(my_lambda)

# => lambda

my_method(my_proc)

# => proc

# You can even create the lambda or proc when calling the method

my_method(-> { puts "cool lambda bro" })

# => cool lambda bro
~~~

### Advanced stuff

Here I'm going to cover some of the more advanced techniques you can use with procs and lambdas. I might not explain the concept too deeply because that would be an entire lesson on its own, but I'll definitely make clear how things work.

#### Closures

I mentioned earlier that blocks can be used in Ruby as a closure. A closure can be thought of as a function that can be treated like a variable and remembers the context in which it was created so that it can refer back to it when called.

What we mean by being treated like a variable is that it can be assigned to another variable, passed as a method argument and anything else a variable can do. Well we've already seen in the examples above that procs and lambdas can both be assigned to a variable, and passed around as method argument to be called whenever.

The more interesting bit is that they remember the context in which they were created. It will be made clearer with an example. Consider the following code

~~~ruby
def lambda_caller(a_lambda)
  name = "bob"
  a_lambda.call
end

name = "tim"

name_lambda = -> { puts name }

lambda_caller(name_lambda)
~~~

What do you think this would output to the terminal? Try and run the code yourself and see.

It should have output `tim`. This is an important point. Procs and Lambdas get their execution context when they are created, not when they are called. If you removed the line where you set `name = "tim"` what do you think would happen then?

You'd get an error. As I said, the context is created when the proc or lambda is created so it won't access the context inside the method and see there is a `name` variable set to `bob` there. That said, if you never call the lambda you won't get an error when creating it just because there isn't a name at that time. It's only when the lambda is called that it looks up it's own context and finds out that name wasn't defined when it was created.

Maybe you're getting to grips with it? How about this curve ball

~~~ruby
name = "tim"

my_lambda = -> { puts name }

my_lambda.call

name = "bob"

my_lambda.call
~~~

What do you think will be output here?

You should have got `tim` then `bob`. That may seem counter intuitive to what I said earlier. The context was created when the lambda was created, and at that time name was `tim`. So it's not unreasonable to assume it would stay that way. However because we haven't left the scope in which the lambda was created a change in variable value also changes the name value you originally created. So looking at it that way it's actually reasonable.

So keeping in mind the two previous examples what will this one output

~~~ruby
my_lambda = { return name }

name = "tim"

my_lambda.call
~~~

I'm sure you got it.... An error.

It does make sense. When the lambda is created there is no name variable to remember so adding one later does not add it to the context of the proc.

Closures are much more commonly used in languages that support functions as first class objects. So you might not find a use case yourself for a closure in Ruby, but it's still cool to learn something new.

#### Currying

Again, currying is really something that belongs in the world of functional programming. But as procs are basically functions we can do it. What is currying? It's a way to call a function with only some of the arguments supplied, and get back a new function that can be called passing the other arguments at that time. Whhhhaattt? Let's see with an example

~~~ruby
multiply = ->(num1, num2) { num1 * num2 }

first_num = multiply.curry.call(10) # Here we call the curry method on the lambda and then call it with just one argument.

puts first_num.call(10) # We then call first_num which will itself by a proc type object passing in the second argument in the normal way

# => 100
~~~

You can do the same thing if you create a Proc object too. Will you ever use this? I have no idea. If you do find a good use for it though let the world know.

### Capturing blocks

Now that we know about how procs and lambdas work, how can this be applied to blocks? As we learned blocks are anonymous functions that can be attached to methods. But what if we want to capture that block to do something with it? Maybe we need to receive the block now and store it in an instance variable to be called later if required.

Ruby allows us to capture blocks in a method definition with a special argument using `&`.

~~~ruby
def cool_method(&my_block)
  my_block.call
end

cool_method { puts "cool" }
~~~

If your method names some other parameters then the block capturing one should always go last.

Capturing a block with `&` is known as an explicit block, when you don't name it in your parameter list then it's known as an implicit block.

One other thing to note is that even when you do capture a block using an `&` you can still use yield rather than `call` to yield to the block. Although it would make the method somewhat unclear so I wouldn't recommend it.

So how does this work? Well, actually the `&` capturing syntax doesn't only have to be used on blocks. What happens is that ruby calls a method called `to_proc` on whatever is assigned to that variable. In the case above using `&` assigns the block to my_block and then calls `to_proc` on it, which creates a Proc object. That is why you can use `call` on it.

Maybe you've seen or used code like the following

~~~ruby
arr ["1", "2", "3"]

arr.map(&:to_i)

# => [1, 2, 3]
~~~

What happens under the hood is that `to_proc` is called on the symbol `to_i`. You can see what it does in the [ruby docs](https://ruby-doc.org/core-3.0.0/Symbol.html#method-i-to_proc). It returns a proc object which responds to the given method by sym. So here map yields each value in the array to the proc object which calls `to_i` on it.

The `&` also works the other way. You can append it to a proc object and it converts it to a block, and appends the block to the method being called.

~~~ruby
def cool_method
  yield
end

my_proc = Proc.new { puts "proc party" }

cool_method(&my_proc)

# => proc party
~~~

If you tried to call `cool_method(my_proc)` without the `&` you'd get an error as the method expected no arguments but you supplied one. Similarly if you had a method that named a parameter and you tried to call it with a proc converted to a block, you'd get an error.

~~~ruby
def cool_method(an_arg)
  an_arg.call
end

a_proc = Proc.new { puts "procodile hunter" }

cool_method(&a_proc)

# => ERROR
~~~

As I said, using `&` on a proc when calling a method converts it to a block and attached it to the method as a regular block, it is no longer a named argument to the method.

### Wrapping up

Blocks are used everywhere in Ruby. You'll find many use cases, and see them used extensively in code libraries. They allow callers of methods to pass in some contextual information which might otherwise be hard to do without having to have numerous methods to handle different scenarios.

After getting to grips with the information in this lesson you'll be a block, proc and lambda master. Able to easily craft beautiful ruby code.

### Assignment
<div class="lesson-content__panel" markdown="1">

1. [this article](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/) provides quite a nice summary of much of what we've covered here.
2. Read [this article](https://www.honeybadger.io/blog/using-lambdas-in-ruby/) which also covers much of what we've used here. I really liked the small section on using lambdas as computed hashes and arrays. A cool use case.
</div>
