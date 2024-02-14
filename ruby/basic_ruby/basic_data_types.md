### Introduction

Ruby is a strongly object-oriented language, which means that absolutely everything in Ruby is an object, even the most basic data types. We'll start here with four of Ruby's basic data types: numbers (integers and floats), strings, symbols, and Booleans (`true`, `false`, and `nil`).

For all of the examples throughout this lesson, feel free to follow along in irb or [replit.com](https://replit.com/languages/ruby) (an online REPL environment) to get a better feel for how they work.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- List the basic arithmetic operators and what they do.
- Describe the difference between an integer and a float and how to convert between the two.
- Explain string interpolation and concatenation.
- Describe what escape characters are, and list several examples.
- Define what a symbol is and how it differs from a string.
- Explain what the Booleans `true`, `false`, and `nil` represent.

### Numbers

You probably already know what numbers are, so there's no need to go into elaborate metaphors here. Ruby has all the typical math operators you would expect:

```ruby
# Addition
1 + 1   #=> 2

# Subtraction
2 - 1   #=> 1

# Multiplication
2 * 2   #=> 4

# Division
10 / 5  #=> 2

# Exponent
2 ** 2  #=> 4
3 ** 4  #=> 81

# Modulus (find the remainder of division)
8 % 2   #=> 0  (8 / 2 = 4; no remainder)
10 % 4  #=> 2  (10 / 4 = 2 with a remainder of 2)
```

#### Integers and floats

There are two main types of numbers in Ruby. **Integers** are whole numbers, such as 10. **Floats** are numbers that contain a decimal point, such as 10.5, 10.0, or 0.25.

It's important to keep in mind that when doing arithmetic with two integers in Ruby, *the result will always be an integer*.

```ruby
17 / 5    #=> 3, not 3.4
```

To obtain an accurate answer, just replace one of the integers in the expression with a float.

```ruby
17 / 5.0  #=> 3.4
```

#### Converting number types

Ruby makes it very easy to convert floats to integers and vice versa.

```ruby
# To convert an integer to a float:
13.to_f   #=> 13.0

# To convert a float to an integer:
13.0.to_i #=> 13
13.9.to_i #=> 13
```

As shown in the last example above, when Ruby converts a float to an integer, the decimal places are cut off. Ruby doesn't do any rounding in this conversion.

#### Some useful number methods

There are many useful methods for numbers built into Ruby. For example,

**#even?**

```ruby
6.even? #=> true
7.even? #=> false
```

**#odd?**

```ruby
6.odd? #=> false
7.odd? #=> true
```

### Strings

Strings, strings, wonderful things, use them well and...your app will...grow wings? Or something.

At first glance, you might think that strings are just a bunch of characters that aren't very useful beyond getting user input and outputting some information to the screen, but like Burt Reynolds passing up the chance to play Han Solo, you'd be wrong. Very wrong. What were you thinking, Burt?

#### Double and single quotation marks

Strings can be formed with either double `""` or single`''` quotation marks, also known as *string literals*. They are pretty similar, but there are some differences. Specifically, string interpolation and the escape characters that we'll discuss soon both only work inside double quotation marks, not single quotation marks.

#### Concatenation

In true Ruby style, there are plenty of ways to concatenate strings.

```ruby

# With the plus operator:
"Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"

# With the shovel operator:
"Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"

# With the concat method:
"Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"

```

Classic Ruby!

#### Substrings

You can access strings inside strings. Stringception! It's super easy, too.

```ruby

"hello"[0]      #=> "h"

"hello"[0..1]   #=> "he"

"hello"[0, 4]   #=> "hell"

"hello"[-1]     #=> "o"

```

In the above example we can access the individual characters of a string by referencing the index(es) of the character within the string using `[]`. For more information on the topic you can read the [method documentation](https://docs.ruby-lang.org/en/3.2/String.html#class-String-label-String+Slices).

#### Escape characters

Escape characters allow you to type in representations of whitespace characters and to include quotation marks inside your string without accidentally ending it. As a reminder, escape characters only work inside double quotation marks.

```ruby

\\  #=> Need a backslash in your string?
\b  #=> Backspace
\r  #=> Carriage return, for those of you that love typewriters
\n  #=> Newline. You'll likely use this one the most.
\s  #=> Space
\t  #=> Tab
\"  #=> Double quotation mark
\'  #=> Single quotation mark
```

The best thing to do is play around with them in irb or a REPL.

```ruby
irb(main):001:0> puts "Hello \n\nHello"
Hello

Hello
=> nil
```

#### Interpolation

String interpolation allows you to evaluate a string that contains placeholder variables. This is a very useful and common technique, so you will likely find yourself using this often. Be sure to use double quotes so that string interpolation will work!

```ruby
name = "Odin"

puts "Hello, #{name}" #=> "Hello, Odin"
puts 'Hello, #{name}' #=> "Hello, #{name}"
```

#### Common string methods

There are many useful string methods that are built into Ruby. You need to capitalize a word? No problem! Reverse a string? Easy peasy. Extract the binary subatomic algorithm from any regex grep? We don't know, but since this is Ruby, let's go with *YES*.

Just remember, strings have loads of methods provided to you for free, and you can find them all in the [Ruby docs](https://docs.ruby-lang.org/en/3.2/String.html). If you're working with strings and need to do something, check the Ruby docs first and see if there's a method that does it for you.

Below is a quick recap of the more common string methods you might find yourself using:

**#capitalize**

```ruby
"hello".capitalize #=> "Hello"
```

**#include?**

```ruby
"hello".include?("lo")  #=> true

"hello".include?("z")   #=> false
```

<span id="upcase">**#upcase**</span>

```ruby
"hello".upcase  #=> "HELLO"
```

**#downcase**

```ruby
"Hello".downcase  #=> "hello"
```

**#empty?**

```ruby
"hello".empty?  #=> false

"".empty?       #=> true
```

**#length**

```ruby
"hello".length  #=> 5
```

**#reverse**

```ruby
"hello".reverse  #=> "olleh"
```

<span id="split">**#split**</span>

```ruby
"hello world".split  #=> ["hello", "world"]

"hello".split("")    #=> ["h", "e", "l", "l", "o"]
```

**#strip**

```ruby
" hello, world   ".strip  #=> "hello, world"
```

You'll read more about these methods and others in the assignment. The examples below are just to get your creative juices flowing with some of the awesome ways you can modify strings.

```ruby
"he77o".sub("7", "l")           #=> "hel7o"

"he77o".gsub("7", "l")          #=> "hello"

"hello".insert(-1, " dude")     #=> "hello dude"

"hello world".delete("l")       #=> "heo word"

"!".prepend("hello, ", "world") #=> "hello, world!"
```

The assignments will go much deeper, so go through them thoroughly and be sure to play around in a REPL as you read.

#### Converting other objects to strings

Using the `to_s` method, you can convert pretty much anything to a string. Here are some examples:

```ruby
5.to_s        #=> "5"

nil.to_s      #=> ""

:symbol.to_s  #=> "symbol"
```

### Symbols

Symbols are an interesting twist on the idea of a string. The full explanation can be a bit long, but here's the short version:

Strings can be changed, so every time a string is used, Ruby has to store it in memory even if an existing string with the same value already exists. Symbols, on the other hand, are stored in memory only once, making them faster in certain situations.

One common application where symbols are preferred over strings are the keys in hashes. We'll cover this in detail in the hashes lesson later in the course.

You won't need to use symbols much in the beginning, but it's good to get familiar with what they are and what they look like so that you can recognize them.

#### Create a symbol

To create a symbol, put a colon at the beginning of some text:

```ruby
:my_symbol
```

#### Symbols vs. strings

To get a better idea of how symbols are stored in memory, give this a whirl in irb or a REPL. The [`#object_id` method](https://docs.ruby-lang.org/en/3.2/Object.html#method-i-object_id) returns an integer identifier for an object. (And remember: in Ruby, *everything* is an object!)

```ruby
"string" == "string"  #=> true

"string".object_id == "string".object_id  #=> false

:symbol.object_id == :symbol.object_id    #=> true
```

### Booleans

You will learn about these data types in more detail in the Conditional Logic lesson later in this course. The goal of this lesson is for you to get a basic understanding of what Booleans are.

#### True and false

The Boolean values `true` and `false` represent exactly what you think they do: `true` represents something that is true, and `false` represents something that is false.

#### Nil

In Ruby, `nil` represents "nothing". Everything in Ruby has a return value. When a piece of code doesn't have anything to return, it will return `nil`. This is pretty abstract, but it will make more sense as you learn and use Ruby more.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read the [Basics chapter](https://launchschool.com/books/ruby/read/basics) of LaunchSchool's *Introduction to Programming With Ruby* for a different explanation of Ruby's data types.
1. [Read Alex Chaffee’s brief writeup on Objects](https://codelikethis.com/lessons/learn-to-code/objects), for a basic understanding of what objects are in programming. We will explore this topic much deeper later in the course.
1. Now it is time to complete some test-driven exercises to practice what you have learned in this lesson.

    - Follow the cloning and installation instructions in the main README to set up our [ruby-exercise repo](https://github.com/TheOdinProject/ruby-exercises).
    - Then follow the instructions in the [ruby-basics README](https://github.com/TheOdinProject/ruby-exercises/tree/main/ruby_basics) to complete the `1_data_types` exercises.
    - If you get stuck, ask questions in the #ruby-help channel in our Discord server.
    - After you have completed the exercises, check out the solutions branch on GitHub to compare solutions.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- Numbers
  - <a class="knowledge-check-link" href="#numbers">What are the basic arithmetic operators you can use on numbers? </a>
  - <a class="knowledge-check-link" href="#integers-and-floats">What's the difference between an integer and a float?</a>
  - <a class="knowledge-check-link" href="#converting-number-types">What method would you use to convert a float to an integer?</a>
  - <a class="knowledge-check-link" href="#converting-number-types">What method would you use to convert an integer to a float?</a>

- Strings
  - <a class="knowledge-check-link" href="#strings">What is a string?</a>
  - <a class="knowledge-check-link" href="#double-and-single-quotation-marks">What are the differences between single and double quotes?</a>
  - <a class="knowledge-check-link" href="#interpolation">What is string interpolation?</a>
  - <a class="knowledge-check-link" href="#concatenation">How do you concatenate strings?</a>
  - <a class="knowledge-check-link" href="#upcase">What method would you use to change all the characters in your string to upper case?</a>
  - <a class="knowledge-check-link" href="#split">What method would you use to split up strings into arrays?</a>
  - <a class="knowledge-check-link" href="#escape-characters">What are escape characters?</a>
  - <a class="knowledge-check-link" href="#substrings">How do you access a specific character or substring?</a>
  - <a class="knowledge-check-link" href="#converting-other-objects-to-strings">How do you convert other data types into strings?</a>

- Symbols
  - <a class="knowledge-check-link" href="#symbols">What is a symbol?</a>
  - <a class="knowledge-check-link" href="#create-a-symbol">How do you create a symbol?</a>
  - <a class="knowledge-check-link" href="#symbols-vs-strings">What's the difference between a symbol and a string?</a>

- Booleans
  - <a class="knowledge-check-link" href="#true-and-false">What does `true` represent?</a>
  - <a class="knowledge-check-link" href="#true-and-false">What does `false` represent?</a>
  - <a class="knowledge-check-link" href="#nil">What does `nil` represent?</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- If you want to go deeper into Ruby's numbers and string data types, read these chapters from the *Bastards Book of Ruby*:
  - [Numbers](http://ruby.bastardsbook.com/chapters/numbers/)
  - [Strings](http://ruby.bastardsbook.com/chapters/strings/)
- Read through these Ruby Monstas sections about data types:
  - [Numbers](http://ruby-for-beginners.rubymonstas.org/built_in_classes/numbers.html)
  - [Strings](http://ruby-for-beginners.rubymonstas.org/built_in_classes/strings.html)
  - [Symbols](http://ruby-for-beginners.rubymonstas.org/built_in_classes/symbols.html)
  - [True, False, and Nil](http://ruby-for-beginners.rubymonstas.org/built_in_classes/true_false_nil.html)
