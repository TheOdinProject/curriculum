### Introduction

It is time that you create your own hash map. You already know the magic of how it all works out from the previous lesson, now it is time for you to create your own magical implementation.

#### Self restriction and limitation

  Before we get started, we need to lay down some ground rules. JavaScript's dynamic nature of array allow us to insert and retrieve indexes that is outside our array size range. Example: if we create an array of size `16` to be our buckets size, nothing stopping us from storing items at index `500`. This defeats the purpose we are trying to demonstrate, so we need to put some self restriction to work around this.

  1. When you create a function that takes a hash code value and returns the bucket index, use this snippet before the function returns to make sure it's accessing inbound array indexes only.

      ```javascript
      if (index < 0 || index >= buckets.length) {
        throw new Error("Trying to access index out of bound");
      }
      ```

  1. Inside the class DO NOT use Objects to store your key value pairs, and DO NOT use the array method `push()` to insert your nodes into the buckets. Always use indexes.

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Start by creating a `HashMap` class or factory function. It's up to you which you want to use. Then proceed to create the following methods:

  1. `hash` takes a value and produces a hash code with it. There are a lot of thought that goes into creating the most optimal hashing function, it is up to you if you want to do a research to find a good hashing function but do not dive too deep into the rabbit hole. Make sure to test that it's not producing too many similar hash codes that will lead to too many collisions.

  1. `set` takes two arguments, the first is a key and the second is a value that is assigned to this key, if a key already exists then the old value is overwritten.

     - Remember to grow your buckets size when it needs to, by calculating if your bucket has reached the `load factor`.

  1. `get` takes one argument as a key and returns the value that is assigned to this key. If key is not found, return `null`.

  1. `has` takes a key as an argument and returns `true` or `false` based on whether or not the key is in the hash map.

  1. `remove` takes a key as argument and removes it from the hash table.

  1. `length` returns the number of stored keys in the hash map.

  1. `clear` removes all entries in the hash map.

  1. `keys` returns an array containing all the keys inside the hash map.

  1. `values` returns an array containing all the values.

  1. `entries` returns an array that contains each `key, value` pair. Example: `[[firstKey, firstValue], [secondKey, secondValue]]`

  Remember that a hash map does not preserve insertion order when you are retrieving your arrays' data, it is normal and expected for keys and values to appear out of the order you inserted them in.

#### Extra Credit

  - Create a class `HashSet` that behaves the same as a `HashMap` but only contains `keys` with no `values`.

</div>
