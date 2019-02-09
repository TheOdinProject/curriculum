### Introduction
In Ruby, methods are where all the action happens! 

You will often find yourself writing code that does the same thing in different places in your program. Wouldn't it be great if there was a way to reuse the same code over and over again without having to write it all out each time? This is what methods are for! Methods allow you to name sections of your code and then run that code anywhere in your program as many times as you need just by calling that name.

This concept allows for what programmers refer to as the **DRY** approach to programming: **Don't Repeat Yourself**. Recycling sections of code instead of repeating them throughout your programs can make your program more readable and manageable.

As you read more about Ruby methods, you'll notice that the terms "methods" and "functions" are often used interchangably. What's the difference? According to [The Ruby Programming Language](https://www.amazon.com/dp/0596516177/?tag=stackoverfl08-20) book:

> Many languages distinguish between functions, which have no associated object, and methods, which are invoked on a receiver object. Because Ruby is a purely object-oriented language, all methods are true methods and are associated with at least one object.

Basically, because everything in Ruby is an object, Ruby only has methods, not functions. With that established, we know that when we're talking about Ruby, "methods" and "functions" refer to the same thing.

In this lesson, we're going to deconstruct what methods are, examine their behaviour, and learn how to use them.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:
 
 - Explain how to create and call a new method.
 - Explain how to pass variables to a method and how to define default parameters.
 - Describe an implicit return.
 - Explain what it means to chain methods together and how to do it.
 - Explain what predicate methods are and how to use one.
 - Explain what bang methods are and how to use one.

### Ruby's Built-in Methods

One of Ruby's great advantages for new programmers is the large number of built-in methods it includes. You've been using many of them already, probably without even realizing it. Over the course of your learning so far, you have modified strings and other objects in various ways. Each time you have done this you have used a method.

Methods are often applied by adding `.method_name` after an object you want to modify. (Though not all methods are used to modify an object).

~~~ruby
"anything".reverse
~~~

In this case, `reverse` is a method Ruby has built in for strings (and some others data types).

`print` and `puts` are also methods. They are just called in a different way, by typing their name and passing them arguments.

~~~ruby
puts "anything" #=> anything
~~~

It's worth noting that in most languages, arguments are passed to methods by wrapping them in parentheses `()`. In Ruby, the parentheses are generally optional, so the above code is the same as `puts("anything")`. There will be exceptions to this rule that you will run into further into your learning.


### Creating a Method

You can create your own custom methods in Ruby like so:
~~~ruby
def my_name
  "Joe Smith"
end

puts my_name #=> "Joe Smith"
~~~
Let's break it down:
* `def` - is a built in Ruby keyword. It lets Ruby know this is the start of a method *definition*.

* `my_name` - is the name you are giving to the method. You can pretty much name it whatever you want. But there are some constraints and conventions which are described in the next section.

* `"Joe Smith"` - is in the *method body*. This is where all the logic of your method goes. This particular method will just *return* a string when it is *called*.

* `end` - as you might have guessed `end` marks the *end* of the method definition. It's another Ruby keyword.

* To call the method you simply need to use its name, as shown in the last line of the example `puts my_name`


### Parameters and Arguments

Of course, not all methods are as simplistic as the example above. After all, what good are methods if you can't interact with them? When you need to return something other than a fixed result, you need methods with parameters. Parameters are variables that your method will receive when it is called. You can have more meaningful and useful interactions with your methods by using parameters to make them more versatile.

~~~ruby
def greet(name)
  "Hello " + name + "!"
end

puts greet("John") #=> Hello John!
~~~

In this simple example, `name` is a parameter that the `greet` method uses to return a more specific greeting. The method is called with the argument `"John"`, and returns the string "Hello John!"

You might be confused when to use the term *argument* vs. *parameter*. Don't be: parameters effectively act as placeholder variables in the template that is your method, while arguments are the actual variables that get passed to the method when it is called. The two terms are commonly used interchangeably, so don't worry too much about it.

#### Default Parameters

What if you don't always want or need to provide arguments for each parameter that your method accepts? That's where default parameters can be useful. Going back to our simple example above, what if we don't know the person's name? We can code our `greet` method to use a default `name` of "stranger":

~~~ruby
def greet(name = "stranger")
  "Hello " + name + "!"
end

puts greet("Jane") #=> Hello Jane!
puts greet #=> Hello stranger!
~~~

### What Methods Return

An important detail that a programmer must learn is understanding what your methods *return*. But how do we tell our methods what to return? Let's revisit our "Joe Smith" example:

~~~ruby
def my_name
  "Joe Smith"
end

puts my_name #=> "Joe Smith"
~~~

Our `my_name` method returns "Joe Smith". This may seem obvious, because it's the only thing inside the method. In most languages, however, such a method would not return anything, because it does not have an *explicit return* statement. Ruby is one of a few languages that employs *implicit returns* for methods.

The above example could just as well be written with an explicit return:

~~~ruby
def my_name
  return "Joe Smith"
end

puts my_name #=> "Joe Smith"
~~~

With *implicit returns*, the rule to keep in mind is that Ruby methods always return the last expression which is evaluated. This may or may not be the last line in the code, as you can see in the following example.

~~~ruby
def even_odd(number)
  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(16) #=>  That is an even number.
puts even_odd(17) #=>  That is an odd number.
~~~

Here, the method's return is dependent on the result of the `if` condition. If the argument is an even number, the expression inside the `else` statement never gets evaluated, so `even_odd` returns "That is an even number."

*Explicit returns* can still have a place in Ruby code. Remember, Ruby returns the last expression evaluated. An *explicit return* (using the keyword `return`) essentially tells Ruby: "This is the last expression you should evaluate." Here's an example that shows how `return` stops the method from continuing.

~~~ruby
def my_name
  return "Joe Smith"
  "Jane Doe"
end

puts my_name #=> "Joe Smith"
~~~

Having a good understanding of just what your methods are returning is an important part of debugging your code when things don't behave as expected. Practice will help you understand this concept better.

#### Difference Between `puts` and `return`

A common source of confusion for new programmers is the difference between `puts` and `return`.

`puts` is an instruction (it's actually a method as you just learned) to print to the console whatever you tell it to.
`return` is the final outcome of a method that you can make use of, as discussed in detail above. For example, you can have a method which calculates the multiplication of 3 and 10:

~~~ruby
def dirty_thirty
  3 * 10
end
~~~

You can then interact with this outcome in other places in your code:

~~~ruby
puts "Yup I am turning " + dirty_thirty.to_s + " this year."
#=>  Yup I am turning 30 this year.
~~~

You can see that the result (return) of the `dirty_thirty` method is just a piece of the output produced by this `puts` statement.

### Chaining Methods

To keep you from having to write multiple lines when performing several actions (methods) on an object, Ruby allows you to chain your methods together. (This can be done with the built-in methods, or methods which you have written.)

~~~ruby
phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
#=> To be or not to be
~~~

You are effectively having each method building off of the outcome of the previous method in the chain. The process that takes place produces the following steps, in order:

~~~
["be", "to", "not", "or", "be", "to"].reverse
= ["to", "be", "or", "not", "to", "be"].join(" ")
= "to be or not to be".capitalize
= "To be or not to be"
~~~

### Best practices

We told you earlier that you can pretty much give your own methods any name you want. But you shouldn't do this haphazardly. For example, don't name your method `do_stuff`. There are certain conventions that are recommended in order to improve readability and maintainability of your code.

You can use numbers, capital letters, lowercase letters, and the special characters `_`, `?`, `!`, and `=` in your method names. The convention for multiple words in a name is to use "snake_case", separating words with underscores.

Here are some things you are not allowed to do:
* You cannot name your method one of Ruby's approximately 40 reserved words, such `end`, `while`, or `for`. Do a quick scan of the [full list here](http://www.java2s.com/Code/Ruby/Language-Basics/Rubysreservedwords.htm)
* You cannot use any symbols other than `_`, `?`, `!`, and `=`
* You cannot use `?`, `!`, or `=` anywhere other than at the end of the name
* You cannot begin a method name with a number

Some examples of valid and invalid method names:

~~~
method_name     # valid
_name_of_method # valid
1method_name    # invalid
method_27       # valid
method?_name    # invalid
method_name!    # valid
begin           # invalid  (Ruby reserved word by itself)
begin_count     # valid
~~~

#### Too Long a Name / Too Many Parameters

In general, short but descriptive is the name of the naming-game.  You want to be able to tell what a method is expected to do based on its name.

Another thing to consider is that, if your method does too many things such that you feel it requires a very long name, then your method should probably be broken up into several smaller/simpler methods. Methods should in reality only do one thing. This practice will pay dividends down the road, again for readability, scalability and maintainability. (It also makes testing your code a lot easier, which will be covered in a later lesson.)

The same idea applies if you find your method accepting too many parameters/arguments. If it is accepting numerous arguments, it is probably doing too many things, and should be broken up into individual simpler methods doing individual tasks.


#### Predicate Methods

You will at times encounter some built-in Ruby methods that have a `?` mark at the end of their name. Such as `even?`, `odd?`, `between?` and many more.  These are called `predicate` methods. Ruby uses this naming convention for any method that strictly returns a Boolean, that is either `true` or `false`.

~~~ruby
puts 5.even?  #=> false
puts 6.even?  #=> true
puts 17.odd?  #=> true

puts 12.between?(10, 15)  #=> true
~~~

You can also name your own methods with a `?` a the end to indicate your method returns a Boolean. (Just note that Ruby does not enforce this, but you will thank yourself later for following this convention).

### Bang Methods

Observe the example below:

~~~ruby
whisper = "HELLO EVERYBODY"

puts whisper.downcase #=> hello everybody
puts whisper #=> HELLO EVERYBODY
~~~

What gives?  I thought we downcased that thing!  So why did it not change when we called it again?
<br/>
What happens is that calling a method on an object, such as our string above, does not actually modify the original value of that object. A general rule in programming is that you do not want your methods to overwrite the objects you call them on. This is to protect you from irreversibly overwriting your data by accident. Though you *ARE* able to do so by explicitly re-assigning a variable (such as whisper = whisper.downcase). But another way to do this is with *bang methods*, which are denoted with the `!` symbol.

By just adding a `!` to the end of your method, you are indicating that this method is going to perform its action and also apply the result to override the value of the original object.

~~~ruby
puts whisper.downcase! #=> hello everybody
puts whisper #=> hello everybody
~~~

Writing `whisper.downcase!` is the equivalent of writing `whisper = whisper.downcase`.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. To get a good introduction to all the different concepts related to methods read [this chapter about methods](https://launchschool.com/books/ruby/read/methods) from Launch School's Introduction to Programming with Ruby book. Make sure to do the exercises at the end of the chapter too.
2. For a deeper look at methods read [this chapter](http://ruby.bastardsbook.com/chapters/methods/) from the Bastards book of Ruby. Again try to complete the exercises throughout the chapter. 
</div> 

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

  - Within the context of Ruby, you will only be writing methods.  But for future learning, as you add more languages to your repertoire (cause any seasoned programmer worth their salt eventually will have learned several languages over the course of their careers), here is a [handy explanation on Stack Overflow](https://stackoverflow.com/questions/155609/difference-between-a-method-and-a-function) on the subtle differences between methods and functions, and how they can differ by language.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* How would you create your own custom method?
* How would you *call* your own method?
* How do you pass variables to your method?
* How do you define default parameters for your method?
* What is the difference between an *explicit* and *implicit* return in your methods?
* What is the difference between `puts` and `return`?
* How do you chain multiple methods together?
* Give an example of a valid method name and an invalid method name.
* What does "snake case" naming mean?
* What are some of Ruby's reserved words?
* What do you call a method that returns `true` or `false`? How are they named?
* What do bang methods do? How are they conventionally named?