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

Ruby's a big language so it's been broken up into smaller chunks to make it more digesible.  In each section, you'll first be asked to do readings, watch videos, or otherwise view content.  We'll provide a "digest" of the material but it's not a replacement for actually doing the reading.  At the end of each section or group of sections will be programming exercises which are best done in pairs.

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

##### Questions
* What's the difference between `=`, `==`, and `===`?
* How do you do exponents in Ruby?

##### Do These First
* Read [Learn Ruby the Hard Way Chapters 1-5](http://ruby.learncodethehardway.org/book/ex3.html)
* Read [Learn to Program Chapter 1](http://pine.fm/LearnToProgram/?Chapter=01) (You should already have completed this)
* Read [http://rubylearning.com/satishtalim/numbers_in_ruby.html](http://rubylearning.com/satishtalim/numbers_in_ruby.html)

##### Digest

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

##### Questions
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

##### Digest
  
Think of every "thing" in Ruby as a having more than meets the eye. The number `12` is more than just a number... It's an **object*** and Ruby lets you do all kinds of interesting things to it like adding and multiplying and asking it questions like `> 12.class` or `> 12+3`.

Ruby gives all objects a bunch of neat **methods**.  If you ever want to know what an object's methods are, just use the `.methods` method!  Asking `> 12345.methods` in IRB will return a whole bunch of methods that you can try out on the number 12345.  You'll also see that the basic operators like `+` and `-` and `/` are all methods too (they're included in that list).  You can call them using the dot `> 1.+2` like any other method or, luckily for you, Ruby made some special shortcuts for them so you can just use them as you have been: `> 1+2`.

Some methods ask true/false questions, and are usually named with a question mark at the end like `.is_a?`, which asks whether an object is a type of something else, e.g. `1.is_a?Integer` returns `true` while `"hihi".is_a?Integer` returns `false`.  You'll get used to that naming convention.  Methods like `.is_a?`, which tell you something about the object itself, are called **Reflection Methods** (as in, "the object quietly reflected on its nature and told me that it is indeed an Integer").  `.class` was another one we saw, where the object will tell you what class it is.

What is a method? A method is just a function or a black box.  You put the thing on the left in, and it spits something out on the right.  *Every method returns something*, even if it's just `nil`.  Some methods are more useful for their **Side Effects** than the thing they actually return, like `puts`.  That's why when you say `> puts "hi"` in IRB, you'll see a little `=> nil` down below... the method prints out your string as a "side effect" and then returns `nil` after it's done.  When you write your own methods, if you forget to think about the return statement, sometimes you'll get some wierd behavior so always think about what's going in and what's coming out of a method.

Methods can take **inputs** too, which are included in parentheses to the right of the method name (though they can be omitted, as you do with `> puts("hi")` becoming `> puts "hi"`... it's okay to be lazy, as long as you know what you're doing).  Going back to the addition example, `> 1+2==3` is asking whether 1+2 will equal 3 (it returns `=> true`), but it can more explicitly be written `> 1.+(2).==(3)`.  So, in this case, you can see there's more going on than meets the eye at first.  

That example also shows **Method Chaining**, which is when you stick a bunch of methods onto each other.  It behaves like you'd expect -- evaluate the thing on the left first, pass whatever it returns to the method on the right and keep going.  So `> 1+2==3` first evaluates `1+2` to be `3` and then evaluates `3==3` which is `true`.  This is great because it lets you take what would normally be many lines of code and combine them into one elegant expression.

Let's answer the question, "Where did all those methods come from?" **Classes** are like umbrellas that let us give an object general behaviors just based on what it is.  An object is an instance of a class -- you (yes, you) are an instance of the `Person` class.  There are lots of behaviors (methods) that you can do just by virtue of being a `Person`... `.laugh`, `.jump`, `.speak("hello")`.  This is really useful in programming because you often need to create lots of instances of something and it's silly to have to rewrite all the methods you want all of them to have anyway, so you write them at the class level and all the instances get to use them.

Instances of a class get to **inherit** the behaviors of that class.  Inheritance works for classes too!  Your class `Person` has lots of methods but many of them are inherited just by virtue of you also being a `Mammal` or even just a `LivingThing`.  You get to use all the methods of your ancestor classes

An interesting exercise to try in Ruby is to use the method `.superclass` to ask a class what its parent is.  If you just keep on going and going, you'll see that everything eventually inherits from `BasicObject`, which originates most of the methods you have access to in the original object:

    > 1.class.superclass.superclass.superclass
    => BasicObject
    > BasicObject.methods
    => # giant list of methods

##### Exercises
##### Additional Resources

#### Strings
##### Intro and Goals
##### Questions
* What is a symbol?
* How is a symbol different from a string?
##### Check these out First
##### Digest
##### Exercises
* know:
* reading/vids
* digest
* thought questions
* exercises

#### Arrays
##### Intro and Goals
##### Questions
##### Check these out First
##### Digest
##### Exercises
* know:
* reading/vids

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
##### Questions
##### Check these out First
##### Digest
##### Exercises

#### Numbers, Strings and Arrays and Hashes Exercises (Paired)
* sort
* reverse
* 
* towers of hanoi
* 

#### Enumerable
##### Intro and Goals
##### Questions
##### Check these out First
##### Digest
##### Exercises

#### Objects
##### Intro and Goals
##### Questions
##### Check these out First
##### Digest
##### Exercises

#### Ranges
##### Intro and Goals
##### Questions
##### Check these out First
##### Digest
##### Exercises

#### Dates and Times
##### Intro and Goals
##### Questions
##### Check these out First
##### Digest
##### Exercises

#### Advanced Issues
##### Intro and Goals
Puts vs p
.to_s
.inspect
##### Questions
##### Check these out First
##### Digest
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

Blocks explained by Alex Chaffee (video) (http://codelikethis.com/lessons/ruby_blocks/blocks)

#### Blocks are Very Ruby-ish

#### Ways to declare a Block

#### Block Return Statements

#### Where Blocks are Used

#### Examples

#### Procs

#### Examples

#### Exercises

### Iteration

You can assemble code, tell the program which parts of it to execute, and wrap it all up in a method.  There's still something missing... what if you want to make something happen a whole bunch of times?  You certainly don't just run the method again and again.  Luckily we've got several standard ways of iterating through a piece of code until we tell the program to stop.

### Projects


## Intermediate Ruby

Classes, inheritance (use .methods), OO design, refactoring, naming, recursion, scope, regex, Modules, metaprogramming (reflection?)

## Ruby and the Web

## File I/O and Serialization

## Testing with RSpec and Test Driven Development

## Basic Data Structures

## Basic Algorithms

## Final Projects

## Finish







