### Introduction

Introduced in Ruby 2.7, pattern matching uses specified patterns to match against some data. If the data conforms to the pattern there is a match and the data is deconstructed accordingly. If there is no match either you can supply a default value to return or else a `NoMatchingPatternError` is raised.

With Ruby 3, most parts of the pattern matching syntax are no longer considered experimental and so it is now worth ensuring you are familiar with the basics. The syntax can feel a little clunky at first but there are times it can definitely simplify Ruby code. However, there are a couple of new patterns with Ruby 3 which we'll introduce at the end.

If you want to play with the examples make sure you're on at least Ruby 2.7. Unfortuantely at the time of writing this means you can't use repl.it as it's still stuck in the dark ages on Ruby 2.5

At the time of writing we still recommend Ruby 2.7 as Ruby 3 is quite new and it can take time for third party gems to update. You can install Ruby 3 and use the [rbenv local](https://github.com/rbenv/rbenv#rbenv-local) command to set rbenv only to Ruby 3 in the folder you create to test out any of the examples below. Alternatively you can just continue with Ruby 2.7, which will work for most of the examples, and then just read through the small section at the end on Ruby 3 patterns.

### Learning Outcomes

By the end of this lesson, you should be able to do the following:

 - Explain the syntax for implementing a pattern matching case statement.
 - Explain what types can be used in pattern matching.
 - Explain the possible return values from a pattern match
 - Explain how to implement a guard condition in a pattern match statement.
 - Explain how to pattern match against an Array and Arrays within Arrays.
 - Explain how to pattern match against a Hash.
 - Explain the main differences between Hash and Array pattern matching.
 - Explain the use of the pin operator.
 - Explain the use of the alternative pattern.
 - Explain how to bind matches to a variable.
 - Explain how to match against your own custom classes.

### Basics

The basic format for a pattern match is a case statement. This is not too different from the case statement you will already be familiar with for matching conditions in Ruby, except now instead of `when` we use `in`. If your use case is very basic, you will find there is no difference between using either `in` or `when` as the below example illustrates.

~~~ruby
grade = 'C'

case grade
when 'A' then puts 'Amazing effort'
when 'B' then puts 'Good work'
when 'C' then puts 'Well done'
when 'D' then puts 'Room for improvement'
else puts 'See me'
end

# => Well done
~~~

vs pattern matching syntax

~~~ruby
grade = 'C'

case grade
in 'A' then puts 'Amazing effort'
in 'B' then puts 'Good work'
in 'C' then puts 'Well done'
in 'D' then puts 'Room for improvement'
else puts 'See me'
end

# => Well done
~~~

The second format is a one line syntax using the trusty hash rocket that will be familiar to you from hashes.

~~~ruby
login = { username: 'hornby', password: 'iliketrains' }

login => { username: username }

puts "Logged in with username #{username}"

#=> Logged in with username hornby
~~~

We'll get to matching against hashes shortly so don't worry about the exact syntax of what is happening. Just note that we can use the hash rocket `=>` to match against some kind of structure. The second format is still considered experimental so the examples that follow will use the case statement format.

The case/in format is best used when there are multiple conditionals you could possibly match against and you need to check against all of them. The hash rocket syntax is best used when the data structure you are matching against is known, such as the login data example we used above.

### Patterns

There are multiple ways of potentially matching against an input. Patterns in Ruby 2.7 can be

 - Any Ruby object which is matched using `===`. The Object Pattern.
 - A variable capture / Variable Pattern
 - An As Pattern
 - An Alternative Pattern
 - A Guard Condition
 - An Array Pattern
 - A Hash Pattern

With Ruby 3 you can use the above patterns while also having the following new additions

 - Rightward Assignment
 - A Find Pattern

Patterns can also be matched using many of the patterns above together. You may for example have an array inside a hash so you could use the hash and array patterns. We'll go through each of the various patterns in more detail below.

When we say pattern we aren't talking about design patterns which you may have come across. We mean the pattern used to match against an input.

### Return values

There are two possible return values from a pattern match statement. The first is `true` which is returned whenever there is a match, even when the match is the else clause in a statement. The second possible return value is a `NoMatchingPatternError` whenever no match can be found. In our examples below when we `puts` something inside a case statement we'll use `# =>` to show the value that will be printed by this. In your terminal though you'll see the value printed followed by `=> true` below. We'll omit that because it's not relevant to what we're trying to show you. Just be aware that the `true` you see is just the return value of the last thing evaluated. Standard Ruby behaviour.

As you'll see though the point of a pattern match usually is to not only match against a pattern but also bind all of part of the match to one or more variables that you can then use outside of the pattern match expression.

### Object Pattern Match

Any object can be used in a pattern match. It is matched using `===` to compare the two objects and is the same basis for matches in the case/when format. This pattern is usually used within other patterns such as the array pattern.

The grade example provided earlier was one such use of the Ruby object pattern match. On each check Ruby compared the grade with the specified letter and when there was a match it executed the then clause of that match. `'A' === 'A' #=> true`.

Because of this we can also check against data types

~~~ruby
input = 3

case input
in String then puts 'input was of type String'
in Integer then puts 'input was of type Integer'
end

#=> input was of type Integer
~~~

It's important to note here that Ruby places the pattern to match on the left of the comparison in `===`. If it didn't then there would be no match. `3 === Integer` is false whereas `Integer === 3` is true. That is because of how Ruby implements the `===` method on Integer vs on instances of Integer. On Integer `===` will check that the operand on the right of the comparison is of type Integer. On an instance of an integer `===` will check they hold the same value. `3 === 3` is true.

With Ruby pattern matching you can match against the following literal types

 - Booleans
 - nil
 - Numbers
 - Strings
 - Symbols
 - Arrays
 - Hashes
 - Ranges
 - Regular Expressions
 - Procs

This isn't any different from what we can do with a case/when statement, but the power comes when you match these types within some of the other patterns as we'll see next

### Variable Pattern

The variable pattern binds a variable or variables to the values that match the pattern.

The basic format is

~~~ruby
age = 15

case age
in a
  puts a
end

# => 15
~~~

This example isn't useful in itself, but lays the foundation for use in other patterns as we'll see.

Something to take note of is that the variable pattern always binds the value to the variable so be careful if there is another variable with the same name in the outer scope which you'll need.

~~~ruby
a = 5

case 1
in a
  a
end

puts a
#=> 1
~~~
 
Above you might have thought you were comparing the value held in the initial `a` variable against the value `1` from the case statement but what actually happened is a variable assignment pattern match. To avoid this Ruby provides the pin operator `^` which instead then matches against a variable of that name.

~~~ruby
a = 5

case 1
in ^a
  :no_match
end

#=> NoMatchingPatternError
~~~

### As Pattern Match

The as pattern is similar to the variable pattern but can be used to manage more complex assignments. This will make most sense when using Arrays and Hashes so examples will be shown when covering those patterns but the general pattern is written as follows

~~~ruby
case 3
in 3 => a
  puts a
end

# => 3
~~~

It uses the hash rocket in the same way the one line pattern match does. Look out for the examples in later sections for clarification on when this pattern could be useful.

### Alternative Pattern Match

The alternative pattern allow you to check if multiple options match the input.

~~~ruby
case 0
in 0 | 1 | 2
  puts :match
end

# => match
~~~

There isn't much more to it. The same rules apply as with any other pattern. So you can use the `^` operator if you are using variables to compare.

### Guard Conditions

This isn't a pattern per se but a way to make sure the pattern is only matched if the guard condition holds true

~~~ruby
some_other_value = true

case 0
in 0 if some_other_value
  puts :match
end

# => match
~~~

You can use any expression in the condition that can evaluate to true or false. You can also use `unless` instead of `if` if it suits you.

### Array Pattern Match

Matching against arrays can be done in a few different ways. At its most basic you can match against the exact elements in the array.

~~~ruby
arr = [1 ,2]

case arr
in [1, 2] then puts :match
in [3, 4] then puts :no_match
end

# => match
~~~

That works using the `===` operator from the object pattern match so would work using case/when. That's no fun so let's ramp it up a little bit

~~~ruby
arr = [1, 2]

case arr
in [Integer, Integer]
  puts :match
in [String, String]
  puts :no_match
end

# => match
~~~

Here we've matched against the type of the arrays elements, this is an example of Ruby matching against a pattern rather than the actual values in the array.

What happens if we have more elements in the array?

~~~ruby
arr = [1, 2, 3]

case arr
in [Integer, Integer]
  puts :no_match
end

# => NoMatchingPatternError ([1, 2, 3])
~~~

An error! Ruby appears to only match against arrays with the same number of elements. What if you want to match against only part of an array? Use the trusty splat `*`

~~~ruby
arr = [1, 2, 3]

case arr
in [Integer, Integer, *]
  puts :match
end

# => match
~~~

You can place the splat anywhere in an array to match against multiple entries

~~~ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr
in [Integer, Integer, *, Integer, Integer]
  puts :match
end

# => match
~~~

Here we are checking only the first and last two elements are Integers. You can also mix and match between checking actual values and types

~~~ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr
in [Integer, Integer, *, 9, 10]
  puts :match
end

# => match
~~~

If you want to scoop up the values of the array matched against the splat you can use the variable pattern.

~~~ruby
arr = [1, 2, 3, 4]

case arr
in [1, 2, *tail]
  p tail
end

# => [3, 4]
~~~

If you don't care about some values in the array and are happy to match against any value for that index you can use `_`

~~~ruby
arr = [1, 2, 3, 4]

case arr
in [_, _, 3, 4]
  puts :match
end

# => match
~~~

Let's say you want to match against an array of two numbers, but only if they aren't the same number. You can use a guard clause

~~~ruby
arr = [1, 2]
case arr
in [a, b] unless a == b
  puts :match
end

# => match
~~~

You can even match against nested arrays

~~~ruby
arr = [1, 2, [3, 4]]

case arr
in [_, _, [3, 4]]
  puts :match
end

# => match
~~~

This is where the real power of pattern matching shines. Traversing deeply nested structures for matches.

You can incorporate the variable pattern to bind matching values to variables to use later

~~~ruby
arr = [1, 2, 3, 4, 5]

case arr
in [1, 2, 3, a, b]
  puts a
  puts b
end

# => 4
# => 5
~~~

Let's say you have a nested array and you want to match against both the nested array, and some individual parts of it. This is where the as pattern can be used.

~~~ruby
case [1, 2, 3, [4, 5]]
in [1, 2, 3, [4, a] => arr]
  puts a
  p arr
end

# => 5
# => [4, 5]
~~~

Be careful with variable reassignment as we discussed earlier

~~~ruby
arr = [1, 2, 3]

case [1, 2, 4]
in arr
  :match
end

p arr

# => [1, 2, 4]
~~~

One last point to note is that when matching an array the `[]` are optional on the outer array.

~~~ruby
arr = [1, 2, 3, 4]

case arr
in 1, 2, 3, 4
  puts :match
end

# => match
~~~

### Hash Pattern Matching

Pattern Matching with Hashes works in a similar way to arrays with a couple of important differences. The first is that pattern matching only works for symbol keys, not string keys. The reason for this is to do with how Ruby matches against a hash. This may change in future Ruby versions. The second important difference is that unlike with arrays, you can match against parts of a Hash without having to handle the fact there may be additional key;value pairs.

We can match against the actual values of a hash

~~~ruby
case { a: 'apple', b: 'banana' }
in { a: 'aardvark', b: 'bat' }
  puts :no_match
in { a: 'apple', b: 'banana' }
  puts :match
end

# => match
~~~

We can match against a hash and assign values to variables

~~~ruby
case { a: 'apple', b: 'banana' }
in { a: a, b: b }
  puts a
  puts b
end

# => apple
# => banana
~~~

Because of ruby syntactic sugar for hashes we could rewrite the above as below. Note how we don't have to provide names for the variables. This isn't pattern matching behaviour but normal Ruby hash behaviour.

~~~ruby
case { a: 'apple', b: 'banana' }
in { a:, b: }
  puts a
  puts b
end

# => apple
# => banana
~~~

As with arrays, with hashes you can omit the brackets `{}`

~~~ruby
case { a: 'apple', b: 'banana' }
in a:, b:
  puts a
  puts b
end

# => apple
# => banana
~~~

You can use the double splat `**` to scoop up multiple key;value pairs

~~~ruby
case { a: 'ant', b: 'ball', c: 'cat' }
in { a: 'ant', **rest }
  p rest
end

# => { b: 'ball', c: 'cat' }
~~~

Something to be mindful of with hashes is that because a hash will match with only a subset of keys matching, you need to guard against situations where you don't want that behaviour

~~~ruby
case { a: 'ant', b: 'ball' }
in { a: 'ant' }
  'this will match'
in { a: 'ant', b: 'ball' }
  'this will never be reached'
end
~~~

If you want to ensure you only match exactly you can use `**nil`

~~~ruby
case { a: 'ant', b: 'ball' }
in { a: 'ant', **nil }
  puts :no_match
in { a: 'ant', b: 'ball' }
  puts :match
end

# => match
~~~

We can use the as pattern to assign the entire hash match to a variable.

~~~ruby
case { a: 'ant', b: 'ball' }
in { a: 'ant' } => hash
  p hash
end

#=> { :a => 'ant', :b => 'ball' }
~~~

### Ruby 3 patterns

With Ruby 3 came a couple of new patterns. If you aren't using Ruby 3 at the time of writing you can install it if you like or just skim the below patterns and know they exist. You may get a warning about these features being experimental and subject to change so they aren't yet considered ready for any production code.

### Rightward assignment.

Usually with Ruby you place variables on the left of an expression that binds a value to that variable. With rightward assignment you deconstruct an object and assign values to variables on the right of the expression. Instead of using `=` to assign you use a hash rocket `=>`.

All of the previous patterns we've covered can be used in this syntax.

~~~ruby
login = { username: 'hornby', password: 'iliketrains' }

login => { username: username }

puts "Logged in with username #{username}"

#=> "Logged in with username hornby"
~~~

The case/in format is best used when there are multiple conditionals you could possibly match against and you need to check against all of them. The hash rocket syntax is best used when the data structure you are matching against is known, such as the login data example we used above.

### Find Pattern

As we saw earlier we can match against only part of a hash, but not an array using the array pattern match. So what do you do if that's what you need to do? The as pattern would capture all of the array and the variable pattern captures individual parts of it. To address this Ruby added the find pattern.

It works by placing a `*` either side of the part you want to match. You can even use the variable pattern to give each `*` a variable name to reference later. Let's look at some examples.

~~~ruby
case [1, 2, 3]
in [*pre, 1, 2, 3, *post]
  p pre
  p post
end

# => []
# => []
~~~

Because everything was match between the pattern our `pre` and `post` variables were assigned empty arrays. Let's see what happens when they aren't.

~~~ruby
case [1, 2, 3, 4, 5]
in [*pre, 2, 3, *post]
  p pre
  p post
end

# => [1]
# => [4, 5]
~~~

Here's an interesting one. Let's say you have an array of both string and integers and want to match on the first instance of two consecutive strings. While that would be a bit of a pain to implement without using pattern matching, with the find pattern it's easy. We can even throw in the as pattern to grab the values of the two consecutive strings.

~~~ruby
case [1, 2, "a", 4, "b", "c", 7, 8, 9]
in [*pre, String => x, String => z, *post]
  p pre
  p x
  p z
  p post
end

# => [1, 2, "a", 4]
# => "b"
# => "c"
# => [7, 8, 9]
~~~

As a last example we'll consider a common use case which will hopefully show where the find pattern could be a better fit than a conventional Ruby solution. It's not uncommon in Ruby to find yourself with an array of hashes or json data, and you might need to locate a record from that data. You need to match that data on a few hash keys. The data might look something like

~~~ruby
data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]
~~~

Let's say you get a name, age and job title as parameters and, if that person exists, you need to return their first language, otherwise nil. Before pattern matching you may do something like

~~~ruby
name = 'Jill'
age = 32
job_title = 'leet coder'

match = data.find do |person|
  person[:name] == name && person[:age] == age && person[:job_title] == job_title
end

match&.fetch(:first_language)
~~~

A couple of things to note here. Firstly, because match could be nil if it couldn't find a record we had to use the `&` safe search navigator to check that we could call fetch on match, otherwise it would have blown up with a no method error. Secondly, while this isn't actually that bad, imagine we had more than 3 fields to search. What if there were 10. Our code would start to get out of control.

Now let's see how we could have handled it using a pattern match.

~~~ruby
name = 'Jill'
age = 32
job_title = 'leet coder'

case data
in [*, { name: ^name, age: ^age, first_language: first_language, job_title: ^job_title }]
else
  first_language = nil
end

puts first_language

# => italian
~~~

With pattern matching we do need to consider the case if there is no match, without the else clause we'd get the no matching pattern error. But that is exactly what the else clause is for in the case statement. We get a couple of benefits from doing it this way. Firstly we can bind the first_language value to a variable right there in the pattern. Secondly, and I acknowledge this is somewhat subjective, but I find it beneficial in the case statement to see exactly what kind of data structure I'm trying to match against. This can be useful when getting to grips with code where the data may come from a third party api. And remember, this is still a very simplistic example, in the real world data can be nested several levels deep which can lead to a horrible tangle of spaghetti code when trying to make sure you can locate a value several levels deep. What if you had to dive 6 levels, but grab a value or two along the way from a couple of the higher levels. No problem with pattern matching.

### Wrapping Up

Pattern Matching provides a powerful way to get at the data you need in a way that makes sense. But as with any tool you don't need to reach for it in any use case. For data structures that are shallow just think about whether you need to bring in a pattern match when you could just grab the value using the hash and array methods already available. If you do find yourself deep in a nested structure, with many checks for `nil` and a lot of edge case handling then it might be time to see if pattern matching brings something to the table.

### Assignment
<div class="lesson-content__panel" markdown="1">

1. Start with the [Ruby docs](https://docs.ruby-lang.org/en/3.0.0/doc/syntax/pattern_matching_rdoc.html) on pattern matching. They cover quite a lot of ground.
2. One thing we didn't cover here is matching your own objects. We did mention implementing the `===` method but there are a couple of other methods you can implement that will allow you to use array and hash pattern matching. Check out [this guide to pattern matching](https://rubyreferences.github.io/rubyref/language/pattern-matching.html), particularly [this section](https://rubyreferences.github.io/rubyref/language/pattern-matching.html#matching-non-primitive-objects-deconstructkeys-and-deconstruct).
</div>
