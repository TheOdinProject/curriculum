
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
  * What are variable Sigils?   # what does this refer to?
  * what does the `+=` operator do?

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
  * What are the basic arithmetic operators you can use with numbers?
  * What's the difference between an Integer and a Float?
  * What method would you use to convert a float to an integer?
  * What method would you use to convert a integer to a float?


## Variables
You can think of Variables as those tupperware containers your mum keeps in the cupboard (that never have matching lids...). You can use those containers to store something in them until you need whatever is in it. In programming a variable is simply a place to store data. To be more specific, variables hold a reference to a specific object in computer memory. Each object will refer to a certain data type.

Although you should be familiar already with variables in Ruby what you may not know are the common Ruby naming conventions for variables and some more advanced assignment operators so we'll cover them here.

### Declaring a Variable
As you have already seen in the prep work this is how you make a variable in Ruby.
```(ruby)
age = 18 #=> 18
```

You can also assign a variables value as the result of an operation

```(ruby)
age = 18 + 5 #=> 23
```

To change the value of a variable after its been already been assigned you will need to assign
it again with the new desired value.

```(ruby)
age = 18
age = 33
age #=> 33
```

There will often be scenarios where you will want to do an operation to the original
value of a variable and reassign the variable as the result of that operation. this
is how you would do that:

```(ruby)
age = 18
age = age + 4 #=>  22
```

Because this is a common scenario Ruby provides a nice short hand
assignment operator for doing this `+=`:

```(ruby)
age = 18
age += 4 #=> 22
```

there are assignment operators like this for all the common math operators

```(ruby)
age = 18
age -= 2 #=> 16

cash = 10
cash *= 2 #=> 20

temperature = 40
temperature /= 10 #=> 4  
```


### How to name them
Ruby is a language which aims to be natural to read and easy to write. Remember this when you're naming your variables. The name should, as clearly as possible, aim to describe the what the value of the variable represents. Naming variables will pay dividends when you review your code months after you've written it when you can no longer clearly remember what that variable was designed to store. When deciding what your variable name will be keep this quote by John Woods at the front of your mind:

> Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.

The most basic thing you can do to write clean, maintainable code is name your variables properly.

variable names should always be lowercase and multiple words that make up a variable name should be split by an underscore this is known as _snake_case_.
```
#bad
a = "Hello"
number = 2

#good
age = 19
name = "John"
can_swim = false
```

### Assignment
1. Read the [variables chapter](http://ruby.bastardsbook.com/chapters/variables/) from the Bastards book of Ruby for alternative metaphors and deeper topics about variables. Don't worry if you don't understand everything completely, especially the sections about references. This will become more intuitive as you use ruby by completing exercises and projects.
2. Open up a [Ruby Repl](https://repl.it/languages/ruby) or IRB in your command line and try naming some variables and assigning some value to it. Don't try at this stage to name good variables but instead experiment with different variable names, run the Repl and see if it's valid. Try using symbols or numbers in your variable names. See what works and what doesn't. If you come across anything quirky Google it to find out why.

## Strings



## Numbers
I'm sure you already know what numbers are so there's no need to go into elaborate
metaphors about kitchenware here. Most of this section will be a review of what
you've already covered in the prep work.

Ruby has all the typical math operators you would expect:
```(ruby)
# addition
1 + 1 #=> 2

# subtraction
2 - 1 #=> 1

# multiplication
2 * 2 #=> 4

# division
10 / 5 #=> 2

# Modulus
10 % 5 #=> 1

# Exponent()
2 ** 2 #=> 4
```

### Integers and Floats
**Integers** are whole numbers such as 10.

**Floats** are numbers which have a decimal point such as 10.5.

Heres a couple of gotchas to bear in mind when working integers and floats:

When doing arithmetic with two integers the result will always be an integer.
Even if you didn't want it to be.

```(ruby)
17 / 5 #=> 3
```

To solve this problem just replace one of the integers with a float in the expression.

```(ruby)
17 / 5.0 #=> 3.4
```

### Converting Number Types
Ruby makes it very easy to convert numbers to and from floats or integers with a couple of
methods.
```(ruby)
# converting a float to an integer
13.0.to_i #=> 13

# converting to a integer to a float
13.to_f #=> 13.0
```

### Some Useful Number Methods
As you've read a few times now, everything in Ruby is an object. This includes
numbers. This means there are a lot of useful methods you can use with numbers.
Heres a few of the most common ones you'll use.

#### even?
```(ruby)
6.even? #=> true
7.even? #=> false
```

#### odd?
```(ruby)
6.odd? #=> false
7.odd? #=> false
```

#### zero?
```(ruby)
8.zero? #=> false
0.zero? #=> true
```


### Assignment
1. For an even deeper look at numbers read [this short chapter](http://ruby.bastardsbook.com/chapters/numbers/) of the bastards book of ruby


## Exercises
link to a repo of exercises with tests.

## Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

Link to no more than three additional resources to avoid this section becoming too cluttered.
* For a deeper explanation of how variables work under the hood read [this short section] from launch schools Learn to Program with Ruby book.
