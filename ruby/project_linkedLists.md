# Project: Linked List
<!-- *Estimated Time: 1 hr* -->

In CS(computer science) one of the most basic data structures is the Array itself. Luckily, in **Ruby** arrays aren't limited to a size,
so one doesn't have to think how to overcome that limitation. However, in some programming languages array size is a concern and one of the ways to overcome that problem and allow dynamically allocated data - and the introduction of **Linked lists**. So if array size is not a limitation in Ruby, is the implementation really necessary? - The short answer to that is *no*, however, it's the simplest of the dynamic data structures and it will make you a solid foundation so you can understand more complex data structures like Graphs and Binary Trees.

A *linked list* is a linear collection of data elements, called nodes "pointing" to the next node by means of a pointer. It is a data structure consisting of a group of nodes which together represent a sequence. The principal benefit of a linked list over a conventional array is that the list elements can easily be inserted or removed without reallocation of any other elements. We could represent is like so:

	`[ NODE(head) ] -> [ NODE ] -> [ NODE(tail) ] -> nil`
 
## Your task
Your task is to build 2 classes, a `Node` class that will represent each node in a list, and a `LinkedList` that will have serval
utility functions over nodes.
Note: Don't think about having an array of nodes, have a variable called `next_node` that will "point" to the next node in the list.
So calling `head.next_node.next_node` would return the third node in the lsit.

1. Build a `Node` class containing some `data` and a variable to the `next_node` and set it `nil` as default.
2. Build a `LinkedList` class that has `head` and `tail` variables, representing appropriate nodes in the list.
3. Make a `LinkedList#add` function that adds a new node to the list. ( **Tip**: You can just add a new node to the tail of the lsit, and then move the tail by 1)
4. Write a method `LinkedList#size` that returns the size of the list. ( You can keep track of size with a instance variable, and increment it when you add new elements to a list )
5. Make a `LinkedList#to_s` function to represent your LinkedList objects as strings, so you can print them out and preview them in the console.
  The format should be: `( data ) -> ( data ) -> ( data ) -> nil`
6. Test it out! Make some LinkedLists and output them to the screen. You should get:

  ```bash
    => List contains: ( 1 ) -> ( 2 ) -> ( 3 ) -> nil
    => List contains: ( h ) -> ( e ) -> ( l ) -> ( o ) -> ( o ) -> nil
  ```
7. Write a method `LinkedList#to_a` that converts a list to an array.
8. Write a method `LinkedList#find(data)` that returns the index of the node containing data, or nil if not found.
9. Extra credit: Write a method `LinkedList#insert_at(index)` that inserts the data after the given index 
10. Extra credit: Write a method `LinkedList#remove_at(index)` that removes the node at the given index. ( You will need to reconnect the list when you remove a node )

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Stefan (destroyergm)'s solution](#)
* Add your solution above this line!

