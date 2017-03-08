# Project: Recursion

*Don't forget to use Git to save your projects!*

## Warmup: Fibonacci

The [Fibonacci Sequence](http://en.wikipedia.org/wiki/Fibonacci_number), which sums each number with the one before it, is a great example of a problem that can be solved recursively.

### Your Task

1. Write a method `#fibs` which takes a number and returns that many members of the fibonacci sequence.  Use iteration for this solution.
2. Now write another method `#fibs_rec` which solves the same problem recursively.  This can be done in just 3 lines (or 1 if you're crazy, but don't consider either of these lengths a requirement... just get it done).

## Project: Merge Sort

We spent some time early on dealing with sorting (e.g. bubble sort).  Now it's time to take another look at sorting with [Merge Sort](http://en.wikipedia.org/wiki/Merge_sort), a type of sort that lends itself well to recursion and can be much faster than bubble sort on the right data sets.  You'll build a method which sorts a given array but uses a "merge sort" method for doing so.

It can be a bit strange to wrap your head around, but just remember you're "dividing and conquering" the problem.

### Background Viewing

The first step is to actually understand what the merge sort algorithm is doing:

1. Check out [this video](http://www.youtube.com/watch?v=EeQ8pwjQxTM) from Harvard's CS50x course.
2. [Merge Sort -- How it Works part 1](http://www.youtube.com/watch?v=OAsokGNa18k) and [Merge Sort -- How it Works part II](http://www.youtube.com/watch?v=nNhpFO9CmPs) on YouTube give you a more formal look at this problem if you're still unclear.

### Your Task

1. Build a method `#merge_sort` that takes in an array and returns a sorted array, using a recursive merge sort methodology.
2. Tips:

    1. Think about what the base case is and what behavior is happening again and again and can actually be delegated to someone else (e.g. that same method!).
    2. It may be helpful to check out the background videos again if you don't quite understand what should be going on.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* Add your solution below this line!
* [Neelotpal's solution](https://github.com/neelotpal97/learning_programming/blob/master/Projects/Merge_Sort/merge_sort.rb)
* [yilmazgunalp's solution](https://github.com/yilmazgunalp/recursion)
* [Orlando's solution](https://github.com/orlandodan14/The-Odin-Project/blob/master/recursion/merge_sort.rb)
* [ToTenMilan's solution](https://github.com/ToTenMilan/the_odin_project/blob/master/ruby/recursion/merge_sort.rb)
* [Ayushka's solution](https://github.com/ayushkamadji/recursive_ruby/blob/master/recursion.rb)
* [Nicolas Amaya's solution](https://github.com/nicoasp/TOP---Ruby-Recursion-Project)
* [Raiko's solution](https://github.com/Cypher0/recursion/blob/master/merge_sort.rb)
* [nmac's solution](https://github.com/nmacawile/recursion/blob/master/merge_sort.rb)
* [John Phelps's solution](https://github.com/jphelps413/odin-ruby/blob/master/recursion/merge_sort.rb)
* [Braydon Pacheco's solution](https://github.com/pacheeko/recursion/blob/master/merge_sort.rb)
* [Stefan P's solution](https://github.com/spavikevik/recursion_project/blob/master/merge_sort/mergesort.rb)
* [mahimahi42's solution](https://github.com/mahimahi42/recursion.git)
* [Chris's solution](https://github.com/krzoldakowski/theodinproject/blob/master/recursion/merge_sort.rb)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/blob/master/project_recursion/merge_sort.rb)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_recursion)
* [Mazin's solution](https://github.com/muzfuz/CodeLessons/blob/master/recursion/merge_sort.rb)
* [TomTom's solution](https://github.com/tim5046/projectOdin/blob/master/Recursion/mergeSort.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_6_Ruby_Recursion/mergesort.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/merge-sort)
* [Michael Alexander's solution](https://github.com/betweenparentheses/project_recursion/blob/master/merge_sort.rb)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/ProjectRecursion.rb)
* [Erithair's solution](https://github.com/N19270/merge-sort)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/recursion)
* [James MacIvor's solution](https://github.com/RobotOptimist/rec_ex/blob/master/merge_sort.rb)
* [Aleksandar's solution](https://github.com/rodic/Odin-Ruby-Projects/blob/master/Project:%20Recursion/lib/merge.rb)
* [Vidul's solution](https://github.com/viparthasarathy/recursion/blob/master/merge_sort.rb)
* [John Quarles' solution](https://github.com/johnwquarles/Ruby-project-recursion/blob/master/merge_sort.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/blob/master/Project6/MergeSort/p2-merg.rb)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/recursion/merge_sort.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/recursion/blob/master/merge_sort.rb)
* [Jason Matthews' solution](https://github.com/fo0man/project_recursion/blob/master/recursion.rb)
* [Nikola Čvorović's solution](https://github.com/cvorak/Recursion/blob/master/merge_sort.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/recursion/blob/master/merge_sort.rb)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/recursion/blob/master/merge_sort.rb)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/blob/master/recursion_project/merge_sort.rb)
* [Eduardo Frias' solution](https://github.com/feek1g/theodinproject/blob/master/Recursion/merge_sort.rb)
* [Frank Peelen's solution](https://github.com/FrankPeelen/Recursion/blob/master/merge_sort.rb)
* [Chris's solution](https://github.com/Concretechris/odinProject/blob/master/OP%20-%20Recursive%20Exercises/merge_sort.rb)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_recursion_project/blob/master/merge_sort.rb)
* [Matias Pan's solution](https://github.com/kriox26/odin_ruby/tree/master/project_recursion)
* [Alex Chen's solution](https://github.com/Chenzilla/recursive)
* [Joe Balsamo's solution](https://github.com/Joe-Balsamo/merge_sort)
* [Dan Hoying's solution](https://github.com/danhoying/recursion/blob/master/merge_sort.rb)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/blob/master/ruby/CS/merge_sort.rb)
* [Mark Viola's solution](https://github.com/markviola/the-odin-project/tree/master/11-more-ruby-problems-4/2%20-%20Merge%20Sort)
* [PiotrAleksander's solution](https://github.com/PiotrAleksander/Ruby/blob/master/Ruby.%20Praktyczne%20Skrypty/sortowaniePoprzezScalanie.rb)
* [Solution by John Tobillo](https://github.com/jdtobill/Ruby/blob/master/challenges/merge_sort/merge_sort.rb)
* [Noah Prescott's solution](https://github.com/npresco/recursion/blob/master/merge_sort.rb)
* [Julie Anderson's solution](https://github.com/julie-anderson/recursion)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/blob/master/ruby/recursion/merge_sort.rb)
* [Andrej Dragojevic's solution](https://github.com/antrix1/The-Odin-Project/blob/master/Ruby%20Programming/Recursion/recursion.rb)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/blob/master/ruby/project11--merge-sort/merge_sort.rb)
* [Aviv levinsky's solution](https://github.com/pugsiman/Ruby_challenges_and_algorithms/blob/master/Merge_Sort/mergesort.rb)
* [Scott Bobbitt's solution](https://github.com/sco-bo/merge_sort_algorithm)
* [Giorgos's solution](https://github.com/vinPopulaire/recursion/blob/master/mergesort.rb)
* [Alex Tsiras' solution](https://github.com/arialblack14/recursion_project/blob/master/merge_sort.rb)
* [Andrew Park's solution](https://github.com/akpark93/the_odin_project/blob/master/ruby_programming_projects/recursion/mergesort.rb)
* [srashidi's solution](https://github.com/srashidi/Recursion/blob/master/merge_sort/merge_sort.rb)
* [Dave Meister's solution](https://github.com/misterdavemeister/theodinproject/blob/master/recursion/merge_sort/merge_sort.rb)
* [Panashe Fundira's solution](https://github.com/munyari/odin/blob/master/learning-ruby/recursion/mergesort.rb)
* [James Brooks's solution](https://github.com/jhbrooks/recursion/blob/master/merge_sort.rb)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/recursion/merge_sort)
* [Skye Free's solution](https://github.com/swfree/the-odin-project/tree/master/merge_sort)
* [Matt Velez's solution](https://github.com/Timecrash/ruby-projects/blob/master/recursion/merge_sort.rb)
* [Luke Walker's solution](https://github.com/ubershibs/ruby-programming/blob/master/cs/mergesort.rb)
* [Ricardo Villegas' solution](https://github.com/claricardo/RubyBuildingBlocks/blob/master/recursion/merge_sort.rb)
* [djhart's solution](https://github.com/djhart/ruby_recursion/blob/master/merge_sort.rb)
* [Miguel Herrera's solution](https://github.com/migueloherrera/projects/blob/master/merge_sort.rb)
* [Max Gallant's solution](https://github.com/mcgalcode/Ruby/blob/master/Recursion/RecursionProject/merge_sort.rb)
* [Fabricio Carrara's solution](https://github.com/fcarrara/ruby_recursion)
* [John's solution (help from Sahil's code)](https://github.com/johnTheDudeMan/the_odin_project/blob/master/ruby_scripts/merge_sort.rb)
* [DV's solution](https://github.com/dvislearning/merge_sort/blob/master/merge_sort.rb))
* [Deepak's solution](https://github.com/Deepak5050/merge_sort/blob/master/merge_sort.rb)
* [Earth35's solution](https://github.com/Earth35/recursion_exercises/blob/master/merge_sort/merge_sort.rb)
* [Cyprium (Stefan)'s solution](https://github.com/dev-cyprium/DataStructures-In-Ruby)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/recursion/blob/master/merge_sort.rb)
* [Austin Mason's solution](https://github.com/CouchofTomato/algorithm/blob/master/merge_sort.rb)
* [John Connor's solution](https://github.com/jacgitcz/mergesort)
* [Oscar Y.'s solution](https://github.com/mysteryihs/ruby_projects/blob/master/recursion_project.rb)
* [Amrr Bakry's solution](https://github.com/Amrrbakry/learning_ruby/blob/master/merge_sort.rb)
* [Manu Phatak's solution](https://github.com/bionikspoon/ruby_recursion#project-merge-sort)
* [Jean Merlet's solution](https://github.com/jeanmerlet/ruby_recursion/blob/master/merge_sort.rb)
* [Sasho's solution](https://github.com/sashoa/the-odin-project/blob/master/project-recursion/merge_sort.rb)
* [Jiazhi Guo's solution](https://github.com/jerrykuo7727/merge_sort)
* [Francisco Carlos's solution](https://github.com/fcarlosdev/the_odin_project/blob/master/recursion/merge_sort.rb)
* [Chris Chambers' soution](https://github.com/chrisgchambers/ruby_exercies/blob/master/merge_sort/merge_sort.rb)
* [Loris Aranda's solution](https://github.com/LorisProg/ruby-recurssion/blob/master/merge_sort.rb)
* [at0micr3d's solution](https://github.com/at0micr3d/project_recursion/blob/master/mergesort.rb)
* [Peuchen's solution (help from Florian's code)](https://github.com/Peuchen/recursion/blob/master/mergesort.rb)
* [Clint's solution](https://github.com/tholymap/Odin-Ruby-Recursion/blob/master/merge_sort.rb)
* [Anthony Vumbaca's solution](https://github.com/tvumbaca/project-recursion/blob/master/merge_sort.rb)
* [David Chapman's Solution](https://github.com/davidchappy/odin_training_projects/blob/master/recursion/merge_sort.rb)
* [Leonard Soai-Van's solution](https://github.com/leosoaivan/TOP_recursions/blob/master/merge_sort.rb)
* [Dom Goj's solution](https://github.com/booyakuhhsha/mergeSort)
* [Jerry Gao's solution](https://github.com/blackwright/merge_sort)
* [Marcus' solution](https://github.com/nestcx/recursion/blob/master/mergesort.rb)
* [Sophia Wu's solution](https://github.com/SophiaLWu/project-recursion/blob/master/merge_sort.rb)
* [Samuel Langenfeld's solution](https://github.com/SamuelLangenfeld/recursion/blob/master/merge_sort.rb)
* [Kyle Thomson's solution](https://github.com/idynkydnk/merge_sort)
* [Jakub Peikert's solution](https://github.com/JPeikert/odin_project/blob/master/ruby/computer_science/recursion/merge_sort.rb)
* [Robert Szabo's solution](https://github.com/Siker001/the_odin_project_exercises/blob/master/ruby/recursion/merge_sort/merge_sort.rb)
* [Bishal's solution](https://github.com/biiishal/recursion/blob/master/merge_sort.rb)
* [jeff1st's solution](https://github.com/jeff1st/cs_recursive/blob/master/merge_s.rb)


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* Another look at [merge sort](http://www.sorting-algorithms.com/merge-sort)
* For more attempts at recursion try the first 5 problems in [Project Euler](https://projecteuler.net/problems)
