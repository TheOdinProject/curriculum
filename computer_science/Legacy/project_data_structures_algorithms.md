### Project 1: Binary Search Trees

You have learned about [binary search trees](http://en.wikipedia.org/wiki/Binary_search_tree) -- where you take a group of data items and turn them into a tree full of nodes where each left node is "lower" than each right node.  The tree starts with the "root node" and any node with no children is called a "leaf node". You have also learned about tree traversal algorithms like breadth-first and depth-first.

Now, let's take a look at balanced binary search trees (BST). Read [this article](https://www.geeksforgeeks.org/sorted-array-to-balanced-bst/) and watch [this video](https://youtu.be/VCTP81Ij-EM) to understand the basic algorithm used to build a balanced BST. Although these two resources do not use Ruby, you should understand it enough to develop your own pseudocode.

### Assignment 1
You'll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.

<div class="lesson-content__panel" markdown="1">

  1. Build a `Node` class.  It is should have attributes for the data it stores as well as its left and right children. As a bonus, try including the `Comparable` module and make nodes compare using their data attribute.

  2. Build a `Tree` class which accepts an array when initialized. The `Tree` class should have a `root` attribute which uses the return value of `#build_tree` which you'll write next.

  3. Write a `#build_tree` method which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree full of `Node` objects appropriately placed (don't forget to sort and remove duplicates!). The `#build_tree` method should return the level-1 root node.

  4. Write an `#insert` and `#delete` method which accepts a value to insert/delete (you'll have to deal with several cases for delete such as when a node has children or not). If you need additional resources, check out these two articles on [inserting](https://www.geeksforgeeks.org/binary-search-tree-set-1-search-and-insertion/?ref=lbp) and [deleting](https://www.geeksforgeeks.org/binary-search-tree-set-2-delete/?ref=lbp), or [this video](https://youtu.be/wcIRPqTR3Kc) with several visual examples.

  5. Write a `#find` method which accepts a value and returns the node with the given value.

  6. Write a `#level_order` method that returns an array of values. This method should traverse the tree in breadth-first level order. This method can be implemented using either iteration or recursion (try implementing both!). **Tip:** You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list (as you saw in the [video](https://www.youtube.com/watch?v=86g8jAQug04)).

  7. Write `#inorder`, `#preorder`, and `#postorder` methods that returns an array of values. Each method should traverse the tree in their respective depth-first order.

  8. Write a `#height` method which accepts a node and returns its height. Height is defined as the number of edges in longest path from a given node to a leaf node.
  
  9. Write a `#depth` method which accepts a node and returns the depth(number of levels) beneath the node.

  10. Write a `#balanced?` method which checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1.

  11. Write a `#rebalance` method which rebalances an unbalanced tree. **Tip:** You'll want to create a level-order array of the tree before passing the array back into the `#build_tree` method.

  12. Write a simple driver script that does the following:

    1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
    2. Confirm that the tree is balanced by calling `#balanced?`
    3. Print out all elements in level, pre, post, and in order
    4. try to unbalance the tree by adding several numbers > 100
    5. Confirm that the tree is unbalanced by calling `#balanced?`
    6. Balance the tree by calling `#rebalance`
    7. Confirm that the tree is balanced by calling `#balanced?`
    8. Print out all elements in level, pre, post, and in order
</div>

**Tip:** If you would like to visualize your binary search tree, here is a `#pretty_print` method that a student wrote and shared on Discord:

~~~ruby
def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end
~~~

### Student Solutions
Submit a pull request with a link to your solution in this [file](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/computer_science/project_data_structures_algorithms.md) when your project is complete. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for details on how.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* [nhleto's Solution](https://github.com/nhleto/Binary-Tree)
* [cbpolley's Solution](https://github.com/cbpolley/rubyTest/blob/master/balanced_BST.rb)
* [Risan's Solution](https://github.com/risanto/ruby-programming/blob/master/14_binary-search-trees.rb)
* [James's Solution](https://github.com/jegrieve/binary_search_trees)
* [Evelyn's Solution](https://github.com/evive82/Odin-Project-Binary-Search-Tree)
* [Aaron's Solution](https://github.com/Aaron-McD/binary-search-tree)
* [Axel Lopez's Solution](https://github.com/lopezaxel/binary-search-trees)
* [Chau Nguyen's Solution](https://github.com/VanQuishi/ruby_practice/blob/master/bst.rb)
* [ChargrilledChook's Solution](https://github.com/ChargrilledChook/binary-search-tree)
* [Coding Shawn's Solution](https://github.com/CodingShawn/TOP-Ruby-Binary-Search-Trees)
* [Kfollen93's Solution](https://github.com/Kfollen93/Binary_Search_Trees)
* [Tilda Udufo's Solution](https://github.com/TildaDares/binary_search_tree)
* [BLuu's solution](https://github.com/bryanluu/TOP_ruby/blob/master/data_structures/binary_search_tree.rb)
* [Sam Eff's solution](https://github.com/SamEff/binary_search_tree)
* [Darren's solution](https://github.com/DarrenLo0530/ruby-tests/tree/master/binary_search_tree)
* [irlgabriel's solution](https://github.com/irlgabriel/the-odin-project/tree/master/tree)
* [tenacious-qi's Solution](https://github.com/Tenacious-Qi/binary_search_tree)
* [threeaces' Solution](https://github.com/threeaces/binary_search_tree_ruby_TOP)
* [andrewjh271's Solution](https://github.com/andrewjh271/binary_search_tree)
* [Brandon Austin's Solution](https://github.com/brandonricharda/Binary-Search-Tree)
* [fillingthemoon's Solution](https://github.com/fillingthemoon/binary-search-trees)
* [rryand's Solution](https://github.com/rryand/ruby_binary_search_tree)
* [Saul-Good-Homie's Solution](https://github.com/Saul-Good-Homie/ruby-building-blocks/tree/master/binary_search)
* [Christian's Solution](https://github.com/rueeazy/ruby-exercises/tree/master/binary_search_tree)
* [YesSeri's Solution](https://github.com/YesSeri/binary_search_tree)
* [Michael K's Solution](https://github.com/a0x77ry/odin/tree/master/ruby-exercises/binary_tree)
* [rlmoser's Solution](https://github.com/rlmoser99/ruby_exercises/tree/master/binary_search_tree)
* [Jose Bohorquez's Solution](https://github.com/Bhrqz/binary_tree_search/blob/master/binary_tree_search.rb)
* [pudu87's Solution](https://github.com/pudu87/binary-search-trees)
* [Philipp's Solution](https://github.com/philipp-mcvity/odin-ruby.binary_search_trees)
* [Olugbade Olalekan's Solution](https://github.com/gbadesimple/binary_tree)
* [leetie's Solution](https://github.com/leetie/Knights_travails)
* [jodokusquack's Solution with Extra Credit](https://github.com/jodokusquack/ruby_binary_search_tree)
* [Billy's Solution](https://github.com/bcoffin9/project_binary_search_trees)
* [Bradley's Solution with Extra Credit](https://github.com/spaceincase/odin-project-exercises/tree/master/binary_search_trees)
* [Run After's Solution](https://github.com/run-after/data_structures-algorithms/blob/master/binary_search_tree.rb)
* [Sher's Solution](https://github.com/sher-s7/binary_search_tree)
* [Lucas Bide's Solution](https://github.com/Lucas-Bide/binary_tree)
* [Nasser Abachi's Solution](https://github.com/abachi/theodinproject/tree/master/building-projects/binary_search_trees)
* [Robin's Solution](https://github.com/CoolGlasses/data_structures_algorithms)
* [Nikolas Broman's Solution](https://github.com/nikolasbroman/binary_search_tree)
* [Ian's Solution](https://github.com/IanMKesler/binary_tree)
* [Andrija Jelenkovic's Solution](https://github.com/Amdrija/ruby-practice)
* [Chris' Solution](https://github.com/CSalois114/project_searching_binary_trees/blob/master/searching_binary_trees.rb)
* [Jose Salvador's Solution](https://github.com/Jsalvadorpp/Ruby-Data-Structures/blob/master/binaryTree.rb)
* [Alain Suarez's Solution](https://gitlab.com/asuar/ruby-binary-search-tree)
* [Jay Burbyga's Solution](https://github.com/Jaybur1/ruby_exercises/blob/master/binary_search/binary_search.rb)
* [BShowen's Solution](https://github.com/BShowen/Linked_list_in_Ruby)
* [George Zhu's Solution](https://github.com/georgezhu11/binary_tree/blob/master/binary_tree.rb)
* [Arilson Souza Solution](https://github.com/arilsonsouza/the_odin_project/blob/master/ruby/project_data_structures_and_algorithms/binary_tree.rb)
* [Vollantre's Solution](https://github.com/vollantre/binary_tree/blob/master/binary_tree.rb)
* [Braxton Lemmon's Solution](https://github.com/braxtonlemmon/binary_trees)
* [Kevin Vuong's Solution](https://github.com/fffear/binary_search_tree)
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
* [Narek's solution](https://github.com/narekokr/binary-search-tree)
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
* [Jean Merlet's solution](https://github.com/jeanmerlet/ruby_misc/blob/master/data_structures/binary_tree.rb)
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
* [Mojotron's solution](https://github.com/mojotron/binary-search-tree)
* [vanny96's Solution](https://github.com/vanny96/binary-trees)
* [Vitaly Osipov's Solution](https://github.com/vi7ali/ruby-practice/blob/master/binary-tree/binary_tree.rb)
* [JamCry's Solution](https://github.com/jamcry/ruby-advanced-exercises/blob/master/binary_search_tree.rb)
* [Rey van den Berg's Solution](https://github.com/Rey810/Data-Structures-and-Algorithms)
* [Alex Krewson's Solution](https://github.com/alexkrewson/data_structures_and_algorithms)
* [Robert Dunbar's Solution](https://github.com/RobertDunbar/ruby-binary-trees)
* [Ben Fowler's Solution](https://github.com/benfowler04/ruby-cs/blob/master/binary_tree.rb)
* [Sergej Jurchenko's Solution](https://github.com/Sergyurch/BinaryTree/blob/master/BinaryTree.rb)
* [Brett Bonnet's Solution](https://github.com/Brett-Bonnet/binary-search-tree)
* [Drew Goddyn's Solution](https://github.com/Drew-Goddyn/binary_search_tree)
* [Toberoni's Solution](https://github.com/toberoni/the_odin_project/tree/master/ruby_programming/binary_search_tree)
* [Bendee's Solution](https://github.com/bendee48/Data-Structures)
* [Jay Conner's Solution](https://github.com/cleve703/data_structures_algorithms/binary_search_tree.rb)
* [guacamobley's Solution](https://github.com/guacamobley/data-structures-and-algorithms/blob/master/binary-search-tree.rb)
* [Robert Suazo's Solution](https://github.com/rsuazo/binary_search_tree/blob/master/binary_search_tree.rb)
* [hyperturing's Solution](https://github.com/hyperturing/data-structures/tree/master/binary_search_tree)
* [Sanyogita's Solution](https://github.com/SanyogitaPandit/RubyProgramming/tree/master/binary_search_tree)
* [Rob Dulabon's Solution](https://github.com/RDulabon/Binary_Search_Tree)
* [Timework's Solution](https://github.com/Timework/search_tree/blob/master/tree.rb)
* [Cinthia's Solution](https://github.com/cinthiagodoi/binary_search_tree)
* [Matt M's Solution](https://github.com/MattMiller1989/Binary-Tree)
* [fussykyloren's Solution](https://github.com/fussykyloren/ruby-data-structures/tree/master/binary-search-tree)
* [Cameron St. Amant's Solution](https://github.com/CameronStAmant/The_Odin_Project/blob/master/Ruby_projects/Data_Structures_and_Algorithms/Binary_tree.rb)
* [mpiriya's Solution](https://github.com/mpiriya/ruby/blob/master/data-structures/binary_search_tree.rb)
* [Sandy's Solution](https://github.com/kuosandys/top-ruby-assignments/blob/master/bst_2.rb)
* [JvPelai's Solution](https://github.com/JvPelai/binary-search-trees)
* [Rémi Borfigat’s Solution](https://github.com/remiborfigat/binary_search_trees)
* [Adam's Solution](https://github.com/abohannon/ruby-sandbox/blob/master/exercises/binary_search_trees.rb)
* [msespos's Solution](https://github.com/msespos/balanced-bst/blob/master/main.rb)
* [bhenning83's Solution](https://github.com/bhenning83/binary_search_tree/blob/master/bst.rb)
* [tim87henry's Solution](https://github.com/tim87henry/ruby_practice/blob/master/binary_search_tree.rb)

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
  => You made it in 3 moves!  Here's your path:
    [3,3]
    [4,5]
    [2,4]
    [4,3]
~~~
</div>

### Student Solutions
Submit a pull request with a link to your solution in this [file](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/computer_science/project_data_structures_algorithms.md) when your project is complete. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for details on how.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* [Risan's Solution](https://github.com/risanto/knight-travails) - [View in repl.it](https://repl.it/@Risanto/knight-travails#knight_moves.rb)
* [cbpolley's Solution](https://github.com/cbpolley/rubyTest/blob/master/knights_travails.rb) - [View in repl.it](https://repl.it/@cbpolley/knightstravails)
* [James's Solution](https://github.com/jegrieve/Knight-s_Travails)
* [Aaron's Solution](https://github.com/Aaron-McD/knight-travails)
* [Kfollen93's Solution](https://github.com/Kfollen93/Knights_Travails)
* [ChargrilledChook's Solution](https://github.com/ChargrilledChook/knights-travails)
* [Axel Lopez's Solution](https://github.com/lopezaxel/knight_travails)
* [Aaron Contreras's Solution](https://github.com/aaron-contreras/knights_travails)
* [Chau Nguyen's Solution](https://github.com/VanQuishi/ruby_practice/blob/master/knight_travails.rb)
* [Aaron Contreras's Solution](https://https://github.com/aaron-contreras/knights_travails)
* [Coding Shawn's Solution](https://github.com/CodingShawn/TOP-Ruby-Knight-Travails)
* [palebluudot's Solution](https://github.com/bryanluu/TOP_ruby/blob/master/data_structures/knight_moves.rb)
* [Brandon Austin's Solution](https://github.com/brandonricharda/Knights-Travails)
* [Tilda Udufo's Solution](https://github.com/TildaDares/knight_travails)
* [tenacious-qi's Solution](https://github.com/Tenacious-Qi/knights_travails)
* [threeaces' Solution](https://github.com/threeaces/knights_travails_ruby/tree/master/knights_travails)
* [Sam Eff's Solution](https://github.com/SamEff/knights_travails)
* [Darren's Solution](https://github.com/DarrenLo0530/ruby-tests/tree/master/knight_travail)
* [irlgabriel's Solution](https://github.com/irlgabriel/the-odin-project/tree/master/knight-moves)
* [andrewjh271's Solution](https://github.com/andrewjh271/knight_travails)
* [fillingthemoon's Solution](https://github.com/fillingthemoon/knights-travails)
* [Saul-Good-Homie's Solution](https://github.com/Saul-Good-Homie/ruby-building-blocks/tree/master/knight_moves)
* [rryand's Solution](https://github.com/rryand/knight_moves)
* [Christian's Solution](https://github.com/rueeazy/ruby-exercises/tree/master/knights-travails)
* [Jose Bohorquez's Solution](https://github.com/Bhrqz/knight_moves/blob/master/knigth_moves.rb)
* [YesSeri's Solution](https://github.com/YesSeri/knights_travails)
* [Michael K's Solution](https://github.com/a0x77ry/odin/tree/master/ruby-exercises/knights_travails)
* [rlmoser's Solution](https://github.com/rlmoser99/ruby_exercises/tree/master/knights_travails)
* [pudu87's Solution](https://github.com/pudu87/knights-travails)
* [Philipp's Solution](https://github.com/philipp-mcvity/odin-ruby.knight-s_travails)
* [Olugbade Olalekan's Solution](https://github.com/gbadesimple/data-structure_knight_travail)
* [jodokusquack's Solution](https://github.com/jodokusquack/knights_travails)
* [Billy's Solution](https://github.com/bcoffin9/project_springer_travails)
* [proto-dylan's Solution](https://github.com/proto-dylan/knight_moves/blob/master/knight_moves.rb)
* [fossegrim's Solution](https://github.com/olav35/data-structures-and-algorithms/blob/master/knight's_travails.rb)
* [Run After's Solution](https://github.com/run-after/data_structures-algorithms/blob/master/knight_moves.rb)
* [Nasser Abachi's Solution](https://github.com/abachi/theodinproject/tree/master/building-projects/knights_travails)
* [Robin's Solution](https://github.com/CoolGlasses/data_structures_algorithms/blob/master/knights_travails.rb)
* [Nikolas Broman's solution](https://github.com/nikolasbroman/knights_travails)
* [Ian's Solution](https://github.com/IanMKesler/knight-s_travails)
* [Chris' Solution](https://github.com/CSalois114/project_knight_moves/blob/master/knight_moves.rb)
* [JFAldridge's Solution](https://github.com/JFAldridge/knight_moves)
* [Jose Salvador's Solution](https://github.com/Jsalvadorpp/Ruby-Data-Structures/blob/master/KnightsTravails.rb)
* [Alain Suarez's Solution](https://gitlab.com/asuar/ruby-knights-tour)
* [Jay Burbyga's Solution](https://github.com/Jaybur1/ruby_exercises/blob/master/knights_travails/knights_travails.rb)
* [BShowen's Solution](https://github.com/BShowen/Knights_travails)
* [George Zhu's solution](https://github.com/georgezhu11/knight_moves/blob/master/knight_moves.rb)
* [Arilson Souza Solution](https://github.com/arilsonsouza/the_odin_project/blob/master/ruby/project_data_structures_and_algorithms/knight_moves.rb)
* [Vollantre's solution](https://github.com/vollantre/knight_moves)
* [Kevin Vuong's solution](https://github.com/fffear/knight_travails)
* [Braxton Lemmon's solution](https://github.com/braxtonlemmon/knight_moves)
* [Nicolas Espinoza's solution](https://github.com/nicospz/knight-moves/blob/master/knight-moves.rb)
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
* [Matias Pan's Solution](https://github.com/kriox26/odin_ruby/tree/master/project_data_structures/knight_moves)
* [Alex Chen's Solution](https://github.com/Chenzilla/data_structure_practice)
* [Mark Viola's Solution](https://github.com/markviola/the-odin-project/tree/master/12-data-structures-and-algorithms/2%20-%20Knights%20Travail)
* [Xavier Reid's Solution](https://github.com/xreid/data_structures_algorithms/blob/master/knights_travails/knight.rb)
* [Dan Hoying's Solution](https://github.com/danhoying/basic_data_structures_and_algorithms/blob/master/knights_travails.rb)
* [PiotrAleksander's Solution](https://github.com/PiotrAleksander/Ruby/blob/master/goniec.rb)
* [Florian Mainguy's Solution](https://github.com/florianmainguy/theodinproject/blob/master/ruby/basic-data-structures-and-algorithms/knight.rb)
* [Sander Schepens's Solution](https://github.com/schepens83/theodinproject.com/blob/master/ruby/project13--knights-travails/knights_travails.rb)
* [Noah Prescott's Solution](https://github.com/npresco/top/blob/master/basic_data_structures_and_algorithms/knight_moves.rb)
* [Alex Tsiras' Solution](https://github.com/arialblack14/binary_trees/blob/master/knight.rb)
* [Giorgos's Solution](https://github.com/vinPopulaire/knights_travails)
* [Scott Bobbitt's Solution](https://github.com/sco-bo/knights_travails)(w/help from John Quarles' blog post)
* [srashidi's Solution](https://github.com/srashidi/Data_Structures/blob/master/Knights_Travails/knight_moves.rb)
* [cdouglass's Solution](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/data-structures-and-algorithms/knights_travails)
* [James Brooks's Solution](https://github.com/jhbrooks/knight-moves)
* [Panashe Fundira's Solution](https://github.com/munyari/odin/blob/master/learn-ruby/bfs_dfs/knight_shortest_path.rb)
* [Matt Velez's Solution](https://github.com/Timecrash/ruby-projects/blob/master/data-structures/knight_traversal.rb)
* [Luke Walker's Solution](https://github.com/ubershibs/ruby-programming/blob/master/algorithms/knight_moves.rb)
* [Miguel Herrera's Solution](https://github.com/migueloherrera/projects/blob/master/knights_travails.rb)
* [Tomasz Kula's Solution](https://github.com/zetsnotdead/Knights-Travails) including visual representation of the steps
* [Max Gallant's Solution](https://github.com/mcgalcode/Ruby/tree/master/DataStructures)
* [Ricardo Villegas' Solution](https://github.com/claricardo/RubyBuildingBlocks/blob/master/algorithms/knight_moves.rb)
* [Jack Wilde's Solution](https://github.com/WildeRunner/data_structures_projects)
* [djhart's Solution](https://github.com/djhart/knight_path)
* [Fabricio Carrara's Solution](https://github.com/fcarrara/ruby_data_structures/tree/master/knight_moves)
* [Earth35's Solution](https://github.com/Earth35/knight_moves)
* [DV's Solution](https://github.com/dvislearning/knight_travels/blob/master/knight_travels.rb)
* [Shala Qweghen's Solution](https://github.com/ShalaQweghen/basic_data_structure/blob/master/knight_moves.rb)
* [John Connor's Solution](https://github.com/jacgitcz/knight_moves)\
* [Jean Merlet's Solution](https://github.com/jeanmerlet/ruby_games/blob/master/chess/knight_movement.rb)
* [Jiazhi Guo's Solution](https://github.com/jerrykuo7727/knights_travails)
* [Austin Mason's Solution](https://github.com/CouchofTomato/algorithm/blob/master/knights_travails.rb)
* [Loris Aranda's Solution](https://github.com/LorisProg/ruby-binary_search_tree-knight_travails/blob/master/knight_moves.rb)
* [Francisco Carlos's Solution](https://github.com/fcarlosdev/the_odin_project/tree/master/data_structures/knight_travails)
* [at0micred's Solution](https://github.com/at0micr3d/data_structure)
* [Clint's Solution](https://github.com/tholymap/OdinDataStructures/blob/master/knight_moves.rb)
* [Dylan's Solution](https://github.com/resputin/the_odin_project/blob/master/Ruby/data_structures/knight.rb)
* [David Chapman's solution](https://github.com/davidchappy/odin_training_projects/tree/master/knights_travails)
* [Dom Goj's Solution](https://github.com/booyakuhhsha/linkedLists/blob/master/knight2.rb)
* [Jerry Gao's Solution](https://github.com/blackwright/odin/tree/master/ruby_knights_travails)
* [Sophia Wu's Solution](https://github.com/SophiaLWu/project-basic-data-structs-and-algorithms/blob/master/knights_travails.rb)
* [Anthony Vumbaca's Solution](https://github.com/tvumbaca/basic_data_structures/blob/master/knights_travails.rb)
* [Braydon Pacheco's Solution](https://github.com/pacheeko/data_structures/blob/master/knights_travails.rb)
* [Simon's Solution](https://github.com/SimonSomlai/Odin/tree/master/Ruby/knight_travails)
* [Kyle Thomson's Solution](https://github.com/idynkydnk/knight_moves)
* [Zach Beaird's Solution](https://github.com/zbbeaird89/Basic-Data-Structures-and-Algorithms/blob/master/knight.rb)
* [Luján Fernaud's Solution](https://github.com/lujanfernaud/ruby-knights-travails)
* [Cody Buffaloe's Solution](https://github.com/CodyLBuffaloe/Knights_Travails)
* [Jonathan Marks' Solution](https://github.com/johnjmarks4/knights_travails)
* [Jamesredux's Solution](https://github.com/Jamesredux/knight_moves)
* [Oliver Curting's Solution](https://github.com/Curting/knights_travails)
* [HSaad's Solution](https://github.com/HSaad/data-structure-algorithms/blob/master/knights_travails.rb)
* [Punnadittr's Solution](https://github.com/punnadittr/knight_traversal/blob/master/knight.rb)
* [Akash's Solution](https://github.com/Akash-sopho/knights_travels)
* [Areeba's Solution](https://github.com/AREEBAISHTIAQ/knight-travails/blob/master/knight-travails.rb)
* [Alex's Solution](https://github.com/alexcorremans/knight)
* [Emil Dimitrov's Solution](https://github.com/imemdm/knight-moves)
* [Leila Alderman's Solution](https://github.com/leila-alderman/knight_moves)
* [Martyn Jones' Solution](https://github.com/martynj2001/binarytree)
* [Mojotron's Solution](https://github.com/mojotron/graph_with_knights_travails)
* [vanny96's Solution](https://github.com/vanny96/binary-trees)
* [Vitaly Osipov's Solution](https://github.com/vi7ali/ruby-practice/blob/master/binary-tree/knight_moves.rb)
* [Alex Krewson's Solution](https://github.com/alexkrewson/data_structures_and_algorithms)
* [Rey van den Berg's Solution](https://github.com/Rey810/Data-Structures-and-Algorithms/tree/master/Knights%20Travails)
* [Robert Dunbar's Solution](https://github.com/RobertDunbar/ruby-binary-trees/blob/master/knight.rb)
* [Gareth Woodman's Solution](https://github.com/GarethWoodman/knights_travails/blob/master/knights_travails.rb)
* [Ben Fowler's Solution](https://github.com/benfowler04/ruby-cs/blob/master/knight_moves.rb)
* [Sergej Jurchenko's Solution](https://github.com/Sergyurch/knight_moves/blob/master/knight_moves.rb)
* [Brett Bonnet's Solution](https://github.com/Brett-Bonnet/knight-moves)
* [Husseinhewehii's Solution](https://github.com/Husseinhewehii/Knight_Moves)
* [Toberoni's Solution](https://github.com/toberoni/the_odin_project/tree/master/ruby_programming/knights_travails)
* [Bendee's Solution](https://github.com/bendee48/Data-Structures/blob/master/knight_moves.rb)
* [Jay Conner's Solution](https://github.com/cleve703/data_structures_algorithms/knights_travails.rb)
* [guacamobley's Solution](https://github.com/guacamobley/data-structures-and-algorithms/blob/master/knights-travails.rb)
* [unheavenlycreature's Solution](https://github.com/unheavenlycreature/ds_and_algos/blob/master/knights_moves.rb)
* [Robert Suazo's Solution](https://github.com/rsuazo/knights_travails/blob/master/main.rb)
* [hyperturing's Solution](https://github.com/hyperturing/data-structures/tree/master/knight_moves)
* [Sanyogita's Solution](https://github.com/SanyogitaPandit/RubyProgramming/tree/master/knight_moves)
* [Timework's Solution](https://github.com/Timework/knight/blob/master/knight.rb)
* [Rob Dulabon's Solution](https://github.com/RDulabon/Knight_Travails)
* [fussykyloren's Solution](https://github.com/fussykyloren/ruby-data-structures/tree/master/knights-travail)
* [Cameron St. Amant's Solution](https://github.com/CameronStAmant/The_Odin_Project/blob/master/Ruby_projects/Data_Structures_and_Algorithms/Knights_travail.rb)
* [mpiriya's Solution](https://github.com/mpiriya/ruby/blob/master/data-structures/knight_moves.rb)
* [Sandy's Solution](https://github.com/kuosandys/top-ruby-assignments/blob/master/knight.rb)
* [Brent's Solution](https://github.com/brentcam250/knight_moves)
* [Rémi Borfigat’s Solution](https://github.com/remiborfigat/knight_travails)
* [Adam's Solution](https://github.com/abohannon/ruby-sandbox/blob/master/projects/knights_travails/lib/knights_travails.rb)
* [msespos's Solution](https://github.com/msespos/knights-travails)
* [bhenning83's Solution](https://github.com/bhenning83/binary_search_tree/blob/master/knights_travels.rb)
* [tim87henry's Solution](https://github.com/tim87henry/ruby_practice/blob/master/knights_travails.rb)

</details>
