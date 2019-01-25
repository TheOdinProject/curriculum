### Introduction
This lesson is all about controlling the flow of your code, which is a pretty simple concept. If you have some code that you want to execute only under specific conditions, then you need a way for the computer to check whether those conditions have been met. Conditional logic can be found everywhere in everyday life. Have you ever had to tidy your room before being allowed to play video games? That's your mother setting up a nice conditional statement that might look like this in a computer program:

```ruby
if room_tidy == true
  "I can play video games"
end
```

There must be a motherboard joke in there somewhere. Answers on a postcard!

Any conditional statement will always have an expression that evaluates to `true` or `false`. Based on this answer, the computer will decide whether or not to execute the code that follows. If it's true, then the code will be processed; if it's false, the code will be skipped, and you can provide some other code that will be run instead. There can even be several conditional statements on one line, but keep in mind that too many can make code look cluttered.

You'll write a lot of conditional statements on your road to programmer stardom. Although they are fundamentally simple, they are a big source of bugs in your code when something isn't working as expected. Make sure you understand the logic behind the expression being evaluated so you can step through it if you need to.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe and list falsy values.
 - Explain how to use `if`, `elsif`, and `else`.
 - Explain the difference between `if` and `unless`.
 - Describe what `||`, `&&`, and `!` do.
 - Explain what short circuit evaluation is.
 - Describe what the ternary operator is and how to use it.
 - Explain what a `case` statement is and how it works. 

#### Truthy and Falsy in Ruby

You already know that conditional statements check expressions for a true or false value, so it follows that you need to understand what Ruby considers to be true or false. In typical Ruby fashion, it's very simple. The only false values in Ruby are the values `nil` and `false` themselves. That's it! Everything else is considered true. Even the string `"false"` is true in conditional expressions! If you have experience with other programming languages, you might be familiar with the number 0 or an empty string ("") being equivalent to false. This isn't the case with Ruby, so be careful when writing those expressions, or you'll have more bugs than a decomposing body.

#### Basic Conditional Statement
The simplest way to control the flow of your code using conditionals is with the `if` statement.

The general syntax of an `if` statement is shown here:

```ruby
if statement_to_be_evaluated == true
  # do something awesome...
end

if 1 < 2
  puts "Hot diggity, 1 is less than 2!"
end
#=> Hot diggity, 1 is less than 2!
```

If there is only one line of code to be evaluated inside the block, then you can rewrite the code to be more succient and take up only one line:

```ruby
puts "Hot diggity damn, 1 is less than 2" if 1 < 2
```

You don't even need the `end` statement. Nice and concise!

The statement to be evaluated can be anything that returns true or false. It could be a mathematical expression, a variable value, or a call to a method. Only if the expression evaluates to true does the code inside the block run.

#### Adding "else" and "elsif"
We often want to check a condition and run some code if it's true but then run some other code if it's false. This is done with an `if; else` statement.

```ruby
if attack_by_land == true
  puts "release the goat"
else
  puts "release the shark"
end
```

Oh yeah! Protected on land and sea.

But what about if we're attacked by air? We need yet another conditional check. Enter the `if; elsif; else` statement!

```ruby
if attack_by_land == true
  puts "release the goat"
elsif attack_by_sea == true
  puts "release the shark"
else
  puts "release Kevin the octopus"
end
```

Ain't nobody pillaging my land!

You can have as many `elsif` expressions as you want. The `else` clause is optional, but you usually want to provide some default value in case none of the previous expressions evaluate to `true`.

#### Boolean Logic
To determine whether an expression evaluates to `true` or `false`, you'll need a comparison operator. There are several provided by Ruby:

`==`(equals) returns `true` if the values compared are equal.
```ruby
5 == 5 #=> true
5 == 6 #=> false
```

`!=`(not equal) returns `true` if the values compared are not equal.
```ruby
5 != 7 #=> true
5 != 5 #=> false
```

`>`(greater than) returns `true` if the value on the left of the operator is larger than the value on the right.
```ruby
7 > 5 #=> true
5 > 7 #=> false
```

`<`(less than) returns `true` if the value on the left of the operator is smaller than the value on the right.
```ruby
5 < 7 #=> true
7 > 5 #=> false
```

`>=`(greater than or equal to) returns `true` if the value on the left of the operator is larger than or equal to the value on the right.
```ruby
7 >= 7 #=> true
7 >= 5 #=> true
```

`<=`(less than or equal to) returns `true` if the value on the left of the operator is smaller than or equal to the value on the right.
```ruby
5 <= 5 #=> true
5 <= 7 #=> true
```

`.eql?` checks both the value type and the actual value it holds.
```ruby
5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true
```

`.equal?` checks whether both values are the exact same object in memory. This can be slightly confusing because of the way computers store some values for efficiency. Two variables pointing to the same number will usually return `true`.

```ruby
a = 5
b = 5
a.equal?(b) #=> true
```

This expression is true because of the way computers store integers in memory. Although two different variables are holding the number 5, they point to the same object in memory. However, consider the next code example:

```ruby
a = "hello"
b = "hello"
a.equal?(b) #=> false
```

This happens because computers can't store strings in the same efficient way they store numbers. Although the values of the variables are the same, the computer has created two separate string objects in memory.

All of the above operators also work on data types other than numbers, such as strings. Why not play around with this in a REPL?

#### Logical Operators
Sometimes you'll want to write an expression that contains more than one condition. In Ruby, this is accomplished with logical operators, which are `&&`(and), `||`(or) and `!`(not).

There are some differences between the word versions and their symbolic equivalents, particularly in the way they evaluate code. I recommend you read [this article](http://www.virtuouscode.com/2010/08/02/using-and-and-or-in-ruby/) that explains the differences.

The `&&` operator returns `true` if **both** the left and right expressions return `true`.

```ruby
if 1 < 2 && 5 < 6
  puts "Party at Kevin's!"
end

# This can also be written as
if 1 < 2 and 5 < 6
  puts "Party at Kevin's!"
end
```

One thing to keep in mind with the `&&` and `||` operators is the order of logic. The expressions are always evaluated from left to right.

Using the `&&` operator, both expressions must return `true`. If the first expression encountered returns `false`, then the second expression is never checked. To the Ruby interpreter, it's pointless to evaluate the second half as the overall expression can never return `true`.

With the `||` operator, if the first expression evaluates to `true`, then the second expression is never checked because the complete expression is already `true`, and the code in the block is run.

This is known as **short circuit evaluation**.

```ruby
if 10 < 2 || 5 < 6 #=> although the left expression is false, there is a party at Kevin's because the right expression returns true
  puts "Party at Kevin's!"
end

# This can also be written as
if 10 < 2 or 5 < 6
  puts "Party at Kevin's!"
end
```

The `!` operator reverses the logic of the expression. Therefore, if the expression itself returns `false`, using the `!` operator makes the expression `true`, and the code inside the block will be executed.

```ruby
if !false #=> true

if !(10 < 5) #=> true
```

#### Case Statements
Case statements are a neat way of writing several conditional expressions that would normally result in a messy `if; elsif` statement. You can even assign the return value from a case statement to a variable for use later.

Case statements process each condition in turn, and if the condition returns `false`, it will move onto the next one until a match is found. An `else` clause can be provided to serve as a default if no match is found.


```ruby
grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "McDonald's is hiring!"
end
```

As soon as a match is found, the value of that match is returned, and the case statement stops execution. Can you tell what the value of the `did_i_pass` variable is going to be after the case statement?

If you need to do some more complex code manipulation, you can remove the `then` keyword and instead place the code to be executed on the next line.

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
  puts "McDonald's is hiring!"
  fml = true
end
```

#### Unless Statements
An `unless` statement works in the opposite way as an `if` statement: it only processes the code in the block if the expression evaluates to `false`. There isn't much more to it.

```ruby
age = 18
unless age < 17
  puts "Get a job."
end
```

Just like with `if` statements, you can write a simple `unless` statement on one line, and you can also add an `else` clause.

```ruby
age = 18
puts "Welcome to a life of debt." unless age < 17

unless age < 17
  puts "Down with that sort of thing."
else
  puts "Careful now!"
end
```

You should use an `unless` statement when you want to **not** do something if a condition is `true`, because it can make your code more readable than using `if !true`.

#### Ternary operator
The ternary operator is a one line `if; else` statement that can make your code much more concise.

Its syntax is `conditional statement ? <execute if true> : <execute if false>`. You can assign the return value of the expression to a variable.

```ruby
age = 18
response = age < 17 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."
```

Here, because the expression evaluated to `false`, the code after the `:` was assigned to the variable `response`.

Writing this as an `if; else` statement would be much more verbose:

```ruby
age = 18
if age < 17
  response = "You still have your entire life ahead of you."
else
  response = "You're all grown up."
end
puts response
```

However, if your conditional statements are complicated, then using an `if; else` statement can help to make your code more readable. Remember, **above all else, your code needs to be readable and understandable by other people**, especially in the development stage. You can always optimize your code for efficiency once it's finished and you're moving to a production environment where speed matters.

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Launch School's [chapter on flow control](https://launchschool.com/books/ruby/read/flow_control#conditionals) is a good learning resource.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

  * What is a Boolean?
  * What are "truthy" values?
  * Are nil, 0, "0", "", 1, [], {} and -1 considered true or false?
  * When do you use elsif?
  * When do you use unless?
  * What do || and && and ! do?
  * What is short circuit evaluation?
  * What is returned by puts("woah") || true?
  * What is the ternary operator?
  * When should you use a case statement?