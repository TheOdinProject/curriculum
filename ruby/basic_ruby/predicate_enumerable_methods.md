### Introduction
In the previous lesson, you learned about some really handy enumerable methods like `#each`, `#map`, and `#select`. In this lesson, we're going to learn about *even more* enumerable methods! Woohoo! The party never ends here at The Odin Project!

This time, we're focusing on a particular subset of enumerable methods: the **predicate enumerable methods**. You should recall from the Methods lesson that a predicate method is indicated by a question mark (`?`) at the end of the method name and returns either `true` or `false`. Again, we won't be going through all of the predicate enumerable methods, so be sure to have a look at the [Ruby docs](https://docs.ruby-lang.org/en/3.2/) to see what else [Enumerable](https://docs.ruby-lang.org/en/3.2/Enumerable.html) offers.

For all of the examples throughout this lesson, feel free to follow along in irb or [replit.com](https://replit.com/languages/ruby) (an online REPL environment) to get a better feel for how they work.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what a predicate enumerable method is.
- Explain how the `#include?` method works.
- Explain how the `#any?` method works.
- Explain how the `#all?` method works.
- Explain how the `#none?` method works.

### The include? method
The `#include?` method works exactly like you think it should. If we want to know whether a particular element exists in an array, we can use the `#include?` method. This method will return `true` if the element you pass as an argument to `#include?` exists in the array or hash; otherwise, it will return `false`.

First, let's explore how we would achieve this with the `#each` method:

```ruby
numbers = [5, 6, 7, 8]
element = 6
result = false

numbers.each do |number|
  if number == element
    result = true
    break
  end
end

result
# => true

element = 3
result = false

numbers.each do |number|
  if number == element
    result = true
    break
  end
end

result
#=> false
```
<div class="lesson-note">
If you notice, there is a `break` statement in the `if` condition so that loop stops executing once the number is found. Otherwise it would still run over all numbers in the array which is not needed as we have already found the element.
</div>

Using `#include?`, this code can be greatly simplified:

```ruby
numbers = [5, 6, 7, 8]

numbers.include?(6)
#=> true

numbers.include?(3)
#=> false
```

For another example, let's return to the `friends` and `invited_friends` arrays from the previous lesson:

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brian')
#=> false
```

### The any? method
You might also be able to guess what the `#any?` method does. It returns `true` if *any* elements in your array or hash match the condition within the block; otherwise, it will return `false`.

Let's say we want to see if there is any number greater than 500 or less than 20 in an array of numbers. First, let's see how we could achieve this using `#each`.

```ruby
numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number > 500
    result = true
    break
  end
end

result
#=> true

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number < 20
    result = true
    break
  end
end

result
#=> false
```

Using `#any?`, this code can be greatly simplified:

```ruby
numbers = [21, 42, 303, 499, 550, 811]

numbers.any? { |number| number > 500 }
#=> true

numbers.any? { |number| number < 20 }
#=> false
```

### The all? method
The `all?` method is also fairly intuitive. It only returns `true` if *all* the elements in your array or hash match the condition you set within the block; otherwise, it will return `false`.

Let's say that we want to check whether all the words in our list are more than 3 characters or 6 characters long. First,let's see how we could achieve this using `#each`:

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 3
    matches.push(fruit)
  end
end

result = fruits.length == matches.length
result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end
end

result = fruits.length == matches.length
result
#=> false
```

Using `#all?`, this code can be greatly simplified:

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false
```

Special note to keep in mind while debugging: `#all?` will return `true` by default unless the block returns `false` or `nil`. So if you call `#all?` on an empty array or hash (i.e., there are no elements  for the block to evaluate), it will return `true`.

### The none? method
As you might expect, `#none?` returns `true` only if the condition in the block matches *none* of the elements in your array or hash; otherwise, it returns `false`.

First, let's see how this could be achieved using `#each`. You'll notice that this approach is very similar to what we did for `#all?`.

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]
result = false

fruits.each do |fruit|
  if fruit.length > 10
    result = false
    break
  end

  result = true
end

result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
result = false

fruits.each do |fruit|
  if fruit.length > 6
    result = false
    break
  end

  result = true
end

result
#=> false
```

Using `#none?`, this can be greatly simplified:

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.none? { |fruit| fruit.length > 10 }
#=> true

fruits.none? { |fruit| fruit.length > 6 }
#=> false
```

### Assignment
<div class="lesson-content__panel" markdown="1">
  1. Read [How to Use Ruby Any, All, None, and One](https://www.rubyguides.com/2018/10/any-all-none-one/) for alternative explanations for predicate enumerables.
  2. Complete the [predicate enumerable](https://github.com/TheOdinProject/ruby-exercises/tree/main/ruby_basics) exercises from the [ruby-exercises repo](https://github.com/TheOdinProject/ruby-exercises) that you previously cloned.
</div>

### Knowledge check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

 * <a class="knowledge-check-link" href="#introduction">Why is there a question mark after some method names?</a>
 * <a class="knowledge-check-link" href="#the-include-method">What does the `#include?` method do?</a>
 * <a class="knowledge-check-link" href="#the-any-method">What does the `#any?` method do?</a>
 * <a class="knowledge-check-link" href="#the-all-method">What does the `#all?` method do?</a>
 * <a class="knowledge-check-link" href="#the-none-method">What does the `#none?` method do?</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- There are many more enumerable methods than are covered in this lesson (e.g., `#member?`). For a full listing, you can check out the [Ruby Docs](https://docs.ruby-lang.org/en/3.2/Enumerable.html).
