### Introduction
Variables are a way of assigning data to names in your programs. You can think of a variable as a box with a label on it: it stores something and has a name so that you know what's inside. This is an imperfect metaphor as you'll see by the end of this lesson, but it should help with understanding variables for now.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe what a variable is and how to assign it a value or expression.
 - Explain what the `+=`, `-=`, `*=`, and `/=` assignment operators do.
 - Describe the naming conventions for variables.

#### Declaring a Variable
This is how to create a variable in Ruby:

~~~ruby
age = 18 #=> 18
~~~

You can also assign the result of an expression to a variable.

~~~ruby
age = 18 + 5 #=> 23
~~~

Variable names are reusable, so you can assign a new value to a variable at any point in your program. Naturally, doing so will override the original value.

~~~ruby
age = 18
age #=> 18
age = 33
age #=> 33
~~~

There will often be scenarios where you want to perform an operation on the original value of a variable and then reassign the result of that operation to the same variable.

~~~ruby
age = 18
age #=> 18
age = age + 4
age #=> 22
~~~

Because this is a common scenario, Ruby provides a nice shorthand assignment operator for doing this: `+=`.

~~~ruby
age = 18
age += 4 #=> 22
~~~

There are similar assignment operators for all the common math operators:

~~~ruby
age = 18
age -= 2  #=> 16

cash = 10
cash *= 2 #=> 20

temperature = 40
temperature /= 10 #=> 4
~~~

#### How to Name Variables
Ruby is a language that aims to be natural to read and easy to write. Remember this when you're naming your variables. The name should, as clearly as possible, describe what the value of the variable represents.

Naming variables clearly will pay dividends when you review your code months after you've written it, when you can no longer remember what that variable was designed to store. From now on, when naming your variables, remember the following quote by John Woods:

> Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.

The most basic thing you can do to write clean, maintainable code is to name your variables properly. So get into this habit early to avoid psychopath programmers coming after you.

Variable names should always be lowercase, and multiple words that make up a variable name should be split by an underscore. This is known as **snake_case**.

~~~ruby
# bad
a = 19
string = "John"

# good
age = 19
name = "John"
can_swim = false
~~~

#### Variables are References
The information you name with a variable is stored in memory on your computer, so a variable is effectively a reference or a pointer to that address in memory. This is important to know as it can sometimes be the cause of unexpected behavior from your code.

In the following example, we have two variables: `desired_location`, which is assigned to the string "Barcelona", and `johns_location`, which is assigned to the `desired_location` variable. Both variables are pointing to where "Barcelona" is stored in memory.

~~~ruby
desired_location = "Barcelona"
johns_location = desired_location

desired_location  #=> "Barcelona"
johns_location    #=> "Barcelona"
~~~

Now, if we modify the string that `johns_location` is pointing to, `desired_location` will also reflect that change:

~~~ruby
johns_location.upcase!  #=> "BARCELONA"

desired_location        #=> "BARCELONA"
johns_location          #=> "BARCELONA"
~~~

Assigning variables to other variables can therefore have some unintended side effects. Just because it looks like fun doesn't mean you should do it, too. But you know what is fun? *Reading assignments*!

### Assignment
<div class="lesson-content__panel" markdown="1">

1. Read the [Variables](https://launchschool.com/books/ruby/read/variables) chapter from LaunchSchool's brilliant *Introduction to Programming With Ruby*.
2. Read through these short, to-the-point variable lessons by Ruby Monstas:
      * [Overview of Variables](http://ruby-for-beginners.rubymonstas.org/variables.html)
      * [Reusing Variables](http://ruby-for-beginners.rubymonstas.org/variables/reusing_names.html)
      * [Things on the Right Go First](http://ruby-for-beginners.rubymonstas.org/variables/right_goes_first.html)
3. Open up a Ruby [repl.it](https://repl.it/languages/ruby) or use IRB in your command line and try naming some variables and assigning values to them. Don't worry so much about good naming conventions at this stage. Instead, experiment with different variable names and see what is valid. Try using symbols or numbers in your variable names. If you come across anything quirky, Google it to find out why it happened.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Read the full [Variables](http://ruby.bastardsbook.com/chapters/variables) chapter from *The Bastards Book of Ruby* if you can't get enough about variables.
* To dive deeper into how variables point to memory locations on your computer, go through these short sections:
  * [Variables as Pointers](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers), from LaunchSchool's *Introduction to Programming With Ruby*.
  * [A visual guide to variables](http://ruby.bastardsbook.com/chapters/variables/#visual-guide) from the [Variables](http://ruby.bastardsbook.com/chapters/variables) chapter of *The Bastards Book of Ruby*
* If you want to know more about Ruby's naming conventions, check out the [Ruby Style Guide](https://github.com/rubocop-hq/ruby-style-guide). Don't get too deep into it; just know that it's there.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* What is a variable?
* How do you assign a value or an expression to a variable?
* What does the `+=` assignment operator do?
* What does the `-=` assignment operator do?
* What does the `*=` assignment operator do?
* What does the `/=` assignment operator do?
* What are the variable naming conventions?
