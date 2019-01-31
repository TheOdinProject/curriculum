### Introduction
To create programs that are user friendly and interactive, you'll need to know how to **output** data to a screen and how to get **input** from a user. In this lesson, we'll cover the most common ways to achieve these tasks in Ruby. As with other lessons, and this one in particular, following along in irb or a REPL will be helpful.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Differentiate between the `print` and `puts` commands.
 - Describe the method used to get input from the user.

#### Output Commands
To output information, such as into your irb or REPL environment or into the command line, we can use the `print` command.

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

puts "Hey, I want 2 key lime pies."
Hey, I want 2 key lime pies.
=> nil

x = "My name is ALEX! :)"
puts x
My name is ALEX! :)
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

**Side note**: In a REPL, such as repl.it, the above `print` and `puts` statements can be written on separate lines without the semicolon. When the code is run, the REPL will read, evaluate, and print the results of each expression. However, irb can read only one statement at a time, making the semicolon necessary for this code to work as intended.

#### Input Commands
To accept input from a user, we can use the `gets` command. When we use `gets`, program execution will stop and wait for user input. After the user presses `Enter`, the program will continue its execution.

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
1. Read through the simple [Hello, World](https://www.learnrubyonline.org/en/Hello%2C_World%21) lesson and exercise from [www.learnrubyonline.org](www.learnrubyonline.org).
2. Read the first four sections of the [Ruby - File I/0](https://www.tutorialspoint.com/ruby/ruby_input_output.htm) from TutorialsPoint on `puts`, `gets`, `putc`, and `print`.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* What are the two methods we can use to output data to the user's screen?
* What is similar between these two output methods?
* What is different between these two output methods?
* What is the method you can use to get input from the user?
* What is at least one difference between the output and input methods?
