
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
At first glance, you'd be forgiven for thinking Strings are just a bunch of characters that aren't very useful beyond getting user input and outputting some information to the screen, but like Burt Reynolds passing up the chance of playing Han Solo, you'd be wrong. Very wrong. What were you thinking Burt? 

- double and single quotes in strings
Strings can be formed with either double `""` or single`''` quotes. There are some small differences which will be explained below. 

### Concatenation
- using the shovel operator or the += method
To build on strings that have been created two of the most common ways are using `<<` and `+=`
```
hello = "hello" # => Set a variable called hello with the value "hello"
hello += ", world" # => The variable hello will now be "hello, world"
```
The same outcome could have been arrived at using `<<`
```
hello = "hello"
hello << ", world"
# => "hello, world"
```

### Interpolation
- using variables inside strings
Interpolation is a very handy skill which will keep your strings from looking really messy. Interpolation will only work inside strings using double quotation marks `""`. We interpolate using `#{}`. Anything inside the brackets `{}` will be evaluated as Ruby code and then converted to text.
Seeing is believing so we'll jump straight into some examples.
```
name = "Odin" # => Assign the value "Odin" to the variable name
hello = "Hello #{name}. Nice to meet you"
```
Here, using interpolation, the variable hello will now have a value of `"Hello Odin. Nice to meet you"`. Amazing!!!!!!

We can also use interpolation to evaluate code.

- using expressions inside strings

### Common string methods
You won't learn about methods until later. For now though all you need to know is that there are very easy ways to change the contents of your string by calling methods which are just names that contain code that will perform a certain action. You can find all the Methods of String in the [Ruby Docs](ruby-doc.org/core-2.4.0/String.html) but we'll focus below on some really simple ones that make manipulating strings a doddle.

- capitalize
```
"hello".capitalize
# => "Hello"
```
- include?
```
"hello.include?("lo")
# => true
```
- upcase
```
"hello".upcase
# => "HELLO"
```
- downcase
```
"Hello".downcase
# => "hello"
```
- empty?
```
"hello".empty?
# => false
```
- length
```
"hello".length
# => 5
```
- reverse
```
"hello.reverse"
# => "olleh"
```
- split
```
"hello world".split
# => ["hello", "world"]
```
- strip
```
"    hello, world       ".strip
# => "hello, world"
```

These are just a few of many string methods. If there's something you want to do with a String the first thing you should do is see if there is already a method that can do it for you. Why reinvent the wheel right? 

### Substrings
- slice.. aliased as -> [0..2], [1,3]

### Escape Characters
- \", \'
- \\
- \b
- \r
- \n
- \s
- \t

### String Manipulation
- gsub
- insert
- partition
- prepend

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
