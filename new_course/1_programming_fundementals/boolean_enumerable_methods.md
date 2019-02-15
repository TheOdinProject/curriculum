### Introduction
In previous lessons, you learned about loops as well as arrays and hashes. You will soon discover that you'll have to do so much iterating (looping or repeating something several times) over collections as a developer that it will make you dizzy.

**Enumerables** are a set of convenient built-in methods in Ruby that you can use on collections. There are some iteration patterns that you'll find yourself doing again and again, such as transforming, searching for, and selecting subsets of elements in your collections. Enumerables were designed to make implementing these iteration patterns (and therefore your life as a developer) much, much easier.

We will run through the enumerable methods that you will most commonly use and see out in the wild. This is certainly not an exhaustive list, so be sure to have a look at the [Ruby docs](https://ruby-doc.org/core-2.6/) to see what else [Enumerable](https://ruby-doc.org/core-2.6.1/Enumerable.html) offers.

For all of the examples throughout this lesson, feel free to follow along in irb or [repl.it](https://repl.it/languages/ruby) (an online REPL environment) to get a better feel for how they work.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe what a Boolean Enumerable method is.
 - Explain how the `#include?` method works.
 - Explain how the `#any?` method works.
 - Explain how the `#any?` method works.
 - Explain how the `#none?` method works.

### Boolean Enumerable Methods
You may have noticed some of Ruby's built in methods have a question mark `?` in the name. Any method with a `?` at the end is a `predicate` method, which is a Ruby convention for a method that returns a Boolean, that is either `true` or `false`.

In this section we are going to take a look at four of Ruby's boolean enumerable methods.

### The `#include?` method
The `#include?` method works exactly like you think it should. If we want to determine if a particular element exists in an array, we can use the `#include?` method. It will return true if the element you pass as an argument to `#include?` exists in a collection, otherwise it will return false.

First lets explore how we would achieve this with the `#each` method:

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

Using include this can simplified to the following:

~~~ruby
numbers = [5, 6, 7, 8]

numbers.include?(6)
#=> true

my_numbers.include?(3)
#=> false
~~~

For another example using your `invited_friends` list:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brain')
#=> false
~~~

### The `#any?` method
You might also be able to guess what the `#any?` method does. It returns true if **any** elements in your collection match the criteria within the block, otherwise it will return false.

Let's say we want to see if there is any number greater than 500 in an array of numbers, lets first explore how we could achieve this using `#each`.

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

Using `#any?` this can be simplified to:

~~~ruby
numbers = [21, 42, 303, 499, 550, 811]

numbers.any? { |number| item > 500 }
#=> true

numbers.any? { |number| item < 20 }
#=> false
~~~

### The `#all?` method
The `all?` method is also fairly intuitive. It only returns true if **all** the elements in your collection match the criteria you set within the block, otherwise it will return false.

Say we want to check if all the words in our list are greater that 6 characters in length, lets first explore how we could achieve this using `#each` :

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

Using `#all?` this can be simplified to:

~~~ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false
~~~

Special note to keep in mind while debugging: `#all?` will return `true` unless the block returns `false` or `nil`. So even if you call `#all?` on an empty collection (i.e., there are no elements to for the block to evaluate), it will return `true`.

### The `#none?` method
As you might expect `#none?` performs the opposite function of `#all?`. It returns true only if the criteria in the block matches **none** of the elements in a collection. Otherwise it returns false.

Lets first explore how this could be achieved using `#each`, its very similar to what we did with `#all?`:

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

Using `#none?` this can be simplified to:

~~~ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.none? { |fruit| fruit.length > 10 }
#=> true

fruits.none? { |fruit| fruit.length > 6 }
#=> true
~~~


### Assignment
<div class="lesson-content__panel" markdown="1">
  1. Follow along to this [How to Use The Ruby Map Method](https://www.rubyguides.com/2018/10/ruby-map-method/) tutorial from Ruby Guides.
  2. Follow along to this [Reducing Enumerable](Reducing Enumerable — Part One: The Journey Begins) article by Brandon Weaver.
  3. Read [How to Use Ruby Any, All None and One](https://www.rubyguides.com/2018/10/any-all-none-one/) for alternative explanations for boolean enumerables.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* The Bastards Book of Ruby has a good section on [Enumerables](http://ruby.bastardsbook.com/chapters/enumerables/).
* This tutorial on [codementor](https://www.codementor.io/ruby-on-rails/tutorial/rubys-swiss-army-knife-the-enumerable-module) is another good discussion of the versatility of enumerable methods.
* There are many more enumerable methods than are covered in this lesson (`reject`, `drop`, `uniq`, to name a few).
For a full listing, you can check out the [Ruby Docs](https://ruby-doc.org/core-2.5.0/Enumerable.html).

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* What does the `#each` method do? What does it return?
* What does the `#each_with_index` method do?
* When should you use `do...end` around a code block versus `{...}`?
* What does the `#map` method do?
* What does the `#select` method do?
* What does the `#reduce` method do?
* Why is there a question mark after some methods?
* What does the `#include?` method do?
* What does the `#any?` method do? The `#all?` method? `#none?`?
* Why should you not use the bang methods of enumerables often?