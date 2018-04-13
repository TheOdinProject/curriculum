### Introduction

The Enumerable module is a set of methods which can be included in Ruby classes (like Array and Hash). You can even include it in your own classes, which will be covered later on. These methods are handy for looping through iterable objects in a collection (most commonly arrays, hashes, and ranges). They provide
easy ways to perform common actions, and are among the most important tools for Rubyists. Some enumerable methods can be used on hashes just as on arrays, while others are implemented differently depending on the type of collection used.

There is a lot here, but these are built-in to make your life easier. We will run you through the ones that you will most commonly use. This certainly is not an exhaustive list. At the end of this lesson is a link for you to find out more about other methods beyond what we go through here.

## Learning outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* What are `enumerable` methods?

* What does the `each` method do?
* What does `each` return?
* What does the `each_with_index` method do?\ 

* When should you use `do...end` around a code block versus `{...}`?\

* What does the `count` method do?
* What does the `sort` method do?\

* Why is there a question mark after some methods?
* What does the `include?` method do?
* What does the `any?` method do? The `all?` method? `none?`?\


* What does the `select` method do?
* What does the `find` method do?\

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
#=> apple banana strawberry pineapple
```

For hashes, each "item" is a key-value pair. If you call `each` on a hash, the item passed to the code block will be an array of the key and value [key, value].

```ruby
my_hash = { "one" => 1, "two" => 2, "three" => 3, "four" => 4}

my_hash.each do |item|
  print item, ""
end
#=> ["one", 1]["two", 2]["three", 3]["four", 4]
```

To allow you to better work with the keys and values, `each` allows you to pass the key and value as separate parameters when used on a hash. If you wanted to print the keys and values in a different format, for instance, you could do the following:

```ruby
my_hash = { "one" => 1, "two" => 2, "three" => 3, "four" => 4}

my_hash.each do |key, value|
  print key, ": ", value, "\n"
end
#=> one: 1
#   two: 2
#   three: 3
#   four: 4
```


### The `each_with_index` method
This is nearly the same as the `each` method, but it provides additional functionality by allowing you to pass two parameters instead of one. The second parameter represents the index of your object, that is the position of the current item within that object.

This allows you to do things that are a bit more complex.

If we take the above example, but instead we want to only print every other word from our array of strings, we can achieve that like so:

```ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.each_with_index { |fruit, index| print fruit, " " if index % 2 == 0 }
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
#=> 2
```

Alternatively, what if we want to know how many keys in our hash are symbols?

```ruby
my_hash = { "one" => 1, "two" => 2, "three" => 3, four: 4 }

my_hash.count { |key, value| key.is_a?(Symbol) }
#=> 1
```


### The `sort` method
`sort` is a method that can operate with or without a block being passed to it. By default, it sorts numbers ascending, and strings alphabetically. However, it can also accept a block that tells it to sort according to any rules you would like. This can take some practice, but is a powerful tool.

When you pass a block to `sort`, you must pass two parameters, which are the items being compared at a given time. The key is to make the block you pass return a -1 if the order of the items should be swapped and return 1 if they should not be swapped. (Technically, it should also have a return of 0 for when they are equal, but this will rarely actually be necessary.) This is best understood through examples.

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
#=> ["banana", "apple", "pineapple", "strawberry"]
```

A handy operator is available for this: `<=>`, which is called the 'spaceship' operator.
It is used between two objects and returns one of three values: 1 if the first object is greater, 0 if they are equal, and -1 if the first object is less than the second.

Our example above could be re-written as:

```ruby
my_array.sort { |first, second| first[-1] <=> second[-1] }
#=> ["banana", "apple", "pineapple", "strawberry"]
```

And, if we wanted to sort our strings in descending order, we could do write the following
(just swapping the order of the arguments):

```ruby
my_array.sort { |first, second| second <=> first }
#=> ["strawberry", "pineapple", "banana", "apple"]
```


### The `include?` method

You may have noticed this method has a `?` mark in the name, which seems out of place. But Ruby actually uses this naming convention for any method that strictly returns a Boolean, that is either `true` or `false`.

The `include?` method works exactly like you think it should.
For example, if we are wanting to determine if a particular element exists in an array, we can use the `include?` method, and it will spit out `true` if that element is present or `false` if it is not.

You call the method on the array and pass it the element you are looking for like so:

```ruby
my_numbers = [5,6,7,8]

my_numbers.include?(6)
#=> true

my_numbers.include?(3)
#=> false
```


### The `any?` method

You might be able to then guess what the `any?` method does.

Let's say we want to see if there is any number greater than 500 in a list of numbers, `any?` can tell us like so:

```ruby
my_numbers = [21, 42, 303, 499, 550, 811]

my_numbers.any? { |item| item > 500 }
#=> true

my_numbers.any? { |item| item < 20 }
#=> false
```


### The `all?` method

The `all?` method is also fairly intuitive.

Say we want to check if all the words in our list are greater that 6 characters in length.

```ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.all? { |word| word.length > 6 }
#=> false
```

(Special note, `all?` will always return `true` unless an item fails to meet the condition. So if you call it on an empty array, there are no items to fail, and it will return `true` )


### The `none?` method

As you might expect `none?` performs the opposite function as `all?`:

```ruby
my_array.none? { |word| word.length < 4 }
#=> true
```


### The `select` method

The `select` method checks every item passed to it against a criteria that you specify, and returns only the items that pass that criteria. Your criteria, as usual, is passed as a block.

Say we want to pick out only the words whose length are greater than 5 characters but less than 10, we would do the follow:

```ruby
my_array.select { |word| word.length > 5 && word.length < 10 }
#=> ["banana", "pineapple"]
```


### The `find` method
The `find` method is similar to `select`, except it returns only the first item which meets the given criteria. If no such item exists, it returns `nil`. Using the same example as above:

```ruby
my_array.find { |word| word.length > 5 && word.length < 10 }
#=> "banana"
```

`find` is useful if you want to be able to use the results in somewhat advanced conditional logic, since `nil` is falsy while any object returned (other than `false`) would be truthy. Don't worry if you can't quite follow it, but an example would be:

```ruby
word = my_array.find { |word| word.length > 9 && word.length < 10 }
if word
  puts word
else
  puts "No object found"
end
#=> No object found
```


### The `map` method
`map` is used to transform each item from the object it is called on and place them into a new object. How the items are transformed is defined by the block you pass to it. `map` may seem confusing at first, but it is extremely useful. Seeing several examples and use cases will help you understand how and when you can use it. You will probably also run into `collect`, which is simply an alias for `map` (same function, different name).

To get the first 100 square numbers, we can simply call `map` on the range of numbers from 1 to 100, like so:

```ruby
my_squares = (1..20).map { |x| x**2 }
#=> [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400]
```

```ruby
my_strings = ["One", "Two", "Three", "Four"]
my_emphatic_strings = my_strings.map { |s| s + "!" }
#=> ["One!", "Two!", "Three!", "Four!"]
```

### The `reduce` method
`reduce` (alias: `inject`) is possibly the most difficult-to-grasp common method for new coders. The idea is simple enough, though: it reduces a collection object (array/range/hash) down to a single object. You should use it when you want to get a single value or output from your collection.

A classic example would be a sum or product of an array of numbers. The syntax is where it can be tricky. In most cases, you need to pass a starting 'value' or object as well as a block with two parameters that tells it how to combine the items. The parameters of the block are the 'cumulative value' and current item.

```ruby
my_numbers = [2, 4, 6, 8, 10]
my_product = my_numbers.reduce(1) { |product, x| product * x }
#=> 3840
```

Here is a more elaborate example, which shows how powerful this method can be and can save you many lines of code in certain scenarios. Here a task required is to determine the distribution of names of the students by first letter.

```ruby
students = ["Steve", "Robert", "Sarah", "John", "Ryan", "Rebecca", "Jane", "Sanjay", "Randy", "Sam", "Abigail"]

students_by_letter = students.reduce(Hash.new(0)) do |hash, name|
  hash[name[0]] += 1
  hash
end
#=> {"S"=>4, "R"=>4, "J"=>2, "A"=>1}
```

Note that this example returns a hash with several key => value pairs. So the object that `reduce` returns is still one object (a hash), but that object can be complex if you need it to be.


## Conclusion

This introduction to some of the more common enumerable methods should give you an idea of how many tools Ruby puts in your tool box that you are free to utilize in whatever combination as you wish. Therefore given a task, and the many tools available, it is common for different coders to come up with different solutions to arrive at the same result.


## Exercises
A group of exercises (If Applicable) for the student to complete in relation to the topic taught in the lesson.

## Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

Link to no more than three additional resources to avoid this section becoming too cluttered.

* There are many more enumerable methods than are covered here (`reject`, `drop`, `uniq`, to name a few).
For a full listing, you can check out the Ruby Docs:
  [Ruby Docs Enumerable methods](https://ruby-doc.org/core-2.5.0/Enumerable.html)
