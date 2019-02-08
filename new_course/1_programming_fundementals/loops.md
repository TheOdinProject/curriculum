### Introduction

Not to be confused with Fruit Loops, the addictive cereal that causes symptoms similar to ADHD in kids, loops in Ruby are simply blocks of code that are continually repeated until a certain condition is met.

Like me, you've probably experienced real-life loops when you were given detention in school and forced to repeatedly write the same line about not drawing small phallic shapes on your desk. Writing the same thing over and over and over is not only boring but also potentially error prone. You might have made a spelling mistake on one line and forgotten to dot an "i" on another line. It's the same with programming: the less code you have to write, the less chance you have of introducing bugs that can cause your program to crash and burn.

If you find yourself needing to repeat an action more than once in your code, you probably need loops in your life.

For all of the examples throughout this lesson, it will be beneficial for you to code along in irb or [repl.it](https://repl.it/languages/ruby) (an online REPL environment) to get a better feel for how they work.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Explain what a loop is and why it's useful.
 - Explain what a `loop` loop is and how to use it.
 - Explain what a `while` loop is and how to use it.
 - Explain what a `for` loop is and how to use it.
 - Explain what a `times` loop is and how to use it.
 - Explain what an `until` loop is and how to use it.
 - Explain what `updo` and `downto` loops are and how to use them.

### Loop
The `loop` loop (say what????) is Ruby's loop that just don't quit. It's an infinite loop that will keep going unless you specifically request for it to stop using the `break` command. Most commonly, `break` is used with a condition, as illustrated in the example below.

~~~ruby
i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10
end
~~~

You won't see this loop used much in Ruby. If you find yourself using `loop`, know that there is probably a better loop for you out there, like one of the more specific loops below.

### While Loop

A `while` loop is similar to the `loop` loop except that you declare the condition that will break out of the loop up front.

~~~ruby
i = 0
while i < 10 do
 puts "i is #{i}"
 i += 1
end
~~~

This is an example of using a `while` loop with a count. Because you declare the condition that breaks the loop up front, the intention of your code is much clearer, making this code easier to read than our `loop` loop above.

You can also use `while` loops to repeatedly ask a question of the user until they give an appropriate response:

~~~ruby
while gets.chomp != "yes" do
  puts "Will you go to prom with me?"
end
~~~

This example shows the flexibility advantage of a `while` loop: it will run until its break condition is met, which could be for a variable number of loops or a number of loops that is initially unknown. Who knows if your prospective prom date will say "yes" the first, fourth, or seventy-ninth time you ask? In real life, of course, you should really just take "no" for an answer the first time.

### For Loop

A `for` loop is used to iterate through a collection of information such as an array or range. These loops are useful if you need to do something a given number of times while also using an iterator.

~~~ruby
for i in 0..5
  puts "The number of zombies I'd take out before succumbing is #{i}."
end
~~~

That's really all there is to it.


### Times Loop

If you need to run a loop for a specified number of times, then look no further than the trusty `times` loop. It works by iterating through a loop a specified number of times and even throws in the bonus of accessing the number it's currently iterating through.

~~~ruby
5.times do
  puts "Hello, world!"
end
~~~

I'm sure you can guess what that code does. Ruby is easily readable that way!

~~~ruby
5.times do |number|
  puts "Alternative fact number #{number}"
end
~~~

Remember, loops will start counting from a zero index unless specified otherwise, so the first loop iteration will output `Alternative fact number 0`.

### Until Loop

The `until` loop is the opposite of the `while` loop. A `while` loop continues for as long as the condition is true, whereas an `until` loop continues for as long as the condition is false. These two loops can therefore be used pretty much interchangeably. Ultimately, what your break condition is will determine which one is more readable.

As much as possible, you should avoid negating your logical expressions using `!` (not) as its often harder to read and reason about, which is where `until` shines.

We can re-write our `while` loop examples using `until`.

~~~ruby
i = 0
until i > 10 do
 puts "i is #{i}"
 i += 1
end
~~~

You can see here that using `until` means that the loop will continue running until the condition i > 10 is false.

The next example shows how you can use `until` to avoid the negation `!` that the above `while` loop had to use.

~~~ruby
until gets.chomp == "yes" do
  puts "Will you go to prom with me?"
end
~~~

Much more readable! This code is guaranteed to get you a "yes".

### Upto and Downto Loops

The Ruby methods `upto` and `downto` do exactly what you'd think they do from their names. You can use these methods to iterate from a starting number either up to or down to another number, respectively.

~~~ruby
5.upto(10) {|num| print "#{num} " }     #=> 5 6 7 8 9 10

10.downto(5) {|num| print "#{num} " }   #=> 10 9 8 7 6 5
~~~

If you need to step through a series of numbers (or even letters) within a specific range, then these are the loops for you.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Read the [Loops & Iterators chapter](https://launchschool.com/books/ruby/read/loops_iterators) of LaunchSchool's *Introduction to Programming With Ruby*. 
Try re-writing the above examples using alternative loop methods to achieve the same results.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

 - If you'd like another overview of loops, read this [Ruby Explained: Iteration](https://www.eriktrautman.com/posts/ruby-explained-iteration) article. (Don't worry about the `#each` method described here; we'll get to that in an upcoming lesson!)
 - If you want yet another take, read [Skork's article on loops](https://skorks.com/2009/09/a-wealth-of-ruby-loops-and-iterators/). (Again, don't worry about the `#each` and `#each_with_index` methods here; they're coming up soon.)

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

 * What is a loop and why it is useful?
 * What is a `loop` loop, and how would you use it?
 * What is a `while` loop, and how would you use it?
 * What is a `for` loop, and how would you use it?
 * What is a `times` loop, and how would you use it?
 * What is an `until` loop, and how would you use it?
 * What are the `upto` and `downto` loops, and how would you use them?