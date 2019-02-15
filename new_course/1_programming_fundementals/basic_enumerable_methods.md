### Introduction
In previous lessons, you learned about loops as well as arrays and hashes. You will soon discover that you'll have to do so much iterating (looping or repeating something several times) over collections as a developer that it will make you dizzy.

**Enumerables** are a set of convenient built-in methods in Ruby that are included as part of both arrays and hashes. There are some iteration patterns that you'll find yourself doing again and again, such as transforming, searching for, and selecting subsets of elements in your collections. Enumerables were designed to make implementing these iteration patterns (and therefore your life as a developer) much, much easier.

We will run through the enumerable methods that you will most commonly use and see out in the wild. This is certainly not an exhaustive list, so be sure to have a look at the [Ruby docs](https://ruby-doc.org/core-2.6/) to see what else the [Enumerable module](https://ruby-doc.org/core-2.6.1/Enumerable.html) offers.

For all of the examples throughout this lesson, feel free to follow along in irb or [repl.it](https://repl.it/languages/ruby) (an online REPL environment) to get a better feel for how they work.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Explain how the `#each` and `#each_with_index` methods work and how they differ.
 - Explain how the `#map` method works.
 - Explain how the `#select` method works.
 - Explain how the `#reduce` method works.
 - Describe the differences between using `do...end` and `{...}`.
 - Explain what a bang method is and why it is or is not considered best practice.

### Life Before Enumerables
Let's say that you wanted to make an invite list for your birthday using your `friends` array but that you don't want to invite your friend Brian because he's a bit of nutcase at parties and always drinks way too much.

With the loops you've learned so far, you might do something like this:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do
  if friend != 'Brian'
  invited_list.push(friend)
  end
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]
~~~

Thats not too hard, but imagine having to do that for every party you host from now until the end of time! It might be easier to just stop hanging out with Brian.

Using the `#select` enumerable method (which we'll get into much more detail about later), you could change the above code to this:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }
 #=> ["Sharon", "Leo", "Leila", "Arun"]
~~~

or even better and more to the point:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brain', 'Arun']

friends.reject { |friend| friend == 'Brian' }
 #=> ["Sharon", "Leo", "Leila", "Arun"]
~~~

You just cut down what was previously an 8 line program down to 2 lines. Amazing! Imagine all the time you'll save sorting your invite lists now.

### The `#each` Method
`#each` is the granddaddy of the enumerable methods. It's a bit like Chuck Norris: it can do anything. As you'll see throughout this lesson, though, just because you can use `#each` to do just about anything doesn't mean it's always the best or most efficient tool for the job.

Calling `#each` on an array will iterate through that array and will yield each element to a code block, where a task can be performed:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }

#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun

#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]
~~~

Let's break down this syntax:

* `friends` is the array that contains strings of your friends' names.
* `.each` is the enumerable method you are calling on your `friends` array.
* `{ |friend| puts friend }` is a **block**, and the code inside this block is run for each element in your array. Because we have 5 friends in our array, this block will be run 5 times, once with each of the 5 elements.
* Within the block, you'll notice that we have `|friend|`, which is known as a **block variable**. This is the element from your array that the block is currently iterating over. In the first iteration, the value of `|friend|` will be `'Sharon'`; in the second iteration, its value will be `'Leo'`; in the third, `Leila`; and so on until it reaches the end of the array.

What if the block you want to pass to a method requires more logic than can fit on one line? It starts to become less readable and looks unwieldy. For multi-line blocks, the commonly accepted best practice is to change up the syntax to use `do...end` instead of `{...}`:

~~~ruby
my_array = [1, 2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end

#=> The new number is 2.
#=> The new number is 4.

#=> [1, 2]
~~~

`#each` also works for hashes with a bit of added functionality. By default, each iteraction will yield both the key and value individually or together (as an array) to the block depending on you define your block variable:

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

You may have noticed in the above code examples that `#each` returns the original array or hash regardless of what happens inside the code block. This is an important thing to keep in mind when debugging your code as it can lead to some confusion.

Take this code as an example:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
~~~

You might expect this to return `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`, but you'd be wrong--dead wrong. It returns the original array you called `#each` on. You're still *not* invited, Brian.

### The `#each_with_index` Method
This method is nearly the same as `#each`, but it provides some additional functionality by yielding two **block variables** instead of one as it iterates through an array. The first variable's value is the element itself, while the second variable's value is the index of that element within the array. This allows you to do things that are a bit more complex.

For example, if we only want to print every other word from an array of strings, we can achieve this like so:

~~~ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]
~~~

Just like with the `#each` method, `#each_with_index` returns the original array it's called on.

### The `#map` Method
Remember when we tried to transform each of your friends names earlier by uppercasing them with `#each`? Lets try that again.

For reference, this what we previously tried:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
~~~

It returns the original array, but dammit that's not what we want.

Let's modify it to get it to work:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends = []

friends.each { |friend| shouting_at_friends.push(friend.upcase) }
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

shouting_at_friends #=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
~~~

It works! But we need to introduce another array into the mix to store the transformed elements. Its starting to suspiciously look like the `for` loop example we were trying to get away from in the introduction of this lesson.

Luckily we have the `#map` enumerable to save us from this misery!

`#map` is used to transform each element from the collection it is called on, and return the transformed elements in a new array. How the elements are transformed is defined by the block you pass to it.

`#map` may seem confusing at first, but it is extremely useful. Seeing several examples and use cases will help you understand how and when you can use it.

Changing our uppercasing friends example to use map would look like this:
~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
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

### The `#select` Method
You've already seen the `#select` method in action, right at the very start of this lesson when we created our invite list and made Brian an outcast.

The `#select` method passes every item in a collection to a block, and returns a brand new array with only the items that evaluate to true from the condition you set within the block.

Lets explore how the same thing would be accomplished by using `#each` first:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

friends.each do |friend|
  if friend != 'Brian'
    invited_list.push(friend)
  end
end

invited_list
 #=> ["Sharon", "Leo", "Leila", "Arun"]
~~~

Using `#select` this can simplified to:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }

 #=> ["Sharon", "Leo", "Leila", "Arun"]
~~~

The friends you invited to your party have gotten back to you, their responses are all in a hash. Lets use `#select` to figure out who's coming. Recall that when we use an emumerable method with a hash, you can use the key and the value as block variables within the block:

~~~ruby
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}
~~~

Looks like only Sharon and Arun can go. That's not great, we need more people. You reluctantly call Brian, who you know will bring a batch of his awful home-brewed IPA.

### The `#reduce` method
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


### Bang Methods and Return Values

#### Bang Methods
Earlier we mentioned that enumerables like `#map` and `#select` return new arrays. This is by design, we won't often want to modify the original collection we are calling our enumerables methods on.

Take this earlier example, where we uppercase each of our friends names:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
~~~

When we call our original friends array again we can see that it is unchanged.

If we wanted to change your friends array we could use the map bang method `#map!`:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
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
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends = friends.select { |friend| friend != 'Brian' }

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends
 #=> ["Sharon", "Leo", "Leila", "Arun"]
~~~

A better option would be to wrap your enumerable in a method:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

def invited_friends(friends)
  friends.select { |friend| friend != 'Brian' }
end


friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends(friends)
 #=> ["Sharon", "Leo", "Leila", "Arun"]
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