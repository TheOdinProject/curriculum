### Introduction

You are already familiar with Ruby blocks from the [Basic Enumerable Methods](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/basic-enumerable-methods) lesson from earlier. But there is more depth to blocks than we've covered, so this lesson will dive deeper. Blocks are such a fundamental part of Ruby that you should get to know them inside out.

A very quick recap of the basics that you should already be familiar with...

<span id="block-basics">A block can be declared as a single-line or multi-line block. Ruby convention is to use `{}` for single-line blocks and `do..end` for multi-line blocks. You can pass parameters to a block by defining them inside pipes, i.e. `|arg1, arg2|`. You'll already know both forms from working with enumerable methods.</span>

```ruby
# Single-line block
[1,2,3].each { |num| puts num }

# Multi-line block
[1,2,3].each do |num|
  puts num
end
```

Although you are familiar with how to write blocks in the context of enumerable methods, there are actually other interesting ways to use them in Ruby. For example, you can write your own methods that accept blocks and even store blocks as variables. By the end of this lesson, you'll have a newfound appreciation for the mighty block.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

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

`yield` is a keyword that can be called inside a method to relinquish execution to the accompanying block. Let's imagine you're writing a simple method for your library which allows users of that library to log some information to the terminal. The one key requirement you have is that users should be able to define how that information is presented. Sometimes they may just want to `puts` something, other times they may want to inspect something with `p`. If you tried to write this using only a method, it would actually be quite difficult. You'd have to account for every possible option the user of your library might want to call and then create the docs to explain it. With blocks, we can just relinquish control of the method to the block with `yield` and allow the user to define how they want to print it.

```ruby
def logger
  yield
end

logger { puts 'hello from the block' }
#=> hello from the block

logger do
  p [1,2,3]
end
#=> [1,2,3]
```

This example isn't that interesting, but hopefully you should see that blocks allow huge flexibility in how methods act upon data.

Let's see if we can make it more interesting. Now your users want a method that allows them to write whatever they want, and it gets printed twice to the terminal. How might you handle this requirement? With `yield`, it's easy! You can call `yield` within a method as many times as you want, and it will behave the same way each time.

```ruby
def double_vision
  yield
  yield
end

double_vision { puts "How many fingers am I holding up?" }
#=> How many fingers am I holding up?
#=> How many fingers am I holding up?
```

Millennial avocados, Batman. That's cool.

<span id="pass-arguments">We mentioned earlier that blocks can accept arguments. But how do you pass them to the block? No problem! Just pass them as arguments to `yield`, and they'll be passed to the block as parameters. If you call `yield` more than once, you can pass a different argument each time if you wanted to.</span>

```ruby
def love_language
  yield('Ruby')
  yield('Rails')
end

love_language { |lang| puts "I love #{lang}" }
#=> I love Ruby.
#=> I love Rails.
```

How might this be useful? Say you're creating a banking app that allows a bank to print a list of transactions to a statement. For our example we'll use the terminal, but it could be a spreadsheet or anything. You have an issue, though. You want your app to work for any bank, but different banks want to print the transactions with different formats. How can you design it so that each bank can choose a different format, but you only have to write the code once?

We can combine the power of `yield` with the `#each` enumerable method. In the example below, we write a method that iterates through a list of transactions, and for each one yields it to a block. The caller of the method (the bank) can call it with any block they want. This way, they can define how the transactions will be printed to their statement, and you can focus on delivering bug-free banking transactions.

```ruby
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  @transactions.each do |transaction|
    yield transaction # You just yield the transaction amount.
  end
end

transaction_statement do |transaction|
  p "%0.2f" % transaction # The bank that calls the method can define how it is handled.
end
#=> ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]
```

If another bank wanted to print their transactions another way it's no problem, they can supply their own block.

What if instead you didn't want the caller to define how the transaction is printed, but just the format? <span id="return-value">Like any method call in Ruby, blocks have a return value.</span> So when you call `yield`, it returns the last executed value from the block. Using the example above, if you instead moved the `p` from the block to inside the `#each` call, your method would be in control of how the transactions were printed. Maybe you only allow exporting to a .csv for example.

```ruby
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  @transactions.each do |transaction|
    p yield transaction # `p` is called within our method now instead of within the block
  end
end

transaction_statement do |transaction|
  "%0.2f" % transaction
end
#=> ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]
```

<span id="collect-return">If you want to gather the value returned from the block, you can just assign it to a variable or collect it in a data structure.</span>

```ruby
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  formatted_transactions = []
  @transactions.each do |transaction|
    formatted_transactions << yield(transaction)
  end

  p formatted_transactions
end

transaction_statement do |transaction|
  "%0.2f" % transaction
end
#=> ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]
```

<span id="explicit-return">You can also write explicit return statements from a block. This works the same way as an explicit return works in a method. This might be useful if you need some kind of [guard clause](https://blog.techatpower.com/never-let-your-guard-down-533605891528).</span>

In the above examples, the value that we yield to the block in `transaction_statement` is captured by the block and assigned to the named parameter (the variable inside the pipes, in this case `|transaction|`). This works the same way it does in enumerable methods like `#each` and `#map`.

If you don't pass a value with `yield` and the block expects one, then the argument is assigned `nil`.

```ruby
def say_something
  yield # No arguments are passed to yield
end

say_something do |word| # But the block expects one argument to be passed in
  puts "And then I said: #{word}"
end
#=> And then I said:
```

If you have two parameters but pass 3 arguments, then the last one is not assigned to a parameter and you can't reference it in the block.

```ruby
def mad_libs
  yield('cool', 'beans', 'burrito') # 3 arguments are passed to yield
end

mad_libs do |adjective, noun| # But the block only takes 2 parameters
  puts "I said #{adjective} #{noun}!"
end
#=> I said cool beans!
```

If you're working with hashes you might need to yield the key and value, just make sure your block names two parameters.

```ruby
def awesome_method
  hash = {a: 'apple', b: 'banana', c: 'cookie'}

  hash.each do |key, value|
    yield key, value
  end
end

awesome_method { |key, value| puts "#{key}: #{value}" }
#=> a: apple
#=> b: banana
#=> c: cookie
```

We'll end our exploration of `yield` by posing a question. What happens if you call `yield`, but the calling method doesn't include a block? We'll cover that in the next section.

### Block control

Oftentimes, the person who writes a method and the person who calls a method are different people. If you're writing a method that uses `yield`, how can you be sure the caller will include a block? What happens if they don't?

```ruby
def simple_method
  yield
end

simple_method
# => `simple_method': no block given (yield) (LocalJumpError)
```

Yep, an error. So how can you write a method that works whether or not the caller passes a block to it?

<span id="block-given">Enter `block_given?`</span>

You can use this method as a conditional check inside your own method to see if a block was included by the caller. If so, `block_given?` returns `true`, otherwise it returns `false`. This lets you write your method so that it behaves differently depending on whether or not it receives a block.

```ruby
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
```

You may have already come across this in some of the enumerables. [#count](https://docs.ruby-lang.org/en/3.2/Enumerable.html#method-i-count) is a method that can be called with or without a block. If called without an argument, it just returns the size of whatever it was called on. When called with an argument, it counts how many times that argument appears in the object it was called on. And with a block, it yields to the block and provides a count of how many times the block returns a truthy response. If you toggle to view the source code of `#count` on the Ruby Documentation site, you'll see it's written in C, but even glancing over the unfamiliar C syntax, you should be able to tell that it checks if a block has been given. With Ruby we just have a more elegant syntax.

### Lambdas

A lambda is a way to write a block and save it to a variable. This can be useful if you're calling different methods but passing in the same block to each of them. It keeps you from having to type out the same code over and over again.

There are two ways to create a lambda. One is to use the `lambda` keyword e.g. `lambda { "inside the lambda" }`. The other way to declare a lambda is using the "stabby lambda" syntax, `-> {}`. This looks a little funky but you get used to it. Stabby lambda notation is more commonly used, so that's what we'll be using for the other examples.

```ruby
my_lambda = lambda { puts "my lambda" }

my_other_lambda = -> { puts "hello from the other side" }
```

To call a lambda you just call the `#call` method.

```ruby
my_lambda = -> { puts "high five" }
my_lambda.call
# => high five
```

If you want to accept arguments into your lambda, you have two options, and which option you use depends on how you declare your lambda. If you use the stabby lambda syntax `->` then you use `()` to name your parameters. If you use the `lambda` keyword, then you use pipes `||` inside the block.

```ruby
my_name = ->(name) { puts "hello #{name}" }

my_age = lambda { |age| puts "I am #{age} years old" }


my_name.call("tim")
#=> hello tim
my_age.call(78)
#=> I am 78 years old
```

One weird thing to note about lambdas is that there are numerous ways you can call them.

```ruby
my_name = ->(name) { puts "hello #{name}" }

my_name.call("tim")
my_name.("tim")
my_name["tim"]
my_name.=== "tim"
```

It's probably best to stick to using `#call`.

### Procs

A proc is just an object that you can use to store blocks and pass them around like variables. If you think this sounds a bit like a lambda, then you'd be right. In fact, there is no special lambda class. A lambda is actually just a type of proc object but with some distinct behaviors which we'll cover shortly.

You declare a new proc in the same way you instantiate any object in Ruby, using `new`.

```ruby
a_proc = Proc.new { puts "this is a proc" }

a_proc.call
#=> this is a proc
```

or you can just use 'proc'

```ruby
a_proc = proc { puts "this is a proc" }

a_proc.call
#=> this is a proc
```

Arguments are declared inside pipes `||`

```ruby
a_proc = Proc.new { |name, age| puts "name: #{name} --- age: #{age}" }

a_proc.call("tim", 80)
#=> name: tim --- age: 80
```

### Procs vs lambdas

There isn't much more to creating procs that you haven't already seen with lambdas. So why use one over the other? Well, there are some key differences between procs and lambdas that can make choosing one over the other more suitable.

#### Arguments

A proc behaves much like a block with regards to arguments. A proc doesn't care if you pass in fewer or more arguments than you specify. In fact, it doesn't care if you don't pass in any arguments at all. It will assign `nil` to any parameters you name but don't pass through as arguments.

```ruby
a_proc = Proc.new { |a, b| puts "a: #{a} --- b: #{b}" }

a_proc.call("apple")
# => a: apple --- b:
```

which is also why this is possible:

```ruby
nested_array = [[1, 2], [3, 4], [5, 6]]
nested_array.select {|a, b| a + b > 10 }

# => [5, 6]
```

As you can see, `#select` has two arguments specified `|a, b|`, on each iteration we pass a single element of nested_array into the block. On the first iteration this is: `[1, 2]`, this array now, is deconstructed automatically (into a = 1, b = 2) and its values compared as specified. So on to the next rounds of iteration in which we pass `[3, 4]` and `[5, 6]` one by one.
This happens because the block `{|a, b| if a + b > 10 }` is treated as a non-lambda proc.
This property is not limited to `#select` but also applies to other `enum` methods like `#map`, `#each` etc.
You can read more about this here: [documentation](https://docs.ruby-lang.org/en/3.2/Proc.html)

A lambda, on the other hand, DOES care and will raise an error if you don't honor the number of parameters expected.

```ruby
a_lambda = lambda { |a, b| puts "a: #{a} --- b: #{b}" }

a_lambda.call("apple")
# => wrong number of Arguments (given 1, expected 2) (ArgumentError)

a_lambda.call("apple", "banana", "cake")
# => wrong number of Arguments (given 3, expected 2) (ArgumentError)
```

#### Returning

When you write an explicit return inside a lambda, it returns from the lambda block back to the caller.

```ruby
a_lambda = -> { return 1 }

a_lambda.call
# => 1
```

A proc object, however, returns from the context in which it is called. If you are in the top level context (outside of a class or method), then you'll get an error because you can't return out of the very top level context, as there is no caller to return to.

```ruby
a_proc = Proc.new { return }

a_proc.call
# => localJumpError (unexpected return)
```

Note that if you try the above example on replit.com you won't get an error. This just has to do with how replit.com manages the context of code. If you try it in irb then you'll get the expected error.

If you return from a proc inside a method, the method is the context in which it was called and therefore it returns from the method before any of the other code below it is executed.

```ruby
def my_method
  a_proc = Proc.new { return }
  puts "this line will be printed"
  a_proc.call
  puts "this line is never reached"
end

my_method
#=> this line will be printed
```

### Similarities

Now that we've covered some big differences between procs and lambdas, there are some similarities we need to cover.

#### Default arguments

Both procs and lambdas support default arguments in the same way Ruby methods do:

```ruby
my_proc = Proc.new { |name="bob"| puts name }

my_proc.call
# => bob

my_lambda = ->(name="r2d2") { puts name }

my_lambda.call
# => r2d2
```

#### Method parameters

Both procs and lambdas can be used as arguments to a method.

```ruby
def my_method(useful_arg)
  useful_arg.call
end

my_lambda = -> { puts "lambda" }
my_proc = Proc.new { puts "proc" }

my_method(my_lambda)
# => lambda

my_method(my_proc)
# => proc
```

### Capturing blocks

Now that we know how procs and lambdas work, how can this be applied to blocks? As we learned, blocks are like little anonymous methods. But what if we want to capture a reference to that block to do something with it? Maybe we need to receive the block now in our method and store it in an instance variable to be called later.

Ruby allows us to capture blocks in a method definition as a special argument using `&`.

```ruby
def cool_method(&my_block)
  my_block.call
end

cool_method { puts "cool" }
```

If your method names some other parameters, then the block-capturing `&` parameter should always go last.

Capturing a block with `&` is known as an explicit block. When you don't name it in your parameter list, then it's known as an implicit block.

One other thing to note is that even when you do capture a block using an `&`, you can still use `yield` rather than `#call` to yield to the block. This would make the method somewhat unclear, though, so it's not recommended.

So how does this work? Well, actually the `&` capturing syntax doesn't only have to be used on blocks. What happens when you use `&` is that Ruby calls a method called `#to_proc` on whatever is assigned to that variable. In the example above, using `&` assigns the block to `my_block` and then calls `#to_proc` on it, which creates a proc object. That is why you can use `#call` on it.

Maybe you've seen or used code like the following

```ruby
arr = ["1", "2", "3"]

arr.map(&:to_i)
# => [1, 2, 3]
```

What happens under the hood is that `#to_proc` is called on the symbol `:to_i`. You can see what it does in the [ruby docs](https://docs.ruby-lang.org/en/3.2/Symbol.html#method-i-to_proc). It returns a proc object which responds to the given method indicated by the symbol. So here, `#map` yields each value in the array to the proc object, which calls `#to_i` on it.

(Yes, names of methods like `#to_i` can be passed around using symbols. It's outside the scope of this lesson, but check out the [documentation](https://docs.ruby-lang.org/en/3.2/Object.html#method-i-send) for `#send` if you're interested. And this Stack Overflow [article](https://stackoverflow.com/questions/14881125/what-does-to-proc-method-mean) on how `#send` and `#to_i` are used together for `arr.map(&:to_i)` to work.)

<span id="proc-to-block">The `&` also works the other way. You can prepend it to a proc object and it converts it to a block, and passes the block to the method being called.</span>

```ruby
def cool_method
  yield
end

my_proc = Proc.new { puts "proc party" }

cool_method(&my_proc)
# => proc party
```

If you tried to call `cool_method(my_proc)` without the `&` you'd get an error because the method expected no arguments but you supplied one. Similarly, if you have a method that names a parameter and you try to call it with a proc converted to a block, you'll get an error.

```ruby
def cool_method(an_arg)
  an_arg.call
end

a_proc = Proc.new { puts "procodile hunter" }

cool_method(&a_proc) # Converting the proc object to a block

# => ArgumentError (wrong number of arguments (given 0, expected 1))
```

Like we said earlier, using `&` on a proc when calling a method converts it to a block before passing it to the method. It is no longer a named argument to the method, which is why we get the `ArgumentError` in the above example.

### Wrapping up

Blocks are used everywhere in Ruby. You'll find many use cases, and see them used extensively in code libraries. They allow callers of methods to pass in some contextual information which might otherwise be hard to do without having numerous methods to handle different scenarios.

After coming to grips with the information in this lesson you'll be a block, proc and lambda master, able to easily craft beautiful Ruby code.

### Assignment
<div class="lesson-content__panel" markdown="1">

1. [This article](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/) provides quite a nice summary of much of what we've covered here.
2. Read [this article](https://www.honeybadger.io/blog/using-lambdas-in-ruby/) which also covers much of what we've used here. We really liked the small section on using lambdas as computed hashes and arrays. A cool use case.
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

- [What is a block?](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/#Understanding_Ruby_Blocks)
- [How is a block like a method?](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/#Understanding_Ruby_Blocks)
- [What are the two ways to declare a block?](#block-basics)
- [How do you return data from a block?](#return-value)
- [How can your methods collect the return data from a block?](#collect-return)
- [What happens if you include a `return` statement in a block?](#explicit-return)
- [What does `yield` do?](#yield)
- [How do you pass arguments to a block from within a method?](#pass-arguments)
- [How do you check whether a block was actually passed in?](#block-given)
- [What is a proc?](#procs)
- [What is a lambda?](#lambdas)
- [What's different between a lambda and a proc?](#procs-vs-lambdas)
- [How do you convert a proc to a block?](#proc-to-block)
- [How do you convert a block to a proc?](#capturing-blocks)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
