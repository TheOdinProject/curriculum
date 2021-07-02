### Introduction

You'll already be familiar with ruby blocks from working with enumerables in the Ruby section. But there is more depth to blocks than we've covered so this lesson will dive deeper. They're such a fundamental part of Ruby that you should get to know them inside out.

A very quick recap of the basics that you should already be familiar with...

A block can be declared as a single-line or multi-line block and Ruby convention is to use `{}` for single-line and `do..end` for multi-line blocks. Parameters can be defined within a block inside pipes `|arg1, arg2|`. You'll already know both forms from working with enumerable methods.

~~~ruby
[1,2,3].each { |num| puts num }

[1,2,3].each do |num|
  puts num
end
~~~

Although you are familiar with how to write blocks, you need to know how to write your own methods that accept blocks and that is what we are aiming to cover here.

### Learning Outcomes

- What is a block?
- How is a block like a method?
- What are the two ways to declare a block?
- Why would you use a block instead of just creating a method?
- What does `yield` do?
- How do you pass arguments to a block from within a method?
- How do you check whether a block was actually passed in?
- What is a proc?
- What is a lambda?
- What's the difference between a proc and a block?
- When would you use a proc instead of a block?
- What's different between a lambda and a proc?


### Yield

`yield` is a keyword that can be called inside a method to relinquish execution to the accompanying block. Let's imagine you're writing a simple method for your library to allow users of that library to log some information to the terminal. The one key requirement you have is that users should be able to define how that block is presented. Sometimes they may just want to `puts` something, other times they may want to inspect something with `p`. If you tried to write this only using a method it would actually be quite difficult. You'd have to write up front all the possible options the user of your library might want to call and then create the docs to explain it. With blocks we can just relinquish control of the method to the block with yield and allow the user to define how they want to print it.

~~~ruby
def logger
  yield
end

logger { puts 'hello from the block' }

logger do
  p [1,2,3]
end
~~~

The example isn't that useful but hopefully you should see how blocks allow huge flexibility in how methods act upon data. Let's see if we can make it more interesting, but still not that useful. You now get given a new requirement that users want a method that allows them to write whatever they want, and it gets printed twice to the terminal. How might you handle this requirement? Well if I told you that you can call yield as many times as you want and each time it yields to the block in the same way you'd probably have a good idea.

~~~ruby
def double_vision
  yield
  yield
end

double_vision { puts "How many fingers am I holding up?" }
~~~

Millennial avocados Batman. That's cool.

We mentioned earlier that blocks can accept arguments. But how do you pass them to the block? No problem! Just pass them as arguments to yield and they'll be passed to the blocks parameters. If you call yield more than once you can pass a different argument each time if you wanted to.

Where might this be useful? Well think about each time you use `each`. You need to yield each member of the collection to the block. Say you're writing an app that will allow other banks to handle all their banking matters. One part of your app is a method that prints all of the transactions to a statement. For our example we'll use the terminal, but it could be a spreadsheet or anything. One issue is that different banks may want to print the transaction with different formats. We can iterate through the transactions and for each one we can yield it to a block that the caller of your method attaches to the method call. They can define how the transactions will be printed to their statement and you can focus on delivering bug free banking transactions

~~~ruby
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  @transactions.each do |transaction|
    yield transaction # You just yield the transaction amount
  end
end

transaction_statement do |transaction|
  puts "%0.2f" % transaction # The person who calls the method can define how it is handled.
end
~~~

If another bank wanted to print their transactions another way it's no problem, they can supply their own block.

What if instead you didn't want the caller to define how the transaction is outputted, but just the format? Like any method call in Ruby there is a return value. So when you call yield, it returns the last executed value from the block. Using the example above if you instead moved the `puts` from the block to inside the `each` loop, your method would be in control of where the transactions were printed. Maybe you only allow exporting to a csv for example.

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

If you want to gather the value returned from the block, you can just assign it to a variable or collect it in a data structure.

~~~ruby
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  formatted_transactions = []
  @transactions.each do |transaction|
    formatted_transactions << yield(transaction) # I've put () around transaction just for clarity here but they aren't required.
  end
  
  formatted_transactions
end

transaction_statement do |transaction|
  "%0.2f" % transaction
end
~~~

You can also write explicit return statements from a block and it will return whatever value is after that. This works the same way as an explicit return from a method. This might be useful if you need some kind of [guard clause](https://blog.techatpower.com/never-let-your-guard-down-533605891528).

To clarify... The value that you yield to the block is captured by the block and assigned to the named parameter of the block. In the case above our block has a `|transaction|` parameter so each iteration the value passed to yield as an argument is assigned to that variable name.

If you don't pass a value with yield and the block expects one then the argument is assigned `nil`. If you have two parameters but pass 3 arguments then the last one is not assigned to a parameter and you can't reference it in the block.

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

As the person who writes a method and the person who calls a method are often different people, how can you be sure the caller will include a block and what happens if they don't?

~~~ruby
def simple_method
  yield
end

simple_method

# => `simple_method': no block given (yield) (LocalJumpError)
~~~

Yep, an error. So what do you do if you want to write a method where the caller will sometimes pass a method and sometimes not?

Enter `block_given?`

You can use this method as a conditional check inside your own method to see if a block was included by the caller. If it is, `block_given?` returns true and any code inside that conditional is executed. If not then your method will ignore it.

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

You may have already come across this in some of the enumerables. [count](https://ruby-doc.org/core-3.0.0/Enumerable.html#method-i-count) is a method where you can use a block or not. Without any argument it just returns the size of whatever it was called on, with an argument it counts how many times that argument appears in the object that count was called on, and with a block it yields to the block and provides a count of how many times the block returns a truthy response. If you toggle to view the source code of count on the ruby docs site you'll see it's written in C, but even glancing over the unfamiliar C syntax you should be able to tell that it checks if a block has been given. With Ruby we just have a more elegant syntax.

### Lambdas

A lambda is a way to write a block and save it to a variable. This can be useful if you find yourself having to write blocks for different methods you're calling which all do the same thing.

There are two ways to create a lambda. One is to use the `lambda` keyword `lambda { "inside the lambda" }`The other way to declare a lambda is `-> {}`. This looks a little funky but you get used to it. The second way is more commonly used so that's what I'll be using for the other examples.

~~~ruby
my_lambda = lambda { puts "my lambda" }

my_other_lambda = -> { puts "hello from the other side" }
~~~

To call a lambda you just call the `call` method.

~~~ruby
my_lambda = -> { puts "high five" }
my_lambda.call

# => high five
~~~

If you want to accept arguments into your lambda you have two options and which option you can use depends on how you declare your lambda. If you use `->` then you can use `()` to name your parameters. If you use `lambda` then you can use the more recognized `||` inside the block.

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

A Proc is just an object that you can use to create blocks to be passed around. If this sounds a bit like a lambda then you'd be right. In fact there is no special lambda class. A lambda is just a type of Proc object but with some distinct behaviors which we'll cover shortly.

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

A lambda, on the other hand, does care and will raise an error if you don't honor the number of parameters expected

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

If you try the above in on repl.it you won't get an error, which is just to do with how they manage the context of code. If you try it in irb then you'd get the expected error.

If you return from a proc inside a method, the method is the context in which it was called and therefore it returns from the method before any of the other code below it is executed.

~~~ruby
def my_method
  a_proc = Proc.new { return }
  a_proc.call
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

#### Method parameters

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
~~~

### Capturing blocks

Now that we know about how procs and lambdas work, how can this be applied to blocks? As we learned blocks are like little anonymous methods. But what if we want to capture a reference to that block to do something with it? Maybe we need to receive the block now in our method and store it in an instance variable to be called later if required.

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
arr = ["1", "2", "3"]

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

cool_method(&a_proc) # Converting the proc object to a block

# => ERROR
~~~

As I said, using `&` on a proc when calling a method converts it to a block and attached it to the method as a regular block, it is no longer a named argument to the method.

### Wrapping up

Blocks are used everywhere in Ruby. You'll find many use cases, and see them used extensively in code libraries. They allow callers of methods to pass in some contextual information which might otherwise be hard to do without having to have numerous methods to handle different scenarios.

After getting to grips with the information in this lesson you'll be a block, proc and lambda master. Able to easily craft beautiful ruby code.

### Assignment
<div class="lesson-content__panel" markdown="1">

1. [This article](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/) provides quite a nice summary of much of what we've covered here.
2. Read [this article](https://www.honeybadger.io/blog/using-lambdas-in-ruby/) which also covers much of what we've used here. I really liked the small section on using lambdas as computed hashes and arrays. A cool use case.
</div>

### Knowledge Check
 
- What is a block?
- How is a block like a method?
- How is a block different from a method?
- What are the two ways to declare a block?
- How do you return data from a block?
- How can your methods collect the return data from a block?
- What happens if you include a `return` statement in a block?
- Why would you use a block instead of just creating a method?
- What does `yield` do?
- How do you pass arguments to a block from within a method?
- How do you check whether a block was actually passed in?
- What is a proc?
- What is a lambda?
- What's the difference between a proc and a block?
- When would you use a proc instead of a block?
- What's different between a lambda and a proc?
- How do you convert a proc to a block?
- How do you convert a block to a proc?
