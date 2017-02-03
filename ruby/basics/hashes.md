# Hashes in Ruby

Now that you know a bit about arrays, it's time to get into the array's supercharged cousin: **the hash**. Not to be confused with a cryptographic hash (which is an algorithm that jumbles up data so bad you can't get back the original data), Ruby hashes are variables that can store multiple values.

Basically like arrays, right?

## Learning Outcomes

By the end of this reading you'll be able to:

* Tell what the difference is between hashes and arrays
* Know how to create a new hash
* Know how to populate that hash
* Know the difference between keys and values
* Change data within a hash
* Delete data from a hash
* Iterate through a hash
* Merge two hashes together


Arrays are maybe best described as bins on a shelf with numbers on them, and each containing something WONDERFUL. E.g. *Bin 0* contains a string that says "zoob", *Bin 1* contains the integer 9, and *Bin 2* contains, weirdly, another bin labeled '*Bin 0*' (but rats, it's empty). This maps out to an array like:

```ruby
array = [ "zoob", 9, [] ]
array[0]
  => "zoob"
array[1]
  => 9
array[2]
  => []
```

Hashes take the analogy a step further by allowing you to write the labels on the outside of the bins, which lines up more with how people act in the real world, which is more or less the whole point of Object-Oriented Programming in the first place.

So, back to the shelf. Here's another set of bins, labeled, not 0, 1, and 2, but "random_word", "Dorothy's math test score", "Guess what, literally another bin". Since the labels here aren't numbers in ascending order starting at 0, we can be pretty sure that what we've got here is *a hash*.

```ruby
hash = { "random_word" => "ahoy", "Dorothy's math test score" => 94, "Guess what, literally another bin" => {} }
```

There's a little bit to parse here, so let's take a breather and puzzle these bins out.

One of the first things you might notice is that hashes use *curly braces* `{}` instead of *brackets* `[]`. That's an important one. It helps us distinguish hashes from arrays (useful, since they share a lot of functionality).

The other thing you might notice is that hashes are made up of two parts: *keys* and *values*. A *key* is more or less analogous to an array's *index*, in that it's the label on the outside of the bin that helps us find what we're looking for. The *value* is what gets stored at a particular *key*.

So in our bins from up above, `"random_word"`, `"Dorothy's math test score"`, and `"Guess what, literally another bin"` are all *keys*. And because they behave the same as indexes in arrays, you can call their values the same way:

```ruby
hash["random_word"]
  => "ahoy"
```

Notice that when we call the hash's value by key, the key goes inside a pair of *brackets*, like when you're calling an array by index.

Of course, hashes don't only take strings as keys and values. Ruby is a pretty flexible language so you can jam any old thing in there and it'll work just fine:

```ruby
hash = { 9 => "nine", :six => 6 }
hash[9]
  => "nine"
hash[:six]
  => 6
```

## Creating Hashes

You've already seen a hash being created *literally* (e.g. `hash = { :whatever => "???" }`), but you can also call good old `#new` on the `Hash` class. If you give the `#new` method an argument, it'll even set a default value for keys that you don't specify:

```ruby
hash = Hash.new
hash["me"]
  => nil
hash = Hash.new("you")
hash["me"]
  => "you"
hash["him"]
  => "you"
```

## Manipulating data in a hash

### Adding data

You can add to a hash the same way that you can add to an array. The easiest way is to call the key and set the value like you would with any other variable. Think of it like finding the right bin by its label and dropping something into the bin.

```ruby
shoes = Hash.new
shoes["summer"] = "sandals"
shoes["winter"] = "boots"
```

### Accessing data

You can get at that data the same way, e.g. `shoes["summer"] #=> "sandals"`. Hashes also come with a couple of sporty methods for finding what you need:

```ruby
shoes["summer"]
  => "sandals"
shoes.key("summer")
  => "sandals"
```

### Removing data

The simple way to delete data from a hash is simply to call the value by its key and set it to zero:

```ruby
shoes["winter"] = nil
# And now we have no footwear in the snow.
```

The fun way to delete data from a hash is to use the hash's `#delete` method, which provides the cool functionality of returning the value from the key-value pair was deleted from the hash. So:

```ruby
shoes.delete("summer")
  => "sandals"
shoes
  => {} # Empty hash, now that we have gotten rid of our shoes.
```


## Methods

Hashes respond to just about all the same methods as arrays do, since they're both part of Ruby's *Enumerable* class. Since hashes have a few more moving parts, though, they behave a little differently. For example, whereas `array.each { |element| puts element }` will iterate through an array and print out each element in the array, hashes take two variables in the block, like so:

```ruby
hash.each { |key, value| puts "#{key}: #{value}" }
```

(Careful not to get confused between the curly braces denoting a block and the curly braces denoting a hash. They're generally pretty easy to tell apart, but keep an eye out.)

Another couple of useful methods for hashes are the `#keys` and `#values` methods, which do just what you think they do. Note that these methods return *arrays*.

```ruby
books = { "Infinite Jest" => "David Foster Wallace", "Into the Wild" => "Jon Krakauer" }
books.keys
  => ["Infinite Jest", "Into the Wild"]
books.values
  => ["David Foster Wallace", "Jon Krakauer"]
```

### Merging two hashes

It'll happen every now and again that two hashes need to come together in holy union. Luckily, there's a method for that.

```ruby
hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
hash1.merge(hash2)
  => { "a" => 100, "b" => 254, "c" => 300 }
```

Note that the hash getting merged in (in this case, `hash2`), has precedence over the hash getting... uh, merged *at*, when both hashes share a key.

For a list of methods that work on hashes, check out the [Ruby Docs](http://ruby-doc.org/core-2.1.1/Hash.html).

## Best practices

In this explanation, we mostly used strings for hash keys, but in the real world, you'll see symbols like `:this_guy` as keys significantly more often. Especially when you get into Rails. The reason for this is a little complicated, but here's the short version:

Strings can be changed, so every time a string is called, Ruby has to store it in memory. They can pile up, especially when hashes start to get big, and you can tell that Ruby is treating them all as different objects (even if they're otherwise identical) because they all have different `object_id`s. Symbols, on the other hand, are basically strings that can't change, and only get stored in memory once, which is faster and easier on your computer, since Ruby can search hash objects by their `object_id`s. For a better explanation of this behavior, check out Stack Overflow over [here](http://stackoverflow.com/questions/8189416/why-use-symbols-as-hash-keys-in-ruby).

If you want to get a little more hands-on with it, run this stuff in IRB:

```ruby
"string" == "string"
  => true
"string".object_id == "string".object_id
  => false
:symbol.object_id == :symbol.object_id
  => true
```

Like magic!

## Exercises

TODO: Make exercises

## Additional resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

TODO: Find additional resources
