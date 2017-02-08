# Conditional Logic
A brief summary about what this lesson is about and why the topics or concepts it covers are important.

This lesson is all about controlling the flow of your code. The concept is pretty simple. You have some code that you only want to execute under specified conditions, so you need a way for the computer to check whether those conditions have been met. Conditional logic can be found everywhere in everyday life. Ever had to tidy your room before being allowed to play video games? That's your mother setting up a nice conditional statement that might look like this in a computer program...

```ruby
if room_tidy == true
  ask mother if I can play video games
end
```
There must be a motherboard joke in there somewhere. Answers on a postcard!

Any conditional statement will always have an expression that evaluates to `true` or `false` and on that basis the computer will decide whether to action the code that follows. If it's true then the code will be processed; false, the code will be skipped, and you can provide some other code to run instead. There can even be several conditional statements on one line although keep in mind that too many can make code look cluttered.

You'll write a lot of conditional statements on your road to programmer stardom and although they are pretty simply at heart, they're are a big source of bugs in your code when something isn't working as expected so make sure you understand the logic behind the expression being evaluated so you can step through it if you need to.

## Learning outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* Conditionals and Flow Control
    * What is a "boolean"?
    * What are "truthy" values?
    * Are nil, 0, "0", "", 1, [], {} and -1 considered true or false?
    * When do you use elsif?
    * When do you use unless?
    * What does <=> do?
    * Why might you define your own <=> method?
    * What do || and && and ! do?
    * What is returned by puts("woah") || true?
    * What is ||=?
    * What is the ternary operator?
    * When should you use a case statement?

## Truthy and Falsy in Ruby

You already know that conditional statements check expressions for a true or false value so it follows that you should understand what Ruby considers to be true or false. In typical Ruby fashion it's very simple. The only false values in ruby are the values `nil` and `false` itself. That's it! Everything else is considered true. Even the string `"false"` is true in conditional expressions! If you have experience with other programming languages you might be familiar with the number 0 or an empty string "" being equivalent to false, this isn't the case with Ruby so be careful when writing those expressions otherwise you'll have more bugs than a decomposing body.

## Basic Conditional Statement
The simplest way to control the flow of your code using conditions is with the `if` statement.

The general syntax is

```ruby
if (statement_to_be_evaluated == true)
  do something awesome...
end

if 1 < 2
  puts "Hot diggity damn, 1 is less than 2"
end
```

If there is only one line of code to be evaluated inside the block then you can rewrite the example above as follows
```ruby
puts "Hot diggity damn, 1 is less than 2" if 1 < 2
```
You don't even need the `end` statement. Nice and concise!

The statement to be evaluated can be anything that returns true or false. It could be a mathematical expression, a variable value or a call to a method. Only if the expression evaluates to true does the code inside the block run.

## Branching in if statements
Often you'll want to check a condition and run some code if it's true, but if it's false then run some other code. That's done with an `if; else` statement.

```ruby
if (attack_by_land == true)
  puts "release the goat"
else
  puts "release the shark"
end
```
Oh yeah! Protected on land and sea.

But what about if we're attacked by air? We need yet another conditional check. Enter the `if; elsif; else` statement

```ruby
if (attack_by_land == true)
  puts "release the goat"
elsif (attack_by_sea == true)
  puts "release the shark"
else
  puts "release Kevin the octopus"
end
```
Ain't nobody pillaging my land!

You can have as many elsif expressions as you want and the else clause is optional but you usually want to provide some default value if none of the previous expression evaluate to true.

## Boolean Logic
To use an expression that evaluates to true or false you'll need a comparison operator. There are several provided by Ruby and in no particular order they are:

`==`(equals) returns true if both of the values compared are equal.
`5 == 5 #=> true`

`!=`(not equal) returns true if both of the values compared are not equal.
`5 != 7 #=> true`

`>`(greater than) returns true if the value on the left of the operator is larger than the value on the right.
`7 > 5 #=> true`

`<`(less than) returns true if the value on the left of the operator is smaller than the value on the right.
`5 < 7 #=> true`

`>=`(greater than or equal to) returns true if the value on the left of the operator is larger than or equal to the value on the right.
`7 > 5 #=> true`

`<=`(less than or equal to) returns true if the value on the left of the operator is smaller than or equal to the value on the right.
`5 < 7 #=> true`

`.eql?` checks both the value type and actual value it holds.
`5.eql?(5.0) #=> false` - because although they are the same value, one is an integer and one is a float

`.equal?` checks both values are the exact same object in memory. This can be slightly confusing because of the way computers store some values for efficiency. Two variables pointing to a number will usually always return true.
```ruby
a = 5
b = 5
a.equal?(b) #=> true
```
This is true because of the way computers store integers in memory. So although you have set two different variables holding the number 5, they point to the same object in memory. However, consider the next code example.
```ruby
a = "hello"
b = "hello"
a.equal?(b) #=> false
```
This happens because computers can't store strings efficiently in the same way as they store numbers. So although the values of the variables are the same. The computer will have created two separate string objects in memory.

All of the above operators also work on data types other than numbers such as strings. Why not have a play around in a repl?

## Logical Operators
Sometimes you'll want to write an expression that contains more than one condition. That's accomplished in Ruby with Logical Operators.

The operators are `&&`(and), `||`(or) and `!`(not).

There are some differences between the word versions and their symbolic equivalents, particulary the way they evaluate code. I recommend you read [this piece](http://www.virtuouscode.com/2010/08/02/using-and-and-or-in-ruby/) that will explain the differences.

The `&&` operator returns true if **both** the left and right expression return true.
```ruby
if 1 < 2 && 5 < 6
  puts "Party at Kevins"
end

# This can also be written as
if 1 < 2 and 5 < 6
```
One thing to keep in mind with the `&&` operator is the order of logic. The expressions are evaluated from left to right and because both expressions must return true, if the first expression encountered returns false, the second expression is never checked because, to the Ruby interpreter, it's pointless as the expression can never return true. This is known as short circuit evaluation.

The `||` operator returns true if either the left or right expression return true. This means both expressions must always be checked, unlike with the and operator above.
```ruby
if 10 < 2 || 5 < 6 #=> although the left expression is false, there is a party at Kevin's because the right expression returns true
  puts "Party at Kevins"
end

# This can also be written as
if 10 < 2 or 5 < 6
```

The `!` operator reverse the logic of the expression, and therefore if the expression itself returns false, using the `!` operator makes the expression true and the code inside the block will be executed.

Some examples are
```ruby
if !false #=> true

if !10<5 #=> true
```

## Case Statements
Case statements are a neat way of writing several conditional expressions that would normally result in a messy if; elsif statement. You can even assign the return value from a case statement to a variable for use later.

Case statements will process each condition in turn and if the condition returns false it will move onto the next one until a match is found. If no match is found then the default option will be processed if an else clause has been provided.

```ruby
grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother"
  else "McDonald's is hiring!"
end
```
As soon as a match is found the value of that match is returned and the case statement stops execution.

If you need to do some more complex code manipulation then you can remove then `then` keyword and instead place the code to be executed on the next line.
```ruby
grade = 'F'

case grade
when 'A'
  puts "You're a genius"
  future_bank_account_balance += 5,000,000
when 'D'
  puts "Better luck next time"
  can_i_retire_soon = false
else
  "McDonald's is hiring!"
  fml = true
end
```

## Unless statement
The unless statement works in the opposite way to the if statement in that it only processes the code if the expression evaluates to false. There isn't much more to it.

```ruby
age = 18
unless age < 17
  puts "get a job"

## Ternary operator
- what they are and how they work

## Exercises
This will link to an external repo which will include exercises and tests

## Further Reading
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

Link to no more than three additional resources to avoid this section becoming too cluttered.
