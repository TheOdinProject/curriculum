### Introduction

The Enumerable module is a set of methods which can be included in Ruby classes (like Array and Hash).
You can even include it in your own classes, which will be covered later on. These methods are handy
for looping through iterable objects in a collection (most commonly arrays, hashes, and ranges). They provide
easy ways to perform common actions, and are among the most important tools for Rubyists. Some enumerable methods can be used on hashes just as on arrays, while others are implemented differently depending on
the type of collection used.

## Learning outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* What are `enumerable` methods?

* What does the `each` method do?
* What does `each` return?
* What does the `each_with_index` method do?
* How are they different?

* When should you use `do...end` around a code block versus `{...}`?

* What does the `count` method do?
* What does the `sort` method do?

* Why is there a question mark after some methods?
* What does the `include?` method do?
* What does the `any?` method do? The `all?` method? `none?`?


* What does the `select` method do?
* What does the `find` method do?
* How is the `find_all` method different from `find`?

* What does the `map` method do?
* Does `map` modify the calling object?
* What is an alias for the `map` method?

* What does the `reduce` method do?
* What is an alias for the `reduce` method?

* How do you check if every item in a hash fulfills a certain criteria?


### Enumerable Methods


### The `each` method
`each` is the most basic and flexible of the enumerable methods.

Calling the `each` method on an iterable object will loop through each item in that object and perform a task, which you define in a code block that you state after calling `each`.  This is called passing a block to the method, which is similar to passing a variable.

The task you want the method to perform can be as simple or complex as you need it to be. It performs that task and then at the end it also returns the original object it was called on.


Simple example of a good use for `each`: Say we want to print every word in an array of strings. We can use the `each` method on that string like so:

```ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.each { |fruit| print fruit, " " }
```
```
#=> apple banana strawberry pineapple
```

For hashes, each "item" is a key-value pair. If you call `each` on a hash, the item passed to the code block will be an array of the key and value [key, value].

```ruby
my_hash = { "one" => 1, "two" => 2, "three" => 3, "four" => 4}

my_hash.each do |item|
  print item, ""
end
```
```
#=> ["one", 1]["two", 2]["three", 3]["four", 4]
```

To allow you to better work with the keys and values, `each` allows you to pass the key and value as separate parameters when used on a hash. If you wanted to print the keys and values in a different format, for instance, you could do the following:

```ruby
my_hash = { "one" => 1, "two" => 2, "three" => 3, "four" => 4}

my_hash.each do |key, value|
  print key, ": ", value, "\n"
end
```
```
#=> one: 1
    two: 2
    three: 3
    four: 4
```

### The `each_with_index` method
This is nearly the same as the `each` method, but it provides additional functionality by allowing you to pass two parameters instead of one. The second parameter represents the index of your object, that is the position of the current item within that object.

This allows you to do things that are a bit more complex.

If we take the above example, but instead we want to only print every other word from our array of strings, we can achieve that like so:

```ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.each_with_index { |fruit, index| print fruit, " " if index % 2 == 0 }
```
```
#=> apple strawberry
```

### `do` and `end`
What if the code block you want to pass is long? Too long to fit on one line?
It starts to become less readable and look kind of unwieldy to take up more than one line (though it is possible).
Another way (and the commonly accepted best practice), is to use
`do` and `end` by replacing the curly braces in your code such that `{ |x| ... }`  becomes:

```ruby
do |x|
  ...
  ...
  ...
end
```

Here is the previous example using `do` and `end` instead of curly braces:
```ruby
my_array.each_with_index do |fruit, index|
   print fruit, " " if index % 2 == 0
end
```

### The `count` method
This method returns an integer representing the number of items within the calling object that meet
the condition(s) set forth in the block that you pass. Like `each`, this method takes a block with
one parameter (or two - key and value - when called on a hash).

For example, we may want to know how many words in our array have more than 6 letters. To find
that out, we can use the `count` method.

```ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.count { |fruit| fruit.length > 6 }
```
```
#=> 2
```

Alternatively, what if we want to know how many keys in our hash are symbols?

```ruby
my_hash = { "one" => 1, "two" => 2, "three" => 3, four: 4 }

my_hash.count { |key, value| key.is_a?(Symbol) }
```
```
#=> 1
```

### The `sort` method
`sort` is a method that can operate with or without a block being passed to it. By default, it sorts
numbers ascending, and strings alphabetically. However, it can also accept a block that
tells it to sort according to any rules you would like. This can take some practice, but
is a powerful tool.

When you pass a block to `sort`, you must pass two parameters, which are the items being compared
at a given time. The key is to make the block you pass return a -1 if the order of the items should be swapped
and return 1 if they should not be swapped. (Technically, it should return 0 if they are equal, but this will  rarely actually be necessary.) This is best understood through examples.

In this first example, we want to sort our array of fruits by ascending order of their last letters.

```ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.sort do |first, second|
  if first[-1] > second[-1]
    1
  else
    -1
  end
end
```
```
#=> ["banana", "apple", "pineapple", "strawberry"]
```

A handy operator is available for this: `<=>`, which is called the 'spaceship' operator.
It is used between two objects and returns one of three values: 1 if the first object is
greater, 0 if they are equal, and -1 if the first object is less than the second.

Our example above could be re-written as:

```ruby
my_array.sort { |first, second| first[-1] <=> second[-1] }
```
```
#=> ["banana", "apple", "pineapple", "strawberry"]
```

And, if we wanted to sort our strings in descending order, we could do write the following
(just swapping the order of the arguments):

```ruby
my_array.sort { |first, second| second <=> first }
```
```
#=> ["strawberry", "pineapple", "banana", "apple"]
```

### The `include?` method
* mention the ? mark
* how it works
* what its good for
* code snippets

### The `any?` method
* how it works
* what its good for
* code snippets

### The `all?` method
* how it works
* what its good for
* code snippets

### The `none?` method
* how it works
* what its good for
* code snippets

### The `select` method
* how it works
* what its good for
* code snippets

### The `find` method
* how it works
* what its good for
* code snippets

### The `find_all` method
* how it works
* what its good for
* code snippets

### The `map` method
* how it works
* what its good for
* code snippets for array
* collect is an alias

### The `reduce` method
* how it works
* what its good for
* code snippets for array
* collect is an alias


## Exercises
A group of exercises (If Applicable) for the student to complete in relation to the topic taught in the lesson.

## Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

Link to no more than three additional resources to avoid this section becoming too cluttered.

* There are many more enumerable methods than are covered here (`reject`, `drop`, `uniq`, to name a few) For a full listing, check out the Ruby Docs:
  [Ruby Docs Enumerable methods](https://ruby-doc.org/core-2.5.0/Enumerable.html)
