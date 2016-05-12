# Linked List implementation in Ruby
<!-- *Estimated Time: 1 hr* -->

## Introduction

In CS(computer science) one of the most basic data structures is the Array itself. Luckily, in **Ruby** arrays aren't limited to a size,
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
In order to start making our linked list, we need a `Node`, a class that will hold the information about our list. The key point here is that we don't need an `Array` of nodes, we'll just make each node "point" to the next node, and that way we can store it in memory. When we reach a `nil` node, we know that it's the end of a list. You can imagine it like so:

	 `[ NODE(head) \] -> \[ NODE \] -> \[ NODE(tail) \] -> nil`
 
So in order to store the list in memory we just need one variable, called `head`. Optionally, we could have another variable that points to the end of a Linked List called `tail` which would help with adding nodes to the end of the list. The one-way connected list is also called **singly linked list**, which means that you can only go one way through the list. In order to make a **doubly linked list** you just need to include a previous node to each node so that you may iterate through the list both ways like so:
	
	`[ NODE(head) ] <-> [ NODE ] <-> [ NODE(tail) ] <-> nil`

So the node class for our singly linked list will look like:
```language-ruby
  class Node
    attr_accessor :data, :next_node
    
    def initialize( data )
       @data = data
       next_node = nil
    end
  end

```
And in order to make the Linked list, we would just create code like so:
```language-ruby
  head = Node.new(2)
  head.next_node = Node.new(3)
  head.next_node.next_node = Node.new(1)
```
This would create the following list: `(2) -> (3) -> (1) -> nil`. As you can see, we only need to include one variable, called `head` and our other nodes will exist in memory by "pointing" at them with the `next_node` variable in the `Node` class. As you can see from our `irb` output, the list looks like ` => "#<Node:0x894feb4 @data=2, @next_node=#<Node:0x88561fc @data=3, @next_node=#<Node:0x884cb70 @data=1>>>" `.
