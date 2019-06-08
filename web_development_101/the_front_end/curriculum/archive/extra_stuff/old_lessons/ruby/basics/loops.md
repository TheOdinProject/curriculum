# Loops

Loops, not to be confused with Fruit Loops, the addictive cereal that causes symptoms similar to ADHD in kids, are simply blocks of code that are continually repeated until a certain condition is met.

Like me, you've probably experienced real life loops when you were given detention and made to write lines for drawing small phallic shapes on the desk at school. Writing the same lines over and over and over was not only boring, but potentially error prone. Maybe on one line you made a spelling mistake and on another you didn't dot an i. It's the same with programming, the less code you have to write the less chance you have of introducing bugs that can cause your program to crash and burn.

If you find yourself needing to repeat an action more than once in your code. You probably need loops in your life

## Learning outcomes
*Look through these now and then use them to test yourself after doing the assignment*

what the student is expected to know or be able to do by the end of this lesson

* You understand what a loop is and why its useful
* You know how to use the `loop` loop in ruby
* You know how to use a `while` loop in ruby
* You know how to use a `for` loop in ruby
* You know how use a `times` loop in ruby.
* You know how to use the `until` loop in ruby.
* You know how to use the `upto` and `downto` loops in ruby

### Loop
The loop loop (say what????) is Ruby's loop that just don't quit. It's an infinite loop that'll keep going unless you specifically request for it to stop using the `break` command. Break is commanly used with a condition as illustrated in the code example below.

```ruby
i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10
end
```

You won't see this loop used much in Ruby and if you're using it then there is probably a better loop for you out there.

### While Loop

A while loop is similar to the `loop` loop except you declare the condition that will break out of the loop up front.

```ruby
i = 0
while(i < 10) do
 puts "i is #{i}"
 i += 1
end
```
This is an example of using a while loop with a count, and as you declare the condition that breaks the loop up-front, the intention of your code is much clearer making it easier to read than our loop loop above.

While loops can also be used to repeatedly ask a question of the user until they give an appropriate response.

```ruby
while gets.chomp != "yes" do
  puts "Will you go to prom with me?"
end
```
In real life you obviously should just take no for an answer the first time.


### For Loop

For loops are used to iterate through a collection of information such as an array or range.

```ruby
for i in 0..5
  puts "The number of zombies I'd take out before succumbing is #{i}"
end
```
It's really all there is to it.

### Times Loop
If you need to run a loop a specified number of times then look no further than the trusty times loop. It works by iterating through a loop a number of times and even throws in the bonus of accessing the number it's currently iterating through.

```ruby
5.times do
  puts "Hello, world!"
end
```
I'm sure you can guess what that code does. Ruby's readable that way!

```ruby
5.times do |number|
  puts "Alternative fact number #{number}"
end
```
Remember, loops will start counting from a zero index unless specified otherwise so the first loop iteration will output `Alternative fact number 0`.

### Until Loop
The until loop is the opposite of the while loop. A while loop continues while the condition is true. An until loop continues while the condition is false so they can be used pretty much interchangably. It will ultimately be what your condition is checking that will determine which one is more readable.

You should, as much as possible, avoid trying to negate your logical expressions using `!`(not) and this is where using unless will shine.

Using the while loop examples we can write them using until.


```ruby
i = 0
until(i > 10) do
 puts "i is #{i}"
 i += 1
end
```
You can see here that using until keeps running the loop while the condition is false.

The second example shows how until can avoid the negation `!` that the while loops had to use.

```ruby
until gets.chomp == "yes" do
  puts "Will you go to prom with me?"
end
```
Much more readable. Guaranteed to get you a yes.

### upto and downto loops
* how they work
* what are they good for
* when to use them

`upto` and `downto` are great examples of Ruby methods that do exactly what you'd think from the name. You can use these methods to iterate from a starting number either upto or downto another number.

```ruby
5.upto(10) {|num| print "#{num} " } #=> 5 6 7 8 9 10

10.downto(5) {|num| print "{num} " } #=> 10 9 8 7 6 5
```

If you need to step through a series of numbers within a specific range then these are the loops for you.

## Assignment
A list of external links for the user to go through

## Exercise
Link to external repo which will include exercises for this lesson which the user will complete by passing tests

## Further Reading
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

Link to no more than three additional resources to avoid this section becoming too cluttered.
