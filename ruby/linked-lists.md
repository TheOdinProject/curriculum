# Linked List implementation in Ruby
<!-- *Estimated Time: 1 hr* -->

## Introduction

In **CS(computer science)** one of the most basic data structures is the Array itself. Luckily, in **Ruby** arrays aren't limited to a size,
so one doesn't have to think how to overcome that limitation. However, in some programming languages array size is a concern and one of the ways to overcome that problem and allow dynamically allocated data - and the introduction of **Linked lists**. So if array size is not a limitation in Ruby, is the implementation really necessary? - The short answer to that is *no*, however, it's the simplest of the dynamic data structures and it will make you a solid foundation so you can understand more complex data structures like Graphs and Binary Trees.

A *linked list* is a linear collection of data elements, called nodes "pointing" to the next node by means of a pointer. It is a data structure consisting of a group of nodes which together represent a sequence. The principal benefit of a linked list over a conventional array is that the list elements can easily be inserted or removed without reallocation of any other elements. So what does it mean to be **dynamic**? ( In Ruby this is hard to explain, because it does not have pure static data structures ). It means that it can be evaluated and changed at run-time. The functionality we're going to implement is already present in our famous array class: if we have an array `[1,2,3]` and call the "shovel head" operator on it, we get an expanded array `[1,2,3] << 5 => [1,2,3,5]`, we just changed the size of our array from `3` to `4` and added `5` to its content. 

## Points to Ponder
*Look through these now and then use them to test yourself after doing the assignment*

* What's an dynamic data type?
* How would you add new elements to a list?
* How would you add at the end and at the beginning of a lits?
* What are the options of calculating the length of a linked list?
* What are the flaws of using a linked list?
* Is there a way to insert a new node in the middle of a list?
* Is there a way to delete a node at a given point in a list?
* Is a list slower or faster then an array at finding elements at an index?
* Can a list cause memory leaks on some programming languages?
* What's the difference between a doubly/singly linked list
* Does list support indexing, e.g. `list[5]`

## Abstract implementation - the Node class


