### Introduction
In Ruby, methods are where all the action happens!

You will often find yourself writing code that does the same thing in different places in your program. Wouldn't it be great if there was a way to reuse the same code over and over again without having to write it all out each time? This is what methods are for! Methods allow you to name sections of your code and then run that code anywhere in your program as many times as you need just by calling that name.

This concept allows for what programmers refer to as the **DRY** approach to programming: **Don't Repeat Yourself**. Recycling sections of code instead of repeating them throughout your programs can make your program more readable and manageable.

As you read more about Ruby methods, you'll notice that the terms "methods" and "functions" are often used interchangeably. What's the difference? According to [The Ruby Programming Language](https://www.amazon.com/dp/0596516177/?tag=stackoverfl08-20) book:

> Many languages distinguish between functions, which have no associated object, and methods, which are invoked on a receiver object. Because Ruby is a purely object-oriented language, all methods are true methods and are associated with at least one object.

Basically, because everything in Ruby is an object, Ruby only has methods, not functions. With that established, we know that when we're talking about Ruby, "methods" and "functions" refer to the same thing.

In this lesson, we're going to deconstruct what methods are, examine their behaviour, and learn how to use them.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

 - Explain how to create and call a new method.
 - Explain how to pass variables to a method and how to define default parameters.
 - Describe the differences between implicit return and explicit return.
 - Explain what it means to chain methods together and how to do it.
 - Explain what predicate methods are and how to use one.
 - Explain what bang methods are and how to use one.

### Ruby's built-in methods

One of Ruby's great advantages for new programmers is its large number of built-in methods. You've been using many of them already, probably without even realizing it. Over the course of your learning so far, you have modified strings and other objects in various ways. For example, the [`#times`](https://docs.ruby-lang.org/en/3.2/Integer.html#method-i-times) and [`#upto`](https://docs.ruby-lang.org/en/3.2/Integer.html#method-i-upto) loops that you learned about in the Loops lesson are both methods that are included as part of Ruby's [`Integer`](https://docs.ruby-lang.org/en/3.2/Integer.html) class.

If you're wondering about all of the pound signs (`#`), they're just [the convention](https://stackoverflow.com/questions/736120/why-are-methods-in-ruby-documentation-preceded-by-a-hash-sign) for writing out Ruby instance methods. We can use them to write out the full name of an instance method, e.g., `Integer#upto`, or just the method name, e.g., `#upto`, depending on the context. Note that in the development world, you shouldn't call these ["hashtags"](https://help.x.com/en/using-twitter/how-to-use-hashtags). If you want to be super awesome, though, you can call them ["octothorpes"](https://en.wiktionary.org/wiki/octothorpe). That word is totally trending.

Methods are typically called by adding `.method_name` after an instance of the object that contains that method.

```ruby
"anything".reverse
```

In this case, [`#reverse`](https://docs.ruby-lang.org/en/3.2/String.html#method-i-reverse) is a built-in method for [String](https://docs.ruby-lang.org/en/3.2/String.html) objects.

However, there are also some built-in methods that Ruby makes globally accessible, such as `print` and `puts`. These methods are called with just their name and any arguments. (If you're super curious, these methods are made globally available by the [Kernel module](https://docs.ruby-lang.org/en/3.2/Kernel.html) through the [Object class](https://docs.ruby-lang.org/en/3.2/Object.html), but that's far more than you need to know right now.)

```ruby
puts "anything" #=> anything
```

It's worth noting that in most languages, arguments are passed to methods by wrapping them in parentheses `()`. In Ruby, however, the parentheses are *generally* optional. We could rewrite the above code as `puts("anything")`, which Ruby would interpret in the same way.

### Creating a method

You can create your own custom methods in Ruby using the following syntax:

```ruby
def my_name
  "Joe Smith"
end

puts my_name    #=> "Joe Smith"
```

Let's break this example down:

 * `def` is a built-in keyword that tells Ruby that this is the start of a method definition.
 * `my_name` is the name of your new method. You can name your methods almost anything you want, but there are some constraints and conventions, which are described in the next section.
 * `"Joe Smith"` is the code inside the method body. All of the logic for your method is contained in the indented lines of the method body. This particular method returns a string when the method is called.
 * `end` is a built-in keyword that tells Ruby that this is the end of the method definition.
 * <span id="calling-a-method">To call the method, you need to use its name, as shown in the last line of the example.</span>

### Method names

As mentioned above, you can name your methods almost anything you want, but you shouldn't pick names haphazardly. There are certain conventions that are recommended in order to improve the readability and maintainability of your code.

Your method names can use numbers, capital letters, lowercase letters, and the special characters `_`, `?`, `!`, and `=`. <span id="snake-case">Just like with variable names in Ruby, the convention for a method name with multiple words is to use **snake_case**, separating words with underscores.</span>

It's good practice to start the method name with a lower-case character, because names that start with capital letters are constants in Ruby. Check [here](https://stackoverflow.com/questions/10542354/what-are-the-restrictions-for-method-names-in-ruby) for more details.

Here are some things you are not allowed to do with your method names:

* <span id="reserved-words">You cannot name your method one of Ruby's approximately 40 reserved words, such as `end`, `while`, or `for`. Checkout the full list [here](http://www.java2s.com/Code/Ruby/Language-Basics/Rubysreservedwords.htm).</span>
* You cannot use any symbols other than `_`, `?`, `!`, and `=`.
* You cannot use `?`, `!`, or `=` anywhere other than at the end of the name.
* You cannot begin a method name with a number.

Here are some examples of valid and invalid method names:

```ruby
method_name      # valid
_name_of_method  # valid
1_method_name    # invalid
method_27        # valid
method?_name     # invalid
method_name!     # valid
begin            # invalid (Ruby reserved word)
begin_count      # valid
```

Can you tell why some of these names are invalid?

In general, short but descriptive is the name of the naming game. You want to be able to tell what a method is expected to do based on its name, so please don't name your method `do_stuff`.

If your method does so many things that you feel it requires a very long name, then your method should probably be broken up into several smaller and simpler methods. Ideally, each method should do only one thing. This practice will pay dividends down the road in terms of readability, scalability, and maintainability. (It also makes testing your code a lot easier, which will be covered in a later lesson.)

### Parameters and arguments

Of course, not all methods are as basic as the `my_name` example method above. After all, what good are methods if you can't interact with them? When you want to return something other than a fixed result, you need to give your methods parameters. **Parameters** are variables that your method will receive when it is called. You can have more meaningful and useful interactions with your methods by using parameters to make them more versatile.

```ruby
def greet(name)
  "Hello, " + name + "!"
end

puts greet("John") #=> Hello, John!
```

In this example, `name` is a parameter that the `greet` method uses to return a more specific greeting. The method was called with the argument `"John"`, which returns the string "Hello John!"

If you're wondering what the differences are between an argument and a parameter, **parameters** act as placeholder variables in the template of your method, whereas **arguments** are the actual variables that get passed to the method when it is called. Thus, in the example above, `name` is a parameter and `"John"` is an argument. The two terms are commonly used interchangeably, though, so don't worry too much about this distinction.

#### Default parameters

What if you don't always want to provide arguments for each parameter that your method accepts? That's where default parameters can be useful. Going back to our example above, what happens if we don't know the person's name? We can change our `greet` method to use a default `name` of "stranger":

```ruby
def greet(name = "stranger")
  "Hello, " + name + "!"
end

puts greet("Jane") #=> Hello, Jane!
puts greet #=> Hello, stranger!
```

### What methods return

An important detail that a programmer must learn is understanding what your methods **return**. Having a good understanding of what your methods are returning is an important part of debugging your code when things don't behave as expected.

How do we tell our methods what to return? Let's revisit our `my_name` example method:

```ruby
def my_name
  "Joe Smith"
end

puts my_name #=> "Joe Smith"
```

Our `my_name` method returns "Joe Smith". This may seem obvious because it's the only thing inside the method. In most languages, however, such a method would not return anything because it does not have an **explicit return** statement, which is a statement that starts with the `return` keyword. The above example could just as easily be written with an explicit return:

```ruby
def my_name
  return "Joe Smith"
end

puts my_name #=> "Joe Smith"
```

Ruby is one of the few languages that offers **implicit return** for methods, which means that a Ruby method will return the last expression that was evaluated even without the `return` keyword. The last expression that was evaluated may or may not be the last line in the code, as you can see in the following example:

```ruby
def even_odd(number)
  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(16) #=>  That is an even number.
puts even_odd(17) #=>  That is an odd number.
```

Here, the method's return is dependent on the result of the `if` condition. If the argument is an even number, the expression inside the `else` statement never gets evaluated, so the `even_odd` method returns `"That is an even number."`

Even though Ruby offers the ease of using implicit returns, explicit returns still have a place in Ruby code. An explicit return (using the keyword `return`) essentially tells Ruby, "This is the last expression you should evaluate." This example shows how using `return` stops the method from continuing:

```ruby
def my_name
  return "Joe Smith"
  "Jane Doe"
end

puts my_name #=> "Joe Smith"
```

For example, an explicit return can be useful when you want to write a method that checks for input errors before continuing.

```ruby
def even_odd(number)
  unless number.is_a? Numeric
    return "A number was not entered."
  end

  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(20) #=>  That is an even number.
puts even_odd("Ruby") #=>  A number was not entered.
```

Now, try removing the explicit `return` from the method above. Does the method return what you expected?

#### Difference between `puts` and `return`

A common source of confusion for new programmers is the difference between `puts` and `return`.

 * `puts` is a method that prints whatever argument you pass it to the console.
 * `return` is the final output of a method that you can use in other places throughout your code.

For example, we can write a method that calculates the square of a number and then `puts` the output to the console.

```ruby
def puts_squared(number)
  puts number * number
end
```

This method only prints the value that it calculated to the console, but it doesn't return that value. If we then write `x = puts_squared(20)`, the method will print `400` in the console, but the variable `x` will be assigned a value of `nil`. (If you need a refresher on this, go back and review the Ruby Input and Output lesson.)

Now, let's write the same method but with an implicit return instead of `puts`. (Using an explicit return will act exactly the same in this example.)

```ruby
def return_squared(number)
  number * number
end
```

When we run the `return_squared` method, it won't print any output to the console. Instead, it will `return` the result in a way that allows it to be used in the rest of your code. We can save the output of running this method in a variable (`x` in the code below) and use that variable in a variety of ways. If we would still like to see the result of the method in the console, we can `puts` that variable to the console using string interpolation.

```ruby
x = return_squared(20) #=> 400
y = 100
sum = x + y #=> 500

puts "The sum of #{x} and #{y} is #{sum}."
#=> The sum of 400 and 100 is 500.
```

### Chaining methods

One of the magical properties of methods that allows you to write very concise code is being able to **chain methods** together. This can be done using Ruby's built-in methods or with methods that you create.

```ruby
phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
#=> "To be or not to be"
```

Chaining methods together like this effectively has each method call build off of the outcome of the previous method in the chain. The process that takes place essentially produces the following steps:

```ruby
["be", "to", "not", "or", "be", "to"].reverse
= ["to", "be", "or", "not", "to", "be"].join(" ")
= "to be or not to be".capitalize
= "To be or not to be"
```

### Predicate methods

You will sometimes encounter built-in Ruby methods that have a question mark (`?`) at the end of their name, such as `even?`, `odd?`, or `between?`. These are all **predicate** methods, which is a naming convention that Ruby uses for methods that return a Boolean, that is, they return either `true` or `false`.

```ruby
puts 5.even?  #=> false
puts 6.even?  #=> true
puts 17.odd?  #=> true

puts 12.between?(10, 15)  #=> true
```

You can also create your own method with a `?` at the end of its name to indicate that it returns a Boolean. Ruby doesn't enforce this naming convention, but you will thank yourself later for following this guideline.

### Bang methods

Observe the example below:

```ruby
whisper = "HELLO EVERYBODY"

puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"
```

What gives? We thought we downcased that thing!  So why was it back to all uppercase when we called it again?

When we call a method on an object, such as our `whisper` string above, it does not modify the original value of that object. A general rule in programming is that you do not want your methods to overwrite the objects that you call them on. This protects you from irreversibly overwriting your data by accident. You *are* able to overwrite your data by explicitly re-assigning a variable (such as `whisper = whisper.downcase`). Another way to do this type of reassignment is with **bang methods**, which are denoted with an exclamation mark (`!`) at the end of the method name.

By adding a `!` to the end of your method, you indicate that this method performs its action and simultaneously overwrites the value of the original object with the result.

```ruby
puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"
```

Writing `whisper.downcase!` is the equivalent of writing `whisper = whisper.downcase`.

### Assignment
<div class="lesson-content__panel" markdown="1">

1. For a good introduction to all the different concepts related to methods, read the [Methods chapter](https://launchschool.com/books/ruby/read/methods) from Launch School's *Introduction to Programming with Ruby*. Make sure to do the exercises at the end of the chapter too!
2. To get a different take, read the part of the Objects section that discusses [Methods](http://ruby-for-beginners.rubymonstas.org/objects/methods.html) from Ruby Monsta's *Ruby for Beginners*.
3. For more depth on how you can write your own methods, read the section on [Writing Methods](http://ruby-for-beginners.rubymonstas.org/writing_methods.html) from Ruby Monsta's *Ruby for Beginners*.
4. Complete the [method](https://github.com/TheOdinProject/ruby-exercises/tree/main/ruby_basics) exercises from the [ruby-exercises repo](https://github.com/TheOdinProject/ruby-exercises) that you previously cloned.
</div>

### Knowledge check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

 * <a class="knowledge-check-link" href="#creating-a-method">How would you create your own method?</a>
 * <a class="knowledge-check-link" href="#calling-a-method">How would you call your new method?</a>
 * <a class="knowledge-check-link" href="#parameters-and-arguments">How do you pass variables to your method?</a>
 * <a class="knowledge-check-link" href="#default-parameters">How do you define default parameters for your method?</a>
 * <a class="knowledge-check-link" href="#what-methods-return">What is the difference between an explicit return and an implicit return?</a>
 * <a class="knowledge-check-link" href="#difference-between-puts-and-return">What is the difference between `puts` and `return`?</a>
 * <a class="knowledge-check-link" href="#chaining-methods">How do you chain multiple methods together?</a>
 * <a class="knowledge-check-link" href="#method-names">Give an example of a valid method name and an invalid method name.</a>
 * <a class="knowledge-check-link" href="#snake-case">What is snake case?</a>
 * <a class="knowledge-check-link" href="#reserved-words">What are some of Ruby's reserved words?</a>
 * <a class="knowledge-check-link" href="#predicate-methods">What do you call a method that returns `true` or `false`? What is their naming convention?</a>
 * <a class="knowledge-check-link" href="#bang-methods">What do bang methods do? What is their naming convention?</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

  - For a deeper look at methods, read the [Methods chapter](http://ruby.bastardsbook.com/chapters/methods/) from the Bastards Book of Ruby. Try to complete the exercises throughout the chapter.
  - For more discussion on the subtle differences between methods and functions and how they can differ between programming languages, here is a [handy explanation on Stack Overflow](https://stackoverflow.com/questions/155609/difference-between-a-method-and-a-function).
