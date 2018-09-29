### Introduction
Variables are a way of assigning names to things in your programs. You can think of a variable as a box with a label on it, they store something and have a name so you know what's inside them. This is an imperfect metaphor as you'll see by the end of this lesson but it should help with understanding variables for now.

### Learning Outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* What is a variable?
* How do you assign a value or an expression to a variable?
* What does the `+=` assignment operator do?
* What does the `-=` assignment operator do?
* What does the `*=` assignment operator do?
* What are the variable naming conventions?

### Declaring a Variable
This is how you make a variable in Ruby:

```ruby
age = 18 #=> 18
```

You can also assign a variable's value as the result of an expression.

```ruby
age = 18 + 5 #=> 23
```

Variables names are reusable, you can assign them to a new value at any point in your program.
This will override the value that is currently in the variable. Here's an example of that.

```ruby
age = 18
age #=> 18
age = 33
age #=> 33
```

There will often be scenarios where you will want to do an operation to the original
value of a variable and reassign that variable to the result of that operation. This
is how you would do that:

```ruby
age = 18
age #=> 18
age = age + 4
age #=> 22
```

Because this is a common scenario, Ruby provides a nice short hand
assignment operator for doing this `+=`:

```ruby
age = 18
age += 4 #=> 22
```

There are assignment operators like this for all the common math operators:

```ruby
age = 18
age -= 2 #=> 16

cash = 10
cash *= 2 #=> 20

temperature = 40
temperature /= 10 #=> 4
```

### How to Name Variables
Ruby is a language which aims to be natural to read and easy to write. Remember this when you're naming your variables. The name should, as clearly as possible, aim to describe what the value of the variable represents.

Naming variables will pay dividends when you review your code months after you've written it, when you can no longer clearly remember what that variable was designed to store. From now on, when naming your variables, remember the following quote by John Woods.

> Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.

The most basic thing you can do to write clean, maintainable code is name your variables properly. So get into this habit early to avoid psychopath programmers coming after you.

Variable names should always be lowercase and multiple words that make up a variable name should be split by an underscore. This is known as _snake_case_.

```ruby
# bad
a = "Hello"
number = 2

# good
age = 19
name = "John"
can_swim = false
```

### Variables are References
The information you name with a variable is stored in memory on your computer. So a variable is effectively a reference or a pointer to that address in memory. This can sometimes be the cause of unexpected behaviours from your code.


In the following example we have two variables, `desired_location` which is assigned to the string "Barcelona" and `johns_location` which is assigned to the `desired_location` variable. Both variables are pointing to where "Barcelona" is stored in memory.

```ruby
desired_location = "Barcelona"
johns_location = desired_location

desired_location #=> "Barcelona"
johns_location #=> "Barcelona"
```

This means if we modify the string "Barcelona" it will in turn change the value of both variables.

```ruby
johns_location.upcase! #=> "BARCELONA"

desired_location #=> "BARCELONA"
johns_location #=> "BARCELONA"
```

### Assignment
1. Read the [variables chapter](https://launchschool.com/books/ruby/read/variables) from the Launch School's brilliant Introduction to Programming with Ruby Book.
2. Read through these short, to the point variable lessons by Ruby Monstas
  * [Overview of Variables](http://ruby-for-beginners.rubymonstas.org/variables.html)
  * [Reusing Variables](http://ruby-for-beginners.rubymonstas.org/variables.html)
  * [Things on the Right go First](http://ruby-for-beginners.rubymonstas.org/variables/right_goes_first.html)  
3. Open up a [Ruby Repl](https://repl.it/languages/ruby) or IRB in your command line and try naming some variables and assigning some values to them. Don't try at this stage to name good variables but instead experiment with different variable names, run the Repl and see if it's valid. Try using symbols or numbers in your variable names. See what works and what doesn't. If you come across anything quirky, google it to find out why.


### Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*
* Read the full [Variables chapter](http://ruby.bastardsbook.com/chapters/variables) from The Bastards Book of Ruby if you can't get enough about variables.
* To dive deeper into how variables point to memory locations on your computer, go through these couple of short sections:
  * [Variables as pointers from Introduction To Programming with Ruby by Launch School](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)
  * [A visual Guide to how Variables work from the Variables chapter in The Bastards Book of Ruby](http://ruby.bastardsbook.com/chapters/variables/#visual-guide)
