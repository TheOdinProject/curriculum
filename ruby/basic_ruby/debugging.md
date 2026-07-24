### Introduction

Tracking down and fixing both errors and unexpected behavior in your code is an inevitable part of being a developer. The art of finding the cause of problems and then fixing them in code is known as **debugging**. The [origin of the term "debugging"](https://en.wikipedia.org/wiki/Debugging#Etymology) is a classic computer science tale worth reading if you haven’t already.

In this lesson, we'll cover some of the main techniques you can use to debug your code when you run into a problem.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What a stack trace is.
- Using a stack trace to debug your code.
- Using `puts`, `p`, and `binding.irb` to debug your code.
- How you should decide to start with debugging.

### Reading the stack trace

When your Ruby program crashes after encountering a runtime error or exception, it will produce a wall of text known as a **stack trace** that is then output in your terminal. A stack trace looks something like this:

![Sample stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/00.png)

Don't let the stack trace intimidate you. You don't need to read it all or even know what most of it means.

The stack trace prints each line of code in your program that was executed before it crashed. <span id='most-useful-stack-trace-line'>The very first line of the stack trace</span> will generally provide the most useful information about the error your program encountered:

![First line of stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/01.png)

<span id='stack-trace-first-line-info'>First, this line of the stack trace will tell you what specific line caused the runtime error. In the above example, the error was encountered in line 31 of the file `bottles.rb`. This line also provides a brief explanation of the error and the name of the error. (In this case, it's a [`NameError`](https://docs.ruby-lang.org/en/3.4/NameError.html)). And yes, in Ruby, [errors (Exceptions) are also objects](https://docs.ruby-lang.org/en/3.4/Exception.html).</span>

There you have it. At this point, you know where in your code the exception is being raised, and you know the type of error you're dealing with. You might even know what fixes need to be implemented in your code.

But what if you don't know how to fix your code? Then it's time to dive into debugging!

### Debugging with puts

The debugging process is all about confirming assumptions about your code until you find something that goes against your assumptions. For example, does a variable or method return what you expect? Does a calculation or iteration over an array or hash give the output you expect?

The easiest and quickest way to confirm your assumptions while debugging is by using `puts` statements to output the return value of variables, methods, calculations, iterations, or even entire lines of code to your terminal.

Let's say that for *whatever* reason, we need to write a method that takes a string and checks if the string is an **isogram** (a word that has no repeating letters) or not. Perhaps it's a hostage situation that requires a pro debugger? Let's take a look at a first draft:

```ruby
def isogram?(string)
  original_length = string.length
  string_array = string.downcase.split
  unique_length = string_array.uniq.length
  original_length == unique_length
end

isogram?("Odin")

#=> false
```

Okay, that didn't work. We didn't expect that. Why? Because the string *Odin* is an isogram but we got `false`. The method didn't throw an exception, so we don't even have a line to start debugging at. Now what?

We know that `original_length == unique_length` returns `false` since it's the last statement, so why not place a `puts` on the line before that to see what `unique_length` is. As an alternative to `puts`, `p` is also commonly used for debugging; `p` is a combination of `puts` and `inspect` (more on that below). To better show the differences between what Ruby is printing to the terminal and returning, the examples in this section use the full IRB syntax, which is exactly what you'd see if you typed these commands into your own terminal IRB session.

```ruby
irb(main):001:1* def isogram?(string)
irb(main):002:1*   original_length = string.length
irb(main):003:1*   string_array = string.downcase.split
irb(main):004:1*   unique_length = string_array.uniq.length
irb(main):005:1*
irb(main):006:1*   p unique_length
irb(main):007:1*
irb(main):008:1*   original_length == unique_length
irb(main):009:0> end
=> :isogram?
irb(main):010:0> isogram?("Odin")
1
=> false
```

*INTERESTING*. Using `p` on `unique_length` prints it to the console and shows us something must be wrong with how we called `#uniq` on `string_array` because we know that we have `4` unique characters in our input but we got `1` as output. For verification, let's place another `p` statement before the `unique_length` statement:

```ruby
irb(main):001:1* def isogram?(string)
irb(main):002:1*   original_length = string.length
irb(main):003:1*   string_array = string.downcase.split
irb(main):004:1*
irb(main):005:1*   p string_array
irb(main):006:1*
irb(main):007:1*   unique_length = string_array.uniq.length
irb(main):008:1*
irb(main):009:1*   p unique_length
irb(main):010:1*
irb(main):011:1*   original_length == unique_length
irb(main):012:0> end
=> :isogram?
irb(main):013:0> isogram?("Odin")
["odin"]
1
=> false
```

Indeed, we didn't use `#split` correctly, as it creates an array with the given string rather than an array of the string's characters. Why? By default, if we didn’t provide arguments, [the #split method](https://docs.ruby-lang.org/en/3.4/String.html#method-i-split) will divide the string using `whitespace` as the delimiter. Try running the above code in IRB using `#split('')` or an appropriate online REPL instead, and you'll see the difference.

Hostage situation resolved! That wasn't so bad, was it?

#### Debugging with puts and nil

Using `puts` is a great way to debug, but there's a **HUGE** caveat with using it: calling `puts` on anything that is `nil` or an empty string or collection will just print a blank line to your terminal.

This is one instance where using `p` will yield more information. As mentioned above, `p` is a combination of puts and [the #inspect method](https://docs.ruby-lang.org/en/3.4/Object.html#method-i-inspect), the latter of which essentially prints a string representation of whatever it's called on. To illustrate this, try the following in a REPL:

```ruby
puts "Using puts:"
puts []
p "Using p:"
p []
```

### Debugging with binding.irb

You're hopefully familiar with the IRB tool for running a Ruby [REPL](https://www.rubyguides.com/2018/12/what-is-a-repl-in-ruby/) in your terminal. So far, you've probably just used it as a standalone tool to test simple code out, but you can also use it to get an interactive debugging experience with a running Ruby program. To do so, you just need to add a line with `binding.irb` in your script. Let's look at an example.

To follow along with this, save the following code into a Ruby file (e.g., `script.rb`) and then run the file in your terminal (e.g., `ruby script.rb`)

```ruby
def isogram?(string)
  original_length = string.length
  string_array = string.downcase.split

  binding.irb

  unique_length = string_array.uniq.length
  original_length == unique_length
end

isogram?("Odin")
```

When your code executes and gets to `binding.irb`, it will open an IRB session in your terminal. You can then use that session to check the values of anything within the scope of where you included `binding.irb`. However, keep in mind that any code written *after* the `binding.irb` statement will not have been evaluated yet.

For example, here `original_length` and `string_array` are in scope. However, `unique_length` is not in scope, because it is written after `binding.irb`.

You can add `binding.irb` at multiple points in the execution of your program. To see this in action, try running the following:

```ruby
def yell_greeting(string)
  name = string

  binding.irb

  name = name.upcase
  greeting = "WASSAP, #{name}!"

  binding.irb

  puts greeting
end

yell_greeting("bob")
```

During the session, if you check for the value of `name`, you will notice that you get back the value `bob` instead of `BOB`. What value do you think `greeting` will return? Yup, it will be `nil`. This is because `name = name.upcase` and `greeting = "WASSAP, #{name}!"` occurred after the first `binding.irb` call and were never evaluated.

To proceed with the program, you can run the `exit` command, which will end the first IRB session and continue execution of the code. Because there's a 2nd `binding.irb`, it stops again. You can now see how `name` has changed and what `greeting` has been defined as.

```ruby
[1] irb(main)> name
=> "bob"
[2] irb(main)> greeting
=> nil
[3] irb(main)> exit

     5: def yell_greeting(string)
     6:   name = string
     7:
     8:   binding.irb
     9:
    10:   name = name.upcase
    11:   greeting = "WASSAP, #{name}!"
    12:
 => 13:   binding.irb
    14:
    15:   puts greeting
    16: end

[4] irb(main)> name
=> "BOB"

```

As you can see, using `binding.irb` for debugging achieves the same outcome as `puts` debugging: it allows you to confirm the assumptions you have about particular parts of your code. If your code is complex, `binding.irb` may allow you to debug more quickly thanks to its interactive runtime environment. In such scenarios, IRB will be easier to interact with than having to add `puts` statements everywhere and re-running your code each time.

### How to start debugging

Programs generally go wrong due to two main reasons:

1. The program encounters an error and won't run. For example, a typo may cause a syntax error to be raised that causes the program to crash. In this case, Ruby provides a stack trace.

1. The program runs but does not work the way you expect. For example, you expect a method to return a `2`, but it actually returns `6` when you run it. In this case, there is no stack trace.

Obviously, if available, <span id='debugging-with-stack-trace'>the stack trace is the first place you should look when debugging.</span> <span id='debugging-without-stack-trace'>If there's no stack trace, then `puts` and `binding.irb` are the easiest and quickest tools you can use to get yourself back up and running.</span>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read through the [Exceptions and Stack Traces](https://launchschool.com/books/ruby/read/more_stuff#readingstacktraces) section of Launch School's online book *Introduction to Programming with Ruby*.
1. Let's practice debugging by completing the debugging exercises from the [ruby-exercises repo](https://github.com/TheOdinProject/ruby-exercises) that you previously cloned.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is a stack trace?](#reading-the-stack-trace)
- [What is generally the most useful line in a stack trace?](#most-useful-stack-trace-line)
- [What are the two things you can learn from the first line of a stack trace?](#stack-trace-first-line-info)
- [How do `puts` and Pry help you in the debugging process?](#debugging-with-puts)
- [What should you use instead of `puts` for `nil` values?](#debugging-with-puts-and-nil)
- [How does `binding.irb` help you in the debugging process?](#debugging-with-bindingirb)
- [Where should you start with debugging if you encounter a runtime error?](#debugging-with-stack-trace)
- [Where should you start with debugging if your program runs but does not work the way you expect?](#debugging-without-stack-trace)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Read through [HOWTO debug your Ruby code](https://readysteadycode.com/howto-debug-your-ruby-code), especially the first section on `puts` debugging, by ReadySteadyCode.
- Read this brilliant article about [reading Ruby error messages](https://medium.com/@roni.shabo/overcoming-ruby-error-messages-ebf53928b64e).
