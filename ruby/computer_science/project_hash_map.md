### Introduction

You already know the magic behind hash maps. Now it's time to write your own implementation!

#### Limitation

Before we get started, we need to lay down some ground rules. Ruby's dynamic nature of arrays allows us to insert and retrieve indexes that are outside our array size range. For example, if we create an array of size `16` to represent our buckets, nothing stops us from storing items at index `500`. This defeats the purpose of limiting storage size in hash maps, so we need to enforce some restrictions.

Use the following snippet whenever you access a bucket through an index. We want to raise an error if we try to access an out-of-bounds index:

```ruby
raise IndexError if index.negative? || index >= @buckets.length
```

### Assignment

<div class="lesson-content__panel" markdown="1">

Start by creating a `HashMap` class. It should have at least two variables for `load factor` and `capacity`. For a `load factor` of `0.75`, you should have an initial `capacity` of size `16`. Then proceed to create the following methods:

1. `#hash(key)` takes a string key and produces a hash code with it (in the real world, hash maps can accommodate various data types as keys, such as integers and arrays, but we'll keep it simple for now). We already implemented a fairly good `hash` function in the previous lesson. As a reminder:

   ```ruby
   def hash(key)
     hash_code = 0
     prime_number = 31

     key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

     hash_code
   end
   ```

   You are free to use that, or you can conduct your own research on hashing algorithms. Beware, this is a deep, deep rabbit hole. Remember to modulo (`%`) the hash code by the current capacity before you return it to ensure the index fits within our buckets (regardless of growth).

   You might find yourself confusing keys with hash codes while accessing key-value pairs later. Keys are the user-provided strings that get passed to the hash function, which will then return a hash code. You will never directly access buckets using keys, only hash codes.

1. `#set(key, value)` takes two arguments: the first is a key and the second is a value to associate with the key. If the key already exists, then the old value associated with it is overwritten by the new one.

   Note that when two *different* keys generate the same hash code and get assigned to the same bucket, it is a collision, not an update. For example, say `Rama` and `Sita` both get hashed to `3`. They'd go in the same bucket without overwriting each other; we know that this is a collision and not an update because the keys are different. Review the [hash map lesson on collisions](https://www.theodinproject.com/lessons/ruby-hashmap-data-structure#collisions) if needed.

   Remember to grow your buckets to double their capacity when your hash map exceeds the `load factor`. The methods mentioned later in this assignment can help you handle the growth logic, so you may want to leave implementing this particular behavior until later.

1. `#get(key)` takes one argument as a key and returns the value that is associated with it. If the key is not found, return `nil`.

1. `#has?(key)` takes a key as an argument and returns a boolean based on whether or not the key is in the hash map.

1. `#remove(key)` takes a key as an argument. If the given key is in the hash map, it should remove the entry with that key and return the deleted entry's value. If the key isn't in the hash map, it should return `nil`.

1. `#length` returns the number of stored keys in the hash map.

1. `#clear` removes all entries in the hash map.

1. `#keys` returns an array containing all the keys (not values) inside the hash map.

1. `#values` returns an array containing all the values (not keys) inside the hash map.

1. `#entries` returns an array that contains each key-value pair in their own arrays, for example: `[[first_key, first_value], [second_key, second_value]]`.

Remember that our hash map does not preserve insertion order when you are retrieving your hash map's data. It is normal and expected for keys and values to appear out of the order you inserted them in.

#### Test your hash map

1. Create a new Ruby file.

1. Create a new instance of your hash map and set the load factor to `0.75`.

   ```ruby
   test = HashMap.new
   ```

1. Populate your hash map using the `#set(key, value)` method by copying the following:

   ```ruby
   test.set('apple', 'red')
   test.set('banana', 'yellow')
   test.set('carrot', 'orange')
   test.set('dog', 'brown')
   test.set('elephant', 'gray')
   test.set('frog', 'green')
   test.set('grape', 'purple')
   test.set('hat', 'black')
   test.set('ice cream', 'white')
   test.set('jacket', 'blue')
   test.set('kite', 'pink')
   test.set('lion', 'golden')
   ```

1. After populating your hash map with the data above, your hash map's current load levels should now be at `0.75` (full capacity).

1. Now with a full hash map, try overwriting a few nodes using `#set(key, value)`. This should only overwrite the existing `values` of your nodes and not add new ones, so `#length` should still return the same value and `capacity` should remain the same.

1. After that, populate your hash map with the last node below. This will make your load levels exceed your `load factor`, triggering your hash map's growth functionality and doubling its `capacity`:

   ```ruby
   test.set('moon', 'silver')
   ```

1. If you have implemented your hash map correctly, the load levels of your expanded hash map should drop well below your load factor, and the entries should be spread evenly among the expanded buckets.

1. With your new hash map, try overwriting a few nodes using `#set(key, value)`. Again, this should only overwrite existing `values` of your nodes.

1. Test the other methods of your hash map, such as `#get(key)`, `#has?(key)`, `#remove(key)`, `#length`, `#clear`, `#keys`, `#values`, and `#entries`, to check if they are still working as expected after expanding your hash map.

#### Extra credit

- Create a class `HashSet` that behaves the same as a `HashMap` but only contains `keys` with no `values`.

</div>
