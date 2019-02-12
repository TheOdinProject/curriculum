### Introduction
In previous lessons you learnt about loops and collections such as arrays and hashes. You will soon find out that you'll have to do a lot of iterating (looping or repeating something several times) over collections as a developer, so much it will make you dizzy.

Say you wanted to make an invite list for your birthday using your friends array, but you don't want to invite your friend Brian because he's a bit of nutcase and always drinks way too much.

With the loops you've already learnt you might do that like this:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']
invited_list = []

for friend in friends do
  if friend != 'Brian'
  invited_list.push(friend)
  end
end

invited_list #=> ["Sharon", "Leo", "Lelia", "Arun"]
~~~

Thats not so bad, but imagine having to do that for every party you host from now until the end of time! It might be easier to just stop hanging out with Brian.

Using the `#select` enumerable method you could change the above code to this:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }
 #=> ["Sharon", "Leo", "Lelia", "Arun"]
~~~

or even better and more to the point:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brain', 'Arun']

friends.reject { |friend| friend == 'Brian' }
 #=> ["Sharon", "Leo", "Lelia", "Arun"]
~~~

You just cut down what was previously a 8 line program to 2 lines. Amazing! Imagine all the time you'll save sorting your invite lists out.

Enumerables are a set of convenient methods built into Ruby that you can use on collections. There are some iteration patterns that you'll find yourself doing again and again such as transforming, searching, and selecting subsets of elements in your collections. Enumerables were designed to make implementing these iteration patterns much, much easier.

We will run through the enumerable methods that you will most commonly use and see out in the wild. This is certainly not an exhaustive list, so be sure to have a look at the [Ruby docs](https://ruby-doc.org/core-2.6/) to see what else Enumerable offers.

For all of the examples throughout this lesson, feel free to follow along in irb or [repl.it](https://repl.it/languages/ruby) (an online REPL environment) to get a better feel for how they work.

### Learning Outcomes
*Look through these now and then use them to test yourself after doing the assignment*

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

### The `#each` Enumerable Method
`#each` is the Grand Daddy of the Enumerables. Its a bit like Chuck Norris: it can do anything. But as you'll see throughout this lesson, just because you can use `#each`, it doesn't mean you should in a lot of situations.

Calling `#each` on an array will iterate through that array and will yield each element to a code block, where a task can be performed:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

friends.each { |friend| puts friend }

#=> Sharon
#=> Leo
#=> Lelia
#=> Brian
#=> Arun

#=> ["Sharon", "Leo", "Lelia", "Brian" "Arun"]
~~~

Lets break down this syntax:

* `friends` is your collection, your array of friends.
* `.each` is the enumerable method you are calling on your friends array.
* `{ |friend| puts friend }` is a block, and the code in the block is run for each element in your collection. Because we have 5 friends in our array, thats how many times the block will be run for this collection.
* Within the block you have what's known as the block variable `|friend|`. This is the element from your collection the block is currently iterating over. In the first iteration its value will be `'Sharon'`, in the second iteration its value will be `'Leo'`, in the third `Lelia`, and so on until it reaches the end of the collection.

`#each` also works with hashes, but with a bit of added functionality. It can yield the key and value of a hash individually or together (as an array) to the block:

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

You may have noticed in the code examples so far when you use `#each`, it will return the original collection. This is something to keep in mind when debugging your code as it can lead to some confusion.

Take this code for example:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']
~~~

You might expect this to return all the friends names in uppercase `['SHARON', 'LEO', 'LELIA', 'BRIAN', 'ARUN']`. But you'd be wrong, dead wrong. It returns the original array you called `#each` on. You're still *not* invited, Brian.

### The `#each_with_index` Enumerable Method
This method is nearly the same as `#each`, but it provides additional functionality by yielding two **block variables** instead of one as it iterates through a collection. The first variables value is the element itself, while the second variable's value is the index or position of that element within the collection. This allows you to do things that are a bit more complex.

For example, if we only want to print every other word from an array of strings, we can achieve this like so:

~~~ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]
~~~

As with the `#each` method, `#each_with_index` will return the original collection it is called on.

### A quick note on styling blocks with `do...end`
What if the block you want to pass to a method requires more logic than can fit in one line? It starts to become less readable and looks unwieldy. In such situations, the commonly accepted best practice is to use `do...end` blocks for multi-line blocks, instead of `{...}` blocks:

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

### The `#map` Enumerable Method
Remember when we tried to transform each of your friends names earlier by uppercasing them with `#each`? Lets try that again.

For reference, this what we previously tried:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']
~~~

It returns the original array, but dammit that's not what we want.

Let's modify it to get it to work:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']
shouting_at_friends = []

friends.each { |friend| shouting_at_friends.push(friend.upcase) }
#=> ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

shouting_at_friends #=> `['SHARON', 'LEO', 'LELIA', 'BRIAN', 'ARUN']`
~~~

It works! But we need to introduce another array into the mix to store the transformed elements. Its starting to suspiciously look like the `for` loop example we were trying to get away from in the introduction of this lesson.

Luckily we have the `#map` enumerable to save us from this misery!

`#map` is used to transform each element from the collection it is called on, and return the transformed elements in a new array. How the elements are transformed is defined by the block you pass to it.

`#map` may seem confusing at first, but it is extremely useful. Seeing several examples and use cases will help you understand how and when you can use it.

Changing our uppercasing friends example to use map would look like this:
~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LELIA', 'BRIAN', 'ARUN']`
~~~

Maybe you want to change your McDonalds order from medium to extra large, with `#map` thats easy peasy:
~~~ruby
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]
~~~

Or maybe you want to deduct your rent payments from your salary over the past few months:

~~~ruby
salaries = [1500, 1500, 1500, 1500]

salaries.map { |salary| salary - 700 }
#=> [800, 800, 800, 800]
~~~

### The `#select` Enumerable Method
You've already seen the `#select` method in action, right at the very start of this lesson when we created our invite list and made Brian an outcast.

The `#select` method passes every item in a collection to a block, and returns a brand new array with only the items that evaluate to true from the condition you set within the block.

Lets explore how the same thing would be accomplished by using `#each` first:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']
invited_list = []

friends.each do |friend|
  if friend != 'Brian'
    invited_list.push(friend)
  end
end

invited_list
 #=> ["Sharon", "Leo", "Lelia", "Arun"]
~~~

Using `#select` this can simplified to:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }

 #=> ["Sharon", "Leo", "Lelia", "Arun"]
~~~

The friends you invited to your party have gotten back to you, their responses are all in a hash. Lets use `#select` to figure out who's coming. Recall that when we use an emumerable method with a hash, you can use the key and the value as block variables within the block:

~~~ruby
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Lelia' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}
~~~

Looks like only Sharon and Arun can go. That's not great, we need more people. You reluctantly call Brian, who you know will bring a batch of his awful home-brewed IPA.

#### The `#reduce` method
The `#reduce` method (alias: `#inject`) is possibly the most difficult-to-grasp enumerable for new coders. The idea is simple enough, though: it reduces a collection (array/hash) down to a single object. You should use it when you want to get a single value or output from your collection.

A classic example of when reduce is useful is to a sum an array of numbers. First lets explore how we would achieve this using each:

~~~ruby
my_numbers = [5, 5, 5, 5]
sum = 0

my_numbers.each { |number| sum + number }

sum
#=> 20
~~~

This isn't too bad in terms on number of lines of code, but we have to introduce a temporary local variable `sum` outside of the enumerable. It would be much nicer if we could do this all within the enumerable:

~~~ruby
my_numbers = [5, 5, 5, 5]

my_numbers.reduce(0) { |sum, number| sum + number }
#=> 20
~~~

There's a lot going on here so lets walk through what its doing. We are passing `0` into the reduce method, this will be the value of the `sum` block variable in the first iteration.

The first block variable in the reduce enumerable is what's known as the **accumulator**. In this case, we are calling it `sum`. The result of each iteration is stored in this block variable and then passed to the next iteration. So in the first Iteration it would be 0, in the second it will be the result `0 + 5` or 5, in the third iteration it will be the result of `5 + 5` or 10, and so on so forth, until it reaches the end of the collection.

Here is a more elaborate example, which shows how powerful this method can be. Don't be discouraged if you don't fully understand it at this point. Just know that `#reduce` can save you many lines of code in certain scenarios.

Now that you know who's coming to your party, you need to decide where to go. You're a democratic party host so you want to put it to a vote among your friends going to the party.

The options are "St. Mark's Bistro", a classy place suited to a sophisticated person such as yourself. The other option is "Bob's Dirty Burger Shack". You know its Brian's favourite place and since he's coming to the party now it was best to have it as an option to avoid any arguments.

~~~ruby
votes = ['Bob's Dirty Burger Shack', 'St. Mark's Bistro', 'Bob's Dirty Burger Shack']

votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}
~~~

Dammit, Brian!

Note that this example returns a hash with several `key => value` pairs. So the object that `#reduce` returns is still one object, a hash. It's just a more complex one.

### Boolean Enumerable Methods
You may have noticed some of Ruby's built in methods have a question mark `?` in the name. Any method with a `?` at the end is a `predicate` method, which is a Ruby convention for a method that returns a Boolean, that is either `true` or `false`.

In this section we are going to take a look at four of Ruby's boolean enumerable methods.

#### The `#include?` method
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
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

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

#### The `#none?` method
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


### Bang Methods and Return Values

#### Bang Methods
Earlier we mentioned that enumerables like `#map` and `#select` return new arrays. This is by design, we won't often want to modify the original collection we are calling our enumerables methods on.

Take this earlier example, where we uppercase each of our friends names:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LELIA', 'BRIAN', 'ARUN']`

friends
#=> ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']
~~~

When we call our original friends array again we can see that it is unchanged.

If we wanted to change your friends array we could use the map bang method `#map!`:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LELIA', 'BRIAN', 'ARUN']`

friends
#=> `['SHARON', 'LEO', 'LELIA', 'BRIAN', 'ARUN']`
~~~

Now when we call our original friends array again, it returns the changed values from the `map!`. Instead of returning a new array, `map!` has modified our original array.

Bang methods can easily be recognised as they have exclamation marks at the end of them `!`. This signifies that
the method is **destructive** and will modify the object they are called on. A lot of the enumerables that return new collections will have a bang method version available, `map!` and `select!` just to name a few.

It's best to avoid using these methods when you can as you, or a future developer working on the same code may need
the original collection. Remember that violent psychopath who may end up maintaining your code? Keep them in
mind when making the decision to use bang methods.

#### Return Values of Enumerables
So if its not a good idea to use bang methods and we need to re-use the result of a enumerable method throughout our program, what can we do instead?

One option is to put the result of an enumerable in a local variable:
~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

invited_friends = friends.select { |friend| friend != 'Brian' }

friends
#=> ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

invited_friends
 #=> ["Sharon", "Leo", "Lelia", "Arun"]
~~~

A better option would be to wrap your enumerable in a method:

~~~ruby
friends = ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

def invited_friends(friends)
  friends.select { |friend| friend != 'Brian' }
end


friends
#=> ['Sharon', 'Leo', 'Lelia', 'Brian', 'Arun']

invited_friends(friends)
 #=> ["Sharon", "Leo", "Lelia", "Arun"]
~~~

### Assignment
<div class="lesson-content__panel" markdown="1">

1. Follow along to this [How to Use The Ruby Map Method](https://www.rubyguides.com/2018/10/ruby-map-method/) tutorial from Ruby Guides.
2. Follow along to this [Reducing Enumerable](Reducing Enumerable — Part One: The Journey Begins) article by Brandon Weaver.
3. Read [How to Use Ruby Any, All None and One](https://www.rubyguides.com/2018/10/any-all-none-one/) for alternative explanations for boolean enumerables.
4. finally go solve [these exercices](https://github.com/TheOdinProject/curriculum/blob/master/new_course/1_programming_fundementals/enumerable_exercises.md) using the enumerables you learn't about in this lesson.
</div>

### Additional Resources
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* The Bastards Book of Ruby has a good section on [Enumerables](http://ruby.bastardsbook.com/chapters/enumerables/).
* This tutorial on [codementor](https://www.codementor.io/ruby-on-rails/tutorial/rubys-swiss-army-knife-the-enumerable-module) is another good discussion of the versatility of enumerable methods.
* There are many more enumerable methods than are covered in this lesson (`reject`, `drop`, `uniq`, to name a few).
For a full listing, you can check out the [Ruby Docs](https://ruby-doc.org/core-2.5.0/Enumerable.html).
