
# Variables, Strings and Numbers
Since you've already done a decent chunk of Ruby in the prep course, this should be a healthy refresher of what you've already learned with Variables, Strings and Numbers.

This lesson will build on your knowledge and go much deeper and further than you went before.

Just like you can't build a castle on a weak foundation, neither can you write a great program without having strong knowledge of the more basic data types. If you want to write the next [Facebook](www.facebook.com) or [LingsCars](www.lingscars.com) you'll need a fundamental knowledge of basic data types and what you can do with them.

Variables, Strings and Numbers can be a little unappreciated next to much cooler Ruby features like Blocks and Hashes but they are so fundamental to Programming that you should know them inside out and what you can do with them before you can really master more advanced features.

We'll start with basic concepts before diving into more advanced areas for each topic so that by the end you'll be comfortable using and manipulating Strings and Numbers and storing them in an appropriately named Variable.

Let's get started. Who's excited??????

## Learning outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* Variables
  * What is a variable?
  * How do you declare a variable?
  * What are the variable naming conventions?
  * How are variables initialised?
  * What are variable Sigils?
  * What are the different variable scopes?

* Strings
  * What is a string?
  * What's the difference between single and double quotes?
  * What is string interpolation?
  * What are escape characters?
  * What are line breaks?
  * How do you make other data types into strings?
  * How do you concatenate strings?
  * How do you access a specific character or substring?
  * How do you split up strings into arrays?
  * How are strings and arrays similar?
  * What does it mean that strings are "mutable" and why care?

* Numbers
  * What's the difference between an Integer and a Float?
  * How does Ruby store Integers and Floats?
  * Why should you be careful when converting back and forth between integers and floats?
  * What operators can you use with numbers to change them? 

## Variables
You can think of Variables as those tupperware containers your mum keeps in the cupboard (that never have matching lids...). You can use those containers to store something in them until you need whatever is in it. In programming a variable is simply a place to store data. To be more specific, variables hold a reference to a specific object in computer memory. Each object will refer to a certain data type.

Ruby is a language which aims to be natural to read and easy to write. Remember this when you're naming your variables. The name should, as clearly as possible, aim to describe the kind of data that it will hold. Naming variables will pay dividends when you review your code months after you've written it when you can no longer clearly remember what that variable was designed to store. When deciding what your variable name will be keep this quote by John Woods at the front of your mind:

> Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.

The most basic thing you can do to write clean, maintainable code is name your variables properly.

Although you should be familiar already with variables in Ruby what you may not know are the common Ruby naming conventions for variables and some more advanced assignment operators so we'll cover them here.

### How to make them
- assignment operators =, +=, -=, *=, /=, %=, **=

In Ruby, assignment uses the = character

`num = 5`

This assignment creates a local variable.

- Abbreviated Assignment

You can mix several operators and assignment. These are best illustrated with examples

```
a = 10
a += 10
# => a = 20
```
This is equivalent to:
`a = a + 1`

Some further examples:
All examples assume a = 10
```
a -= 10
# => a = 0

a *= 10
# => a = 100

a /= 10
# => a = 1

a %= 6
# => a = 4

a **= 2
# => a = 100
```
There are also `||=` and `&&=`.
`||=` makes an assignment if the value of the variable was nil or false. `&&=` makes an assignment if the value of the variable was not nil or false.

```
num = 10 # => num has been assigned a value
num ||= 5 # => As num has already been assigned it will not be assigned a new value here.
num &&= 5 # => Num has been assigned and is therefore not nil or false. This will set the new value of num to 5.
```

- Multiple Assignment
You can assign multiple variables to multiple values.
```
a, b, c = 1, 2, 3
# a = 1
# b = 2
# c = 3
```
### How to name them
variable names should always be lowercase and multiple words that make up a variable name should be split by an underscore.
```
number = 1
not_a_number = "hello"
it_wasnt_me = false
```

### Assignment
1. Read through this [Zetcode tutorial on variables](http://zetcode.com/lang/rubytutorial/variables/)
2. Read through the variables section of this [Jumpstart Lab Tutorial](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html#2.-variables).
3. Read through the variables section of this [Tutorialspoint tutorial](https://www.tutorialspoint.com/ruby/ruby_variables.html).
4. Open up a Ruby Repl and try naming some variables and assigning some value to it. Don't try at this stage to name good variables but instead experiment with different variable names, run the Repl and see if it's valid. Try using symbols or numbers in your variable names. See what works and what doesn't. If you come across anything quirky Google it to find out why.

## Strings

Strings, strings, wonderful things, use them well and your app will grow wings. Or something.

At first glance, you'd be forgiven for thinking Strings are just a bunch of characters that aren't very useful beyond getting user input and outputting some information to the screen, but like Burt Reynolds passing up the chance of playing Han Solo, you'd be wrong. Very wrong. What were you thinking Burt? 

From the prep course you should have a good understanding of Strings so we won't bore you to death recapping what you already know. Instead we'll just cover some of the pitfalls and more interesting features and let the reading assignments do the rest.

- double and single quotes in strings
Strings can be formed with either double `""` or single`''` quotes. They are pretty similar but there are some differences.

### Interpolation
```
name = "Odin"
puts "Hello, #{name}" # => "Hello, Odin"
puts 'Hello, #{name}' # => "Hello, #{name}"
```
Moral of the story? ~~Don't judge others les~~ Use double quotes for String interpolation.

### Concatenation
In true Ruby style. There are plenty of ways to concatentate with Ruby
```
"Welcome " + "to " + "Odin!"
"Welcome " "to " "Odin!" # => Did you know you could leave you the + signs?
"Welcome " << "to " << "Odin!"
"Welcome ".concat("to ").contact("Odin!")
```
Classic Ruby!

### Common string methods
You've dabbled with some of the Ruby methods in the prep course. Someone need you to capitlize a word? No problem! Reverse a string? Not all heroes wear capes. Extract the binary subatomic algorithm from any regex grep? Errrrrrrrr, yeah totally.

Just remember, strings have loads of methods provided to you for free and you can find them all in the [Ruby Docs](ruby-doc.org/core-2.4.0/String.html). If you're working with strings and need to do something check the Ruby Docs first and see if there is one that does it for you.

Below is a quick recap on the more common methods you might find yourself using. 

```
"hello".capitalize
# => "Hello"
"hello.include?("lo")
# => true
"hello".upcase
# => "HELLO"
"Hello".downcase
# => "hello"
"hello".empty?
# => false
"hello".length
# => 5
"hello.reverse"
# => "olleh" # => This is where the Spanish word came from. True story!
"hello world".split
# => ["hello", "world"]
"    hello, world       ".strip # => Strip and dance for me.
# => "hello, world"
"hello".dance # => Undefined method 'dance'... Worth a try
```

### Substrings
You can access strings inside strings inside strings. Stringception! It's super easy too
```
"hello"[0] # => "h"
"hello"[0..1] # => "he"
"hello"[0, 4] # => "hell"
"hello"[-1] # => "o"
"hello dude"[0,5][1..3] # => "ell". I have no idea why you'd want to do this, but you can!
```

### Escape Characters
Hopefully these are self explanatory. Use them if you need them in you code. There may be some gotchas with single quotes so use double quotes to be safe.
```
\\ # => Need a backslash in your string?
\b # => Backspace
\r # => Carriage return, For you oldies that love typewriters
\n # => Newline. You'll use this one.
\s # => Space
\t # => Tab
\" # => Double Quote
\' # => Single Quote
```
The best thing to do is play around with them in a Repl. But for your eyes only here's an awesome string using all of them.
```
"hello\" \' \ndude\\. What\'s up??\b\r\tSweet"
```
hello" '
dude\. What's up??
  Sweet

Rocking it!

### String Manipulation
You'll read about these in the assignments. So I'll just leave some examples to get your creative juices flowing  thinking about some awesome ways to actually modify strings.
```
"he77o".sub("7", "l") # => "hel7o"
"he77o".gsub("7", "l") # => "hello"
"hello".insert(-1, " dude") # => "hello dude"
"hello".split("") # => ["h", "e", "l", "l", "o"]
"!".prepend("hello ", "world") # => "hello, world!"
```

The assignments will go deeper and clarify more than I have, so go through them and be sure to play around in a Repl.

### Assignment

## Numbers
A brief description of the different types of numbers in Ruby and the maths operations you can do on them.

### Common Operators and Expressions
- +-\*
- % ^ **

### Floats and Integers
- how they differ

### Strings and Numbers

### Converting numbers


## Output and Input
A brief description of how to output from to the users terminal and how to get input.

### Puts and Print

### Formatting

### Gets

## Exercises
link to a repo of exercises with tests.

## Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

Link to no more than three additional resources to avoid this section becoming too cluttered.
