# Projects: Basic Data Structures and Algorithms
<!-- *Estimated Time: 6-10 hours* -->

*Don't forget to use Git to save your projects!*

## Project 1: Searching Binary Trees

You learned about [binary search trees](http://en.wikipedia.org/wiki/Binary_search_tree) -- where you take a group of data items and turn them into a tree full of nodes where each left node is "lower" than each right node.  The tree starts with the "root node" and any node with no children is called a "leaf node".

You also learned about tree search algorithms like breadth-first-search and depth-first-search.  You learned that BFS is best used to find the optimum solution but can take a very long time (impractically long for broad and deep data sets) while DFS is often much faster but will give you the FIRST solution, not necessarily the best.  Here you'll get a chance to implement both.

### Your Task

You'll build a simple binary tree data structure from some arbitrary input and also the "crawler" function that will locate data inside of it.

1. Build a class `Node`.  It should have a `value` that it stores and also links to its parent and children (if they exist).  Build getters and setters for it (e.g. parent node, child node(s)). 
2. Write a method `build_tree` which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of `Node` objects appropriately placed.  Start by assuming the array you get is sorted.
3. Now refactor your `build_tree` to handle data that isn't presorted and cannot be easily sorted prior to building the tree.  You'll need to figure out how to add a node for each of the possible cases (e.g. if it's a leaf versus in the middle somewhere).
3. Write a simple script that runs `build_tree` so you can test it out.
5. Build a method `breadth_first_search` which takes a target value and returns the node at which it is located using the breadth first search technique.  **Tip:** You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to search and to add new ones to the list (as you saw in the [video](http://www.youtube.com/watch?v=zLZhSSXAwxI)).  If the target node value is not located, return `nil`.
4. Build a method `depth_first_search` which returns the node at which the target value is located using the depth first search technique.  Use an array acting as a *stack* to do this.
5. Next, build a new method `dfs_rec` which runs a depth first search as before but this time, instead of using a stack, make this method recursive.
6. Tips:
    
    1. You can think of the `dfs_rec` method as a little robot that crawls down the tree, checking if a node is the correct node and spawning other little robots to keep searching the tree.  No robot is allowed to turn on, though, until all the robots to its left have finished their task.
    2. The method will need to take in both the target value and the current node to compare against.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_data_structs_alg/bst)
* [Mazin's solution](https://github.com/muzfuz/CodeLessons/blob/master/binary_search/binary_search.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_7_Ruby_DataStructures/binarytree.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/bst-practice)
* [Michael Alexander's solution](https://github.com/betweenparentheses/project_data_structures/blob/master/binarytree.rb)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/data-structures-and-algorithms)
* [Aleksandar's solution](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Basic%20Data%20Structures%20and%20Algorithms/lib/btree.rb)
* [John Quarles' solution](https://github.com/johnwquarles/Ruby-binary-trees-knights-travails/blob/master/binary_tree.rb)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/data_structures_and_algorithms/binary_search_tree.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/blob/master/Project7/BinTree/p1-tree.rb)
* [Jason Matthews' solution](https://github.com/fo0man/project_data_structures/blob/master/BinaryTree.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/binary_tree/blob/master/binary_tree.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/algorithms/blob/master/binary_tree.rb)
* [Frank Peelen's solution](https://github.com/FrankPeelen/Data-Structures-and-Algorithms/blob/master/binary_search_tree.rb)
* [Brann James' solution](https://github.com/brannj/The_Odin_Project/blob/master/basic_data_structs/binary_trees.rb)
* [ll14m4n's solution](https://github.com/ll14m4n/the-odin-project/tree/master/3_Ruby_btree-search)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_basic_data_structure/tree/master/lib)
* [Matias Pan's solution](https://github.com/kriox26/odin_ruby/tree/master/project_data_structures/bst)
* [Alex Chen's solution](https://github.com/Chenzilla/data_structure_practice)
* [Mark Viola's solution](https://github.com/markviola/the-odin-project/tree/master/12-data-structures-and-algorithms/1%20-%20Searching%20Binary%20Trees)
* [Xavier Reid's solution](https://github.com/xreid/data_structures_algorithms/tree/master/binary_tree)
* [Dan Hoying's solution](https://github.com/danhoying/basic_data_structures_and_algorithms/blob/master/searching_binary_trees.rb)
* [PiotrAleksander's solution](https://github.com/PiotrAleksander/Ruby/blob/master/drzewo_binarne.rb)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/blob/master/ruby/basic-data-structures-and-algorithms/searching_binary_tree.rb)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/blob/master/ruby/project12--searching-binary-trees/searching_binary_trees.rb)
* [Noah Prescott's solution](https://github.com/npresco/basic_data_structures_and_algorithms/blob/master/binary_search.rb)
* [poctek's solution](https://github.com/poctek/The_Odin_Project/blob/master/Learning/CS/Algorithms/binary_tree.rb)
* [Aviv Levinsky's solution](https://github.com/pugsiman/Ruby_challenges_and_algorithms/blob/master/Searching_Binary_Trees/sbt.rb)
* [Giorgos's solution](https://github.com/vinPopulaire/search_binary_trees)
* [Andrew Park's solution](https://github.com/akpark93/the_odin_project/tree/master/ruby_programming_projects/Data%20Structures)
* [Scott Bobbitt's solution](https://github.com/sco-bo/binary_search_tree)
* [srashidi's solution](https://github.com/srashidi/Data_Structures/blob/master/Node/node.rb)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/data-structures-and-algorithms/binary_search_trees)
* [James Brooks's solution](https://github.com/jhbrooks/binary-search-tree)
* [Panashe Fundira's solution](https://github.com/munyari/odin/blob/master/learn-ruby/bfs_dfs/Node.rb)
* [Matt Velez's solution](https://github.com/Timecrash/ruby-projects/blob/master/data-structures/binary_tree.rb)
* Add your solution above this line!


## Project 2: Knight's Travails

Now you're a pro with DFS and BFS.  Let's try using our search algorithms on a real problem.

A knight in chess can move to any square on the standard 8x8 chess board from any other square on the board, given enough turns (don't believe it?  See [this animation](http://upload.wikimedia.org/wikipedia/commons/c/ca/Knights-Tour-Animation.gif)).  Its basic move is two steps forward and one step to the side.  It can face any direction.

All the possible places you can end up after one move look like this:

<img src="http://0.tqn.com/d/chess/1/0/6/-/-/-/KnightMoves.gif">

### Your Task

Your task is to build a function `knight_moves` that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

You can think of the board as having 2-dimensional coordinates.  Your function would therefore look like:

  * `knight_moves([0,0],[1,2]) == [[0,0],[1,2]]`
  * `knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]` 
  * `knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]`

1. Put together a script that creates a game board and a knight.
2. Treat all possible moves the knight could make as children in a tree.  Don't allow any moves to go off the board.
2. Decide which search algorithm is best to use for this case.  Hint: one of them could be a potentially infinite series.
3. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square.  Output what that full path looks like, e.g.:

    ```language-bash
        > knight_moves([3,3],[4,3])
        You made it in 3 moves!  Here's your path:
        [3,3]
        [4,5]
        [2,4]
        [4,3]
    ```

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_data_structs_alg/knights_travails)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_7_Ruby_DataStructures/knight.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/knight-moves)
* [Michael Alexander's solution](https://github.com/betweenparentheses/project_data_structures/blob/master/knightstravails.rb)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/data-structures-and-algorithms)
* [Sergio Ribeiro's solution](https://github.com/serg1o/Data_Structures/blob/master/knight.rb)
* [Aleksandar's solution](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Basic%20Data%20Structures%20and%20Algorithms/lib/knight.rb)
* [John Quarles' solution](https://github.com/johnwquarles/Ruby-binary-trees-knights-travails/blob/master/knight.rb)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/data_structures_and_algorithms/knight_moves.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/blob/master/Project7/KnightsTravails/p2-knight.rb)
* [Jason Matthews' solution](https://github.com/fo0man/project_data_structures/blob/master/knight_travails.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/knight_moves/blob/master/knight_moves.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/algorithms/blob/master/knights_travails.rb)
* [Frank Peelen's solution](https://github.com/FrankPeelen/Data-Structures-and-Algorithms/blob/master/knight_moves.rb)
* [Brann James' solution](https://github.com/brannj/The_Odin_Project/blob/master/basic_data_structs/knight_travails.rb)
* [ll14m4n's solution](https://github.com/ll14m4n/the-odin-project/tree/master/3_Ruby_khight-moves)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_basic_data_structure/blob/master/knight_moves.rb)
* [Matias Pan's solution](https://github.com/kriox26/odin_ruby/tree/master/project_data_structures/knight_moves)
* [Alex Chen's solution](https://github.com/Chenzilla/data_structure_practice)
* [Mark Viola's solution](https://github.com/markviola/the-odin-project/tree/master/12-data-structures-and-algorithms/2%20-%20Knights%20Travail)
* [Xavier Reid's solution](https://github.com/xreid/data_structures_algorithms/blob/master/knights_travails/knight.rb)
* [Dan Hoying's solution](https://github.com/danhoying/basic_data_structures_and_algorithms/blob/master/knights_travails.rb)
* [PiotrAleksander's solution](https://github.com/PiotrAleksander/Ruby/blob/master/goniec.rb)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/blob/master/ruby/basic-data-structures-and-algorithms/knight.rb)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/blob/master/ruby/project13--knights-travails/knights_travails.rb)
* [Noah Prescott's solution](https://github.com/npresco/basic_data_structures_and_algorithms/blob/master/knight_moves.rb)
* [Alex Tsiras' solution](https://github.com/arialblack14/binary_trees/blob/master/knight.rb)
* [Giorgos's solution](https://github.com/vinPopulaire/knights_travails)
* [Scott Bobbitt's solution](https://github.com/sco-bo/knights_travails)(w/help from John Quarles' blog post)
* [srashidi's solution](https://github.com/srashidi/Data_Structures/blob/master/Knights_Travails/knight_moves.rb)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/data-structures-and-algorithms/knights_travails)
* [James Brooks's solution](https://github.com/jhbrooks/knight-moves)
* [Panashe Fundira's solution](https://github.com/munyari/odin/blob/master/learn-ruby/bfs_dfs/knight_shortest_path.rb)
* [Matt Velez's solution](https://github.com/Timecrash/ruby-projects/blob/master/data-structures/knight_traversal.rb)
* Add your solution above this line!


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* More on [Binary Search Trees from Coursera](https://www.youtube.com/watch?v=pJ6aeg8x1Ig)... it gets a bit technical.
