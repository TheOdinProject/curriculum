### Introduction

In Computer Science one of the most basic and fundamental data structures is the
linked list, which functions similarly to an array. The principal benefit of a linked
list over a conventional array is that the list elements can easily be inserted or
removed without reallocation of any other elements.

In some programming languages the size of an array is a concern and one of the ways
to overcome that problem and allow dynamically allocated data is using linked lists.

Luckily in **Ruby** arrays aren't limited to a certain size, so you don't have to think
about overcoming that limitation.

So if array size is not a limitation in Ruby, are linked lists really necessary?
The short answer to that is _no_; however, it's the simplest of the dynamic data
structures and it will give you a solid foundation, so you can understand more
complex data structures like graphs and binary trees with more ease.

### Structure of a Linked List

A _linked list_ is a linear collection of data elements called nodes that "point"
to the next node by means of a pointer.

Each node holds a single element of data and a link or pointer to the next node in the list.

A head node is the first node in the list, a tail node is the last node in the list. Below is a basic representation of a linked list:

`[ NODE(head) ] -> [ NODE ] -> [ NODE(tail) ] -> nil`

For a more thorough explanation, use these resources:

1.  [Linked Lists in Plain English](https://www.youtube.com/watch?v=oiW79L8VYXk)
2.  [What's a Linked List, Anyway?](https://dev.to/vaidehijoshi/whats-a-linked-list-anyway)
3.  [Linked Lists, Ruby's Missing Data Structure](https://www.sitepoint.com/rubys-missing-data-structure/)
4.  [A more verbose explanation with plenty of diagrams](https://web.archive.org/web/20200217010131/http://www.cs.cmu.edu/~adamchik/15-121/lectures/Linked%20Lists/linked%20lists.html)

### Assignment

<div class="lesson-content__panel" markdown="1">
  You will need two classes:

1. `LinkedList` class, which will represent the full list.
2. `Node` class, containing a `#value` method and a link to the `#next_node`, set both as `nil` by default.

Build the following methods in your linked list class:

1. `#append(value)` adds a new node containing `value` to the end of the list
2. `#prepend(value)` adds a new node containing `value` to the start of the list
3. `#size` returns the total number of nodes in the list
4. `#head` returns the first node in the list
5. `#tail` returns the last node in the list
6. `#at(index)` returns the node at the given `index`
7. `#pop` removes the last element from the list
8. `#contains?(value)` returns true if the passed in value is in the list and otherwise returns false.
9. `#find(value)` returns the index of the node containing value, or nil if not found.
10. `#to_s` represent your LinkedList objects as strings, so you can print them out and preview them in the console.
    The format should be: `( value ) -> ( value ) -> ( value ) -> nil`

### Extra Credit

1. `#insert_at(value, index)` that inserts a new node with the provided `value` at the given `index`.
2. `#remove_at(index)` that removes the node at the given `index`.

**Extra Credit Tip:** When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their `#next_node` link updated.
</div>
