### Introduction
Having to locate and fix errors and failures in your code is an inevitable part of being a developer. The art of finding the cause of problems and fixing them in code is known as **debugging**. [The origin of the term](https://en.wikipedia.org/wiki/Debugging#Origin_of_the_term)
is a classic computer science tale worth knowing if you haven't heard it already.

In this lesson we will cover all of the main techniques you can use to debug your code when you
run into a problem.

### Learning Outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* What is a stack trace?
* what generally the most useful line in a stack trace?
* What are the two things you can learn from the first line of a stack trace?
* What does debugging with `puts` and Pry help you with in the debugging process?
* What should you use instead of `puts` on its own?
* Where should you start with debugging if you encounter a runtime error?
* Where should you start with debugging if your program runs but does not work the way you expect?

### Reading the Stack Trace
When your Ruby program crashes after encountering a runtime error/exception, it will produce a wall of text known as a **stack trace** and output it in your terminal.
It looks something like this:

<a href="https://i.imgur.com/UmoEQBD.png"><img class="tutorial-img" src="https://i.imgur.com/UmoEQBD.png" title="source: imgur.com" /></a>

Don't let the stack trace intimidate you. You don't need to read it all or even know what most of it means.

The stack trace prints each line of code in your program that were executed before it crashed. The very first line of the stack trace will generally provide the most useful information about the error your program encountered:

<a href="https://i.imgur.com/5LJDp9v.png"><img class="tutorial-img" src="https://i.imgur.com/5LJDp9v.png" title="source: imgur.com" /></a>

First, this line of the stack trace will tell you what specific line caused the runtime error. In the above example, the error was encountered in line 30 of `lib/bottles.rb`. This line will also provide a brief explanation of the error, as well as the name of error, (in this case, [`NameError`](https://ruby-doc.org/core-2.6/NameError.html)). And yes, Ruby [errors](https://ruby-doc.org/core-2.6/Exception.html) are *also* objects.

And there you have it. The stack trace really is that simple. At this point, you know where in your code the exception is being raised, and you know the kind of error you're dealing with. You might even know what fixes need to be implemented.

What if you don't know? Enter a simple technique known as...

### Puts Debugging
The debugging process is all about confirming assumptions about your code until you find something that goes against your assumptions. For example, does a variable or method return what you expect? Does a calculation or iteration over an array or hash output what you expect?


The easiest and quickest way to confirm your assumptions while debugging is using one or more `puts` statements to output the return value of variables, methods, calculations, iterations, or even entire lines of code to your terminal.

Let's say, for *whatever* reason, we need to write a method that takes a string and doubles each word in that string. Perhaps a hostage situation that requires a pro debugger? Either way, let's take a look at a (simple, contrite) first draft:

~~~ruby
def double_words_in_phrase(string)
  string_array = string.split(' ')
  string_array.map { |word| word * 2}
  string_array.join(' ')
end

double_words_in_phrase("This is a test")

#=> "This is a test"
~~~

Okay, that didn't work and we totally expected that. Actually no, we didn't expect that. The method didn't throw an exception, so we don't even have a line to start debugging at.

We know that `string_array.join(' ')` returns `"This is a test"` since it's the last statement, so why not place a `puts` on the line before to see what `string_array` is. `p` is also commonly used for debugging, as it is a combination of `puts` and `inspect` (more on that below):

~~~ruby
def double_words_in_phrase(string)
  string_array = string.split(' ')
  string_array.map { |word| word * 2}

  p string_array

  string_array.join(' ')
end

double_words_in_phrase("This is a test")

["This", "is", "a", "test"]
#=> "This is a test"
~~~

*INTERESTING*. Using `p` on `string_array` prints it out, and shows us that the words aren't doubled at all. Something must be wrong with how we called `#map` on `string_array`. For verification, you could also place another `p` statement before the `map` statement...

~~~ruby
def double_words_in_phrase(string)
  string_array = string.split(' ')

  p string_array

  string_array.map { |word| word * 2}
  string_array.join(' ')
end

double_words_in_phrase("This is a test")

["This", "is", "a", "test"]
#=> "This is a test"
~~~

...and confirm `#map` didn't do the trick.

Indeed, we didn't use `#map` correctly, as this particular method creates a new array rather than acting on the array it's called on. Try running the above code in a REPL, using `#map!` instead, and you'll see the difference.

Hostage situation resolved! That wasn't so bad, was it?

#### Puts Debugging: Caveats
Using `puts` is a great way to debug, but there's a **YUGE** caveat with using it: calling `puts` on anything that is `nil`, or on an empty string or collection, will just print a blank line in your terminal.

This is one instance where using `p` will yield more information. As mentioned above, `p` is a combination of `puts` and [#inspect](https://ruby-doc.org/core-2.6.1/Object.html#method-i-inspect), the latter of which essentially prints a string representation of whatever it's called on. To illustrate this, try the following in a REPL:

~~~ruby
puts "Using puts:"
puts []
puts "Using p:"
p []
~~~

### Using PRY
[Pry](https://github.com/pry/pry) is a Ruby gem that provides you with an interactive [REPL](https://www.rubyguides.com/2018/12/what-is-a-repl-in-ruby/) while your program is running. It's very similar to IRB, but with added functionality.

You can use Pry to debug by first installing it in your terminal by running `gem install pry`. You can then make it available in your program by requiring it at the top of your file with `require 'pry'`. Finally to use Pry you just need to call `binding.pry` at any point in your program.

~~~ruby
# script.rb

require 'pry'

def double_words_in_phrase(string)
  string_array = string.split(' ')

  binding.pry

  string_array.map { |word| word * 2}
  string_array.join(' ')
end
~~~

When your code executes and gets to `binding.pry`, it will open an IRB-like session in your terminal. You can then use that session to check the values of anything within the scope of where you included `binding.pry`.

Using Pry to debug achieves the same outcome as `puts` debugging: it allows you to confirm the assumptions you have about particular parts of your code. If your code is complex, Pry will probably allow you to debug quicker thanks to it's interactive, runtime environment. In such scenarios, Pry will be easier to interact with, rather than adding many `puts` statements everywhere and re-running your code again each time.

There is a lot, lot more you can do with Pry which is out of the scope of this lesson. Check out the assignments and extra resources to find out where you can learn more about this useful gem.

### Where to start when debugging
Programs generally go wrong due to two main reasons:

1. The program encounters an error and won't run. For example, a typo may cause a
syntax error to be raised that causes the program to crash. In this case, Ruby provides a stack trace; OR,

2. The program runs, but does not work the way you expect. For example you expect a method to return a `2`, but it actually returns `6` when you run it. In this case, there is no stack trace.

Obviously, if available, the stack trace is the first place you should look when debugging. Otherwise, `puts` and Pry are the some of the easiest and quickest tools you can use to get yourself back up and running.

### Assignment
1. Go through Ruby Guides's [Ruby Debugging](https://www.rubyguides.com/2015/07/ruby-debugging/) tutorial, which covers everything about debugging in more depth.
2. Read through the [Exceptions and Stack Traces]((https://launchschool.com/books/ruby/read/more_stuff#readingstacktraces)) section of Launch School's online book *Introduction to Programming with Ruby*
3. Follow along with [this Pry tutorial](https://learn.co/lessons/debugging-with-pry) by Learn.co.

### Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [HOWTO debug your Ruby code](https://readysteadycode.com/howto-debug-your-ruby-code), especially the first section on `puts` debugging, by ReadySteadyCode.
* [Debugging without doom and gloom](https://practicingruby.com/articles/debugging-without-doom-and-gloom), by Practicing Ruby.
* [Pry's wiki](https://github.com/pry/pry/wiki), for a collection of resources that'll help you master this invaluable gem.
