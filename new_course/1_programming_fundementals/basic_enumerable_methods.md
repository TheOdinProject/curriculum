### Introduction
In Ruby, enumerables are a set of methods that are available to collection objects, such as arrays or hashes. These enumerable methods are handy for searching or looping through a collection, and are among the most important tools for Rubyists, they are a large part of what makes Ruby such a joy to work with.

We will run through the enumerable methods that you will most commonly use and see out in the wild. This is certainly not an exhaustive list, so be sure to have a look at the [Ruby docs](https://ruby-doc.org/core-2.6/) to see what else Enumerable offers.

It will be beneficial for you to code along to test the examples as you work through this lesson, either in IRB or [repl.it](https://repl.it/languages/ruby).

### Learning Outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* What does the `#each` method do? What does it return?
* What does the `#each_with_index` method do?
* When should you use `do...end` around a code block versus `{...}`?
* Why is there a question mark after some methods?
* What does the `#include?` method do?
* What does the `#any?` method do? The `#all?` method? `#none?`?
* What does the `#count` method do?
* What does the `#sort` method do?
* What does the `#select` method do?
* What does the `#find` method do?
* What does the `#map` method do? Does it modify the collection it's called on?
* What does the `#reduce` method do?

### The `#each` method
Calling `#each` on an array will loop or iterate through that array and will yield each element to a code block, where a task can be performed. This is also called passing a block to the `#each` method:

~~~ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.each { |fruit| puts fruit }

apple
banana
strawberry
pineapple
#=> ["apple", "banana", "strawberry", "pineapple"]
~~~

When used on an array or hash, `#each` will return the original collection (something to keep in mind when debugging your code).

Note that for hashes, `#each` can yield the key and value individually or together (as an array) to the block:

~~~ruby
my_hash = { "one" => 1, "two" => 2}

my_hash.each { |key, value| puts "#{key} is #{value}" }

one is 1
two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }

the pair is ["one", 1]
the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}
~~~

#### A quick note on styling blocks with `do..end`
What if the code block you want to pass to a method requires more logic than can fit in one line? It starts to become less readable and looks unwieldy. In such situations, the commonly accepted best practice&mdash;according to the [Ruby Style Guide](https://github.com/rubocop-hq/ruby-style-guide)&mdash;is to use `do...end` blocks for multi-line blocks, instead of `{...}` blocks:

~~~ruby
my_array = [1, 2]

# bad
my_array.each { |num| num *= 2; puts "the new number is #{num}" }

# good
my_array.each do |num|
  num *= 2
  puts "the new number is #{num}"
end
~~~

### The `#each_with_index` method
This method is nearly the same as the `#each` method, but it provides additional functionality by yielding two parameters instead of one as it iterates through a collection. The first parameter is the element itself, while the second parameter represents the index or position of that element within the collection. This allows you to do things that are a bit more complex.

For example, if we only want to print every other word from an array of strings, we can achieve this like so:

~~~ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.each_with_index { |fruit, index| puts fruit if index % 2 == 0 }

apple
strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]
~~~

As with the `#each` method, `#each_with_index` will return the original collection it is called on.

### The `#include?` method
You may have noticed this method has a `?` mark in the name. Any method with a `?` at the end is a `predicate` method, which is Ruby convention for any method that strictly returns a Boolean, that is either `true` or `false`.

The `#include?` method works exactly like you think it should. For example, if we want to determine if a particular element exists in an array, we can use the `#include?` method.

You call the method on the array and pass it the element you are looking for like so:

~~~ruby
my_numbers = [5, 6, 7, 8]

my_numbers.include?(6)
#=> true

my_numbers.include?(3)
#=> false
~~~

### The `#any?` method
You might also be able to guess what the `#any?` method does.

Let's say we want to see if there is any number greater than 500 in an array of numbers. The `#any?` method can tell us like so:

~~~ruby
my_numbers = [21, 42, 303, 499, 550, 811]

my_numbers.any? { |item| item > 500 }
#=> true

my_numbers.any? { |item| item < 20 }
#=> false
~~~

### The `#all?` method
The `all?` method is also fairly intuitive. For example, if we want to check if all the words in our list are greater that 6 characters in length, we could do the following:

~~~ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.all? { |word| word.length > 6 }
#=> false
~~~

Special note to keep in mind while debugging: `#all?` will return `true` unless the block returns `false` or `nil`. So even if you call `#all?` on an empty collection (i.e., there are no elements to for the block to evaluate), it will return `true`.

#### The `#none?` method
As you might expect `#none?` performs the opposite function of `#all?`. It returns `true` only if the block never evaluates to `true` for all elements:

~~~ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.none? { |word| word.length < 4 }
#=> true
~~~

### The `#count` method
The `#count` method returns the total number of elements in a collection. Additionally, when passed a block, it can also return the number of elements that yield a true value. Like `#each`, this method takes a block with one parameter (or two&mdash;`key` and `value`&mdash;when called on a hash).

~~~ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.count                                    #=> 4
my_array.count { |fruit| fruit.length > 6 }       #=> 2

my_hash = { "one" => 1, "two" => 2, "three" => 3, four: 4 }

my_hash.count                                     #=> 4
my_hash.count { |key, value| key.is_a?(Symbol) }  #=> 1
~~~

### The `#sort` method
`#sort` is a method that can operate with or without a block being passed to it. By default, it sorts elements in ascending order, both numerically and alphabetically, by using the elements' `<=>` operator (a.k.a., the spaceship operator). This implies that the items being compared are of the same type, naturally (you'll get `nil` otherwise). This operator returns **-1**, **0**, or **1** depending on the whether the first item is less than, equal to, or greater than the second element, respectively.

~~~ruby
"apple" <=> "strawberry"  #=> -1
"strawberry" <=> "apple"  #=> 1
~~~

When you pass a block to `#sort`, the behavior is essentially the same: lesser comes first, greater comes after. You yield and compare two elements at a time, `a` and `b`, for example. Then, the block should return:
* An integer **lesser** than 0, if `a` should come before `b`
* 0, if `a` is equal to `b` (this can produce unstable orders, though); OR,
* An integer **greater** than 0, if `a` should come after `b`

Based on all the points above, it's also possible to sort items in *descending* order:
~~~ruby
my_array = ["strawberry", "apple", "banana"]

my_array.sort
#=> ["apple", "banana", "strawberry"]

my_array.sort { |a, b| b <=> a }
#=> ["strawberry", "banana", "apple"]
~~~

Don't worry if it takes a few minutes for your mind to wrap around this. Read through it step by step, and check into our Discord to say hello if you still feel lost (mental breaks are always a good thing).

### The `#select` method
The `#select` method (a.k.a., `#filter` method) passes every item in a collection to a block, and returns a brand new array with only the items that evaluate to true.

Say we want to pick out the freshest fruits from our array of fruits. More to the point, say we want pick out those fruits that have a length greater than 5 characters but less than 10:

~~~ruby
my_array.select { |word| word.length > 5 && word.length < 10 }
#=> ["banana", "pineapple"]
~~~

Or maybe we only want to pack pastries that can be grouped in exact batches of dozens:

~~~ruby
my_hash = { "croissant": 12, "donuts": 36, "muffins": 11, "twinkies": 4 }

my_hash.select { |key, value| value % 12 == 0 }
#=> {:croissant=>12, :donuts=>36}
~~~

### The `#find` method
The `#find` method is similar to `#select`, except it returns only the first item which meets the given criteria. If no such item exists, it returns `nil`. Using the same example as above:

~~~ruby
my_array = ["strawberry", "apple", "banana"]

my_array.find { |word| word.length > 5 && word.length < 10 }
#=> "banana"
~~~

`#find` is useful if you want to be able to use the results in somewhat advanced conditional logic, since `nil` is falsy while anything returned (other than `false`) would be truthy. Don't worry if you can't quite follow it, but an example would be:

~~~ruby
word = my_array.find { |word| word.length > 9 && word.length < 10 }
if word
  puts word
else
  puts "No object found"
end
#=> No object found
~~~
<br/>

### The `#map` method
`#map` is used to transform each item from the collection it is called on and to place them into a new array. How the items are transformed is defined by the block you pass to it. `#map` may seem confusing at first, but it is extremely useful. Seeing several examples and use cases will help you understand how and when you can use it. You will probably also run into `#collect`, which is simply an alias for `#map`.

To get the first 20 square numbers, we can simply call `map` on the range of numbers from 1 to 20, like so (ranges are collections too):

~~~ruby
my_squares = [1, 2, 3, 4].map { |number| number * 2 }
#=> [2, 4, 6, 8]
~~~

Here we modify each string in an array by adding an '!':

~~~ruby
my_strings = ["One", "Two", "Three", "Four"]

my_emphatic_strings = my_strings.map { |string| string + "!" }
#=> ["One!", "Two!", "Three!", "Four!"]
~~~

### The `#reduce` method
The `#reduce` method (alias: `#inject`) is possibly the most difficult-to-grasp, common method for new coders. The idea is simple enough, though: it reduces a collection (array/hash) down to a single object. You should use it when you want to get a single value or output from your collection.

A classic example would be a sum or product of an array of numbers. The syntax is where it can be tricky. In most cases, you need to pass a starting 'value' as well as a block with two parameters that tells it how to combine the items. The parameters of the block are the 'cumulative value' and current item.

~~~ruby
my_numbers = [5, 5, 5, 5]
my_sum = my_numbers.reduce(0) { |sum, number| sum * number }
#=> 20
~~~

Here is a more elaborate example, which shows how powerful this method can be. Don't be discouraged if you don't fully understand it at this point. Just know that `#reduce` can save you many lines of code in certain scenarios.

Here's an example in which you've been given the task of determining the distribution of names from an array of students by first letter.

~~~ruby
students = ["Steve", "Robert", "Sarah", "John", "Ryan", "Rebecca", "Jane", "Sanjay", "Randy", "Sam", "Abigail"]

students_by_letter = students.reduce(Hash.new(0)) do |hash, name|
  hash[name[0]] += 1
  hash
end
#=> {"S"=>4, "R"=>4, "J"=>2, "A"=>1}
~~~

Note that this example returns a hash with several `key => value` pairs. So the object that `#reduce` returns is still one object, a hash. It's just a more complex one.


### Assignment
<div class="lesson-content__panel" markdown="1">
  1. [For a deeper look at the map method follow along to this article on Ruby Guides](https://www.rubyguides.com/2018/10/ruby-map-method/)
  2. [For a deeper look at the reduce method follow along to this article by Brandon Weaver](https://medium.com/@baweaver/reducing-enumerable-part-one-the-journey-begins-ddc1d4108490)
</div>

### Conclusion
This introduction to some of the more common enumerable methods should give you an idea of how many tools Ruby puts in your toolbox that you are free to utilize in whatever combination you wish. Therefore, given a task, and the many tools available, it's common for different coders to come up with different solutions to arrive at the same result.

### Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* The Bastards Book of Ruby has a good section on [Enumerables](http://ruby.bastardsbook.com/chapters/enumerables/).
* This tutorial on [codementor](https://www.codementor.io/ruby-on-rails/tutorial/rubys-swiss-army-knife-the-enumerable-module) is another good discussion of the versatility of enumerable methods.
* There are many more enumerable methods than are covered in this lesson (`reject`, `drop`, `uniq`, to name a few).
For a full listing, you can check out the [Ruby Docs](https://ruby-doc.org/core-2.5.0/Enumerable.html).
