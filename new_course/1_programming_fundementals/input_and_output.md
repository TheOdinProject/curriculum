<!-- This lesson will cover how to output things to the screen in Ruby and how to get input from the user. -->

### Introduction
To create programs that are user friendly and interactive you'll need to know how to **output** data to a screen and how to get **input** from a user. We'll cover the most common ways to achieve these tasks in Ruby programming language during this lesson. As with other lessons, and this one in particular, following along in irb or a REPL will be helpful.

### Learning Outcomes
* What are the two methods we can use to output data to the user's screen?
* What is similar between these two output methods?
* What is different between these two output methods?
* What is the method you can use to get input from the user?
* What is at least one difference between the output and input methods?

### Output Commands
In order to output the information we want, such as into your irb environment, REPL, or into the command line, we can use the `print` command.

```ruby
print "Learning to code is FUN!"
Learning to code is FUN!
=> nil

print "1234"
1234
=> nil
```

We can also use the `puts` command:
```ruby
puts "Learning to code is cool!!"
Learning to code is cool!!
=> nil

puts "hey I want 2 lemonades"
hey I want 2 lemonades
=> nil

x = "My name is ALEX :)"
puts x
My name is ALEX :)
=> nil
```

As you can see, the `puts` and `print` commands are quite similar. Note that after printing whatever argument they are passed, they both return `nil`. One notable difference, however, is that `puts` appends a new line to the argument passed in.

Try the following in irb:

```ruby
print "Hello World"; print "I love drinking coffee"
Hello WorldI love drinking coffee
=> nil

puts "Hello World"; puts "I love drinking coffee"
Hello World
I love drinking coffee
=> nil
```

**Side note**: In a REPL, such as repl.it, the above `print` and `puts` statements can be written on individual lines without the semi-colon. When run, the REPL will read, evaluate, and print the results of each expression. On the other hand, without the semi-colon, irb can only read one statement at a time.

### Input Commands
In order to accept input from a user, we can use the `gets` command. When we use `gets`, program execution will stop and wait for a user's input. After pressing `Enter`, the program will continue its execution.

Let's give this a go. Open irb, type `gets`, and then type `The Odin Project`. You should see something like the following:

```ruby
irb(main):001:0> gets
The Odin Project
=> "The Odin Project\n"
```

How about that? Let's break it down a bit.

You'll notice that `gets`, unlike `puts` and `print`, actually **returns** what a user inputs, instead of `nil`. This means that the input can be assigned to a variable for you to use and manipulate and twist and turn and spit back out.

As you might also remember from the String section of the Primitive Data Types lesson, `"\n"` is an escape character that represents a new line. `gets` always returns a new line, and it often makes use of a "separator" to read streams and multi-line files, but that's beyond the scope of a beginner lesson. For now, just know that `#chomp` is a method commonly used to trim separators.

```ruby
irb(main):001:0> new_string = gets.chomp
This is a sentence
=> "This is a sentence"

irb(main):002:0> puts new_string
This is a sentence
=> nil
```

### Assignment
1. Read through the simple [Hello, World](https://www.learnrubyonline.org/en/Hello%2C_World%21) lesson and exercise from www.learnrubyonline.org.
2. Read the first four sections of the [Ruby - File I/0](https://www.tutorialspoint.com/ruby/ruby_input_output.htm) from TutorialsPoint on `puts`, `gets`, `putc`, and `print`.