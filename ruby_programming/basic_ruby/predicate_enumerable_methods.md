### Introduction
In the previous lesson, you learned about some really handy enumerable methods like `#each`, `#map`, and `#select`. In this lesson, we're going to learn about *even more* enumerable methods! Woohoo! The party never ends here at The Odin Project!

This time, we're focusing on a particular subset of enumerable methods: the **predicate enumerable methods**. You should recall from the Methods lesson that a predicate method is indicated by a question mark (`?`) at the end of the method name and returns either `true` or `false`. Again, we won't be going through all of the predicate enumerable methods, so be sure to have a look at the [Ruby docs](https://ruby-doc.org/core-2.6/) to see what else [Enumerable](https://ruby-doc.org/core-2.6.1/Enumerable.html) offers.

For all of the examples throughout this lesson, feel free to follow along in irb or [repl.it](https://repl.it/languages/ruby) (an online REPL environment) to get a better feel for how they work.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe what a predicate enumerable method is.
 - Explain how the `#include?` method works.
 - Explain how the `#any?` method works.
 - Explain how the `#all?` method works.
 - Explain how the `#none?` method works.

### The include? Method
The `#include?` method works exactly like you think it should. If we want to know whether a particular element exists in an array, we can use the `#include?` method. This method will return `true` if the element you pass as an argument to `#include?` exists in the array or hash; otherwise, it will return `false`.

First, let's explore how we would achieve this with the `#each` method:

~~~ruby
numbers = [5, 6, 7, 8]
element = 6
result = false

numbers.each do |number|
  if number == element
    result = true
  end
end

result
# => true

element = 3
result = false

numbers.each do |number|
  if number == element
    result = true
  end
end

result
#=> false
~~~

Using `#include?`, this code can be greatly simplified:

~~~ruby
numbers = [5, 6, 7, 8]

numbers.include?(6)
#=> true

numbers.include?(3)
#=> false
~~~

For another example, let's return to the `friends` and `invited_friends` arrays from the previous lesson:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brian')
#=> false
~~~

### The any? Method
You might also be able to guess what the `#any?` method does. It returns `true` if *any* elements in your array or hash match the condition within the block; otherwise, it will return `false`.

Let's say we want to see if there is any number greater than 500 or less than 20 in an array of numbers. First, let's see how we could achieve this using `#each`.

~~~ruby
numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number > 500
    result = true
  end
end

result
#=> true

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number < 20
    result = true
  end
end

result
#=> false
~~~

Using `#any?`, this code can be greatly simplified:

~~~ruby
numbers = [21, 42, 303, 499, 550, 811]

numbers.any? { |number| number > 500 }
#=> true

numbers.any? { |number| number < 20 }
#=> false
~~~

### The all? Method
The `all?` method is also fairly intuitive. It only returns `true` if *all* the elements in your array or hash match the condition you set within the block; otherwise, it will return `false`.

Let's say that we want to check whether all the words in our list are more than 6 characters long. First,let's see how we could achieve this using `#each`:

~~~ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 3
    matches.push(fruit)
  end

  result = fruits.length == matches.length
end

result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end

  result = fruits.length == matches.length
end

result
#=> false
~~~

Using `#all?`, this code can be greatly simplified:

~~~ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false
~~~

Special note to keep in mind while debugging: `#all?` will return `true` by default unless the block returns `false` or `nil`. So if you call `#all?` on an empty array or hash (i.e., there are no elements  for the block to evaluate), it will return `true`.

### The none? Method
As you might expect, `#none?` performs the opposite function of `#all?`. It returns `true` only if the condition in the block matches *none* of the elements in your array or hash; otherwise, it returns `false`.

First, let's see how this could be achieved using `#each`. You'll notice that this approach is very similar to what we did for `#all?`.

~~~ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 10
    matches.push(fruit)
  end

  result = matches.length == 0
end

result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end

  result = matches.length == 0
end

result
#=> false
~~~

Using `#none?`, this can be greatly simplified:

~~~ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.none? { |fruit| fruit.length > 10 }
#=> true

fruits.none? { |fruit| fruit.length > 6 }
#=> false
~~~

### Assignment
<div class="lesson-content__panel" markdown="1">
  1. Read [How to Use Ruby Any, All, None, and One](https://www.rubyguides.com/2018/10/any-all-none-one/) for alternative explanations for predicate enumerables.
  2. Complete the [predicate enumerable](https://github.com/TheOdinProject/ruby-exercises/tree/master/ruby_basics) exercises from the [ruby-exercises repo](https://github.com/TheOdinProject/ruby-exercises) that you previously cloned.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* There are many more enumerable methods than are covered in this lesson (e.g., `#member?` and `#one?`). For a full listing, you can check out the [Ruby Docs](https://ruby-doc.org/core-2.5.0/Enumerable.html).

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

 * Why is there a question mark after some method names?
 * What does the `#include?` method do?
 * What does the `#any?` method do?
 * What does the `#all?` method do?
 * What does the `#none?` method do?
