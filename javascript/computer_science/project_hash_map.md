### Introduction

You already know the magic behind hash maps. Now it's time to write your own implementation!

#### Limitation

  Before we get started, we need to lay down some ground rules. JavaScript's dynamic nature of arrays allows us to insert and retrieve indexes that are outside our array size range. Example: if we create an array of size `16` to represent our buckets, nothing stops us from storing items at index `500`. This defeats the purpose of limiting storage size in hash maps, so we need to enforce some restrictions.

  Use the following snippet whenever you access a bucket through an index. We want to throw an error if we try to access an out-of-bounds index:

```javascript
if (index < 0 || index >= buckets.length) {
  throw new Error("Trying to access index out of bounds");
}
```

### Assignment

<div class="lesson-content__panel" markdown="1">

  Start by creating a `HashMap` class or factory function. It's up to you which you want to use. It should have at least two variables for `load factor` and `capacity`. Then proceed to create the following methods:

  1. `hash(key)` takes a key and produces a hash code with it. We already implemented a fairly good `hash` function in the previous lesson. As a reminder:

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

      You are free to use that, or you can conduct your own research on hashing algorithms. Beware, this is a deep, deep rabbit hole.

      However, there is one edge case our `hash` function still needs to address. For very long keys, our hash code will exceed the maximum integer value allowed by JavaScript. Once that happens, calculations become inaccurate, and the chance of collisions significantly increases. One way to avoid this issue is to apply the modulo `%` operator on *each iteration* instead of outside the loop at the end. This ensures the output never becomes larger than our bucket's length.

      You might find yourself confusing keys with hash codes while accessing key-value pairs later. We would like to stress that the key is what your `hash` function will take as an input. In a way, we could say that the key is important for us *only* inside the `hash` function, as we never access a bucket directly with the key. Instead, we always do so with the hash code.

      <div class="lesson-note lesson-note--tip" markdown="1">

      In the real world, hash maps can accommodate various data types as keys, including numbers, strings, or objects. However, for this project, we will only handle keys of type `string`.

      </div>

  1. `set(key, value)` takes two arguments: the first is a key, and the second is a value that is assigned to this key. If a key already exists, then the old value is overwritten, and we can say that we *update* the key's value (e.g. `Carlos` is our key but it is called twice: once with value `I am the old value.`, and once with value `I am the new value.`. Following this logic, `Carlos` should contain only the latter value).

      Recall that collisions occur when *TWO DIFFERENT* keys generate the same hash code and get assigned to the same bucket. (e.g. `Carlos` and `Carla` are both hashed to `3`, so `3` becomes a location for `Carlos` AND `Carla`. However, we know that this is not an update because the keys are different). Review the [dealing with collisions](https://www.theodinproject.com/lessons/javascript-hashmap-data-structure#collisions) section of the previous lesson to find a way to handle our collisions.

      - Remember to grow your buckets to double their capacity when your hash map reaches the `load factor`. The methods mentioned later in this assignment can help you handle the growth logic, so you may want to implement this feature near the end. However, we mention this with `set()` because it's important to grow buckets exactly as they are being expanded.

  1. `get(key)` takes one argument as a key and returns the value that is assigned to this key. If a key is not found, return `null`.

  1. `has(key)` takes a key as an argument and returns `true` or `false` based on whether or not the key is in the hash map.

  1. `remove(key)` takes a key as an argument. If the given key is in the hash map, it should remove the entry with that key and return `true`. If the key isn't in the hash map, it should return `false`.

  1. `length()` returns the number of stored keys in the hash map.

  1. `clear()` removes all entries in the hash map.

  1. `keys()` returns an array containing all the keys inside the hash map.

  1. `values()` returns an array containing all the values.

  1. `entries()` returns an array that contains each `key, value` pair. Example: `[[firstKey, firstValue], [secondKey, secondValue]]`

Remember that a hash map does not preserve insertion order when you are retrieving your hash map's data. It is normal and expected for keys and values to appear out of the order you inserted them in.

#### Test Your Hash Map

1. Create a new JavaScript file.

1. Create a new instance of your hash map and set the load factor to be `0.75`.

    ```javascript
    const test = new HashMap() // or HashMap() if using a factory
    ```

1. Populate your hash map using the `set(key, value)` method by copying the following:

    ```javascript
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

1. Now with a full hash map, try overwriting a few nodes using `set(key, value)`. This should only overwrite the existing `values` of your nodes and not add new ones, so `length()` should still return the same value and `capacity` should remain the same.

1. After that, populate your hash map with the last node below. This will make your load levels exceed your `load factor`, triggering your hash map's growth functionality and doubling its `capacity`:

    ```javascript
    test.set('moon', 'silver')
    ```

1. If you have implemented your hash map correctly, the load levels of your expanded hash map should drop well below your load factor, and the entries should be spread evenly among the expanded buckets.

1. With your new hash map, try overwriting a few nodes using `set(key, value)`. Again, this should only overwrite existing `values` of your nodes.

1. Test the other methods of your hash map, such as `get(key)`, `has(key)`, `remove(key)`, `length()`, `clear()`, `keys()`, `values()`, and `entries()`, to check if they are still working as expected after expanding your hash map.

#### Extra Credit

- Create a `HashSet` class or factory function that behaves the same as a `HashMap` but only contains `keys` with no `values`.

</div>
