### Introduction
Tracking down and fixing both errors and unexpected behavior in your code is an inevitable part of being a developer. The art of finding the cause of problems and then fixing them in code is known as **debugging**. The [origin of the term](https://en.wikipedia.org/wiki/Debugging#Origin_of_the_term) is a classic computer science tale worth reading if you haven't already.

In this lesson, we'll cover all of the main techniques you can use to debug your code when you run into a problem.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe what a stack trace is.
 - Explain how you can use a stack trace to debug your code.
 - Explain how you can use `puts` and Pry to debug your code.
 - Explain how you should decide to start with debugging.

### Reading the Stack Trace
When your Ruby program crashes after encountering a runtime error or exception, it will produce a wall of text known as a **stack trace** that is then output in your terminal. A stack trace looks something like this:

<a href="https://cdn.statically.io/gh/TheOdinProject/curriculum/284f0cdc998be7e4751e29e8458323ad5d320303/ruby_programming/basic_ruby/debugging/imgs/00.png"><img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/284f0cdc998be7e4751e29e8458323ad5d320303/ruby_programming/basic_ruby/debugging/imgs/00.png" title="source: imgur.com" alt="sample stack trace"/></a>

Don't let the stack trace intimidate you. You don't need to read it all or even know what most of it means.

The stack trace prints each line of code in your program that was executed before it crashed. The very first line of the stack trace will generally provide the most useful information about the error your program encountered:

<a href="https://cdn.statically.io/gh/TheOdinProject/curriculum/284f0cdc998be7e4751e29e8458323ad5d320303/ruby_programming/basic_ruby/debugging/imgs/01.png"><img class="tutorial-img" src="https://cdn.statically.io/gh/TheOdinProject/curriculum/284f0cdc998be7e4751e29e8458323ad5d320303/ruby_programming/basic_ruby/debugging/imgs/01.png" title="source: imgur.com" alt="first line of stack trace" /></a>

First, this line of the stack trace will tell you what specific line caused the runtime error. In the above example, the error was encountered in line 30 of the file `lib/bottles.rb`. This line also provides a brief explanation of the error and the name of the error. (In this case, it's a [`NameError`](https://ruby-doc.org/core-2.6/NameError.html)). And yes, in Ruby, [errors](https://ruby-doc.org/core-2.6/Exception.html) are *also* objects.

There you have it. The stack trace really is that simple. At this point, you know where in your code the exception is being raised, and you know the type of error you're dealing with. You might even know what fixes need to be implemented in your code.

But what if you don't know how to fix your code? Then it's time to dive into debugging!

### Debugging with puts
The debugging process is all about confirming assumptions about your code until you find something that goes against your assumptions. For example, does a variable or method return what you expect? Does a calculation or iteration over an array or hash give the output you expect?

The easiest and quickest way to confirm your assumptions while debugging is by using `puts` statements to output the return value of variables, methods, calculations, iterations, or even entire lines of code to your terminal.

Let's say that for *whatever* reason, we need to write a method that takes a string and doubles each word in that string. Perhaps it's a hostage situation that requires a pro debugger? Let's take a look at a (simple) first draft:

~~~ruby
def double_words_in_phrase(string)
  string_array = string.split(' ')
  string_array.map { |word| word * 2 }
  string_array.join(' ')
end

double_words_in_phrase("This is a test")

#=> "This is a test"
~~~

Okay, that didn't work. We didn't expect that. The method didn't throw an exception, so we don't even have a line to start debugging at. Now what?

We know that `string_array.join(' ')` returns `"This is a test"` since it's the last statement, so why not place a `puts` on the line before that to see what `string_array` is. As an alternative to `puts`, `p` is also commonly used for debugging; `p` is a combination of `puts` and `inspect` (more on that below). To better show the differences between what Ruby is printing to the terminal and returning, the examples in this section use the full IRB syntax, which is exactly what you'd see if you typed these commands into your own terminal IRB session.

~~~ruby
irb(main):001:0> def double_words_in_phrase(string)
irb(main):002:1>   string_array = string.split(' ')
irb(main):003:1>   string_array.map { |word| word * 2 }
irb(main):004:1>
irb(main):005:1>   p string_array
irb(main):006:1>
irb(main):007:1>   string_array.join(' ')
irb(main):008:1> end
=> :double_words_in_phrase

irb(main):009:0> double_words_in_phrase("This is a test")
["This", "is", "a", "test"]
=> "This is a test"
~~~

*INTERESTING*. Using `p` on `string_array` prints it to the console and shows us that the words aren't doubled at all. Something must be wrong with how we called `#map` on `string_array`. For verification, let's place another `p` statement before the `map` statement:

~~~ruby
irb(main):001:0> def double_words_in_phrase(string)
irb(main):002:1>   string_array = string.split(' ')
irb(main):003:1>
irb(main):004:1>   p string_array
irb(main):005:1>
irb(main):006:1>   string_array.map { |word| word * 2 }
irb(main):007:1>   p string_array
irb(main):008:1>   string_array.join(' ')
irb(main):009:1> end
=> :double_words_in_phrase

irb(main):010:0> double_words_in_phrase("This is a test")
["This", "is", "a", "test"]
["This", "is", "a", "test"]
=> "This is a test"
~~~

Indeed, we didn't use `#map` correctly, as this particular method creates a new array rather than acting on the array it's called on. Try running the above code in a REPL or IRB using `#map!` instead, and you'll see the difference.

Hostage situation resolved! That wasn't so bad, was it?

#### Debugging with `puts` and `nil`
Using `puts` is a great way to debug, but there's a **HUGE** caveat with using it: calling `puts` on anything that is `nil` or an empty string or collection will just print a blank line to your terminal.

This is one instance where using `p` will yield more information. As mentioned above, `p` is a combination of `puts` and [#inspect](https://ruby-doc.org/core-2.6.1/Object.html#method-i-inspect), the latter of which essentially prints a string representation of whatever it's called on. To illustrate this, try the following in a REPL:

~~~ruby
puts "Using puts:"
puts []
p "Using p:"
p []
~~~

### Debugging with Pry-byebug
[Pry](https://github.com/pry/pry) is a Ruby gem that provides you with an interactive [REPL](https://www.rubyguides.com/2018/12/what-is-a-repl-in-ruby/) while your program is running. The REPL provided by Pry is very similar to IRB but has added functionality. The recommended Ruby gem for debugging is [Pry-byebug](https://github.com/deivid-rodriguez/pry-byebug) and it includes Pry as a dependency. Pry-byebug adds step-by-step debugging and stack navigation.  

To use Pry-byebug, you'll first need to install it in your terminal by running `gem install pry-byebug`. You can then make it available in your program by requiring it at the top of your file with `require 'pry-byebug'`. Finally, to use Pry-byebug, you just need to call `binding.pry` at any point in your program.

To follow along with these examples save the code into a Ruby file (e.g., `script.rb`) and then run the file in your terminal (e.g., `ruby script.rb`)

~~~ruby
require 'pry-byebug'

def double_words_in_phrase(string)
  string_array = string.split(' ')

  binding.pry

  string_array.map { |word| word * 2 }
  string_array.join(' ')
end

double_words_in_phrase("This is a test")
~~~

When your code executes and gets to `binding.pry`, it will open an IRB-like session in your terminal. You can then use that session to check the values of anything within the scope of where you included `binding.pry`. However, keep in mind that any code written *after* the `binding.pry` statement will not have been evaluated during the Pry session. Thus, adding a `binding.pry` line in our code is similar to creating a breakpoint in JavaScript.

To see this point in action, try running the following:

~~~ruby
require 'pry-byebug'

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end

yell_greeting("bob")
~~~

During the session, if you check for the value of `name`, you will notice that you get back the value `bob` instead of `BOB`. What value do you think `greeting` will return? Yup, it will be `nil`. This is because `name = name.upcase` and `greeting = "WASSAP, #{name}!"` occurred after the `binding.pry` call and were never evaluated.

Using the same example above, you can use one of pry-byebug's commands to figure out what `name = name.upcase` will return. You won't need to quit the session or add another `binding.pry` beneath it. Enter `next` to step over to the next line.   

~~~ruby
[1] pry(main)> name
=> "bob"
[2] pry(main)> greeting
=> nil
[3] pry(main)> next

     5: def yell_greeting(string)
     6:   name = string
     7: 
     8:   binding.pry
     9: 
    10:   name = name.upcase
 => 11:   greeting = "WASSAP, #{name}!"
    12:   puts greeting
    13: end

[4] pry(main)> name
=> "BOB"

~~~

It stops after evaluating the next line. `name` now returns `BOB`. Calling `next` again will evaluate the following line. Try it out to know what `greeting` will return. Pry-byebug has a few more commands, play around with them to get a feel of what they do. You can find the commands with a short description of what they do [here](https://github.com/deivid-rodriguez/pry-byebug).

As you can see, using Pry-byebug for debugging achieves the same outcome as `puts` debugging: it allows you to confirm the assumptions you have about particular parts of your code. If your code is complex, Pry-byebug will probably allow you to debug quicker thanks to its interactive runtime environment. In such scenarios, Pry-byebug will be easier to interact with than having to add `puts` statements everywhere and re-running your code each time.

There is far, far more that you can do with Pry-byebug, but that's beyond the scope of this lesson. Check out the Assignments and Additional Resources to find out where you can learn more about this useful gem.

### How to Start Debugging
Programs generally go wrong due to two main reasons:

1. The program encounters an error and won't run. For example, a typo may cause a syntax error to be raised that causes the program to crash. In this case, Ruby provides a stack trace.

2. The program runs but does not work the way you expect. For example, you expect a method to return a `2`, but it actually returns `6` when you run it. In this case, there is no stack trace.

Obviously, if available, the stack trace is the first place you should look when debugging. If there's no stack trace, then `puts` and Pry are the easiest and quickest tools you can use to get yourself back up and running.

### Assignment
<div class="lesson-content__panel" markdown="1">

1. Go through the Ruby Guides [Ruby Debugging](https://www.rubyguides.com/2015/07/ruby-debugging/) tutorial, which covers everything about debugging in more depth.
2. Read through the [Exceptions and Stack Traces](https://launchschool.com/books/ruby/read/more_stuff#readingstacktraces) section of Launch School's online book *Introduction to Programming with Ruby*.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* Read through [HOWTO debug your Ruby code](https://readysteadycode.com/howto-debug-your-ruby-code), especially the first section on `puts` debugging, by ReadySteadyCode.
* Read the article on [Debugging without doom and gloom](https://practicingruby.com/articles/debugging-without-doom-and-gloom) by Practicing Ruby.
* Poke around [Pry's wiki](https://github.com/pry/pry/wiki) for a collection of resources that will help you master this invaluable gem.
* Read [this](https://medium.com/@roni.shabo/overcoming-ruby-error-messages-ebf53928b64e) brilliant error about reading Ruby error messages

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

 * What is a stack trace?
 * What is generally the most useful line in a stack trace?
 * What are the two things you can learn from the first line of a stack trace?
 * How do `puts` and Pry help you in the debugging process?
 * What should you use instead of `puts` for `nil` values?
 * Where should you start with debugging if you encounter a runtime error?
 * Where should you start with debugging if your program runs but does not work the way you expect?
