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
Let's say that you wanted to make an invite list for your birthday using your `friends` array but that you don't want to invite your friend Brian because he's a bit of a nutcase at parties and always drinks way too much.

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

That's not too hard, but imagine having to do that for every party you host from now until the end of time! It might be easier to just stop hanging out with Brian.

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
* Within the block, you'll notice that we have `|friend|`, which is known as a **block variable**. This is the element from your array that the block is currently iterating over. You can use any variable name that you find helpful here; in this example, we could have used `|x|`, but `|friend|` is more descriptive of what each element is. In the first iteration, the value of `|friend|` will be `'Sharon'`; in the second iteration, its value will be `'Leo'`; in the third, `'Leila'`; and so on until it reaches the end of the array.

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

`#each` also works for hashes with a bit of added functionality. By default, each iteraction will yield both the key and value individually or together (as an array) to the block depending on how you define your block variable:

~~~ruby
my_hash = { "one" => 1, "two" => 2 }

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

You might expect this to return `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`, but you'd be wrong---dead wrong. It actually returns the original array you called `#each` on. You're *still* not invited, Brian.

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
Remember when we tried to use `#each` to write all of your friends' names in all caps? For reference, this is the code that we tried:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
~~~

As we can see, `#each` returns the original array, but that's not what we want. WE WANT CAPS!

Let's modify our `#each` code to get it to work:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends = []

friends.each { |friend| shouting_at_friends.push(friend.upcase) }
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

shouting_at_friends #=> ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']
~~~

It works! It took quite a bit of extra work, though. We had to introduce another array that could store the transformed elements. This code is starting to look more clunky and suspiciously like the `for` loop example in the first section that we're trying to get away from.

Luckily, we have the `#map` enumerable method to save us from our misery!

The `#map` method (also called `#collect`) transforms each element from an array according to whatever block you pass to it and returns the transformed elements in a new array. `#map` may seem confusing at first, but it is extremely useful. We'll go through several examples and use cases, which should help you understand how and when you can use this enumerable power for good.

First, let's use `#map` to improve on our code that transforms all of our friends' names to uppercase:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
~~~

We're back down to two lines of code, baby! Isn't it beautiful?

Maybe now you're getting hungry from all this intense learning and you want to change your McDonald's order from medium to extra large. With `#map` and [`#gsub`](https://ruby-doc.org/core-2.6.1/String.html#method-i-gsub), that's easy peasy:

~~~ruby
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]
~~~

Maybe you've decided that it's time for you to get your finances in order, and you want to deduct your rent payments from your salary over the past few months to make sure that you haven't been spending all of your remaining money on extra large Big Mac meals:

~~~ruby
salaries = [1200, 1500, 1100, 1800]

salaries.map { |salary| salary - 700 }
#=> [500, 800, 400, 1100]
~~~

Whenever you want to return a new array with the results of running your block of code, `#map` is the method for you!

### The `#select` Method
You've already seen the `#select` method in action at the beginning of this lesson in our quest to make Brian an outcast.

The `#select` method (also called `#filter`) passes every item in an array to a block and returns a new array with only the items for which the condition you set in the block evaluated to `true`.

First, let's explore how we would accomplish the same thing using `#each`:

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

Using our shiny new `#select` method, this code can be simplified down to two lines:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }

 #=> ["Sharon", "Leo", "Leila", "Arun"]
~~~

Now that we've cut out Brian, we can send out the invites! Let's say that the friends who you invited to your party have gotten back to you, and their responses are all recorded in a hash. Let's use `#select` to see who's coming. Recall that when you use an emumerable method with a hash, you need to set up block variables for both the key and the value:

~~~ruby
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}
~~~

Looks like only Sharon and Arun can go. You're going to need more people for a good party. Sounds like it's time for you to reluctantly call Brian, who you know will bring a batch of his awful home-brewed IPA. Maybe his last batch has gotten better?

### The `#reduce` Method
The `#reduce` method (also called `#inject`) is possibly the most difficult-to-grasp enumerable for new coders. The idea is simple enough, though: it reduces an array or hash down to a single object. You should use `#reduce` when you want to get an output of a single value.

A classic example of when `#reduce` is useful is obtaining the sum of an array of numbers. First, let's explore how we would achieve this using `#each`:

~~~ruby
my_numbers = [5, 6, 7, 8]
sum = 0

my_numbers.each { |number| sum += number }

sum
#=> 26
~~~

This isn't too bad in terms of number of lines of code, but we had to introduce a temporary local variable (`sum`) outside of the enumerable. It would be much nicer if we could do all of this within the enumerable:

~~~ruby
my_numbers = [5, 6, 7, 8]

my_numbers.reduce { |sum, number| sum + number }
#=> 26
~~~

Woah! What?! There's a lot happening here, so let's walk through what it's doing step by step. 

The first block variable in the `#reduce` enumerable (`sum` in this example) is known as the **accumulator**. The result of each iteration is stored in the accumulator and then passed to the next iteration. The accumulator is also the value that the `#reduce` method returns at the end of its work. By default, the initial value of the accumulator is zero, so for each step of the iteration, we would have the following:

 1. Iteration 0: sum = 0
 2. Iteration 1: sum = 0 + 5 = 5
 3. Iteration 2: sum = 5 + 6 = 11
 4. Iteration 3: sum = 11 + 7 = 18
 5. Iteration 4: sum = 18 + 8 = 26

We can also set a different initial value for the accumulator by directly passing in a value to the `#reduce` method.

~~~ruby
my_numbers = [5, 6, 7, 8]

my_numbers.reduce(1000) { |sum, number| sum + number }
#=> 1026
~~~

Now let's look at a more elaborate example that shows just how powerful this method can be. This one is much more complicated, so don't be discouraged if you don't fully understand it at this point. Just know that `#reduce` can save you many lines of code in certain scenarios.

Now that you know who's coming to your party, you need to decide where to go. You don't actually like making decisions very much, so you put it to a vote among your friends.

The options are St. Mark's Bistro, a classy place suited for a sophisticated person such as yourself. The other option is Bob's Dirty Burger Shack, which you know is Brian's favorite place. Since he's coming to the party now, it's best to include it as an option to avoid any arguments. Your friends' votes are collected in the `votes` array.

~~~ruby
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}
~~~

Alright, so what happened here? Other than Brian ruining your party. Again.

First, we passed in a much more interesting initial value for our accumulator this time. When we pass in an argument to `Hash.new`, that becomes the default value when accessing keys that do not exist in the hash. For example, we could say the following:

~~~ruby
hundreds = Hash.new(100)
hundreds["first"]         #=> 100
hundreds["mine"]          #=> 100
hundreds["yours"]         #=> 100
~~~

Once you set the value for a key equal to something else, the default value is overwritten:

~~~ruby
hundreds = Hash.new(100)
hundreds["new"]           #=> 100
hundreds["new"] = 99
hundreds["new"]           #=> 99
~~~

Now that we know that this new hash with a default value of `0` is our accumulator (which is called `result` in the code block), let's see what happens in each iteration:

 1. Iteration 0: 
    * result = {}
    * Remember, this hash already has default values of `0`, so `result["Bob's Dirty Burger Shack"] = 0` and `result["St. Mark's Bistro"] = 0`
 2. Iteration 1: 
    * The method runs `result["Bob's Dirty Burger Shack"] += 1`
    * result = {"Bob's Dirty Burger Shack" => 1}
 3. Iteration 2:
    * The method runs `result["St. Mark's Bistro"] += 1`
    * result = {"Bob's Dirty Burger Shack" => 1, "St. Mark's Bistro" => 1}
 4. Iteration 3: 
    * The method runs `result["Bob's Dirty Burger Shack"] += 1`
    * result = {"Bob's Dirty Burger Shack" => 2, "St. Mark's Bistro" => 1}

Note that this example returns a hash with several `key => value` pairs. So even though the result is more complicated, `#reduce` still just returns one object, a hash.

### Bang Methods
Earlier, we mentioned that enumerables like `#map` and `#select` return new arrays but don't modify the arrays that they were called on. This is by design since we won't often want to modify the original array or hash and we don't want to accidentally lose that information. For example, if enumerables did mutate the original array, then using `#select` to filter out Brian from our ivitation list would *permanently* remove him from our friends list. Whoah! That's a bit drastic. Brian may be a nutcase at parties, but he's still our friend.

To see this principle in action, let's go back to an earlier example where we wrote each of our friends' names in all caps:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
~~~

You can see that when we call our original `friends` array again, it remains unchanged.

If you wanted to change your `friends` array instead, you could use the bang method `#map!`:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
~~~

Now when we call our original `friends` array again, it returns the changed values from the `#map!` method. Instead of returning a new array, `#map!` modified our original array.

As you'll recall from the Methods lesson, **bang methods** can be easily identified by their exclamation marks (`!`) at the end of their name. All bang methods are **destructive** and modify the object they are called on. Many of the enumerable methods that return new versions of the array or hash they were called on have a bang method version available, such as `#map!` and `#select!`.

It's best practice to avoid using these methods, however, as you or a future developer working on your code may need the original version. Remember that violent psychopath who you should expect will end up maintaining your code? Keep that in mind when making the decision to use bang methods.

### Return Values of Enumerables
So if it's not a good idea to use bang methods but we need to re-use the result of a enumerable method throughout our program, what can we do instead?

One option is to put the result of an enumerable method into a local variable:

~~~ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends = friends.select { |friend| friend != 'Brian' }

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends
#=> ["Sharon", "Leo", "Leila", "Arun"]
~~~

An even better option would be to wrap your enumerable method in a method definition:

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

  1. Read through the Ruby Explained article on [Map, Select, and Other Enumerable Methods](https://www.eriktrautman.com/posts/ruby-explained-map-select-and-other-enumerable-methods).
  2. Follow along with this [How to Use The Ruby Map Method](https://www.rubyguides.com/2018/10/ruby-map-method/) tutorial from Ruby Guides.
  3. Follow along with this [Reducing Enumerable](https://medium.com/@baweaver/reducing-enumerable-part-one-the-journey-begins-ddc1d4108490) article by Brandon Weaver.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* The Bastards Book of Ruby has a good section on [Enumerables](http://ruby.bastardsbook.com/chapters/enumerables/).
* This tutorial on [codementor](https://www.codementor.io/ruby-on-rails/tutorial/rubys-swiss-army-knife-the-enumerable-module) is another good discussion of the versatility of enumerable methods.
* There are many more enumerable methods than are covered in this lesson (e.g., `#reject`, `#drop`, `#uniq`). For a full listing, you can check out the [Ruby Docs](https://ruby-doc.org/core-2.5.0/Enumerable.html).

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

 * What does the `#each` method do? What does it return?
 * What does the `#each_with_index` method do?
 * What does the `#map` method do?
 * What does the `#select` method do?
 * What does the `#reduce` method do?
 * When should you use `do...end` around a code block versus `{...}`?
 * Why should you avoid using the bang methods of enumerables?
