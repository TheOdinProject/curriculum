
# Variables, Strings and Numbers
Since you've already done a decent chunk of Ruby in the prep course, this should be a healthy refresher of what you've already learned with Variables, Strings and Numbers.

This lesson will build on your knowledge and go much deeper and further than before.

Just like you can't build a castle on a weak foundation, neither can you write a great program without having strong knowledge of the more basic data types. If you want to write the next [Facebook](www.facebook.com) or [LingsCars](www.lingscars.com) you'll need a fundamental knowledge of basic data types and what you can do with them.

Variables, Strings and Numbers can be a little unappreciated next to much cooler Ruby features like Blocks and Hashes but they are so fundamental to programming that you should know them inside out before you can really master more advanced features.

We'll start with basic concepts before diving into more advanced areas for each topic so that by the end you'll be comfortable using and manipulating Strings and Numbers and storing them in appropriately named variables.

Let's get started. Who's excited??????

## Learning outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* Variables
  * What is a variable?
  * How do you assign a value or an expression to a variable?
  * What does the `+=` operator do?
  * What are the variable naming conventions?

* Strings
  * What is a string?
  * What's the difference between single and double quotes?
  * What is string interpolation?
  * How do you concatenate strings?
  * What method would you use to change all the characters in your string to upper case?
  * What method would you use to _split_ up strings into arrays?
  * What are escape characters?
  * How do you access a specific character or substring?
  * How do you convert other data types into strings?

* Numbers
  * What are the basic arithmetic operators you can use on numbers?
  * What's the difference between an integer and a float?
  * What method would you use to convert a float to an integer?
  * What method would you use to convert an integer to a float?


## Variables
You can think of Variables as those tupperware containers your mum keeps in the cupboard (that never have matching lids...). You can use those containers to store something in them until you need whatever is in it. In programming, a variable is simply a place to store data. To be more technical, variables hold a reference to a specific object in computer memory. Each object will refer to a certain data type.

Although you should already be familiar with variables, there are a few things you may not have encountered yet such as naming conventions and more advanced assignment operators.

### Declaring a Variable
As you have already seen in the prep work, this is how you make a variable in Ruby.

```ruby
age = 18 #=> 18
```

You can also assign a variable's value as the result of an operation

```ruby
age = 18 + 5 #=> 23
```

To change the value of a variable after it has been already been assigned you will need to assign
it again with the new desired value.

```ruby
age = 18
age = 33
age #=> 33
```

There will often be scenarios where you will want to do an operation to the original
value of a variable and reassign the variable as the result of that operation. this
is how you would do that:

```ruby
age = 18
age = age + 4 #=>  22
```

Because this is a common scenario, Ruby provides a nice short hand
assignment operator for doing this `+=`:

```ruby
age = 18
age += 4 #=> 22
```

there are assignment operators like this for all the common math operators

```ruby
age = 18
age -= 2 #=> 16

cash = 10
cash *= 2 #=> 20

temperature = 40
temperature /= 10 #=> 4
```

### How to name variables
Ruby is a language which aims to be natural to read and easy to write. Remember this when you're naming your variables. The name should, as clearly as possible, aim to describe the what the value of the variable represents. Naming variables will pay dividends when you review your code months after you've written it when you can no longer clearly remember what that variable was designed to store. From now on, when naming your variables, remember the following quote by John Woods.

> Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.

The most basic thing you can do to write clean, maintainable code is name your variables properly.

Variable names should always be lowercase and multiple words that make up a variable name should be split by an underscore this is known as _snake_case_.

```ruby
# bad
a = "Hello"
number = 2

# good
age = 19
name = "John"
can_swim = false
```

### Assignment
1. Read the [variables chapter](http://ruby.bastardsbook.com/chapters/variables/) from the Bastards book of Ruby for alternative metaphors and deeper topics about variables. Don't worry if you don't understand everything completely, especially the sections about references. This will become more intuitive as you use ruby by completing exercises and projects.
2. Open up a [Ruby Repl](https://repl.it/languages/ruby) or IRB in your command line and try naming some variables and assigning some value to it. Don't try at this stage to name good variables but instead experiment with different variable names, run the Repl and see if it's valid. Try using symbols or numbers in your variable names. See what works and what doesn't. If you come across anything quirky, google it to find out why.


## Strings
Strings, strings, wonderful things, use them well and your app will grow wings. Or something.

At first glance, you'd be forgiven for thinking strings are just a bunch of characters that aren't very useful beyond getting user input and outputting some information to the screen, but like Burt Reynolds passing up the chance of playing Han Solo, you'd be wrong. Very wrong. What were you thinking Burt?

From the prep course, you should have a good understanding of strings so we won't bore you to death recapping what you already know. Instead we'll just cover some of the pitfalls and more interesting features and let the reading assignments do the rest.

- double and single quotes in strings
Strings can be formed with either double `""` or single`''` quotes. They are pretty similar but there are some differences.

### Interpolation
Use double quotes for string interpolation.

```ruby
name = "Odin"
puts "Hello, #{name}" #=> "Hello, Odin"
puts 'Hello, #{name}' #=> "Hello, #{name}"
```

### Concatenation
In true Ruby style, there are plenty of ways to concatentate strings.

```ruby
# with the plus operator
"Welcome " + "to " + "Odin!" #=> "Welcome to Odin!"

# with the shovel operator
"Welcome " << "to " << "Odin!" # "Welcome to Odin!"

# with the concat method
"Welcome ".concat("to ").contact("Odin!") #=> "Welcome to Odin!"
```
Classic Ruby!

### Common string methods
You've dabbled with some of the Ruby methods in the prep course. Someone needs you to capitalize a word? No problem! Reverse a string? Not all heroes wear capes. Extract the binary subatomic algorithm from any regex grep? Errrrrrrrr, yeah totally.

Just remember, strings have loads of methods provided to you for free and you can find them all in the [Ruby docs](ruby-doc.org/core-2.4.0/String.html). If you're working with strings and need to do something, check the Ruby Docs first and see if there is one that does it for you.

Below is a quick recap on the more common methods you might find yourself using.

#### capitalize
```ruby
"hello".capitalize #=> "Hello"
```

#### include?
```ruby
"hello".include?("lo") #=> true

"hello".include?("z") #=> false
```

#### upcase
```ruby
"hello".upcase #=> "HELLO"
```
### downcase
```ruby
"Hello".downcase #=> "hello"
```

#### empty?
```ruby
"hello".empty? #=> false

"".empty? #=> true
```
#### length
```ruby
"hello".length #=> 5
```
#### reverse
```ruby
"hello".reverse #=> "olleh"
```

#### split
```ruby
"hello world".split #=> ["hello", "world"]
```
#### strip
```ruby
" hello, world   ".strip  #=> "hello, world"
```

### Substrings
You can access strings inside strings inside strings. Stringception! It's super easy too

```ruby
"hello"[0] #=> "h"

"hello"[0..1] #=> "he"

"hello"[0, 4] #=> "hell"

"hello"[-1] #=> "o"

"hello dude"[0,5][1..3] #=> "ell". I have no idea why you'd want to do this, but you can!
```

### Escape Characters
Hopefully these are self explanatory. Use them if you need them in you code. There may be some gotchas with single quotes so use double quotes to be safe.

```ruby
\\ #=> Need a backslash in your string?
\b #=> Backspace
\r #=> Carriage return, For you oldies that love typewriters
\n #=> Newline. You'll use this one.
\s #=> Space
\t #=> Tab
\" #=> Double Quote
\' #=> Single Quote
```
The best thing to do is play around with them in a Repl. But for your eyes only here's an awesome string using all of them.

```ruby
"hello\" \' \ndude\\. What\'s up??\b\r\tSweet"

hello" '
dude\. What's up??
  Sweet
```

Rocking it!

### String Manipulation
You'll read about these in the assignments. So I'll just leave some examples to get your creative juices flowing  thinking about some awesome ways to actually modify strings.

```ruby
"he77o".sub("7", "l") #=> "hel7o"

"he77o".gsub("7", "l") #=> "hello"

"hello".insert(-1, " dude") #=> "hello dude"

"hello".split("") #=> ["h", "e", "l", "l", "o"]

"!".prepend("hello ", "world") #=> "hello, world!"
```

The assignments will go deeper and clarify more than I have, so go through them and be sure to play around in a Repl.

### Converting other objects to strings
Using the `to_s` method, you can convert pretty much anything to a string, here are some examples:

```ruby
5.to_s #=> "5"

nil.to_s #=> ""

:symbol.to_s #=> "symbol"
```

### Assignment
1. To get a deeper understanding of strings [read this chapter](http://ruby.bastardsbook.com/chapters/strings/) of the Bastards book of Ruby.


## Numbers
I'm sure you already know what numbers are so there's no need to go into elaborate
metaphors about kitchenware here.

Ruby has all the typical math operators you would expect:

```ruby
# addition
1 + 1 #=> 2

# subtraction
2 - 1 #=> 1

# multiplication
2 * 2 #=> 4

# division
10 / 5 #=> 2

# modulus (find the remainder from division)
10 % 4 #=> 2

# exponent
2 ** 2 #=> 4
3 ** 4 = => 83
```

### Integers and Floats
**Integers** are whole numbers such as 10.

**Floats** are numbers which have a decimal point such as 10.5.

Heres a couple of gotchas to bear in mind when working integers and floats:

When doing arithmetic with two integers, the result will always be an integer.
Even if you didn't want it to be.

```ruby
17 / 5 #=> 3
```

To solve this problem, just replace one of the integers with a float in the expression.

```ruby
17 / 5.0 #=> 3.4
```

### Converting Number Types
Ruby makes it very easy to convert numbers to and from floats or integers with a couple of
methods.

```ruby
# converting a float to an integer
13.0.to_i #=> 13

# converting to a integer to a float
13.to_f #=> 13.0
```
When converting from a float to an integer remember that the deminal places will effectively be cut off so only the whole (integer) remains. It won't do any rounding to the closest number.

### Some Useful Number Methods
As you've read a few times now, everything in Ruby is an object. This includes
numbers. This means there are a lot of useful methods you can use with numbers.
Heres a few of the most common ones you'll use.

#### even?

```ruby
6.even? #=> true
7.even? #=> false
```

#### odd?

```ruby
6.odd? #=> false
7.odd? #=> true
```

### Assignment
1. For an even deeper look at numbers read [this short chapter](http://ruby.bastardsbook.com/chapters/numbers/) of the bastards book of ruby


## Exercises
1. [Take this quiz on variables, numbers and strings to test your knowledge](http://www.codequizzes.com/ruby/beginner/variables-strings-numbers)

2. link to a repo of exercises TODO.

## Symbols

Symbols are an interesting twist on the idea of a string. The real explanation can be a bit long, but here's the short version:

Strings can be changed, so every time a string is called, Ruby has to store it in memory. They can pile up, especially when hashes start to get big, and you can tell that Ruby is treating them all as different objects (even if they're otherwise identical) because they all have different `object_id`s. Symbols, on the other hand, are basically strings that can't change, and only get stored in memory once, which is faster and easier on your computer, since Ruby can search hash objects by their `object_id`s. For a better explanation of this behavior, check out Stack Overflow over [here](http://stackoverflow.com/questions/8189416/why-use-symbols-as-hash-keys-in-ruby).

If you want to get a little more hands-on with it, run this stuff in IRB:

```ruby
"string" == "string"
  => true
"string".object_id == "string".object_id
  => false
:symbol.object_id == :symbol.object_id
  => true
```

Like magic!

## Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* For a deeper explanation of how variables work under the hood, read [this short section](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers) from LaunchSchool's Learn to Program with Ruby book.
