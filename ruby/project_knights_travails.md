## Project: Knight's Travails

*Don't forget to use Git to save your projects!*

Now you're a pro with DFS and BFS.  Let's try using our search algorithms on a real problem.

For this project, you'll need to use a data structure that's similar (but not identical) to a binary tree. For a summary of a few different examples, reference [this article](https://www.khanacademy.org/computing/computer-science/algorithms/graph-representation/a/describing-graphs).

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

* Add your solution below this line!
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
* [Noah Prescott's solution](https://github.com/npresco/basic_data_structures_and_algorithms/blob/master/knight_moves.rb)
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
* [m-chrzan's solution](https://github.com/m-chrzan/knights-travails)
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


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*
