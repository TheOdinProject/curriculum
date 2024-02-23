### Introduction
To create programs that are user friendly and interactive, you'll need to know how to **output** data to a screen and how to get **input** from a user. In this lesson, we'll cover the most common ways to achieve these tasks in Ruby. As with other lessons, and this one in particular, following along in irb or a REPL will be helpful.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Differentiate between the `print` and `puts` commands.
- Describe the method used to get input from the user.

### Output commands
To output information, such as into your irb or REPL environment or into the command line, we can use the `print` command. To better show the differences between what Ruby is printing to the terminal and returning, the examples in this lesson use the full irb syntax, which is exactly what you'd see if you typed these commands into your own terminal irb session.

```ruby
irb(main):001:0> print "Learning to code is FUN!"
Learning to code is FUN!=> nil

irb(main):002:0> print "1234"
1234=> nil
```

We can also use the `puts` command:

```ruby
irb(main):001:0> puts "Learning to code is cool!!"
Learning to code is cool!!
=> nil

irb(main):002:0> puts "Hey, I want 2 key lime pies."
Hey, I want 2 key lime pies.
=> nil

irb(main):003:0> x = "My name is ALEX! :)"
=> "My name is ALEX! :)"

irb(main):004:0> puts x
My name is ALEX! :)
=> nil
```

As you can see, the `puts` and `print` commands are quite similar, but you should have already noticed the small difference between the two: `puts` appends a new line to the argument passed in, whereas `print` keeps things all on one line. A very important thing to notice for both commands is that after printing whatever argument they are passed, `puts` and `print` both return `nil`.

To highlight the difference between `puts` and `print`, we're going to pull out a piece of rarely used Ruby syntax: [the semicolon](https://stackoverflow.com/questions/3953846/can-you-use-semicolons-in-ruby). In short, semicolons are never required in Ruby, but they allow you to run multiple Ruby commands all on one line. This type of [code golf](https://en.wikipedia.org/wiki/Code_golf) is not generally recommended, but it's helpful for this example. In a REPL, such as replit.com, the two statements can be written on separate lines without the semicolon and still produce the desired output. However, irb can read only one statement at a time, making the semicolons necessary for this code to work as intended.

```ruby
irb(main):001:0> print "Hello World"; print "I love drinking coffee"
Hello WorldI love drinking coffee=> nil

irb(main):002:0> puts "Hello World"; puts "I love drinking coffee"
Hello World
I love drinking coffee
=> nil
```

### Input commands
To accept input from a user, we can use the `gets` command. When we use `gets`, program execution will stop and wait for user input. After the user presses <kbd>Enter</kbd>, the program will continue its execution.

Let's give this a go. Open irb, type `gets`, and then type `The Odin Project`. You should see something like the following:

```ruby
irb(main):001:0> gets
The Odin Project
=> "The Odin Project\n"
```

How about that? Let's break this process down a bit.

You'll notice that, unlike `puts` and `print`, `gets` actually **returns** the user input instead of returning `nil`. This means that the input can be assigned to a variable for you to then use and manipulate and twist and turn and spit back out.

As you might also remember from the String section of the Basic Data Types lesson, `"\n"` is an escape character that represents a new line. The `gets` command always returns a new line at the end of the input. This command often makes use of a "separator" to read streams and multi-line files, but that's beyond the scope of this beginner lesson. For now, it's helpful to know that `#chomp` is a method commonly used to trim separators.

```ruby
irb(main):001:0> new_string = gets.chomp
This is a sentence.
=> "This is a sentence."

irb(main):002:0> puts new_string
This is a sentence.
=> nil
```

### Assignment
<div class="lesson-content__panel" markdown="1">

1. Read through the [Hello, World](https://www.learnrubyonline.org/en/Hello_World) lesson and exercise from [www.learnrubyonline.org](https://www.learnrubyonline.org).
2. Read the first four sections of the [Ruby - File I/0](https://www.tutorialspoint.com/ruby/ruby_input_output.htm) from TutorialsPoint on `puts`, `gets`, `putc`, and `print`.
3. [Read this article from Ruby Guides](https://www.rubyguides.com/2018/10/puts-vs-print/) which describes the differences between `puts`, `print` and `p`.
</div>

### Knowledge check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* <a class="knowledge-check-link" href="#output-commands">What are the two methods we can use to output data to the user's screen? </a>
* <a class="knowledge-check-link" href="#output-commands">What is similar between these two output methods? </a>
* <a class="knowledge-check-link" href="#output-commands">What is different between these two output methods? </a>
* <a class="knowledge-check-link" href="#input-commands">What is the method you can use to get input from the user? </a>
* <a class="knowledge-check-link" href="#input-commands">What is at least one difference between the output and input methods? </a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
