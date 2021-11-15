### Introduction

In the previous project and lessons, we looked at some of the more simple data structures that we may find ourselves using from day to day; and how to implement `Stacks` and `Queues`. We've dabbed our feet into the idea of being able to do things with data without necessarily having to explicitly go into an array and jumble things around. In this lesson, we will be doing more of this; but our approach won't think of data as an `Array` that needs to be accessed, but as `Nodes` that can be rearranged.

Specifically, we'll be a looking briefly at linked lists, and a lot at trees and some traversal algorithms for trees.

### Learning outcomes
Look through these now and then use them to test yourself after doing the assignment:

* What is commonly understood by the term "Node"
* What is a Linked List? What is a tree? How are Nodes used in them
* What advantages do Linked Lists have over standard Arrays?
* How do we traverse data in a tree?

### What is a Node?

If you think of an `Array` of simply a collection of boxes of data you can do things with; then a `Node` is a box data that can be `linked` and unlinked from other `Nodes`. Nodes are something that you, the programmer, may have to write in order to facilitate the use of data structures that use them. Typically, a Node may look something like this:

~~~
  define class Node
    Object some_value    
    Node[] child_nodes

    methods ...
~~~

So Nodes, fundamentally, should hold the value and should be able to link to one or more `"child"` nodes. Depending on your choice of implementation, a Node may also have methods; although this isn't fundamental.

### What is a Linked List

As the name may suggest, a `Linked List` is a List of items that is just that: linked! If you think of an `Array` as just a collection of boxes, then a `Linked List` is a collection of boxes that are sequentially linked, from box #1, to box #2, to box #3 and so on. In programming terms, it's a collection of `Nodes`, with each `Node` connecting to one other `Node` sequentially. So Node#1 -> Node#2 -> Node#3.

So how is this any different from `Arrays`? In some languages, there isn't much difference at all where `Arrays` aren't a fixed size. `Ruby` and `Javascript` are two such cases of this. However, other languages such as `Java`, `Arrays` are a fixed size upon creation; so other means of managing data flexibly are required. This concept of flexible data handling is called a `Dynamic Data Structure`.

So, in cases where `Arrays` are a fixed size, how are `Linked Lists` better? Say you wanted to input some new data in the middle of your data structure; with a fixed away you would have to:

~~~
  Create a new array that's longer than the current one
  Copy all the data that would come before your new data into the new array
  Insert your new data
  Copy the rest of the old data.
~~~

This is a lot of work, and a lot of overhead. Now how would a `Linked List` handle this?

~~~
  Create a new node for the data.
  Find our middle node.
  Link our new node to the middle node's child
  Link our middle node to the new node.
~~~

No copying massive amounts of data. Simply making a new object and linking it in. Simplicity itself! If we were to delete an element from a `Linked List`, all we need to do is find the nodes on either side of the element, and link them together instead of to said element. Easy peasy!

### So what's a tree then?

A `tree` is somewhat similar to a `linked list` in that it uses `nodes`. But unlike `nodes` in a `linked list`, `nodes` in trees can have multiple children, but still only one parent! This means that from any `node` in the tree, we may have several paths we can continue down. Trees start from a single `node`, that we commonly call the `root` of the tree. Pathways down the `tree` eventually lead to `nodes` with no `children`. These are called `leaf nodes`.

So we will need a different approach to the simple search we could use with `lists` and `arrays`. Let's explore a couple! In this lesson, we shall cover `Blind Search Algorithms`. `Blind Search Algorithms` are algorithms where there is no information on which path may be best to travel down.

### Depth First Search (DFS)

With `Depth First Search, the idea is that before we look at the at the data in a `node`; we look at the each `child` of that `node`, and before we look at the data in each of those `child nodes`, we look at ***their*** `children nodes`. See the recurring theme here? Before we look at the value we're currently at, we're `recursively` going down the path of our first `child` node; and if we don't find what we're looking for, we go down the next `child`, and so forth.

Thus, we are actually searching the `nodes` deepest down first, and working our way back up! This is a useful blind search to use if we can expect the desired values to be deep down in the tree.

However, we need to be careful here! If we're dealing with a `tree` that may be *infinitely* deep, you'll be forever searching down `one` pathway, ignoring all other `nodes`.

That said, it also has the benefit of not needing to have every `node` already generated; depending on the implementation and problem.

### Breadth First Search

`Breadth First Search` has the polar opposite approach to DFS. Here, we start from the top and work our way down. To do this, we look at our current node. If it's not what we're looking for, we `queue` the `children nodes`, then look at the first `node` in our `queue`; if that isn't what we're after, add all it's `children nodes` to the queue; and repeat this process until our desired data is found or the tree is exhausted of all it's nodes. 

This goes through the `breadth` of the tree, as opposed to plunging it's `depth`.

If you're facing a problem that requires the optimum number of steps to complete, then assuming an optimal solution is as shallow in the `tree` as possible; breadth first will eventually reach that optimal solution. However, this method requires that you have all the nodes of the tree already in memory; so you will be looking at a lot of memory usage.

### Depth-Limited Search

If `Depth First Search` is diving down the rabbit hole; `Depth-Limited Search` is simply limiting how deep you can go. So you `Depth First Search` down the tree, but only as far as the limit you set. This is a start when you're dealing with infinitely deep `trees`, or have some other reason to limit how far you go. This has the drawback that if the solution you're looking for is deeper than the limit you set, you won't find said solution.

### Iterative Deepening

This is just like `Depth-Limited Search`, but instead of having a fixed limit; you increase that limit if you cannot find your solution at the current limit. This has the benefit that `Depth First` provides, in not having to generate all your `nodes` before searching; while also providing the benefit of finding an optimal solution that `Breadth First` provides. 

### Conclusion and Remarks

We have touched on the power of `Nodes` and `Dynamic Data Structures`, specifically when we need our data to be able to grow and shrinkly flexibly. We started simple with a `Linked List`, which essentially acts as a chain of `Nodes`; and we've learned just how easy it is to make changes to a `Linked List` with this `Nodes` in mind. 

We then turned our attention to `trees`, which are similar in behavior to `linked lists`; but broader in scale! We have explored four `algorithms` to `blindly` traverse through a `tree`, and briefly touched on the benefits and drawbacks of these `algorithms`.

The emphasis on the word `blind` should be noted here. Meaning that there exist algorithms aimed towards specific problems, like path-finding; that used a more "guided" approach; and depending on how curious you are about Computer Science or problems in general; may be worth looking into. 

For those of you who have gone through `Web Dev 101`; or otherwise been doing `Web Dev`, you may have repeatedly heard the term `child node` and thought "Hold on a minute! Didn't I do something like this with javascript?" And you'd be **spot on** for making that connection. The `DOM` (Document Object Model) for a page is essentially a `tree` of all the 'Objects' in that webpage. If you have a `div` element, with other elements nested inside; those other elements are the `child nodes` of the `div` element.

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Learn about breadth-first search and depth-first search of binary search trees from this series of videos on YouTube:
      * [Binary tree traversal](https://www.youtube.com/watch?v=9RHO6jU--GU)
      * [Breadth-first traversal](https://www.youtube.com/watch?v=86g8jAQug04)
      * [Depth-first traversal](https://www.youtube.com/watch?v=gm8DUJJhmY4)
  2. Now, we're going to focus on learning about binary search trees. Start by watching [this video](https://www.youtube.com/watch?v=FvdPo8PBQtc) to learn how a binary search tree is constructed from an unordered array.
  3. Finally, learn about the principles of queues and stacks, which are concepts used in breadth-first search and depth-first search, respectively, by watching [this video](https://www.youtube.com/watch?v=6QS_Cup1YoI).
  4. Without spending too much time learning about the nuances of every algorithm; take a look at specific problems, like "path-finding"; find [interesting algorithms](https://en.wikipedia.org/wiki/A*_search_algorithm) to solve them. You don't need to commit these algorithms to memory; but it may be worth knowing they exist!
</div>