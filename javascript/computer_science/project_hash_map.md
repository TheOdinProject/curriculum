### Introduction

You already know the magic behind hash maps, now it's time to write your own implementation!

#### Limitation

  Before we get started, we need to lay down some ground rules. JavaScript's dynamic nature of array allows us to insert and retrieve indexes that are outside our array size range. Example: if we create an array of size `16` to be our buckets size, nothing stopping us from storing items at index `500`. This defeats the purpose we are trying to demonstrate, so we need to put some self restriction to work around this.

  Use the following snippet whenever you access a bucket through an index. We want to throw an error if we try to access an out of bound index:

```javascript
if (index < 0 || index >= buckets.length) {
  throw new Error("Trying to access index out of bound");
}
```

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Start by creating a `HashMap` class or factory function. It's up to you which you want to use. Then proceed to create the following methods:

  1. `hash(key)` takes a key and produces a hash code with it. We did implement a fairly good `hash` function in the previous lesson. As a reminder:

      ```javascript
      function hash(key) {
        let hashCode = 0;
      
        const primeNumber = 31;
        for (let i = 0; i < key.length; i++) {
          hashCode = primeNumber * hashCode + key.charCodeAt(i);
        }
      
        return hashCode;
      }
      ```

      You are free to use that, or if you wish, you can conduct your own research. Beware, this is a deep deep rabbit hole.

      <div class="lesson-note lesson-note--tip" markdown="1">
        Hash maps could accommodate various data types for keys like numbers, strings, objects. But for this project, only handle keys of type strings.
      </div>

  1. `set(key, value)` takes two arguments, the first is a key and the second is a value that is assigned to this key. If a key already exists, then the old value is overwritten.

     - Remember to grow your buckets size when it needs to, by calculating if your bucket has reached the `load factor`.

  1. `get(key)` takes one argument as a key and returns the value that is assigned to this key. If a key is not found, return `null`.

  1. `has(key)` takes a key as an argument and returns `true` or `false` based on whether or not the key is in the hash map.

  1. `remove(key)` takes a key as an argument. If the given key is in the hash map, it should remove the entry with that key and return `true`. If the key isn't in the hash map, it should return `false`.

  1. `length()` returns the number of stored keys in the hash map.

  1. `clear()` removes all entries in the hash map.

  1. `keys()` returns an array containing all the keys inside the hash map.

  1. `values()` returns an array containing all the values.

  1. `entries()` returns an array that contains each `key, value` pair. Example: `[[firstKey, firstValue], [secondKey, secondValue]]`

  Remember that a hash map does not preserve insertion order when you are retrieving your hash map's data. It is normal and expected for keys and values to appear out of the order you inserted them in.

#### Extra Credit

- Create a class `HashSet` that behaves the same as a `HashMap` but only contains `keys` with no `values`.

</div>
