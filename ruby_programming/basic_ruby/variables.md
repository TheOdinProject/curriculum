### Introduction
Variables are a way of assigning data to names in your programs. You can think of a variable as a box with a label on it: it stores something and has a name so that you know what's inside. This is an imperfect metaphor as you'll see by the end of this lesson, but it should help with understanding variables for now.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe what a variable is and how to assign it a value or expression.
 - Explain what the `+=`, `-=`, `*=`, and `/=` assignment operators do.
 - Describe the naming conventions for variables.

### Declaring a Variable
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

Because this is a common scenario, <span id="add-assignment-operator">Ruby provides a nice shorthand assignment operator for doing this: `+=`</span>.

~~~ruby
age = 18
age += 4 #=> 22
~~~

<span id="non-add-assignment-operators">There are similar assignment operators for all the common math operators</span>:

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

> Always code as if the person who ends up maintaining your code will be a violent psychopath who knows where you live.

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

Let's look at an example of this unexpected behavior, with two variables: `desired_location`, which is assigned to the string "Barcelona", and `johns_location`, which is assigned to the `desired_location` variable. Both variables are pointing to where "Barcelona" is stored in memory.

~~~ruby
desired_location = "Barcelona"
johns_location = desired_location

desired_location  #=> "Barcelona"
johns_location    #=> "Barcelona"
~~~

Unexpected behavior happens if the string "Barcelona" that is stored in memory is modified. One way to modify a string is to use the `upcase!` method, instead of the safe `upcase` method. If the string is modified using `johns_location.upcase!` then `desired_location` will also reflect that change:

~~~ruby
johns_location.upcase!  #=> "BARCELONA"

desired_location        #=> "BARCELONA"
johns_location          #=> "BARCELONA"
~~~

This example may be hard to completely understand at this point in the lesson. The important concept is that assigning variables to other variables can have unintended side effects. Just because you can do it, doesn't mean you should. You will have the opportunity to revisit this example in one of the following assignments.

### Assignment
<div class="lesson-content__panel" markdown="1">

1. Read the [Variables](https://launchschool.com/books/ruby/read/variables) chapter from LaunchSchool's brilliant *Introduction to Programming With Ruby*. As indicated in this article, remember that you should not use `$global_variables`. Additionally, `@@class_variables` are rarely needed and easily misused.
2. Read through these short, to-the-point variable lessons by Ruby Monstas:
      * [Overview of Variables](http://ruby-for-beginners.rubymonstas.org/variables.html)
      * [Reusing Variable Names](http://ruby-for-beginners.rubymonstas.org/variables/reusing_names.html)
      * [Things on the Right Go First](http://ruby-for-beginners.rubymonstas.org/variables/right_goes_first.html)
3. Open up a Ruby [repl.it](https://repl.it/languages/ruby) or use IRB in your command line and try naming some variables and assigning values to them. Don't worry so much about good naming conventions at this stage. Instead, experiment with different variable names and see what is valid. Try using symbols or numbers in your variable names. Try assigning a variable to another variable and observe the behavior when using `upcase!`, as in the example above. If you come across anything quirky, Google it to find out why it happened.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* Read the full [Variables](http://ruby.bastardsbook.com/chapters/variables) chapter from *The Bastards Book of Ruby* if you can't get enough about variables.
* To dive deeper into how variables point to memory locations on your computer, go through these short sections:
  * [Variables as Pointers](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers), from LaunchSchool's *Introduction to Programming With Ruby*.
  * [A visual guide to variables](http://ruby.bastardsbook.com/chapters/variables/#visual-guide) from the [Variables](http://ruby.bastardsbook.com/chapters/variables) chapter of *The Bastards Book of Ruby*
* If you want to know more about Ruby's naming conventions, check out the [Ruby Style Guide](https://github.com/rubocop-hq/ruby-style-guide). Don't get too deep into it; just know that it's there.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* <a class="knowledge-check-link" href="#introduction">What is a variable?</a>
* <a class="knowledge-check-link" href="#declaring-a-variable">How do you assign a value or an expression to a variable?</a>
* <a class="knowledge-check-link" href="#add-assignment-operator">What does the `+=` assignment operator do?</a>
* <a class="knowledge-check-link" href="#non-add-assignment-operators">What does the `-=` assignment operator do?</a>
* <a class="knowledge-check-link" href="#non-add-assignment-operators">What does the `*=` assignment operator do?</a>
* <a class="knowledge-check-link" href="#non-add-assignment-operators">What does the `/=` assignment operator do?</a>
* <a class="knowledge-check-link" href="#how-to-name-variables">What are the variable naming conventions?</a>
