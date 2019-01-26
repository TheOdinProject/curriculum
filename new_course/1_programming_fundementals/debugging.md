### Introduction
Having to fix errors and failures in your code is an inevitable part of being a developer.
The art of finding the cause of problems and fixing them in code is known as debugging.

[The origin of the term debugging](https://en.wikipedia.org/wiki/Debugging#Origin_of_the_term)
is a classic computer science tale worth knowing if you haven't heard the story already.

In this lesson we will cover all of the main techniques you can use to debug your code when you
run into a problem.

### Learning Outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* What is a stack trace?
* what generally the most useful line in a stack trace?
* What are the two things you can learn from the first line of a stack trace?
* What does debugging with puts and Pry help you with in the debugging process?
* What should you use instead of puts on its own?
* Where should you start with debugging if you encounter a runtime error?
* Where should you start with debugging if your program runs but does not work the way you expect?

### Reading the stack trace
When your program crashes in Ruby, it will produce a wall of text known as a stack trace and output it in your terminal.
It looks like this:

<a href="https://i.imgur.com/UmoEQBD.png"><img class="tutorial-img" src="https://i.imgur.com/UmoEQBD.png" title="source: imgur.com" /></a>

Don't let it intimidate you, you don't need to read it all or even know what most of it means.
Each line in your stack trace represents the lines of code in your program that were executed before it crashed.

The very first line at the top of the stack trace is the line of code in which the program crashed. This is where
the most useful information can usually be found about the error it encountered.

<a href="https://i.imgur.com/5LJDp9v.png"><img class="tutorial-img" src="https://i.imgur.com/5LJDp9v.png" title="source: imgur.com" /></a>

It tells you what type of error Ruby encountered and the specific line it happened on in your program. With this information in
hand you can narrow down your debugging efforts significantly.

At this point you know what kind of error you're dealing with and you know exactly where its happening. You'll either know exactly what to do to fix it or you'll need to debug a bit further, which leads us to...

### Puts Debugging
The debugging process is all about confirming assumptions about your code until you find something that goes against your assumptions. for example, does a variable or method return what you expect? does a calculation or iteration over an array or hash output what you expect?

The easiest and quickest way to confirm your assumptions while debugging is using the a print or puts statements to output the return value of variables, methods, calculations, result of iterations or even entire lines of code to your terminal.

Just simply start outputting the return values of the parts of code where you think the problem may reside by using puts or print.

~~~ruby
def verses(start_verse, end_verse)
  puts start_verse
  puts end_verse
  start_verse.downto(end_verse).map { |number| verse(number) }.join("\n")
end
~~~

**Pro Tip**
Puts is a great way to debug but there are a couple of confusing traps with using it.

Such as when you `puts` something that is `nil` to your terminal. Doing that will
output a blank line which will make it hard to notice what your outputting actually
has a value of nil.

Another one is using `puts` with a empty array or blank string. Those will also
output empty lines.

This can however be avoided by using the `.inspect` method which gives you more
information about whatever you are outputting. for example `puts my_variable.inspect`.
It always outputs the actual value of the thing you use want to output to your terminal. eg `nil`, `[]` and `""`

Or you could just use `p my_variable` which is the equivalent of `print my_variable.inspect`.

### Using PRY
[Pry](https://github.com/pry/pry) is a Ruby gem that provides you with an interactive [REPL](https://www.rubyguides.com/2018/12/what-is-a-repl-in-ruby/). It's very similar to IRB, but with added functionality.

You can use Pry to debug by first installing it in your terminal by  running `bundle install pry`. You can then make it available in your program by requiring it at the top of your file `require 'pry'`. Finally to use Pry you just need to call `binding.pry` at any point in your program.

When your code executes and gets to `binding.pry` it will open an interactive Pry session in your Terminal. Using the interactive Pry session you can check and use the values of anything within the scope of where you included `binding.pry`.

Using Pry to debug achieves the same outcome as puts debugging, it allows you to confirm the assumptions you have about particular parts of your code. If your code is complex Pry will probably allow you to debug quicker as it gives you an environment to easily interact with your code in real time instead of using lots of puts statements and then having to run your code again each time you add a new puts to see new output.

There is a lot, lot more you can do with Pry which is out of the scope of this lesson. But checkout the assignments and extra resources to find out where you can learn more about this useful gem.

### Where to start when debugging
Programs generally go wrong due to two main reasons:

1. The Program encounters an error and won't run. For example a typo may cause a
syntax error to be raised that causes the program to crash. In this case you would
start by reading your stack trace and then moving on to debugging with puts/pry if
you don't know how to solve the problem after reading the stack trace.

2. The program does not work the way you expect, for example you expect a method
to return a `2` but it actually returns `6` when you run it. In this case you won't
have a stack trace so you'd want to go to straight to debugging with puts and/or Pry.

### Assignment
1. [Go through this Ruby Guides tutorial which covers everything about debugging in more depth.](https://www.rubyguides.com/2015/07/ruby-debugging/)
2. [Read through the Exceptions and Stack Traces section of Launch Schools Introduction to Programming with Ruby book](https://launchschool.com/books/ruby/read/more_stuff#readingstacktraces)
3. [Follow along with this Pry tutorial by Learn.co](https://learn.co/lessons/debugging-with-pry)

### Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [The first section of this article goes over how to puts debug with different explanations](https://readysteadycode.com/howto-debug-your-ruby-code)
* [A more advanced tutorial that covers everything in this lesson](https://practicingruby.com/articles/debugging-without-doom-and-gloom)
* [Check out Pry's wiki for a ton of resources that cover everything you would ever need to know about Pry](https://github.com/pry/pry/wiki)
