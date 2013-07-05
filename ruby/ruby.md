# Ruby
Total Estimated Time: 100-200 hrs

## !! This section is incomplete !!

*[Top level table of contents](/README.md)*

## Table of Contents
1. Intro
2. Intermediate Ruby
3. Ruby and the Web
4. File I/O and Serialization
5. Testing Ruby with RSpec
6. Basic Data Structures
7. Basic Algorithms
8. Final Projects
9. Finish

## Intro

In this unit you will learn Ruby, the language designed specifically with programmer happiness in mind.  It's a healthy chunk of learning but, by the end of it all, you'll have built some pretty sweet games including Tic Tac Toe, Minesweeper, Checkers, and Chess.  You'll be able to put together a Twitter spambot (that really spams!), save and open files, test out your code, separate your spaghetti code into nice modular classes, and even reproduce some basic algorithms and data structures for solving complex problems.  Basically, you're going to start feeling a whole lot more like a real programmer and that feeling will be justified.

Some people believe you can just dive right into Rails and start firing out websites.  Rails is a framework built using Ruby and every piece of code in it is Ruby.  When (not *if*) something in your project breaks, you'd better be able to debug it.  And what happens when you want to stretch your wings and do something just a bit beyond what the vanilla tutorials show you how to do?  The amount of time you'd spend googling your error messages and staring blankly at help docs was better spent learning Ruby.

As you may gather, this is also where the real project work begins.  Some of the early material will be fairly straightforward and will rely on simple exercises to help reinforce understanding.  As we get further along and into some of the more advanced topics, we'll be learning less and doing more... just the way it should be.   Buckle up, strap in, and let's get learning!

**How this will work:**

Ruby's a big language so it's been broken up into smaller chunks to make it more digesible.  In each section, you'll first be asked to do readings, watch videos, or otherwise view content.  We'll provide a "A Brief Summary" of the material but it's not a replacement for actually doing the reading.  At the end of each section or group of sections will be programming exercises which are best done in pairs.

**Our free resources:**

The goal here is to provide as much of this curriculum as possible using free resources.  If you've done the prep work from Web Development 101 then you should have a good handle on the basics but these resources are important to help you really understand the material.
* The staple book: Zed Shaw's [Learn Code the Hard Way](http://ruby.learncodethehardway.org/book/), an extension of his wildly popular Learn Python the Hard Way into Ruby.
* For the crazies: Why's [Poignant Guide to Programming](http://mislav.uniqpath.com/poignant-guide/book/chapter-1.html) (check it out... if it jives with your learning style, you may have found the match you never thought you'd find)
* If there's anything you need to brush up on still: [The Ruby User's Guide](http://www.rubyist.net/~slagell/ruby/) has sections on many topics you might want to dive back into for a deeper look.

**Other good resources:**
* Peter Cooper's [Beginning Ruby](http://beginningruby.org/) is a solid introduction to Ruby that covers pretty much the breadth of the language as you need to understand it.
* Brian Marick's [Everyday Scripting with Ruby](http://pragprog.com/book/bmsft/everyday-scripting-with-ruby) takes a pragmatic approach to learning Ruby to help with the kinds of problems you might face in a variety of different real-world work scenarios.

## Basic Ruby

### Intro

Ruby shouldn't be anything new to you by now... you should have completed the preparatory readings, Ruby Monk, and the test-first exercises as part of the [Ruby 101 section of the Web Development 101 Unit](/web_development_basics/web_development_basics.md#ruby-101) that you completed prior to jumping into this.  If you haven't, go back and work on that before getting started here.  It's expected that you have a pretty good handle on the basics of the Ruby language and an idea of what you're still shakey on.

In this section on Basic Ruby, we're going to make sure you really do understand all the building blocks of the language and of programming in general.  If there's something that you still just don't quite understand, track it down via the Additional Resources section or Google for it on your own.  *How* you learn isn't as important as making sure you're comfortable with your understanding of everything that will be covered here.

### Primitive Data Types

Primitive data types are the basic building blocks of computer programs.  Understanding them and what you can do with them is like knowing your ABC's.  Get well acquainted with Numbers, Strings, Arrays, Hashes, Enumerable methods, Objects, Ranges, and Dates/Times.  You're populating your developer's toolkit.

The exercises should help you hone in on what things you understand well and which ones you need to dig deeper on.  The larger exercises towards the end will round things out a bit more wholistically.

#### Numbers and Operators and Expressions
##### Goals
This is pretty straightforward stuff.  The goal here is to familiarize yourself with all basic data types and how they interact in arithmetic expressions

##### Thought Questions
* What's the difference between `=`, `==`, and `===`?
* How do you do exponents in Ruby?

##### Do These First
* Read [Learn Ruby the Hard Way Chapters 1-5](http://ruby.learncodethehardway.org/book/ex3.html)
* Read [Learn to Program Chapter 1](http://pine.fm/LearnToProgram/?Chapter=01) (You should already have completed this)
* Read [http://rubylearning.com/satishtalim/numbers_in_ruby.html](http://rubylearning.com/satishtalim/numbers_in_ruby.html)

##### A Brief Summary

When doing mathematical operations, Ruby expects the result to be the same type as the inputs, so dividing two integers by each other will produce an integer... whether you want to or not:

    > 5 / 3
    => 1  

To fix this, you need to make one of the inputs a different data type that can handle decimals, like a *floating point* number (float): 

    > 5.0 / 3 
    => 1.6666666666666667

Because Ruby is so flexible, it lets you do some quirky things like multiplying completely different data types together in a way that you sort of think you *should* be able to but never expected to actually be able to do:

    > "hi" * 3
    => "hihihihi"

These types of operations work the same way with variables:

    > my_word = "howdy"
    => "howdy"
    > my_word * 3
    => "howdyhowdyhowdy"

For equality:
* `=` is for assignment, so it assigns a value to a variable as in `> name = "Erik"`
* `==` is for checking that two things are equal but don't have to be identical instances.  You'll use this in most cases, especially when working with conditional statements.  `> 1 + 1 == 2` returns '=> true'.  When you start creating your own classes (like an "Animal" class), you'll need to tell Ruby how to compare two animal instances by writing your own version of this method (it's easy).
* `===` can actually mean some different things (you can overwrite it easily). You will probably be sticking with `==` in most situations, but it's good to understand `===` as well.  `===` typically asks whether the thing on the right is a member or a part or a type of the thing on the left.  If the thing on the left is the range `(1..4)` and we want to know if 3 is inside there:

    > (1..4) === 3
    => true

This also works for checking whether some object is an instance of a class:

    > Integer === 3
    => true

See [http://stackoverflow.com/questions/4467538/what-does-the-operator-do-in-ruby](http://stackoverflow.com/questions/4467538/what-does-the-operator-do-in-ruby) for a more detailed explanation.

##### Exercises
* Play around in IRB and just try multiplying and dividing and equating and comparing things to each other.  Be creative until you have a good handle on things.

#### Objects and Methods
##### Intro and Goals
"Everything in Ruby is an Object" is something you'll hear rather frequently.  "Pretty much everything else is a method" could also be said.  The goal here is for you to see the Matrix... that everything in Ruby is an Object, every object has a class, and being a part of that class gives the object lots of cool methods that it can use to ask questions or do things.  Being incredibly object-oriented gives Ruby lots of power and makes your life easier.

Hopefully you've already picked most of this up from the prep-work.

##### Thought Questions
* What is an object?
* What is a class?
* What is a method?
* How can you print out an object or class's methods?
* What is inheritance?
* How many classes can a class inherit from in Ruby?
* What's the top-level ancestor class that all others inherit from in Ruby?
* What are Reflection Methods?
* What are a method's Side Effects?
* How do methods take inputs?
* Do all methods have outputs?
* What is Method Chaining and how does it work?

##### Do These First
* [Ruby Inheritance](http://rubylearning.com/satishtalim/ruby_inheritance.html)

##### A Brief Summary
  
Think of every "thing" in Ruby as a having more than meets the eye. The number `12` is more than just a number... It's an **object*** and Ruby lets you do all kinds of interesting things to it like adding and multiplying and asking it questions like `> 12.class` or `> 12+3`.

Ruby gives all objects a bunch of neat **methods**.  If you ever want to know what an object's methods are, just use the `.methods` method!  Asking `> 12345.methods` in IRB will return a whole bunch of methods that you can try out on the number 12345.  You'll also see that the basic operators like `+` and `-` and `/` are all methods too (they're included in that list).  You can call them using the dot `> 1.+2` like any other method or, luckily for you, Ruby made some special shortcuts for them so you can just use them as you have been: `> 1+2`.

Some methods ask true/false questions, and are usually named with a question mark at the end like `.is_a?`, which asks whether an object is a type of something else, e.g. `1.is_a?Integer` returns `true` while `"hihi".is_a?Integer` returns `false`.  You'll get used to that naming convention.  Methods like `.is_a?`, which tell you something about the object itself, are called **Reflection Methods** (as in, "the object quietly reflected on its nature and told me that it is indeed an Integer").  `.class` was another one we saw, where the object will tell you what class it is.

What is a method? A method is just a function or a black box.  You put the thing on the left in, and it spits something out on the right.  *Every method returns something*, even if it's just `nil`.  Some methods are more useful for their **Side Effects** than the thing they actually return, like `puts`.  That's why when you say `> puts "hi"` in IRB, you'll see a little `=> nil` down below... the method prints out your string as a "side effect" and then returns `nil` after it's done.  When you write your own methods, if you forget to think about the return statement, sometimes you'll get some wierd behavior so always think about what's going in and what's coming out of a method.

Methods can take **inputs** too, which are included in parentheses to the right of the method name (though they can be omitted, as you do with `> puts("hi")` becoming `> puts "hi"`... it's okay to be lazy, as long as you know what you're doing).  Going back to the addition example, `> 1+2==3` is asking whether 1+2 will equal 3 (it returns `=> true`), but it can more explicitly be written `> 1.+(2).==(3)`.  So, in this case, you can see there's more going on than meets the eye at first.  

That example also shows **Method Chaining**, which is when you stick a bunch of methods onto each other.  It behaves like you'd expect -- evaluate the thing on the left first, pass whatever it returns to the method on the right and keep going.  So `> 1+2==3` first evaluates `1+2` to be `3` and then evaluates `3==3` which is `true`.  This is great because it lets you take what would normally be many lines of code and combine them into one elegant expression.

**Bang Methods** are finished with an exclamation point `!` like `.sort!`, and they actually modify the original object.  Remember, when you run a normal method in IRB, it will output whatever the method returns but it will preserve the original object.  Bang methods save over the original object:

    > my_numbers = [1,5,3,2]
    => [1, 5, 3, 2]
    > my_numbers.sort
    => [1, 2, 3, 5]
    > my_numbers
    => [1, 5, 3, 2]          # still unsorted
    > my_numbers.sort!
    => [1, 2, 3, 5]
    > my_numbers
    => [1, 2, 3, 5]          # overwrote the original my_numbers object!

Let's answer the question, "Where did all those methods come from?" **Classes** are like umbrellas that let us give an object general behaviors just based on what it is.  An object is an instance of a class -- you (yes, you) are an instance of the `Person` class.  There are lots of behaviors (methods) that you can do just by virtue of being a `Person`... `.laugh`, `.jump`, `.speak("hello")`.  This is really useful in programming because you often need to create lots of instances of something and it's silly to have to rewrite all the methods you want all of them to have anyway, so you write them at the class level and all the instances get to use them.

Instances of a class get to **inherit** the behaviors of that class.  Inheritance works for classes too!  Your class `Person` has lots of methods but many of them are inherited just by virtue of you also being a `Mammal` or even just a `LivingThing`.  You get to use all the methods of your ancestor classes

An interesting exercise to try in Ruby is to use the method `.superclass` to ask a class what its parent is.  If you just keep on going and going, you'll see that everything eventually inherits from `BasicObject`, which originates most of the methods you have access to in the original object:

    > 1.class.superclass.superclass.superclass
    => BasicObject
    > BasicObject.methods
    => # giant list of methods

Random Note: Running the `.methods` method on a class only returns the class methods, whereas `.instance_methods` will return all methods available to any instance of that class (so `String.methods` will return a list of class methods, while `"hello".methods` will return a longer list that is the same as `String.instance_methods`).

Other Random Note: Use `.object_id` to see an object's id, and this can be useful if you're running into odd errors where you thought you were modifying and object but it's not changing.  If you debug and look at the id's along the way, you may find that you're actually only modifying a COPY of that object.

##### Exercises
##### Additional Resources

#### Strings
##### Intro and Goals
##### Thought Questions
* What's the difference between single and double quotes?
* What is string interpolation?
* What are escape characters?
* What are line breaks?
* How do you make other things into strings?
* How do you concatenate strings?
* How do you access a specific character or substring?
* How do you split up strings into arrays?
* How are strings an arrays similar?
* How do you get and clean up user input on the command line?
* What does it mean that strings are "mutable" and why care?
* What is a symbol?
* How is a symbol different from a string?
* What is a Regular Expression (RegEx)?

##### Check these out First
* [Chris Pine on Strings](http://pine.fm/LearnToProgram/?Chapter=02) (was part of the prep work)
* A list of [Escape Characters](http://www.java2s.com/Code/Ruby/String/EscapeCharacterslist.htm) in Ruby
* Read through (and watch the video) for this [Regular Expressions in Ruby](http://net.tutsplus.com/tutorials/ruby/ruby-for-newbies-regular-expressions/) explanation.
* A great little [Regex Tutorial](http://regexone.com/) and the example problems (should only take an hour or so) 

##### A Brief Summary
Strings are just made up of individual characters and denoted with quotes.  `I confuse Ruby and probably throw an error` but `"I do not because I have quotes"`.  

**Double Quotes** are often interchangeable with **Single Quotes**... there's almost no difference and you're free to use either.  Two cases make the distinction important:

A) When you want to show quotes inside a string:

    > my_long_string = "And she said, 'Cool program!'"
    => "And she said, 'Cool program!'"

Note that you can accomplish the same type of thing by escaping the quote characters (see below).

B) When you want to use string interpolation and when you want to show quotes within a string.

**String Interpolation** occurs when you want to plug something else into a string, like a variable.  You'll find yourself using this a lot, for instance, when you make websites with dynamic text content that needs to change depending on who is logged in.  Simply use the pound symbol and curly braces `#{}` to do so, and the output of whatever is within those curly braces will be converted to a string and, presto! You've got a new string:

    > my_name = "Tiny Tim"
    => "Tiny Tim"
    > my_string = "My name is #{my_name}!"
    => "My name is Tiny Tim!"

The key point here, though, is that interpolation *only works inside DOUBLE quotes*.  Keep the interpolated stuff brief or your code won't be very legible.  Single quotes will simply escape every special character in the string and treat it like a normal letter (so the pound-curly-braces has no special meaning):

    > my_name = "Neo"
    => "Neo"
    > my_string = 'My name is #{my_name}!'
    => "My name is \#{my_name}!"  # Hey! That's not what we wanted!

**Escaping** characters just means telling the output program to not treat them specially at all (like the pound symbol, which has special meaning before the curly braces).  You do so with a back slash `\` before whatever you want to escape.  Sometimes you'll see what looks like a strange jumble of characters in your output, with lots of those '\' floating around, and you'll know that you've got some escaping going on.

    > now = "RIGHT NOW"
    => "RIGHT NOW"
    > puts "interpolating #{now} but not \#{now}"
    "interpolating RIGHT NOW but not #{now}"
    => nil            # Remember, puts returns nil!

IRB shows you the backslashes, but they'll be hidden in your `puts` output.

As you can imagine, this could get pretty tedious if you're trying to output a blog post or some other long batch of text that contains lots of mixed characters and don't want to manually or programmatically replace special characters, so later we'll see some simple convenience methods to use to take care of those issues for you.

There are some special characters that are actually denoted using the backslash and you'll want to know the key ones, which will probably pop up again and again:  
* `\n` will output a new line
* `\r` is a newline too (carriage return)
* `\t` will output a tab

    > puts "let's put a bunch of newlines between this\n\n\nand this."



    and this.
    => nil

**`to_s`** is a method that will try to convert anything into a string.  

    > 12345.to_s
    => "12345"

This method gets called a LOT behind the scenes later on... basically anytime Ruby or especially Rails is outputting or rendering something (like a variable), it will call `to_s` on it to make it a nice friendly string first.  

Fun fact: If you've created your own object, you may need to write your own `to_s` method for it to display properly in some settings (e.g. looking ahead, if you've got a Person object and want to display its first name only whenever you tried to `puts` it, you'd want to write the `to_s` method to do so).

**Combining Strings** without using interpolation can be done using "concatenation", or basically just adding them together:

    > my_name = "Billy Bob"
    > "hello" + " world" + ", say I, the great " + my_name + "!"
    # => "hello world, say I, the great Billy Bob!"

Instead of adding them with a plus `+`, you can also use the friendly shovel operator `<<` to append to a string (just like with arrays...):

    > "howdy " << "fella!"
    => "howdy fella!"

To **Access a Specific Character or Substring** of a string, just treat it like an array!  A string acts like a zero-indexed array that ends at -1, so use `[0]` to access the first letter, `[-1]` to access the last letter, and `[n..m]` to pluck a substring:

    > s = "hello"
    => "hello"
    > s[0]
    => "h"
    > s[-1]
    => "o"
    > s[-2]
    => "l"
    > s[2..4]
    => "llo"
    > s[1..-2]
    => "ell"

**Break a String into Pieces** using `.split`, which creates an array of substrings that are broken up based on whatever character you passed in:

    > list = "eggs, milk, cheese and crackers"
    => "eggs, milk, cheese and crackers"
    > list.split(", ")
    => ["eggs", "milk", "cheese and crackers"]
    > list.split(" ")
    => ["eggs,", "milk,", "cheese", "and", "crackers"]

You can also split based on individual characters by passing either a blank string or a blank regular expression (denoted by `//`):

    > list.split("")      # or also list.split(//)
    => ["e", "g", "g", "s", ",", " ", "m", "i", "l", "k", ",", " ", "c", "h", "e", "e", "s", "e", " ", "a", "n", "d", " ", "c", "r", "a", "c", "k", "e", "r", "s"] 

When you write your Ruby programs, you'll probably want to ask for **User Input**... which is easy with `gets`, which then waits for the user to type something.  You'll want to store whatever the user types into a variable and be sure to trim off the extra line break (from when the user hit the `enter` key) using `.chomp`:

    > player1 = gets    
    Erik                # this was typed in manually
    => "Erik\n"         # woah, let's get rid of that \n
    > player1 = gets.chomp
    Erik
    => "Erik"           # better.

`.chomp` will cut off a space or newline at the END of the string (and can take an optional input so you can specify what exactly to chomp off). `.strip` will remove ALL spaces and newlines from both the beginning and end of the string:

    > " dude \n".chomp
    => " dude "         # still have the extra spaces
    > " dude \n".strip
    => "dude"           # clean as a whistle.

Of course, it's up to you to figure out if your user has entered something illegal or harmful, but at least you have an easy job removing extraneous spaces and returns.

**Other Helpful String Methods** include:
* `.length` to get the length of the string
* `.downcase` to convert `"ALL THIS"`` to `"all this"`
* `.upcase` to convert `"all this"` back to `"ALL THIS"`
* `.reverse` to convert `"hello"` to `"olleh"`

Fun fact: Strings made with the backtick characters `` ` `` (which is usually located on the same key as the tilde `~`) are actually interpolated and run by your operating system, so in IRB if you type ``> puts `ls` `` on a mac, it will actually output your directory contents!

What about all the times you may want to **Search For or Replace Within Strings**?  For that, you need to begin understanding **Regular Expressions**, or "RegEx"'s.  There's a handy method for strings called `.gsub(pattern, replace_with_this)`, which finds any occurrances of that pattern and replaces it with whatever you want:

    > "hello".gsub("l","r")
    => "herro"

But what if you want to go looking for more advanced patterns than just simple letters?  Pretty much anytime you've got a function that needs to go mucking through a string looking for patterns, you can employ a Regular Expression.  

Regular Expressions are really just a special syntax that is used to find things (and not just in Ruby, they're used all over the place).  It's beyond the scope of this summary for sure, but I hope you've tried them out at [RegexOne](http://regexone.com/).  Once you know how to match stuff, you'll feel ready to take on any big dictionary files or big batches of questionable user input that needs to be standardized.  But be careful, it can be too tempting to go hog-wild with your expressions. It's something you should at least know the basics of but probably will not be applying all that often "in the wild".  

The last thing to cover is **Symbols**, which start creeping up all over the place when you get into Rails and even Hashes.  Symbols are denoted with the colon before the name, e.g. `:my_symbol` instead of `"my_string"`.  A symbol is basically like a string without any depth... string lite, if you will.  A string is **Mutable**, meaning it can be added to, reversed, and generally messed with in a hundred different ways.  Whenever you have text that you want to play around with or use as, well, text, just stick with strings.

But sometimes all you want is a name, like when you're using a hash key.  In that case, it makes sense to use symbols.  Symbols are immutable, so they don't change.  They are also only stored in memory in one place, wherease strings have a new place in memory each time you declare one:

    > "hello".object_id
    => 70196107337380
    > "hello".object_id
    => 70196107320960       # different
    > :hello.object_id
    => 461128
    > :hello.object_id
    => 461128               # same!

While you're learning, just stick with strings until you see the examples using symbols, which will mostly be with hash keys.

##### Exercises
* know:
* reading/vids
* A Brief Summary
* thought questions
* exercises

#### Arrays
##### Intro and Goals
##### Thought Questions
##### Check these out First
##### A Brief Summary
##### Exercises
* know:
* reading/vids
* CODECADEMY http://www.codecademy.com/tracks/ruby

* Creating an Array
* Accessing items (index and range)
* Changing items
* Adding and Removing items (push and pop and shift and unshift and shovel)
* Helper methods (size, count)
* Arrays to strings
* Include?
* Sort
* Shuffle
* First, Last
* Sample
* Pluralize Names
* Best practices with arrays: One thing only
** EXERCISES **
* thought questions
* Test-first exercises

#### Hashes
##### Intro and Goals
##### Thought Questions
##### Check these out First
CODECADEMY http://www.codecademy.com/tracks/ruby
##### A Brief Summary
##### Exercises

#### Numbers, Strings and Arrays and Hashes Exercises (Paired)
* sort
* reverse
* 
* towers of hanoi
* 

#### Enumerable
##### Intro and Goals
##### Thought Questions
##### Check these out First
##### A Brief Summary
##### Exercises

#### Ranges
##### Intro and Goals
##### Thought Questions
##### Check these out First
##### A Brief Summary
##### Exercises

#### Dates and Times
##### Intro and Goals
##### Thought Questions
##### Check these out First
##### A Brief Summary
##### Exercises

#### Advanced Issues
##### Intro and Goals
Puts vs p
.to_s
.inspect
##### Thought Questions
##### Check these out First
##### A Brief Summary
##### Exercises

#### Tutorial

#### Exercises (Paired) >> PUT LATER AFTER METHODS / BLOCKS!
* Rewrite the following methods from Enumerable.  You may not use the real method... which should be obvious.  You MAY use #each in the following methods once you've created it yourself the first time:
    * #each
    * #each_with_index
    * #map
    * #select
    * 

### Conditionals and Flow Control

So now you've got an understanding of what tools you can use and it's time to start thinking about how the program moves through your code.

CODECADEMY http://www.codecademy.com/tracks/ruby

#### If/Else

##### The Ternary Operator

##### Until

#### Case Statements

#### Exercises

### Methods

You have the power to assemble the building blocks and control how your program steps through them.  You may have been told that "everything in Ruby is a method."  So what are methods anyways?

#### Everything is an Object

#### Inputs

Symbols, hashes, options hashes, default values

#### Return Statements

#### Side Effects

#### Method Chaining

#### KISS

### Blocks... Huh?

One of the most confusing parts of learning basic Ruby is understanding what blocks are and how they work.  It shouldn't be, because they're actually pretty simple.

[Procs, Lambdas and Closures in Ruby by Peter Cooper (video)](http://www.youtube.com/watch?v=VBC-G6hahWA)

http://www.rubytapas.com/episodes/36-Blocks-Procs-and-Lambdas 
> Blocks vs procs vs lambdas free screencast.  Need to know call though.

http://www.robertsosinski.com/2008/12/21/understanding-ruby-blocks-procs-and-lambdas/

Blocks explained by Alex Chaffee (video) (http://codelikethis.com/lessons/ruby_blocks/blocks)

CODECADEMY http://www.codecademy.com/tracks/ruby

#### Blocks are Very Ruby-ish

#### Ways to declare a Block

#### Block Return Statements

#### Where Blocks are Used

#### Examples

#### Procs

#### Examples

#### Exercises

### Iteration

CODECADEMY http://www.codecademy.com/tracks/ruby

You can assemble code, tell the program which parts of it to execute, and wrap it all up in a method.  There's still something missing... what if you want to make something happen a whole bunch of times?  You certainly don't just run the method again and again.  Luckily we've got several standard ways of iterating through a piece of code until we tell the program to stop.

### Projects

### Style
https://github.com/bbatsov/ruby-style-guide

## Intermediate Ruby

Classes, inheritance (use .methods), OO design, refactoring, naming, recursion, scope, regex, Modules, metaprogramming (reflection?)
http://www.codecademy.com/tracks/ruby for oop

## Ruby and the Web

## File I/O and Serialization

## Testing with RSpec and Test Driven Development

## Basic Data Structures

## Basic Algorithms

## Final Projects

## Finish







