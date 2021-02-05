### Introduction

Last lesson, we glossed over what a data structure is, and covered `The Array` as our classic example of a data structure. But simply picking out indexes might not be the best, or most `structured` way of playing around with our data. In this lesson, we look at some of the more simple data structures that don't come in layers. We will be looking at Maps, Stacks and Queues

### Learning outcomes
Look through these now and then use them to test yourself after doing the assignment:

* What are Maps, Stacks and Queues?
* What are their differences, and how may each be used?
* What features would you expect each of these to have?

### Map

Sometimes known as an `Associative Array`, `Dictionary` or a `Map` depending on the language. Maps are used like an array, but instead of using an index number like:

~~~ruby
  arr = [4, 9, 45]
  arr[0] #This would return 4
~~~

You use a key to identify where you want to look:

~~~ruby
  people = {"Billy Smiggins" => "male", "Jane Doe" => "female"}
  people["Jane Doe"]  #This would return female
~~~

This data structure allow us to store values with keys that have some meaning, or otherwise map values to objects other than integers. In the cases of Ruby and Javascript, The Odin Project's languages of choice, Ruby calls these [Hashes](https://ruby-doc.org/core-2.7.1/Hash.html) and Javascript calls them [Maps](https://devdocs.io/javascript-map/)

### Stacks

You may recall that `The Stack` was mentioned in when we were learning about recursion, a concept that functions and parameters are stacked on top of each other in memory, then taken from the top down when they are needed. [Stacks](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) as a data structure follow the same methodology of stacking their input on top of remaining data, and taking data off the top of the stack. 

`Stacks` should allow users to use two methods to manipulate data. `#push`, which puts it's input on the top, or the `head` of the stack; and `#pop`, which removes the element from the head of the stack and returns it. Some implementations may have `#peek`, which allow users to see the head of the stack without removing it. Here is an example of what `Stack` use may look like

~~~ruby
  simple_stack.push(3)    #[3]
  simple_stack.push(1)    #[3,1]
  simple_stack.push(9)    #[3,1,9]

  simple_stack.pop()      # Returns 9, Stack: [3,1]
  simple_stack.pop()      # Returns 1, Stack: [3]
  simple_stack.pop()      # Returns 3, Stack: []
~~~

To conceptualise this idea; think of a stack of plates. Removing a plate from the middle would be a silly idea. Instead, you'd take the plates from the top.

An alternative name for a `stack` is a `LIFO (Last-In-First-Out)` queue.

Both [Ruby](https://ruby-doc.org/core-2.6/Array.html#method-i-pop) and [Javascript](https://devdocs.io/javascript/global_objects/array/pop) have `Stack` functionality built into their `Array` object. Be sure to read on what their pop and push methods do!

### Queues

You will be familiar with the concept of queuing for something. Say you're buying groceries, and there's a line of people waiting to purchase their goods; and you join the back of this line. You have just joined a `Queue`.

By definition, a [Queue](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)), like a `Stack`, should allow uses to use two methods: `#enqueue`, which places it's input at the back of the queue, and `#dequeue` which removes an element from the front of the queue and returns it.

To go back to our grocery analogy; you joining the queue would be `#enqueue`, and the individual finally buying and bagging their food would be `#dequeue`'d. Here is an example of what a `Queue` may look like:

~~~ruby
  grocery_queue.enqueue("Billy Smiggins")   #["Billy Smiggins"]
  grocery_queue.enqueue("Jane")             #["Billy Smiggins", "Jane"]
  grocery_queue.enqueue("QChai")            #["Billy Smiggins", "Jane", "QChai"]

  grocery_queue.dequeue()                   # Returns "Billy Smiggins", Queue: ["Jane", "QChai"]
  grocery_queue.dequeue()                   # Returns "Jane",           Queue: ["QChai"]
  grocery_queue.dequeue()                   # Returns "QChai",          Queue: ["QChai"]
~~~

An alternative name for a `queue` is a `FIFO (First-In-First-Out)` queue.

Some languages have builtin queues ready for use; but Ruby and Javascript do not explicitly have `queues` or either of the mentioned functions. However, both languages [Ruby](https://ruby-doc.org/core-2.6/Array.html#method-i-shift) and [Javascript](https://devdocs.io/javascript/global_objects/array/shift) have the `#shift` method which, when used with `#push`; allows the easy implementation of `queues`.


### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Use pop, push and shift in your language of choice and get a feel for how these work! If you're not using Ruby or Javascript for this course, you might need to google around to find Queue implementation.
  2. View the docs of your chosen language and find how maps work in your language. It could be under a different name, like 'Hash' or 'Dictionary'.
</div>