### Introduction

Ruby is a strongly object-oriented language, which means that absolutely everything in Ruby is an object, even the most basic data types. We'll start here with four of Ruby's basic data types: numbers (integers and floats), strings, symbols, and Booleans (`true`, `false`, and `nil`).

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - List the basic arithmetic operators and what they do.
 - Describe the difference between an integer and a float and how to convert between the two.
 - Explain string interpolation and concatenation.
 - Describe what escape characters are and list several examples.
 - Define what a symbol is and how it differs from a string.
 - Explain what the booleans `true`, `false`, and `nil` represent.

### Numbers
You probably already know what numbers are, so there's no need to go into elaborate
metaphors here. Ruby has all the typical math operators you would expect:

```ruby
# Addition
1 + 1   # => 2

# Subtraction
2 - 1   # => 1

# Multiplication
2 * 2   # => 4

# Division
10 / 5  # => 2

# Exponent
2 ** 2  # => 4
3 ** 4  # => 81

# Modulus (find the remainder of division)
8 % 2   # => 0  (8 / 2 = 4; no remainder)
10 % 4  # => 2  (10 / 4 = 2 with a remainder of 2)
```

#### Integers and Floats
There are two main types of numbers in Ruby. **Integers** are whole numbers, such as 10. **Floats** are numbers that contain a decimal point, such as 10.5, 10.0, or 0.25.

It's important to keep in mind that when doing arithmetic with two integers in Ruby, *the result will always be an integer*.

```ruby
17 / 5    # => 3, not 3.4
```

To obtain an accurate answer, just replace one of the integers in the expression with a float.

```ruby
17 / 5.0  # => 3.4
```

#### Converting Number Types
Ruby makes it very easy to convert floats to integers and vice versa.

```ruby
# To convert an integer to a float:
13.to_f   # => 13.0

# To convert a float to an integer:
13.0.to_i # => 13
13.9.to_i # => 13
```

As shown in the last example above, when Ruby converts a float to an integer, the decimal places are simply cut off. Ruby doesn't do any rounding in this conversion.

#### Some Useful Number Methods
There are many useful methods for numbers built into Ruby. For example,

**#even?**
```ruby
6.even? # => true
7.even? # => false
```

**#odd?**
```ruby
6.odd? # => false
7.odd? # => true
```

### Strings
Strings, strings, wonderful things, use them well and...your app will...grow wings? Or something.

At first glance, you might think that strings are just a bunch of characters that aren't very useful beyond getting user input and outputting some information to the screen, but like Burt Reynolds passing up the chance to play Han Solo, you'd be wrong. Very wrong. What were you thinking, Burt?

From the prep course, you should have a good understanding of strings already, so we won't bore you to death recapping what you already know. Instead, we'll just cover some of the pitfalls and more interesting features here and let the reading assignments do the rest.

#### Double and Single Quotation Marks
Strings can be formed with either double `""` or single`''` quotation marks, also known as *string literals*. They are pretty similar, but there are some differences. First, the escape characters that we'll discuss soon work only inside double quotation marks, not single quotation marks. Second, string interpolation also works only inside double quotation marks.

#### Concatenation
In true Ruby style, there are plenty of ways to concatenate strings.

```ruby
# With the plus operator:
"Welcome " + "to " + "Odin!"    # => "Welcome to Odin!"

# With the shovel operator:
"Welcome " << "to " << "Odin!"  # => "Welcome to Odin!"

# With the concat method:
"Welcome ".concat("to ").concat("Odin!")  # => "Welcome to Odin!"
```
Classic Ruby!

#### Substrings
You can access strings inside strings inside strings. Stringception! It's super easy, too.

```ruby
"hello"[0]      # => "h"

"hello"[0..1]   # => "he"

"hello"[0, 4]   # => "hell"

"hello"[-1]     # => "o"

"hello dude"[6,10][0..2]  #=> "dud" I have no idea why you'd want to do this, but you can!
```

#### Escape characters
Escape characters allow you to type in representations of whitespace characters and to include quotation marks inside your string without accidently ending it. As a reminder, escape characters only work inside double quotation marks.

```ruby
\\  # => Need a backslash in your string?
\b  # => Backspace
\r  # => Carriage return, for those of you that love typewriters
\n  # => Newline. You'll likely use this one the most.
\s  # => Space
\t  # => Tab
\"  # => Double quotation mark
\'  # => Single quotation mark
```
The best thing to do is play around with them in irb or a REPL.

```ruby
irb(main):001:0> puts "Hello \n\nHello"
Hello

Hello
=> nil
```

#### Interpolation
Be sure to use double quotes for string interpolation.

```ruby
name = "Odin"

puts "Hello, #{name}" # => "Hello, Odin"
puts 'Hello, #{name}' # => "Hello, #{name}"
```

#### Common String Methods
There are many useful string methods that are built into Ruby. You need to capitalize a word? No problem! Reverse a string? Easy-peasy. Extract the binary subatomic algorithm from any regex grep? We don't know, but since this is Ruby, let's go with *YES*.

Just remember, strings have loads of methods provided to you for free, and you can find them all in the [Ruby docs](ruby-doc.org/core-2.6.0/String.html). If you're working with strings and need to do something, check the Ruby docs first and see if there's a method that does it for you.

Below is a quick recap of the more common string methods you might find yourself using. Feel free to follow along with these in irb or [repl.it](https://repl.it/languages/ruby) (an online REPL environment) to get a feel for them.

**#capitalize**
```ruby
"hello".capitalize # => "Hello"
```

**#include?**
```ruby
"hello".include?("lo")  # => true

"hello".include?("z")   # => false
```

**#upcase**
```ruby
"hello".upcase  # => "HELLO"
```

**#downcase**
```ruby
"Hello".downcase  # => "hello"
```

**#empty?**
```ruby
"hello".empty?  # => false

"".empty?       # => true
```

**#length**
```ruby
"hello".length  # => 5
```

**#reverse**
```ruby
"hello".reverse  # => "olleh"
```

**#split**
```ruby
"hello world".split  # => ["hello", "world"]

"hello".split("") # => ["h", "e", "l", "l", "o"]
```

**#strip**
```ruby
" hello, world   ".strip  #=> "hello, world"
```

You'll read more about these methods and others in the assignment. The examples below are just to get your creative juices flowing with some of the awesome ways you can modify strings.

```ruby
"he77o".sub("7", "l")          #=> "hel7o"

"he77o".gsub("7", "l")         #=> "hello"

"hello".insert(-1, " dude")    #=> "hello dude"

"hello".split("")              #=> ["h", "e", "l", "l", "o"]

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

One common application where symbols are preferred over strings are for the keys in hashes. We'll cover this in detail in the hashes lesson later in the course.

You won't need to use symbols much in the beginning, but it's good to get familiar with what they are and what they look like so that you can recognize them.

#### Create a Symbol
To create a symbol, simply put a colon at the beginning of some text:
```
:my_symbol
```

#### Symbols vs. Strings
To get a better idea of how symbols are stored in memory, give this a whirl in irb or a REPL. The [`#object_id` method](https://ruby-doc.org/core-2.6/Object.html#method-i-object_id) returns an integer identifier for an object. (And everything in Ruby is an object!)

```ruby
"string" == "string"  # => true

"string".object_id == "string".object_id  # => false

:symbol.object_id == :symbol.object_id    # => true
```

### Booleans
You will learn about these data types in more detail in the conditional logic lesson later in this course. The goal in this lesson is get a basic understanding of what Booleans are.

#### True and False
The Boolean values `true` and `false` represent exactly what you think they do: `true` represents something that is true, and `false` represents something that is false.

#### Nil
'Nil' represents 'nothing'. Everything in Ruby has a return value. When a piece of code doesn't have anything to return, it will return `nil`. This is pretty abstract, but it will make more sense as you learn and use Ruby more.


### Assignment

1. Read the [Basics chapter](https://launchschool.com/books/ruby/read/basics) of LaunchSchool's *Introduction to Programming With Ruby* for a different explanation of Ruby's data types.
2. Read through these Ruby Monstas sections about data types:
    * [Numbers](http://ruby-for-beginners.rubymonstas.org/built_in_classes/numbers.html)
    * [Strings](http://ruby-for-beginners.rubymonstas.org/built_in_classes/strings.html)
    * [Symbols](http://ruby-for-beginners.rubymonstas.org/built_in_classes/symbols.html)
    * [True, False, and Nil](http://ruby-for-beginners.rubymonstas.org/built_in_classes/true_false_nil.html)

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* If you want to go deeper into Ruby's numbers and string data types, read these chapters from the *Bastards Book of Ruby*:
    * [Numbers](http://ruby.bastardsbook.com/chapters/numbers/)
    * [Strings](http://ruby.bastardsbook.com/chapters/strings/)

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* Numbers
  * What are the basic arithmetic operators you can use on numbers?
  * What's the difference between an integer and a float?
  * What method would you use to convert a float to an integer?
  * What method would you use to convert an integer to a float?

* Strings
  * What is a string?
  * What are the differences between single and double quotes?
  * What is string interpolation?
  * How do you concatenate strings?
  * What method would you use to change all the characters in your string to upper case?
  * What method would you use to _split_ up strings into arrays?
  * What are escape characters?
  * How do you access a specific character or substring?
  * How do you convert other data types into strings?

* Symbols
  * What is a symbol?
  * How do you create a symbol?
  * What's the difference between a symbol and a string?

* Booleans
  * What does `true` represent?
  * What does `false` represent?
  * What does `nil` represent?