## Numbers and Operators and Expressions
### Intro and Goals
This is pretty straightforward stuff.  The goal here is to familiarize yourself with all basic data types and how they interact in arithmetic expressions

### Thought Questions
* What's the difference between an `Integer` and a `Float?`
* Why should you be careful when converting back and forth between integers and floats?
* What's the difference between `=`, `==`, and `===`?
* How do you do exponents in Ruby?
* What is a `range`?
* How do you create a range?
* What's the difference between `(1..3)` and `(1...3)`?
* What are three ways to create a range?

### Check These Out First
* Read [Learn Ruby the Hard Way Chapters 1-5](http://ruby.learncodethehardway.org/book/ex3.html) for a basic treatment of numbers.
* Read [Zetcode's Data Types section](http://zetcode.com/lang/rubytutorial/datatypes/) for a bit more depth on the subject.
* If you prefer video, Treehouse has a [free video on numbers](http://teamtreehouse.com/library/programming/ruby-foundations/numbers/creating-numbers)

### A Brief Summary

When doing mathematical operations, Ruby expects the result to be the same type as the inputs, so dividing two integers by each other will produce an integer... whether you want to or not:

    > 5 / 3
    => 1  

To fix this, you need to make one of the inputs a different data type that can handle decimals, like a *floating point* number (float): 

    > 5.0 / 3               # as long as one of them is a float...
    => 1.6666666666666667   # ... the result is a float

Converting between integers and floats is easy -- just use `to_i` and `to_f` respectively:

    > 5.0234.to_i
    => 5
    > 5.to_f
    => 5.0

Because Ruby is so flexible, it lets you do some quirky things like multiplying completely different data types together in a way that you sort of think you *should* be able to but never expected to actually be able to do:

    > "hi" * 3
    => "hihihihi"

These types of operations work the same way with variables:

    > my_word = "howdy"
    => "howdy"
    > my_word * 3
    => "howdyhowdyhowdy"

A **Range** is just a continuous sequence and we represent it in a shorthand way.  If we want to say `3,4,5,6,7,8,9,10,11`, it's much easier to just write it the short way `(3..11)`, meaning "all the integers beween 3 and 11, including both 3 and 11".  If we wrote it `(3...11)`, it would actually exclude `11`  You can also create a range using `Range.new(start, finish)`, though the shorthand notation is more conventional.

For equality:
* **`=`** is for assignment, so it assigns a value to a variable as in `> name = "Erik"`
* **`==`** is for checking that two things are equal but don't have to be identical instances.  You'll use this in most cases, especially when working with conditional statements.  `> 1 + 1 == 2` returns '=> true'.  When you start creating your own classes (like an "Animal" class), you'll need to tell Ruby how to compare two animal instances by writing your own version of this method (it's easy).
* **`===`** can actually mean some different things (you can overwrite it easily). You will probably be sticking with `==` in most situations, but it's good to understand `===` as well.  `===` typically asks whether the thing on the right is a member or a part or a type of the thing on the left.  If the thing on the left is the range `(1..4)` and we want to know if 3 is inside there:

    > (1..4) === 3
    => true

This also works for checking whether some object is an instance of a class:

    > Integer === 3
    => true

See [http://stackoverflow.com/questions/4467538/what-does-the-operator-do-in-ruby](http://stackoverflow.com/questions/4467538/what-does-the-operator-do-in-ruby) for a more detailed explanation.


### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*
1. Play around in IRB and just try multiplying and dividing and equating and comparing things to each other.  Be creative until you have a good handle on things.
2. TODO

### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* Read [Learn to Program Chapter 1](http://pine.fm/LearnToProgram/?Chapter=01) (You should already have completed this)
* [Zetcode's Expressions Section](http://zetcode.com/lang/rubytutorial/expressions/) gets into real depth about expressions and operators.
* Read [http://rubylearning.com/satishtalim/numbers_in_ruby.html](http://rubylearning.com/satishtalim/numbers_in_ruby.html)
* Add Here!
