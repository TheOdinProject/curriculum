### Introduction
Now that you know a bit about arrays, it's time to get into the array's supercharged cousin: **the hash**. The short definition is: Ruby hashes are variables that can store collections of data.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Explain what a hash is.
 - Describe how to create a new hash and how to add information to it.
 - Explain what keys and values are.
 - Describe how to change and delete data inside a hash.
 - Describe how to merge two hashes.

### Creating Hashes

If an array is like a shelf of bins with numbers in ascending order on it, hashes take the analogy a step further by allowing you to write the labels on the outside of the bins, which lines up more with how people act in the real world.

So, let's take a look at this shelf:

~~~ruby
hash = { "random_word" => "ahoy", "Dorothy's math test score" => 94, "Guess what, literally another bin" => {} }
~~~

Here's another set of bins, labeled, not 0, 1, and 2 (like on the 'array' shelf), but "random_word", "Dorothy's math test score", "Guess what, literally another bin". Since the labels here aren't numbers in ascending order starting at 0, we can be pretty sure that what we've got here is *a hash*.

The above example is the most basic way to create a hash.

There's a little bit to parse here, so let's take a breather and puzzle these bins out.

One of the first things you might notice is that hashes use *curly braces* `{}` instead of *brackets* `[]`. That's an important one. It helps us distinguish hashes from arrays (useful, since they share a lot of functionality).

The other thing you might notice is that hashes are made up of two parts: *keys* and *values*. A *key* is more or less analogous to an array's *index*, in that it's the label on the outside of the bin that helps us find what we're looking for. The *value* is what gets stored at a particular *key*. Keys and values are associated with a little operator called a 'hash rocket': `=>`.

So that's what it looks like when a hash is created *literally* (e.g. `hash = { :whatever => "???" }`), but you can also call good old `#new` on the `Hash` class. If you give the `#new` method an argument, it'll even set a default value for keys that you don't specify:

~~~ruby
hash = Hash.new
hash["me"]
  => nil
hash = Hash.new("you")
hash["me"]
  => "you"
hash["him"]
  => "you"
~~~

Of course, hashes don't only take strings as keys and values. Ruby is a pretty flexible language so you can jam any old thing in there and it'll work just fine:

~~~ruby
hash = { 9 => "nine", :six => 6 }
hash[9]
  => "nine"
hash[:six]
  => 6
~~~

### Adding data

You can add to a hash the same way that you can add to an array. The easiest way is to call the key and set the value like you would with any other variable. Think of it like finding the right bin by its label and dropping something into the bin.

~~~ruby
shoes = Hash.new
shoes["summer"] = "sandals"
shoes["winter"] = "boots"
~~~

### Accessing data

You can get at that data the same way, e.g. `shoes["summer"] #=> "sandals"`. Hashes also come with a couple of sporty methods for finding what you need:

~~~ruby
shoes["summer"]
  => "sandals"
shoes.key("summer")
  => "sandals"
~~~

Notice that when we call the hash's value by key, the key goes inside a pair of *brackets*, like when you're calling an array by index.

### Removing data

The simple way to delete data from a hash is simply to call the value by its key and set it to `nil`:

~~~ruby
shoes["winter"] = nil
# And now we have no footwear in the snow.
~~~

The fun way to delete data from a hash is to use the hash's `#delete` method, which provides the cool functionality of returning the value from the key-value pair was deleted from the hash. So:

~~~ruby
shoes.delete("summer")
  => "sandals"
shoes
  => {} # Empty hash, now that we have gotten rid of our shoes.
~~~


### Methods

Hashes respond to just about all the same methods as arrays do, since they're both part of Ruby's *Enumerable* class. Keep an eye out in the next lesson on the Enumerable class for the difference in the way that arrays and hashes handle Enumerable methods -- the `#each` method especially.

Another couple of useful methods for hashes are the `#keys` and `#values` methods, which do just what you think they do. Note that these methods return *arrays*.

~~~ruby
books = { "Infinite Jest" => "David Foster Wallace", "Into the Wild" => "Jon Krakauer" }
books.keys
  => ["Infinite Jest", "Into the Wild"]
books.values
  => ["David Foster Wallace", "Jon Krakauer"]
~~~

### Merging two hashes

It'll happen every now and again that two hashes need to come together in holy union. Luckily, there's a method for that.

~~~ruby
hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
hash1.merge(hash2)
  => { "a" => 100, "b" => 254, "c" => 300 }
~~~

Note that the hash getting merged in (in this case, `hash2`), has precedence over the hash getting... uh, merged *at*, when both hashes share a key.

For a list of methods that work on hashes, check out the [Ruby Docs](http://ruby-doc.org/core-2.1.1/Hash.html).

### Best practices

In this explanation, we mostly used strings for hash keys, but in the real world, you'll see symbols like `:this_guy` as keys significantly more often. This is predominantly because symbols are a lot better performant than strings in Ruby, but also because they allow for a much cleaner syntax when defining hashes. Behold:

~~~ruby
# 'Rocket' syntax
american_cars = { :chevrolet => "Corvette", :ford => "Mustang", :dodge => "Ram" }
# 'Symbols' syntax
japanese_cars = { honda: "Accord", toyota: "Corolla", nissan: "Altima" }
~~~

Notice that the 'hash rocket' and the colon that represents a symbol have been mashed together. This unfortunately only works for symbols, though, so don't try { 9: "value" }, or you'll get a syntax error.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Follow along Launch School's chapter on [Hashes](https://launchschool.com/books/ruby/read/hashes), and go through the exercises using IRB or any other REPL, such as [repl.it](https://repl.it/languages/ruby).
</div>


### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Read through [Ruby Explained: Hashes](http://www.eriktrautman.com/posts/ruby-explained-hashes) by Erik Trautman.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* What's the difference between hashes and arrays?
* How can you create a new hash?
* How can you populate that hash with data?
* What are keys and values in a hash?
* How can you change existing values within a hash?
* How can you delete existing data from a hash?
* How can you merge two hashes together?