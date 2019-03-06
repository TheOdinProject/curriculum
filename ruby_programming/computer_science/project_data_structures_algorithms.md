### Project 1: Searching Binary Trees

You learned about [binary search trees](http://en.wikipedia.org/wiki/Binary_search_tree) -- where you take a group of data items and turn them into a tree full of nodes where each left node is "lower" than each right node.  The tree starts with the "root node" and any node with no children is called a "leaf node".

You also learned about tree search algorithms like breadth-first-search and depth-first-search.  You learned that BFS is best used to find the optimum solution but can take a very long time (impractically long for broad and deep data sets) while DFS is often much faster but will give you the FIRST solution, not necessarily the best.  Here you'll get a chance to implement both.

### Assignment 1
You'll build a simple binary tree data structure from some arbitrary input and also the "crawler" function that will locate data inside of it.

<div class="lesson-content__panel" markdown="1">
  1. Build a class `Node`.  It should have a `value` that it stores and also links to its parent and children (if they exist).  Build getters and setters for it (e.g. parent node, child node(s)).
  2. Write a method `build_tree` which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of `Node` objects appropriately placed.  Start by assuming the array you get is sorted.
  3. Now refactor your `build_tree` to handle data that isn't presorted and cannot be easily sorted prior to building the tree.  You'll need to figure out how to add a node for each of the possible cases (e.g. if it's a leaf versus in the middle somewhere).
  3. Write a simple script that runs `build_tree` so you can test it out.
  5. Build a method `breadth_first_search` which takes a target value and returns the node at which it is located using the breadth first search technique.  **Tip:** You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to search and to add new ones to the list (as you saw in the [video](https://youtu.be/9RHO6jU--GU)).  If the target node value is not located, return `nil`.
  4. Build a method `depth_first_search` which returns the node at which the target value is located using the depth first search technique.  Use an array acting as a *stack* to do this.
  5. Next, build a new method `dfs_rec` which runs a depth first search as before but this time, instead of using a stack, make this method recursive.
  6. Tips:

    1. You can think of the `dfs_rec` method as a little robot that crawls down the tree, checking if a node is the correct node and spawning other little robots to keep searching the tree.  No robot is allowed to turn on, though, until all the robots to its left have finished their task.
    2. The method will need to take in both the target value and the current node to compare against.

</div>

### Student Solutions
Submit a link below to this [file](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/computer_science/project_data_structures_algorithms.md) on the ruby course github repo with your files in it by using a pull request. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.

<details markdown="block">
  <summary> Show Student Solutions </summary>
    
* Add your solution below this line!
* [Rudi Boshoff's solution](https://github.com/RudiBoshoff/binary-search-tree/blob/master/binary_tree.rb)
* [Learnsometing's Solution](https://github.com/learnsometing/TOP-ruby-projects/tree/master/computer-science/binary-tree)
* [Chris Wegscheid's solution](https://github.com/cwegscheid08/binary_trees)
* [Simon Tharby's solution](https://github.com/jinjagit/binary_tree)
* [Smetanca52's Solution](https://github.com/Smetanca52/ruby_exercices/blob/master/searching_binary_trees.rb)
* [Mohamed Elattar's Solution](https://github.com/mohamed-elattar/odin-project-data-structures-and-algorithms/blob/master/bst.rb)
* [prw001's Solution](https://github.com/prw001/binary_tree_dfs_bfs)
* [Max Garber's Solution](https://github.com/bubblebooy/miscellaneous-exercises/blob/master/Binary%20Tree.rb)
* [Malaika (Mic) Solution](https://github.com/malaikaMI/Data_structure/blob/master/binary_tree.rb)
* [Nathan Sherburne' Solution](https://github.com/nathansherburne/ruby_practice/tree/master/data_structures/binary_search_tree)
* [Btreims' Solution](https://github.com/btreim/ruby/blob/master/binary_trees.rb)
* [Samuel Masters' Solution](https://github.com/redeyetuning/rb_binary_tree)
* [Demo318's solution](https://github.com/Demo318/ruby_data_structures_and_algorithms/blob/master/searching_binary_trees/binary_tree.rb)
* [0zra's solution](https://github.com/0zra/btree)
* [mtizim's solution](https://github.com/mtizim/odin_projects/blob/master/ruby/binarysearch.rb)
* [Ben Deltenre's solution](https://github.com/benjdelt/binary_search_trees)
* [Isil Donmez's solution](https://github.com/isildonmez/data_structures_and_algorithms/tree/master/searching_binary_trees)
* [Bruno Parga's solution](https://github.com/brunoparga/odinproject/blob/master/Ruby/bst.rb)
* [Jmooree30's solution](https://github.com/jmooree30/Data-structures-and-algorithms-.git)
* [Andrew's solution](https://github.com/andrewr224/Data-Structures)
* [Jonathan Yiv's solution](https://github.com/JonathanYiv/binary_tree)
* [justinckim3's solution](https://github.com/justinckim3/searching_binary_trees/blob/master/searching_binary_trees.rb)
* [Kasey Z'S solution](https://github.com/kasey-z/TOP-solutions/blob/master/data%20_structures_and_algorithms/searching_binary_trees/searching_binary_trees.rb)
* [SadieD'S solution](https://github.com/SadieD/data_structures_and_algorithms/blob/master/binary_tree.rb)
* [Clayton Sweetens Solution](https://github.com/cjsweeten101/OdinProjects/tree/master/binary_tree)
* [thisisned's solution](https://github.com/thisisned/binary_search_tree/blob/master/binary_search_tree.rb)
* [Ovsjah Schweinefresser's solution](https://github.com/Ovsjah/basic_data_structures_and_algorithms/blob/master/binary_tree.rb)
* [holdercp's solution](https://github.com/holdercp/searching_binary_trees)
* [jfonz412's solution](https://github.com/jfonz412/computer_science/blob/master/binary_search_tree.rb)
* [xavier solution](https://github.com/nxdf2015/odin-basic-data-structures/blob/master/searching-tree/tree.rb)
* [mindovermiles262's Solution](https://github.com/mindovermiles262/algorithms)
* [Oleh Sliusar's solution](https://github.com/OlehSliusar/binary_tree)
* [theghall's solution](https://github.com/theghall/binary-trees)
* [Nikolay Dyulgerov's solution](https://github.com/NicolayD/ruby-data-structures/blob/master/binary_tree.rb)
* [Raiko's Solution](https://github.com/Cypher0/data_structures_algorithms/tree/master/lib)
* [yilmazgunalp's solution](https://github.com/yilmazgunalp/binarytrees)
* [Ayushka's solution](https://github.com/ayushkamadji/binary_tree_ruby/blob/master/BST.rb)
* [Nicolas Amaya's solution](https://github.com/nicoasp/TOP---Ruby-Data-Structures)
* [nmac's solution](https://github.com/nmacawile/BinaryTrees/blob/master/binarytrees.rb)
* [John Phelps's Solution](https://github.com/jphelps413/odin-ruby/blob/master/data-structures/binary_tree.rb)
* [Jib's Solution](https://github.com/NuclearMachine/OdinTasks/tree/master/Searching_BinaryTrees)
* [Stefan P's solution](https://github.com/spavikevik/bst)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_data_structs_alg/bst)
* [Mazin's solution](https://github.com/muzfuz/CodeLessons/blob/master/binary_search/binary_search.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_7_Ruby_DataStructures/binarytree.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/bst-practice)
* [Michael Alexander's solution](https://github.com/betweenparentheses/project_data_structures/blob/master/binarytree.rb)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/data-structures-and-algorithms)
* [Aleksandar's solution](https://github.com/rodic/Odin-Ruby-Projects/blob/master/Projects:%20Basic%20Data%20Structures%20and%20Algorithms/lib/btree.rb)
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
* [Noah Prescott's solution](https://github.com/npresco/top/blob/master/basic_data_structures_and_algorithms/binary_search.rb)
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
* [Luke Walker's solution](https://github.com/ubershibs/ruby-programming/blob/master/algorithms/binary_search.rb)
* [Miguel Herrera's solution](https://github.com/migueloherrera/projects/blob/master/binary_trees.rb)
* [Max Gallant's solution](https://github.com/mcgalcode/Ruby/tree/master/DataStructures)
* [Ricardo Villegas' solution](https://github.com/claricardo/RubyBuildingBlocks/blob/master/algorithms/binary_search_tree.rb)
* [Jack Wilde's solution](https://github.com/WildeRunner/data_structures_projects)
* [djhart's solution](https://github.com/djhart/binary_search)
* [Fabricio Carrara's solution](https://github.com/fcarrara/ruby_data_structures/blob/master/binary_search_tree.rb)
* [DV's solution](https://github.com/dvislearning/binary_search_tree/blob/master/bst.rb)
* [Earth35's solution](https://github.com/Earth35/binary_tree_search)
* [Stefan (Cyprium)'s solution](https://github.com/dev-cyprium/DataStructures-In-Ruby)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/basic_data_structure/blob/master/binary_trees.rb)
* [John Connor's solution](https://github.com/jacgitcz/binary_tree)
* [Jean Merlet's solution](https://github.com/jeanmerlet/data_structures/blob/master/binary_tree.rb)
* [Austin Mason's solution](https://github.com/CouchofTomato/algorithm/blob/master/binary_search_tree.rb)
* [Loris Aranda's solution](https://github.com/LorisProg/ruby-binary_search_tree-knight_travails/blob/master/binary_search_tree.rb)
* [Joanna Takesian's solution](https://github.com/joannatakesian/data-structures/blob/master/binary-tree/binary-tree.rb)
* [Francisco Carlos's solution](https://github.com/fcarlosdev/the_odin_project/tree/master/data_structures/binary_search_tree)
* [at0micred's solution](https://github.com/at0micr3d/data_structure)
* [Clint's solution](https://github.com/tholymap/OdinDataStructures/blob/master/bin_tree.rb)
* [Dylan's solution](https://github.com/resputin/the_odin_project/blob/master/Ruby/data_structures/bintree2.rb)
* [Leonard Soai-Van's solution](https://github.com/leosoaivan/TOP_compsci/blob/master/binary_tree.rb)
* [Dom Goj's solution](https://github.com/booyakuhhsha/linkedLists/commit/a3928f9747d422a49801e27e6d88b0cfc3fb3324)
* [Jerry Gao's solution](https://github.com/blackwright/odin/tree/master/ruby_binary_tree)
* [Sophia Wu's solution](https://github.com/SophiaLWu/project-basic-data-structs-and-algorithms/blob/master/binary_tree.rb)
* [Anthony Vumbaca's solution](https://github.com/tvumbaca/basic_data_structures/blob/master/binary_tree.rb)
* [Braydon Pacheco's solution](https://github.com/pacheeko/data_structures/blob/master/bst.rb)
* [Simon's solution](https://github.com/SimonSomlai/Odin/blob/master/Ruby/data_tree.rb)
* [Kyle Thomson's solution](https://github.com/idynkydnk/binary_trees)
* [Zach Beaird's solution](https://github.com/zbbeaird89/Basic-Data-Structures-and-Algorithms/blob/master/binary_tree.rb)
* [Daniel Varcas's solution](https://github.com/d-zer0/binary_search_trees/blob/master/binary_search_trees.rb)
* [Luján Fernaud's solution](https://github.com/lujanfernaud/ruby-binary-search-tree)
* [Cody Buffaloe's solution](https://github.com/CodyLBuffaloe/Data_Structures)
* [Jason Dancocks's solution](https://github.com/JasonDancocks/Ruby/blob/master/binarysearchtree/binarysearchtree.rb)
* [Jamesredux's solution](https://github.com/Jamesredux/binary_tree)
* [Oliver Curting's solution - with one-line dfs_rec](https://github.com/Curting/searching_binary_trees/blob/master/searching_binary_trees.rb)
* [HSaad's solution](https://github.com/HSaad/data-structure-algorithms/blob/master/binary_tree.rb)
* [Punnadittr's solution](https://github.com/punnadittr/binary_tree/blob/master/binary_tree.rb)
* [Areeba's solution](https://github.com/AREEBAISHTIAQ/binary-tree/blob/master/node.rb)
* [Alex's solution](https://github.com/alexcorremans/binary_search_tree)
* [Tommy's solution](https://github.com/hoangtommy/dataStructures-Algorithms)
* [Emil Dimitrov's solution](https://github.com/imemdm/searching-binary-trees)
* [Leila Alderman's solution](https://github.com/leila-alderman/binary-tree)
* [Martyn Jones' solution](https://github.com/martynj2001/binarytree)

</details>

### Project 2: Knight's Travails

Now you're a pro with DFS and BFS.  Let's try using our search algorithms on a real problem.

For this project, you'll need to use a data structure that's similar (but not identical) to a binary tree. For a summary of a few different examples, reference [this article](https://www.khanacademy.org/computing/computer-science/algorithms/graph-representation/a/describing-graphs).

A knight in chess can move to any square on the standard 8x8 chess board from any other square on the board, given enough turns (don't believe it?  See [this animation](https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Knight%27s_tour_anim_2.gif/250px-Knight%27s_tour_anim_2.gif)).  Its basic move is two steps forward and one step to the side.  It can face any direction.

All the possible places you can end up after one move look like this:

<img src="https://i.imgur.com/mHQqH08.gif">

### Assignment 2
Your task is to build a function `knight_moves` that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

You can think of the board as having 2-dimensional coordinates.  Your function would therefore look like:

  * `knight_moves([0,0],[1,2]) == [[0,0],[1,2]]`
  * `knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]`
  * `knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]`

<div class="lesson-content__panel" markdown="1">
1. Put together a script that creates a game board and a knight.
2. Treat all possible moves the knight could make as children in a tree.  Don't allow any moves to go off the board.
2. Decide which search algorithm is best to use for this case.  Hint: one of them could be a potentially infinite series.
3. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square.  Output what that full path looks like, e.g.:

~~~bash
  > knight_moves([3,3],[4,3])
  => You made it in 3 moves!  Heres your path:
    [3,3]
    [4,5]
    [2,4]
    [4,3]
~~~
</div>

### Student Solutions
Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

<details markdown="block">
  <summary> Show Student Solutions </summary>
    
* Add your solution below this line!
* [Rudi Boshoff's solution](https://github.com/RudiBoshoff/binary-search-tree/blob/master/knight_moves.rb)
* [Learnsometing's Solution](https://github.com/learnsometing/TOP-ruby-projects/tree/master/computer-science/knights-moves)
* [Chris Wegscheid's solution](https://github.com/cwegscheid08/knight_work)
* [Simon Tharby's solution](https://github.com/jinjagit/knight)
* [Mohamed Elattar's Solution](https://github.com/mohamed-elattar/odin-project-data-structures-and-algorithms/blob/master/knight-moves.rb)
* [prw001's Solution](https://github.com/prw001/knight_moves)
* [Max Garber's Solution](https://github.com/bubblebooy/miscellaneous-exercises/blob/master/chess.rb)
* [Malaika (Mic) Solution](https://github.com/malaikaMI/Kinghts_trevail/blob/master/kt.rb)
* [Btreims' Solution](https://github.com/btreim/ruby/blob/master/knight_moves.rb)
* [Samuel Masters' Solution](https://github.com/redeyetuning/rb_knights_travails)
* [Demo318's solution](https://github.com/Demo318/ruby_data_structures_and_algorithms/tree/master/knights_travails)
* [Javier Machin's solution](https://github.com/Javier-Machin/Knight_Travails/blob/master/Knight_travails.rb)
* [0zra's solution](https://github.com/0zra/knight)
* [mtizim's solution](https://github.com/mtizim/odin_projects/blob/master/ruby/chessknight.rb)
* [Ben Deltenre's solution](https://github.com/benjdelt/knights_travails)
* [Isil Donmez's solution](https://github.com/isildonmez/data_structures_and_algorithms/tree/master/knights_project)
* [Bruno Parga's solution](https://github.com/brunoparga/odinproject/blob/master/Ruby/knight_joint.rb)
* [Jmooree30's solution](https://github.com/jmooree30/Knights_Travels.git)
* [Andrew's solution](https://github.com/andrewr224/Knight-s-Travails)
* [Jonathan Yiv's solution](https://github.com/JonathanYiv/knights_travails)
* [justinckim3's solution](https://github.com/justinckim3/knights_travails/blob/master/knights_travails.rb)
* [Kasey Z's solution](https://github.com/kasey-z/TOP-solutions/blob/master/data%20_structures_and_algorithms/knights_travails/knight_moves.rb)
* [Dallaire's solution](https://github.com/Dallaire/knights_travails)
* [SadieD's solution](https://github.com/SadieD/data_structures_and_algorithms/blob/master/knights_travails.rb)
* [Adsy430's Solution](https://github.com/adampal/knight_moves)
* [Clayton Sweeten's Solution](https://github.com/cjsweeten101/OdinProjects/blob/master/knights_travails/travail.rb)
* [thisisned's solution](https://github.com/thisisned/knights_travails/blob/master/knights_travails.rb)
* [Ovsjah Schweinefresser's solution](https://github.com/Ovsjah/basic_data_structures_and_algorithms/blob/master/knight_moves.rb)
* [holdercp's solution](https://github.com/holdercp/knights-travails)
* [jfonz412's solution](https://github.com/jfonz412/computer_science/blob/master/knight/lib/knight.rb)
* [xavier solution](https://github.com/nxdf2015/odin-basic-data-structures/tree/master/knight)
* [mindovermiles262's Solution](https://github.com/mindovermiles262/knight-travails)
* [Oleh Sliusar's solution](https://github.com/OlehSliusar/knights_travails)
* [Nikolay Dyulgerov's solution](https://github.com/NicolayD/ruby-data-structures/blob/master/knights_travails.rb)
* [theghall's solution](https://github.com/theghall/knights-travails)
* [Raiko's Solution](https://github.com/Cypher0/data_structures_algorithms)
* [yilmazgunalp's solution](https://github.com/yilmazgunalp/knight_moves)
* [Ayushka's solution](https://github.com/ayushkamadji/knights_travails_ruby)
* [Nicolas Amaya's solution](https://github.com/nicoasp/TOP---Ruby-Data-Structures)
* [nmac's solution](https://github.com/nmacawile/KnightsTravails/blob/master/knight.rb)
* [Stefan P's solution](https://github.com/spavikevik/knight_travails)
* [Leonard Soai-van's solution](https://github.com/leosoaivan/TOP_compsci)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_data_structs_alg/knights_travails)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_7_Ruby_DataStructures/knight.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/knight-moves)
* [Michael Alexander's solution](https://github.com/betweenparentheses/project_data_structures/blob/master/knightstravails.rb)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/data-structures-and-algorithms)
* [Sergio Ribeiro's solution](https://github.com/serg1o/Data_Structures/blob/master/knight.rb)
* [Aleksandar's solution](https://github.com/rodic/Odin-Ruby-Projects/blob/master/Projects:%20Basic%20Data%20Structures%20and%20Algorithms/lib/knight.rb)
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
* [Noah Prescott's solution](https://github.com/npresco/top/blob/master/basic_data_structures_and_algorithms/knight_moves.rb)
* [Alex Tsiras' solution](https://github.com/arialblack14/binary_trees/blob/master/knight.rb)
* [Giorgos's solution](https://github.com/vinPopulaire/knights_travails)
* [Scott Bobbitt's solution](https://github.com/sco-bo/knights_travails)(w/help from John Quarles' blog post)
* [srashidi's solution](https://github.com/srashidi/Data_Structures/blob/master/Knights_Travails/knight_moves.rb)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/data-structures-and-algorithms/knights_travails)
* [James Brooks's solution](https://github.com/jhbrooks/knight-moves)
* [Panashe Fundira's solution](https://github.com/munyari/odin/blob/master/learn-ruby/bfs_dfs/knight_shortest_path.rb)
* [Matt Velez's solution](https://github.com/Timecrash/ruby-projects/blob/master/data-structures/knight_traversal.rb)
* [Luke Walker's solution](https://github.com/ubershibs/ruby-programming/blob/master/algorithms/knight_moves.rb)
* [Miguel Herrera's solution](https://github.com/migueloherrera/projects/blob/master/knights_travails.rb)
* [Tomasz Kula's solution](https://github.com/zetsnotdead/Knights-Travails) including visual representation of the steps
* [Max Gallant's solution](https://github.com/mcgalcode/Ruby/tree/master/DataStructures)
* [Ricardo Villegas' solution](https://github.com/claricardo/RubyBuildingBlocks/blob/master/algorithms/knight_moves.rb)
* [Jack Wilde's solution](https://github.com/WildeRunner/data_structures_projects)
* [djhart's solution](https://github.com/djhart/knight_path)
* [Fabricio Carrara's solution](https://github.com/fcarrara/ruby_data_structures/tree/master/knight_moves)
* [Earth35's solution](https://github.com/Earth35/knight_moves)
* [DV's solution](https://github.com/dvislearning/knight_travels/blob/master/knight_travels.rb)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/basic_data_structure/blob/master/knight_moves.rb)
* [John Connor's solution](https://github.com/jacgitcz/knight_moves)\
* [Jean Merlet's solution](https://github.com/jeanmerlet/ruby_games/blob/master/chess/knight_movement.rb)
* [Jiazhi Guo's solution](https://github.com/jerrykuo7727/knights_travails)
* [Austin Mason's solution](https://github.com/CouchofTomato/algorithm/blob/master/knights_travails.rb)
* [Loris Aranda's solution](https://github.com/LorisProg/ruby-binary_search_tree-knight_travails/blob/master/knight_moves.rb)
* [Francisco Carlos's solution](https://github.com/fcarlosdev/the_odin_project/tree/master/data_structures/knight_travails)
* [at0micred's solution](https://github.com/at0micr3d/data_structure)
* [Clint's solution](https://github.com/tholymap/OdinDataStructures/blob/master/knight_moves.rb)
* [Dylan's solution](https://github.com/resputin/the_odin_project/blob/master/Ruby/data_structures/knight.rb)
* [David Chapman's solution](https://github.com/davidchappy/odin_training_projects/tree/master/knights_travails)
* [Dom Goj's solution](https://github.com/booyakuhhsha/linkedLists/blob/master/knight2.rb)
* [Jerry Gao's solution](https://github.com/blackwright/odin/tree/master/ruby_knights_travails)
* [Sophia Wu's solution](https://github.com/SophiaLWu/project-basic-data-structs-and-algorithms/blob/master/knights_travails.rb)
* [Anthony Vumbaca's solution](https://github.com/tvumbaca/basic_data_structures/blob/master/knights_travails.rb)
* [Braydon Pacheco's solution](https://github.com/pacheeko/data_structures/blob/master/knights_travails.rb)
* [Simon's solution](https://github.com/SimonSomlai/Odin/tree/master/Ruby/knight_travails)
* [Kyle Thomson's solution](https://github.com/idynkydnk/knight_moves)
* [Zach Beaird's solution](https://github.com/zbbeaird89/Basic-Data-Structures-and-Algorithms/blob/master/knight.rb)
* [Luján Fernaud's solution](https://github.com/lujanfernaud/ruby-knights-travails)
* [Cody Buffaloe's solution](https://github.com/CodyLBuffaloe/Knights_Travails)
* [Jonathan Marks' solution](https://github.com/johnjmarks4/knights_travails)
* [Jamesredux's solution](https://github.com/Jamesredux/knight_moves)
* [Oliver Curting's solution](https://github.com/Curting/knights_travails)
* [HSaad's solution](https://github.com/HSaad/data-structure-algorithms/blob/master/knights_travails.rb)
* [Punnadittr's solution](https://github.com/punnadittr/knight_traversal/blob/master/knight.rb)
* [Akash's Solution](https://github.com/Akash-sopho/knights_travels)
* [Areeba's Solution](https://github.com/AREEBAISHTIAQ/knight-travails/blob/master/knight-travails.rb)
* [Alex's solution](https://github.com/alexcorremans/knight)
* [Emil Dimitrov's solution](https://github.com/imemdm/knight-moves)
* [Leila Alderman's solution](https://github.com/leila-alderman/knight_moves)
* [Martyn Jones' solution](https://github.com/martynj2001/binarytree)

</details>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* More on [Binary Search Trees from Coursera](https://www.youtube.com/watch?v=pJ6aeg8x1Ig)... it gets a bit technical.
