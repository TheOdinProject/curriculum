### Introduction

You have learned about [binary search trees](http://en.wikipedia.org/wiki/Binary_search_tree), where you take a group of data items and turn them into a tree full of nodes, with each left node being "lower" than each right node. The tree starts with the "root node" and any node with no children is called a "leaf node". You have also learned about tree traversal algorithms like breadth-first and depth-first.

Now, let's take a look at balanced binary search trees (BST). A BST allows fast operations for lookup, insertion, and deletion of data items. Read this [article on building balanced BSTs](https://www.geeksforgeeks.org/sorted-array-to-balanced-bst/). Here is a [video on building balanced BSTs](https://youtu.be/VCTP81Ij-EM) as well. Although the last resource does not use JavaScript, you should understand it well enough to develop your own pseudocode.

### Assignment

You'll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.

<div class="lesson-content__panel" markdown="1">

1. Build a `Node` class. It should have an attribute for the data it stores as well as its left and right children.

1. Build a `Tree` class which accepts an array when initialized. The `Tree` class should have a `root` attribute, which is initialized as null. 

1. Write a `find(value)` method inside of the ‘Tree’ class that returns a boolean value if the value exists in the binary search tree. If you need a refresher on classes, check [this](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes) article on classes and methods. 

1. Write `insert(value)` and `deleteItem(value)` methods inside of the ‘Tree’ class. These methods should insert/delete the given value. Return a true or false boolean if the insertion/deletion was successful. The insert method should also refuse any duplicate values using the prior ‘find’ method. Both methods should utilize the ‘Node’ class to ensure you are properly updating the left and right children of each node. You'll have to deal with several cases for delete, such as when a node has children or not. If you need additional resources, check out these two articles on [inserting](https://www.geeksforgeeks.org/insertion-in-binary-search-tree/?ref=lbp) and [deleting](https://www.geeksforgeeks.org/binary-search-tree-set-2-delete/?ref=lbp), or this [video on BST inserting/removing](https://youtu.be/wcIRPqTR3Kc) with several visual examples.

    <div class="lesson-note" markdown="1">

      In order to make the Binary Search Tree as efficient as possible, you should refer back to the [Big O Cheatsheet](https://www.bigocheatsheet.com/). Binary search trees can insert/delete in `O(log n)` time, which is a significant performance boost over arrays for the same operations. To get this added efficiency, your implementation of these methods should traverse the tree and manipulate the nodes and their connections.

    </div>

        **Tip:** If you would like to visualize your binary search tree, here is a `prettyPrint()` function that will `console.log` your tree in a structured format. This function will expect to receive the root of your tree as the value for the `node` parameter.

    ```javascript
    const prettyPrint = (node, prefix = "", isLeft = true) => {
      if (node === null) {
        return;
      }
      if (node.right !== null) {
        prettyPrint(node.right, `${prefix}${isLeft ? "│   " : "    "}`, false);
      }
      console.log(`${prefix}${isLeft ? "└── " : "┌── "}${node.data}`);
      if (node.left !== null) {
        prettyPrint(node.left, `${prefix}${isLeft ? "    " : "│   "}`, true);
      }
    };
    ```
   
1. Write a `levelOrder(callback)` method that accepts an optional callback function as its parameter. `levelOrder` should traverse the tree in breadth-first level order and provide each node as an argument to the callback. As a result, the callback will perform an operation on each node following the order in which they are traversed. `levelOrder` may be implemented using either iteration or recursion (try implementing both!). The method should return an array of values if no callback is given as an argument. **Tip:** You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list ([video on level order traversal](https://www.youtube.com/watch?v=86g8jAQug04)).
   
1. Write `inOrder(callback)`, `preOrder(callback)`, and `postOrder(callback)` methods that also accept an optional callback as a parameter. Each of these functions should traverse the tree in their respective depth-first order and yield each node to the provided callback. The functions should return an array of values if no callback is given as an argument.

1. Write a `height(node)` method that returns the given node's height. Height is defined as the number of edges in the longest path from a given node to a leaf node.

1. Write a `depth(node)` method that returns the given node's depth. Depth is defined as the number of edges in the path from a given node to the tree's root node.

1. Write an `isBalanced` method that checks if the tree is balanced. A balanced tree is one where the difference between heights of the left subtree and the right subtree of every node is not more than 1. 'isBalanced' should return a true or false boolean value depending if the tree is balanced or not. 

1. Write a 'rebalance' and a 'buildTree' methods. The rebalance function should use a traversal method to provide a new array to the buildTree method. The buildTree method should then re-balance the tree and return the level-0 root node. 

#### Tie it all together

Write a driver script that does the following:

1. Create a binary search tree from an array of random numbers < 100. You can create a function that returns an array of random numbers every time you call it if you wish.
1. Confirm that the tree is balanced by calling `isBalanced`.
1. Print out all elements in level, pre, post, and in order.
1. Unbalance the tree by adding several numbers > 100.
1. Confirm that the tree is unbalanced by calling `isBalanced`.
1. Balance the tree by calling `rebalance`.
1. Confirm that the tree is balanced by calling `isBalanced`.
1. Print out all elements in level, pre, post, and in order.

</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Yicheng Gong has some excellent videos that help visualize the call stack when traversing binary search trees: [In-order](https://www.youtube.com/watch?v=4_UDUj1j1KQ&t=1s), [Post-order](https://www.youtube.com/watch?v=4Xo-GtBiQN0), and [Pre-order](https://www.youtube.com/watch?v=8xue-ZBlTKQ&ab_channel=ygongcode) Traversal Algorithms.
