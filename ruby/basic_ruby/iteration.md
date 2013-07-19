## Iteration

### Intro and Goals

You can assemble code, tell the program which parts of it to execute, and wrap it all up in a method.  There's still something missing... what if you want to make something happen a whole bunch of times?  You certainly don't just run the method again and again manually.  Luckily we've got several standard ways of iterating through a piece of code until we tell the program to stop.

You should understand the basic iterators `for` and `while` and understand how to use `each` and `times`  We'll talk more about blocks and the other Ruby iterators like `map` and `select` in the next sections, so it should be more obvious how `each` and `times` work after reading that.

### Do This First
* [Codecademy's loops track](http://www.codecademy.com/courses/ruby-beginner-en-XYcN1)
* [Codecademy's loops 'project'](http://www.codecademy.com/courses/ruby-beginner-en-mzrZ6/0/1)
* If you want a bit more, check out [Skork's entry on Ruby looping and iterators](http://www.skorks.com/2009/09/a-wealth-of-ruby-loops-and-iterators/)

### Thought Questions
* What does `loop` do?
* What are the two ways to denote a block of code?
* How do you print out each item of a simple array `[1,3,5,7]` with:
    * `loop`?
    * `while`?
    * `for`?
    * `each`?
    * `times`?
* What's the difference between `while` and `until`?
* How do you stop a loop?
* How to you skip to the next iteration of a loop?
* How would you start the loop over again?
* What are the (basic) differences between situations when you would use `while` vs `times` vs `each`?

### A Brief Summary
**`loop`** is the most basic way to loop in Ruby and it's not used all that much because the other ways to loop are much sexier.  `loop` takes a block of code, denoted by either `{ ... }` or `do ... end` (if it's over multiple lines).  It will keep looping until you tell it to stop using a `break` statement:

    > loop { puts "this will not stop until you press CTRL+c" }
    this will not stop until you press CTRL+c
    this will not stop until you press CTRL+c
    ... and so on

    > i=0
    > loop do
    >   i+=1
    >   print "#{i} "
    >   break if i==10
    > end
    1 2 3 4 5 6 7 8 9 10 => nil

**`while`** performs a similar function but in a much more compact way, by allowing you to specify the condition that must be true to keep looping, and you'll find yourself using it much more in your own code.  It doesn't actually take a formal block of code, just runs everything until it reaches its `end`  Just remember to declare the variable(s) you'll be using (or they'll get reset with each iteration) and to increment at some point (or you'll get stuck in an infinite loop [use ctrl+c to break in Terminal]):

    > i=1
    > while i < 5
    >   print "#{i} "
    >   i+=1
    > end
    1 2 3 4 => nil

**`until`** is almost identical to `while` but, instead of running as long as the specified condition is `true`, it runs as long as the condition is `false`

**`for`** is a looping mechanism present in lots of other languages but it gets de-emphasized in Ruby and you don't see it used much.  A common use is to loop over every number in a range.  Whatever you name the first variable is how you call that number inside the loop:

    > for a_number in (1..3)
    >   print "#{a_number} "
    > end
    1 2 3 => 1..3

Things get more interesting when you realize that most of your loops will probably involve looping over each element in either an array or a hash of items.  Ruby knows this and made it super easy for you by specifying the `each` method that you call directly on that array or hash.  It will automatically pass whichever item it is currently on into your code block.  That item will be named whatever name you specify inside the pipes `| name_goes_here |`:

    > guys = ["Bob", "Billy", "Joe"]
    > guys.each do |current_name|    # better to call it just "name"
    >   print "#{current_name}! "
    > end
    Bob! Billy! Joe! => ["Bob", "Billy", "Joe"]  # returns original array

Many other loops are just you trying to do something a certain number of times (which was the case in our `for` loop example).  In that case, Ruby has the simplest possible method for you, `times`  If you pipe in an argument, it will be the current iteration starting from zero:

    > 5.times do |jump_num|
    >     print "Jump #{jump_num}!"
    > end
    Jump 1!Jump 2!Jump 3!Jump 4!Jump 5!=> 5

A couple other methods with similar purposes to `times` that you see less frequently:
* `upto`, as in `1.upto(4) { |current_number| ...some code... }`, just like `times` but you choose the starting and ending point instead of always starting at zero.
* `downto`, similar to `upto` but... down... to....

Your best friends early on will be `while` for anything that needs to run until a certain condition is reached (like winning the game), `each` for any time you want to do stuff with every item in an array or hash, and `times` for the simple cases when you just want to do something a fixed number of times.  

Because you may want some additional control over your loops, use these statements to jump in and out of them for certain abnormal conditions:
* `break` will **stop the current loop**.  Often used with an `if` to specify under what conditions to do that.
* `next` will **jump to the next iteration**.  Also usually used with an `if` statement.
* `redo` will let you restart the loop (without evaluating the condition on the first go-through), again usually with some condition
* `retry` works on most loops (not `while` or `until`) similarly to `redo` but it *will* re-evaluate the condition before running through the loop again (hence *try* instead of *do*).
* NOTE: Do NOT use `return` to exit a loop, since that will exit the whole method that contains it as well!

### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* A lecture by Avi Flombaum on [iteration in Ruby](http://flatironschool.s3.amazonaws.com/lectures/iteration.study.mov) that shows you the nuts and bolts of it (esp. starting minute 16), including some of Khan Academy's new visualizations.  Solid stuff.
* Add Here!

### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*

1. TODO
