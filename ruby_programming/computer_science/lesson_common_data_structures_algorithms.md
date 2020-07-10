### Introduction

The basic idea of a **data structure** is to store data in a way that meets the needs of your particular application.  You might be inclined to store a particular kind of data in one giant array, but it would be rather time consuming to locate a specific value if you had a significant number and depth of items.  So you need to look to other options.

Depending on the application, there are a batch of other basic data structures available to help you out.  The differences between them typically have to do with trade-offs between how long it takes to first populate the structure, how long it takes to add or find elements, and how large the structure is in memory.

We'll save the specifics of data structures for more computer-science-oriented courses, but this introduction should again expand your toolbox slightly so you can identify and solve certain problems where plain old Arrays, Hashes and Sets don't quite cut it.  New structures and strategies will be particularly relevant, for instance, when you're trying to search through a large batch of data for a particular value or plan out a strategy several moves in advance.

You've already had a brief introduction to **algorithms** over some of the other lessons and you even got to write your own Merge Sort algorithm in the last project.  You'll find that sorting algorithms are quite common.  Another major area for algorithms is in search, where milliseconds count.  When you're searching through enormous troves of data, the quality of your search algorithm is incredibly important.  Traversing a data tree looking for a particular element is a related problem that's common in data intensive applications.

Luckily for you, these complex algorithmic problems have all been solved many times in the past.  Understanding *how* they are solved will give you some great tools to apply to other (similar) problems on your own.  Algorithms are really just ways of solving problems systematically.  In this brief introduction, we'll focus on a couple of algorithms that you may run into when coding on your own -- breadth-first-search and depth-first-search.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

* What is a data structure?
* What is a stack?
* What is a queue?
* What's the difference between a stack and a queue?
* What is a stack useful for?
* What is a queue useful for?
* What's the best way to implement stacks and queues in Ruby (hint: think simple)?
* Why bother having many different search algorithms?
* What is breadth-first-search (BFS)?
* What is depth-first-search (DFS)?
* What situations would you want to use BFS?
* What situations would you want to use DFS instead?
* When would BFS be impractical?

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Glance over the [Wikipedia entry on Data Structures](http://en.wikipedia.org/wiki/Data_structure) for a high level overview of things.
  2. Learn about basic algorithms from Coursera's Algorithms course in [this video](http://www.youtube.com/watch?v=u2TwK3fED8A).  The first 10 minutes are really the meat of the introduction to algorithms, the rest gets more mathematical (if you're so inclined).
  3. Read the [Gentle Introduction to Algorithms for Web Developers](http://www.giocc.com/a-gentle-introduction-to-algorithms-for-web-developers.html) for another basic look at what algorithms are.
  4. Learn about how binary search works by watching [this video](https://www.youtube.com/watch?v=T98PIp4omUA) from Harvard's CS50 on YouTube.
  5. Now, we're going to focus on learning about binary search trees. Start by watching [this video](https://www.youtube.com/watch?v=FvdPo8PBQtc) to learn how a binary search tree is constructed from an unordered array.
  4. Next, learn about the principles of queues and stacks, which are concepts used in breadth-first search and depth-first search, respectively, by watching [this video](https://www.youtube.com/watch?v=6QS_Cup1YoI).
  5. Finally, learn about breadth-first search and depth-first search of binary search trees from this series of videos on YouTube:
      * [Binary tree traversal](https://www.youtube.com/watch?v=9RHO6jU--GU)
      * [Breadth-first traversal](https://www.youtube.com/watch?v=86g8jAQug04)
      * [Depth-first traversal](https://www.youtube.com/watch?v=gm8DUJJhmY4)
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Khan Academy's great Algorithms Course](https://www.khanacademy.org/computing/computer-science/algorithms)
* [Stanford's Coursera 4-Part Algorithm Course](https://www.coursera.org/specializations/algorithms)
* [Visualizing Algorithms from Mike Bostock](http://bost.ocks.org/mike/algorithms/)
* [Another free course on algorithms by Udacity](https://www.udacity.com/course/cs215)
* [A brief note on putting Sorting, Tries and Heaps into Ruby, by Ilya Grigorik](http://www.igvita.com/2009/03/26/ruby-algorithms-sorting-trie-heaps/)
* [A more detailed video on stacks and queues](https://www.youtube.com/watch?v=idrrIMXXeHM)
* [An article](https://www.crondose.com/2016/06/create-a-binary-search-tree-array/) that discusses how to construct a binary search tree from an unordered array.
* [A stack overflow discussion](https://stackoverflow.com/questions/3332947/when-is-it-practical-to-use-depth-first-search-dfs-vs-breadth-first-search-bf) on the relative strengths of BFS and DFS.
