# Linked List implementation in Ruby
<!-- *Estimated Time: 1 hr* -->

## Introduction

In **CS(computer science)** one of the most basic data structures is the Array itself. Luckly, in **Ruby** arrays aren't limited to a size,
so one doesn't have to think how to overcome that limitation. However, in some programming languages array size is a concern and one of the ways to overcome that problem and allow dynamically allocated data - and the introduction of **Linked lists**. So if array size is not a limitation in Ruby, is the implementation really nesecery? - The short answer to that is *no*, however, it's the simplest of the dynamic data structures and it will make you a solid foundation so you can understand more complex data structures like Graphs and Binary Trees.

A *linked list* is a linear collection of data elements, called nodes "pointing" to the next node by means of a pointer. It is a data structure consisting of a group of nodes whitch together represent a sequence. The principal benefit of a linked list over a conventional array is that the list elements can easily be inserted or removed without reallocation of any other elements. So what does it mean to be **dynamic**? ( In Ruby this is hard to explain, because it does not have pure static data structures ) It means that it can be evaluated and changed at run-time. The functionality we're going to implement is allready present in our famous array class: if we have an array `[1,2,3]` and call the "shovel head" operator on it, we get an expanded array `[1,2,3] << 5 => [1,2,3,5]`, we just changed the size of our array from 3 to 4.

## Abstract implementation


