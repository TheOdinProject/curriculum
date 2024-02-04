### Introduction

You already know the magic behind hash maps, now it's time to write your own implementation!

#### Limitation

  Before we get started, we need to lay down some ground rules. Ruby's dynamic nature of array allow us to insert and retrieve indexes that are outside our array size range. Example: if we create an array of size `16` to be our buckets size, nothing stopping us from storing items at index `500`. This defeats the purpose we are trying to demonstrate, so we need to put some self restriction to work around this.

  1. Use the following snippet whenever you access a bucket through an index. We want to raise an error if we try to access an out of bound index:

      ```ruby
      raise IndexError if index.negative? || index >= @buckets.length
      ```

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Start by creating a `HashMap` class. Proceed to create the following methods:

  1. `#hash` takes a value and produces a hash code with it. We did implement a fairly good `hash` method in the previous lesson.
     As a reminder:

      ```ruby
      def hash(value)
        hash_code = 0
        prime_number = 31
      
        value.each_char { |char| hash_code = prime_number * hash_code + char.ord }
      
        hash_code
      end
      ```

     You are free to use that, or if you wish, you can conduct your own research. Beware this is a deep deep rabbit hole.

      <div class="lesson-note lesson-note--tip" markdown="1">
        Hash maps could accommodate various data types for keys like numbers, strings, and even other hashes. But for this project, only handle keys of type strings.
      </div>

  1. `#set` takes two arguments, the first is a key and the second is a value that is assigned to this key. If a key already exists, then the old value is overwritten.

     - Remember to grow your buckets size when it needs to, by calculating if your bucket has reached the `load factor`.

  1. `#get` takes one argument as a key and returns the value that is assigned to this key. If key is not found, return `nil`.

  1. `#key?` takes a key as an argument and returns `true` or `false` based on whether or not the key is in the hash map.

  1. `#remove` takes a key as an argument. If the given key is in the hash map, it should remove the entry with that key and return the deleted entry's value. If the key isn't in the hash map, it should return `nil`.

  1. `#length` returns the number of stored keys in the hash map.

  1. `#clear` removes all entries in the hash map.

  1. `#keys` returns an array containing all the keys inside the hash map.

  1. `#values` returns an array containing all the values.

  1. `#entries` returns an array that contains each `key, value` pair. Example: `[[first_key, first_value], [second_key, second_value]]`

  Remember that our hash map does not preserve insertion order when you are retrieving your hash map's data. It is normal and expected for keys and values to appear out of the order you inserted them in.

#### Extra Credit

- Create a class `HashSet` that behaves the same as a `HashMap` but only contains `keys` with no `values`.

</div>
