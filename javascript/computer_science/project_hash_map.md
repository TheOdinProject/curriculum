### Introduction

One of the most used data structure across all languages is a Hash Table, aka Hash Map. If you've worked with JavaScript Object Literal `{}`, `Set`, and `Map`, then you have used structures based on hash tables. But how do they work exactly? How can we save values using strings and symbols as keys and then retrieve those values using the same keys.

In this project, you will learn how it all works, and you will implement your own Hash Map! To start we need to learn a few concepts, one of which is a hash code, what does it mean, and how to use it. Let us get started and hope you are exited to finally know what is happening with an object when you put keys and values in them.

### What is a hash code

Let us start by learning what does it mean to hash a value. Hashing means taking an input in and generating an output that represents this input. A Hash function should be a pure function, hashing the same input should always return the same hash code, there should be no random generation that is happening. For example, let's work a hashing function that takes a name and gives us the first letter of that name:

```javascript
function hash(name) {
  return name.charAt(0);
}
```

We created our first basic hashing function, it takes a name and returns the first letter of that name.
You might be familiar with this concept from your cipher exercise earlier in foundation, but there is a key difference between hashing and ciphering (encryption), which is reversibility.

Hashing is a one-way process. Here is an example given a name, you can get a hash out of it, but given a hash, you cannot revert it back to a name. If you have a name `"Carlos"` we can hash it to `"C"`. But it will not be possible to reverse it from `"C"` back to its original form. You cannot know if it is `"Carlos"`, maybe it's `"Carla"` or `"Carrot"` we don't know. This is very good for security also, given a password you can save the hash of that password, but if someone steals your hashes they cannot know the original passwords since they are unable to reverse the hash back to the password. We are not going to dive deeper into hashing passwords, this is a subject for another lesson.

### Use cases

What can we do with those hashes, You have probably seen it in school where a folder is organized into smaller folders, each folder holds information about people with the same first letter, so we get something like this:

```
C:
  carlos.txt
  carla.txt
B:
  bryan.txt
  bob.txt
  beatrice.txt
  bella.txt
  benjamin.txt
  bianca.txt
```

If we get new student in our school with the name `"Carlos"` we can run our hash function to find out what folder do we assign them in `hash("Carlos") -> "C"` so we put `"Carlos"` in the directory labeled `C`

You might have spotted a problem, what if our school is populated with many people that share the same first letter `C`? Then we will have a directory with labeled `C` that have too many names that start with `"C"` and the other directories are empty. We need to rework our hash function, to eliminate more duplication and separate our students, while keeping constant structure in folders.

```javascript
function hash(name, surname) {
  return name.charAt(0) + surname.charAt(0);
}
```

Instead of just taking the first name letter, we take the first name and last name letters. `"Carlos Smith"` will have a hash code of `"CS"` this will surely spread our students in more directories, it will eliminate many duplicate hash codes from being generated.

![Example of hashing a name using first name's first letter, and last name's first letter](./project_hash_map/imgs/00.png)

But it still doesn't solve our problem, what if we have a very popular first name's first letter and surname's first letter? Then we are again with directories that are empty and other directories that are full, we need it easier for us to find the person we are looking for, so let's rework our hash code.

```javascript
function stringToNumber(string) {
  let hashCode = 0;
  for (let i = 0; i < string.length; i++) {
    hashCode += string.charCodeAt(i);
  }

  return hashCode;
}

function hash(name, surname) {
  return stringToNumber(name) + stringToNumber(surname);
}
```

Using this technique we don't only take the first letters into consideration, now we take the whole name and convert it into numbers.

You might be thinking, wouldn't it be just better to save the whole name as a hash code? That is true, this would make it unique for each name, but there are other reasons that we have chosen a number:

- We do not save the hash code, the hash code is a calculation to find out which bucket (storage) our value will have to go to. Think about it as a locker number for example.

- We save computation time. If we are to find where our hash is stored, it would be much faster and easier for a computer to compare two numbers rather than a string (or objects) to find the bucket where we have to store our elements (you will learn more about buckets shortly). Finding a bucket using a number would allow us to use that number as our index.

- By using number as hash code, we can have hash codes that is uniform across variables where it doesn't have to only be a string, we can even hash numbers, or objects then we need an algorithm to generate a hash code number for our needs from an object, taking `class Person` object as an example, our hash code can be a combination of `strinngToNummber(name) + age`.

### Buckets

Buckets are storage that we need to store our elements. Simply, it's an array. From now on, we will be referring to our storage as buckets. We have a set of buckets as our storage, since our hash function now produce a number we are going to find out which bucket we gonna use for storage using that number as index. We receive a key `"Fred"` We hash it using our hash function, it produces the number `508` we look which Bucket has index `508` we put `"Fred"` in the bucket. This is the simple form, but there are more mechanics that we need to deal with.

To get a value using a key, we put each entry inside a bucket as a `Node` item, which hold both the key and the value. To retrieve the value we hash a key, we find the bucket number, if the bucket is not empty then we go to that bucket we compare if the Node's key is the same key that is already in the bucket, if it is then we retrieve the Node's value otherwise we return null.

Maybe you are wondering, why are we comparing the keys if we already found the hash code of that bucket? That is because remember, hash code is just the location, different items might generate the same hash code. We need to make sure the key is the same by comparing both keys that are inside the bucket.

This is it, making this will result in a hash table with `search`, `set` and `get`.

What if we found the hash code, but also the key value is the same as what we already have in the bucket. We check if it's the same item by comparing the keys, then we overwrite the value with our new value. This is how we can only have unique values inside a `Set`, `Set` is similar to a hash map but the key difference (pun intended) is that a `Set` will have Nodes with only keys and no values.

<div class="lesson-note lesson-note--warning" markdown="1">
A Hash Map does not guarantee insertion order, when you iterate over it. That is because of the buckets indexing nature of hash coding. That means if you are to retrieve the array of keys and values to iterate over them, then they will not be in order of when you inserted them.
For example, if we insert the values `Mao`, `Zach`, `Xari` in this order, we may get back `["Zach", "Mao", "Xari"]`
If iterating over the hash map frequently is your goal, then this data structure is not the right choice for the job, a simple array would be better.
</div>

### Collisions

We have another problem that we need to track down. Collisions. A collision means two different values generating the exact same hash code, and since they have the same hash code they need to land in the same exact bucket.

Let's take an example: hashing the name `"Sara"` and the name `"raSa"` will generate the same hash code. That is because the letters in both names are the same, just arranged differently.
Turn out, we can rework our `stringToNumber` function so that it can give us unique hash codes which depends on where the letter appear in the name using an algorithm.

```javascript
function stringToNumber(string) {
  let hashCode = 0;

  const primeNumber = 31;
  for (let i = 0; i < string.length; i++) {
    hashCode = primeNumber * hashCode + string.charCodeAt(i);
  }

  return hashCode;
}
```

With our new function we will have different hash codes for the names `"Sara"` and `"raSa"` that is because even if both names have the same letters, some of the letters appear in different locations. The hash code started to change because we are multiplying the old hash every new iteration and then adding the letter code.

<div class="lesson-note lesson-note--tip" markdown="1">
  Notice the usage of prime number. We could have chosen any number we wanted, but prime numbers are even better to introduce less hash codes that are divisible by the same bucket length, which will make collisions less likely to happen.
</div>

Even tho we reworked our hash function, there is always the possibility for collisions, especially that we have a finite amount of buckets. There is no way to eliminate collisions entirely, but we try to minimize them as much as possible.

#### Dealing with collisions

Enters `Linked Lists`. If each `Node` inside the bucket is also a Linked List, Then we look for bucket `508` if it's empty we insert the head of Linked List, If a Node head exists in a bucket we follow that Linked List to add to the end of it.

You probably understand by this point why we must write a good hashing function which eliminates as many collisions as possible. Most likely you will not be writing your own hash functions, as most languages have it built in. But understanding how hash functions work is important.

Check out [This Video](https://www.youtube.com/watch?v=btT4bCOvqjs) from CS50 that explains the concept shortly with visualization

### Growth of a hash table

Let's talk about the growth of our buckets. We don't have infinite memory, we can't have infinite amount of buckets. We need to start somewhere but starting too big is also a waste of memory if we're only going to have a hash map that have `"Bryan"` in it. So to deal with this issue we start with a small array as our buckets, `10 buckets` for a starter with indexes from 0 to 9.

<div class="lesson-note lesson-note--tip" markdown="1">
  Most programming languages start with the default size of `16` because it's a power of 2, which help with some techniques for performance that require bit manipulation for indexes. But for this example, we will be using a starting size of 10.
</div>

How are we going to insert into those buckets when our hash function generates big numbers like `20353924`? We make use of the modulo `%` operation `given any number modulo by 10 we will get a number between 0 and 9`.
For example, If we are to find where the value `"Manon"` going to land, in what bucket, then we do the following:
![hashing using hash code and modular operation example](./project_hash_map/imgs/01.png)

If we keep adding nodes into our buckets then the buckets will start filling up, but what is more important is we know for a fact that if almost all buckets have items in them, then it is guaranteed that some buckets will have collisions, It is Mathematically impossible not to.

Remember we don't want collisions, in a perfect world each bucket will either have 0 or 1 Node only, so we grow our buckets to have more chance that our Nodes will spread and not stack up in the same buckets. To grow our buckets, we create a new buckets list that is double the size of the old buckets list, then we retrieve all nodes from the old buckets and insert them into the new buckets.

#### When do we know that it's time to grow our buckets size

To deal with this, our Hash Map class need to keep track of two new fields, the `capacity` and the `load factor`.

- The `capacity` is the amount of buckets we currently have. Keeping track of this will let us know if our map has reached the threshold, the threshold will depend on our factor variable as well.

- The `load factor` is a number that we can assign our hash map to at the start. It's the factor that will determine when is it a good time to grow our buckets, for example a load factor of `0.75` means our hash map will need to grow its buckets when the capacity reaches 75% full. Setting it too low will consume too much memory by having too many empty buckets, while setting it too high will allow our buckets to have collisions before we grow them. Usually a good balance of `0.75 to 1` is used.

### Computation complexity

A HashMap is very efficient in its insertion, retrieving and removing operations. That is because we use array indexes to do those operations. A HashMap has an average case complexity of `O(1)` for the following methods:
- Insertion
- Retrieving
- Deletion

Assuming we have a good HashMap written. The worst case of those operations would be `O(n)` and that happens when we have all our data hashes to the same exact bucket.

The Growth of our HashMap has the complexity of `O(n)` at all times.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Self restriction and limitation

  Before we get started, we need to lay down some ground rules. As we all know JavaScript is a dynamic language the restriction we have in other languages does not exist in JavaScript for example if you create an array of size `16` to be your buckets size, nothing stopping you from storing items at index `500`. This defeats the purpose we are trying to demonstrate, so we need to put some self restriction to work around this.

  1. When you create a function that takes a hash code value and returns the bucket index, use this snippet before the function returns to make sure it's accessing inbound array indexes only.

      ```javascript
      if (index < 0 || index >= buckets.length) {
        throw new Error("Trying to access index out of bound");
      }
      ```

  1. Inside the class DO NOT use Objects to store your key value pairs, And DO NOT use the array method `push` to insert your nodes into the buckets, always use indexes.

#### Time to create a real HashMap

  1. Start by creating a HashMap class or factory function, up to you. Then proceed to create the following methods:

  1. `hash` takes a value and produces a hash code with it. There are a lot of thought that goes into creating the most optimal hashing function, it is up to you if you want to do a research to find a good hashing function but do not dive too deep into the rabbit hole. Make sure to test that it's not producing too many similar hash codes that will lead to too many collisions.

  1. `set` takes two arguments, the first is a key and the second is a value that is assigned to this key.

     - Remember to grow your buckets size when it needs to, by calculating the `load factor` and `capacity`.

  1. `get` takes one argument as a key and returns the value that is assigned to this key.

  1. `has` takes a key as an argument and checks if your HashMap has that key.

  1. `remove` takes a key as argument and remove it from the hash table.

  1. `length` returns how many stored keys in the hash code.

  1. `clear` removes all entries in the hash map.

  1. `keys` returns an array containing all the keys inside the hash map.

  1. `values` returns an array containing all the values.

  1. `entries` returns an array that contains each a `key, value` pairs. Example: `[[firstKey, firstValue], [secondKey, secondValue]]`

  Remember that a hash map does not preserve insertion order when you are retrieving your arrays' data, it is normal and expected for keys and values to appear out of the order you inserted them in.

#### Extra Credit

  - Create a class `HashSet` that behaves the same as a `HashMap` but only contains `keys` with no `values`.

</div>

### Additional resources

- Check out [What are Hash Functions and How to choose a good Hash Function](https://www.geeksforgeeks.org/what-are-hash-functions-and-how-to-choose-a-good-hash-function) for more technical overview of a hash function if you are interested in that.
