### Introduction

You have learned about [binary search trees](http://en.wikipedia.org/wiki/Binary_search_tree), where you take a group of data items and turn them into a tree full of nodes, with each left node being "lower" than each right node. The tree starts with the "root node" and any node with no children is called a "leaf node". You have also learned about tree traversal algorithms like breadth-first and depth-first.

Now, let's take a look at balanced binary search trees (BST). A BST allows fast operations for lookup, insertion, and deletion of data items. Read this [article on building balanced BSTs](https://www.geeksforgeeks.org/sorted-array-to-balanced-bst/). Here is a [video on building balanced BSTs](https://youtu.be/VCTP81Ij-EM) as well. Although these two resources do not use Ruby, you should understand it enough to develop your own pseudocode.

### Assignment

You'll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.

<div class="lesson-content__panel" markdown="1">

1. Build a `Node` class. It should have an attribute for the data it stores as well as its left and right children.

1. Build a `Tree` class which accepts an array when initialized. The `Tree` class should have a `root` attribute, which uses the return value of `#build_tree` which you'll write next.

1. Write a `#build_tree` method which takes an array of data (e.g., `[1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]`) and turns it into a balanced binary tree full of `Node` objects appropriately placed (don't forget to sort and remove duplicates!). The `#build_tree` method should return the level-0 root node.

   <div class="lesson-note lesson-note--tip" markdown="1">

   #### Visually representing your tree

   If you would like to visualize your binary search tree, here is a `#pretty_print` method that a student wrote and shared on Discord:

   ```ruby
   def pretty_print(node = @root, prefix = '', is_left: true)
     return unless node

     pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false)
     puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
     pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true)
   end
   ```

   </div>

1. Write an `#include?(value)` method that accepts a value and returns `true` if the given value is in the tree. If the value isn't in the tree, it should return `false`.

1. Write an `#insert(value)` method which accepts a value and inserts a new node with that value into the tree. Be sure to insert in a way that preserves the "binary search" property: for each node, every node to its left must have a lower value, and every node to its right must have a greater value. If the method is called with a value that already exists in the tree, the method should do nothing. If you need additional resources, check out the [Geeks for Geeks article on binary search tree insertion](https://wwww.geeksforgeeks.org/insertion-in-binary-search-tree/?ref=lbp).

   <div class="lesson-note" markdown="1">

   #### Avoid using the original input array

   You may be tempted to implement these methods using the original input array, but it's important for the efficiency of these operations that you don't do this. If we refer back to the [Big O Cheatsheet](https://www.bigocheatsheet.com/), we'll see that binary search trees can insert/delete in `O(log n)` time, which is a significant performance boost over arrays for the same operations. To get this added efficiency, your implementation of these methods should traverse the tree and manipulate the nodes and their connections.

   </div>

1. Write a `#delete(value)` method that accepts a value and removes it from the tree. You'll have to deal with multiple cases for this based on how many children the targeted node has. If the given values doesn't exist in the tree, the method should do nothing. If you need additional resources, check out the [Geeks for Geeks article on deleting in a binary search tree](https://wwww.geeksforgeeks.org/binary-search-tree-set-2-delete/?ref=lbp).

1. Write a `#level_order` method which accepts a block. This method should traverse the tree in breadth-first level order and yield each value to the provided block. With a block, it should return `self`. This method can be implemented using either iteration or recursion (try implementing both!). If a block isn't given, the method should return an `Enumerator`.

   <div class="lesson-note lesson-note--tip" markdown="1">

   #### Using a queue

   You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list. If you need a visualization, watch [mycodeschool's video on level order traversal](https://www.youtube.com/watch?v=86g8jAQug04).

   </div>

1. Write `#inorder`, `#preorder`, and `#postorder` methods that also accept a block. Each of these methods should traverse the tree in their respective depth-first order and yield each value to the provided block. With a block, they should return `self`, and without a block, they should return an `Enumerator`. If you need a resource for how the different traversals work, watch [mycodeschool's video on Binary Tree Traversal: Preorder, Inorder, Postorder](https://www.youtube.com/watch?v=gm8DUJJhmY4).

1. Write a `#height` method that accepts a value and returns the height of the node containing that value. Height is defined as the number of edges in the longest path from that node to a leaf node. If the value is not found in the tree, the method should return `nil`.

1. Write a `#depth` method that accepts a value and returns the depth of the node containing that value. Depth is defined as the number of edges in the path from that node to the tree's root node. If the value is not found in the tree, the method should return `nil`.

1. Write a `#balanced?` method that checks if the tree is balanced. A binary tree is considered balanced if, for every node in the tree, the height difference between its left and right subtrees is no more than 1, and both the left and right subtrees are also balanced.

   <div class="lesson-note lesson-note--tip" markdown="1">

   #### Pitfall with checking balance

   A common mistake is only checking the height difference between the root's left and right children. That is not enough — you must check the balance condition for every node.

   </div>

1. Write a `#rebalance` method which rebalances an unbalanced tree. **Tip:** You'll want to use a traversal method to provide a new array to the `#build_tree` method.

#### Tie it all together

Write a driver script that does the following:

1. Create a binary search tree from an array of random numbers `(Array.new(15) { rand(1..100) })`
1. Confirm that the tree is balanced by calling `#balanced?`
1. Print out all elements in level, pre, post, and in order
1. Unbalance the tree by adding several numbers whose value is more than 100
1. Confirm that the tree is unbalanced by calling `#balanced?`
1. Balance the tree by calling `#rebalance`
1. Confirm that the tree is balanced by calling `#balanced?`
1. Print out all elements in level, pre, post, and in order.

</div>
