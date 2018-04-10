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


### The `each` Enumerable Method
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

### The `each_with_index` Enumerable method
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

### The `count` Enumerable Method
* how it works
* what its good for
* code snippets

### The `sort` Enumerable Method
* how it works
* what its good for
* code snippets

### The `include?` Enumerable Method
* mention the ? mark
* how it works
* what its good for
* code snippets

### The `any?` Enumerable Method
* how it works
* what its good for
* code snippets

### The `all?` Enumerable Method
* how it works
* what its good for
* code snippets

### The `none?` Enumerable Method
* how it works
* what its good for
* code snippets

### The `select` Enumerable Method
* how it works
* what its good for
* code snippets

### The `find` Enumerable Method
* how it works
* what its good for
* code snippets

### The `find_all` Enumerable Method
* how it works
* what its good for
* code snippets

### The `map` Enumerable Method
* how it works
* what its good for
* code snippets for array
* collect is an alias

### The `reduce` Enumerable Method
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
