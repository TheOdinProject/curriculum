# Projects: Advanced Building Blocks
<!-- *Estimated Time: 4-8 hrs* -->

*Don't forget to use Git to save your projects!*

## Project 1: Bubble Sort

Sorting algorithms are some of the earliest that you typically get exposed to in Computer Science.  It may not be immediately obvious how important they are, but it shouldn't be hard to think of some examples where your computer needs to sort some massive datasets during everyday operations.

One of the simpler (but more processor-intensive) ways of sorting a group of items in an array is **bubble sort**, where each element is compared to the one next to it and they are swapped if the one on the right is larger than the one on the left.  This continues until the array is eventually sorted.

Check out [this video from Harvard's CS50x on Bubble Sort](http://cs50.tv/2012/fall/shorts/bubble_sort/bubble_sort-720p.mp4).

There's also [an entry on Bubble Sort on Wikipedia](http://en.wikipedia.org/wiki/Bubble_sort) that's worth taking a look at.

![Bubble Sort](http://upload.wikimedia.org/wikipedia/commons/c/c8/Bubble-sort-example-300px.gif)

### Your Task

1. Build a method `#bubble_sort` that takes an array and returns a sorted array.  It must use the bubble sort methodology (using `#sort` would be pretty pointless, wouldn't it?).

    ```language-bash
        > bubble_sort([4,3,78,2,0,2])
        => [0,2,2,3,4,78]
    ```

2. Now create a similar method called `#bubble_sort_by` which sorts an array but accepts a block.  The block should take two arguments which represent the two elements currently being compared.  Expect that the block's return will be similar to the spaceship operator you learned about before -- if the result of the block is negative, the element on the left is "smaller" than the element on the right.  `0` means they are equal.  A positive result means the left element is greater.  Use this to sort your array.

    ```language-bash
        > bubble_sort_by(["hi","hello","hey"]) do |left,right|
        >   left.length - right.length
        > end
        => ["hi", "hey", "hello"]
    ```

### Student Solutions

*[Submit a link](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) to the github repo with your files in it here with a pull request.  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Jamie's solution](https://github.com/Jberczel/odin-projects/blob/master/ruby_advanced/project1.rb)
* [Chris Oldakowski's solution](https://github.com/krzysieko/theodinproject/blob/master/advanced_ruby_blocks/bubble_sort.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_2_Ruby_AdvancedBlocks/bubble_sort.rb)
* [Afshin M. afshinator's solution](https://github.com/afshinator/playground/tree/master/Ruby-AdvancedBuildingBlocks)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_adv_building_blocks)
* [Alan Russell's solution](https://github.com/ajrussellaudio/adv_build_blocks/blob/master/bubble_sort.rb)
* [Mazin Power's solution](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/bubble.rb)
* [Sessl's solution](https://github.com/Sessl/ruby_work/blob/master/bubble_sort.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/ruby-project-2/blob/master/bubble_sort.rb)
* [Michael Alexander's solution](https://github.com/betweenparentheses/project_advanced_bldg_blocks/blob/master/bubble_sort.rb)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/bubble_sort.rb)
* [James MacIvor's solution](https://github.com/RobotOptimist/bubblesort)
* [Vincent's solution](https://github.com/wingyu/Advanced_Building_Blocks/tree/master)
* [Roman's Solution](https://github.com/RomanADavis/Ruby-Building-Blocks/tree/master/bubble_sort)
* [Aleksandar's solution](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Advanced%20Building%20Blocks/lib/bubble_sort.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/Ruby_Building_Blocks)
* [John Quarles' solution](https://github.com/johnwquarles/Ruby-Advanced-Building-Blocks/blob/master/bubble_sort.rb)
* [Jack Nguyen's solution](http://github.com/jnguyen85/projects-advanced-building-blocks/blob/master/01_bubble_sort/bubble_sort.rb)
* [Vidul's solution](https://github.com/viparthasarathy/bubble_sort/blob/master/bubble_sort_method.rb)
* [Maggie Baker's solution](https://github.com/maggiedbaker/Odin_Project/blob/master/bubble_sort.rb)
* [Hunter Ducharme's solution](https://github.com/hgducharme/Playground/blob/master/odin_projects/ruby_programming/advanced_building_blocks/bubble_sort.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/blob/master/Project2/abbproject1/p1-bubble.rb)
* [Tyler Travers' solution](https://github.com/ttravers17/the_odin_project/tree/master/advanced_building_blocks)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/advanced_building_blocks/bubble_sort_by.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/bubble_sort.rb)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/blob/master/bubble_sort.rb)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/advanced-building-blocks/blob/master/bubble_sort/bubble_sort.rb)
* [Sami Bashraheel's solution](https://github.com/sami/advanced-ruby-building-blocks/blob/master/bubble_sort.rb)
* [Josh Naughton's solution](https://github.com/ThothLogos/odin-rubyprogramming/blob/master/04_bubble_sort.rb)
* [Jason Matthews' solution](https://github.com/fo0man/advanced_building_blocks/blob/master/bubble_sort.rb)
* [Nikola Čvorović's solution](https://github.com/cvorak/ruby-project-advanced_building_blocks/blob/master/bubble_sort.rb)
* [Ali Ayoub's solution](https://github.com/Cryptolemming/Advanced-Ruby-Exercises/blob/master/bubble_sort.rb)
* [JrodManU's solution](https://github.com/JrodManU/bubble-sort)
* [poctek's solution](https://github.com/poctek/bubble_sort/blob/master/bubble_sort.rb)
* [Greg Park's solution](https://github.com/gregoryjpark/ruby_building_blocks/blob/master/bubble_sort.rb)
* [Sasi kala's solution](https://github.com/Sasikala-Ravichandran/my_ruby_projects/blob/master/bubble_sort.rb)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/advanced_building_blocks/blob/master/bubble_sort.rb)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/blob/master/ruby_building_blocks_assignments/bubble_sort.rb)
* [LongPotato's solution](https://github.com/LongPotato/Ruby_Building_Blocks/blob/master/Bubble_Sort.rb)
* [Dorian Iacobescu's solution](https://github.com/iacobson/Odin8-Ruby-Advanced-Building_Blocks/blob/master/bubble_sort.rb)
* [Sam Padrul's solution](https://github.com/sampadrul/Ruby-Projects/blob/master/bubble%20sort/bubblesort.rb)
* [Eleanor Weigert's solution](https://github.com/mixophrygian/Ruby-Building-Blocks)
* [Lyman Wong's solution](https://github.com/lymanwong/Ruby-Stuff/blob/master/odin/bubble_sort/bubble_sort.rb)
* [omokoro's solution](https://github.com/omokoro/advanced_building_blocks/blob/master/bubble_sort.rb)
* [Andrej Dragojevic's solution](https://github.com/antrix1/The-Odin-Project/blob/master/Ruby%20Programming/Advanced%20Building%20Blocks/bubble_sort.rb)
* [Brann James' solution](https://github.com/brannj/The_Odin_Project/blob/master/Advanced_Building_Blocks/bubble_sort.rb)
* [Eduardo Frias' solution](https://github.com/feek1g/theodinproject/blob/master/rubyChallenge/bubble_sort.rb)
* [Antonio Augusto's solution](https://github.com/antoniosb/bubble_sort)
* [Ryan Jordan's solution](https://github.com/krjordan/advanced_building_blocks)
* [Josh Klein's solution](https://github.com/kleinjoshuaa/Ruby_Programming/blob/master/bubblesort.rb)
* [ll14m4n's solution](https://github.com/ll14m4n/the-odin-project/blob/master/3_Ruby_building-blocks/lib/bubble_sort.rb)
* [AtActionParks's solution](https://github.com/AtActionPark/odin-ruby-advanced-building-blocks/blob/master/bubble-sort.rb)
* [Matias Pan's solution](https://github.com/kriox26/odin_ruby/blob/master/ruby_building_blocks/bubble_sort.rb)
* [Mark Viola's solution](https://github.com/markviola/the-odin-project/blob/master/7-more-ruby-problems-2/1%20-%20Bubble%20Sort/bubble_sort.rb)
* [Bhupendra Singh's solution](https://github.com/bhupendra11/rubySandbox/blob/master/bubblesort.rb)
* [Dan Hoying's solution](https://github.com/danhoying/advanced_building_blocks/blob/master/bubble_sort.rb)
* [Joe Balsamo's solution](https://github.com/Joe-Balsamo/ruby_advanced_building_blocks/blob/master/bubble_sort.rb)
* [Cody Gipson's solution](https://github.com/Cgipson06/ruby-bubble-sort/blob/master/bubblesort.rb)
* [Glenn Crosby's solution](https://github.com/glennc15/TheOdinProject_Assignments/blob/master/03_RubyProgramming/02_Project_AdvancedBuildingBlocks/bubble_sort.rb)
* [Raycotek's solution](https://github.com/Raycotek/Odinprojects/blob/master/bubble_sort.rb)
* [M. Edgar Joel's solution](https://github.com/edgar-/odin-project-solutions/blob/master/advanced_building_blocks/bubble_sort.rb)
* [Miguel Oliveira's solution](https://github.com/Powerade/The-Odin-Project/tree/master/Ruby%20Programming%20Projects/Bubble%20Sort)
* [Xavier Reid's solution](https://github.com/xreid/ruby_building_blocks/blob/master/src/bubble_sort.rb)
* [Gb69010p's solution](https://github.com/gb69010p/AdvancedRubyBuildingBlocks/blob/master/BubbleSort.rb)
* [Alex Chen's solution](https://github.com/Chenzilla/ruby_building_blocks/blob/master/bubble_sort.rb)
* [Tarek Ahmed's solution](https://github.com/tadeve96/ruby_programming_odin/blob/master/bubble_sort.rb)
* [Aleksandre Clapin-Pepin's solution](https://github.com/aclapinpepin/bubble-sort/blob/master/bubble_sort.rb)
* [John Tobillo's Solution](https://github.com/jdtobill/Ruby/tree/master/challenges/bubble_sort)
* [PiotrAleksander's solution](https://github.com/PiotrAleksander/Ruby/blob/master/bubbleSort.rb)
* [Berin Larson's solution](https://github.com/larson004/the-odin-project/tree/master/Chap-03-Advanced-Ruby/advanced_building_blocks/bubble_sort)
* [Jason Symons' solution](https://github.com/jsymons/the-odin-project/blob/master/03_ruby_programming/advanced-building-blocks/bubble_sort.rb)
* [AnthonyL's solution](https://github.com/AnthonyLarios/adv-building-blocks/blob/master/bubble_sort.rb)
* [Angus Dobson's solution](https://github.com/Apneal/ruby_building_blocks/blob/master/bubble_sort.rb)
* [Ashley Lewis's solution](https://github.com/ashleymichal/the_odin_project/blob/master/the-odin-project/ruby/bubble_sort.rb)
* [Panashe Fundira's solution](https://github.com/munyari/adv_building_blocks/blob/master/bubble_sort.rb)
* [pwdd's solution](https://github.com/pwdd/odinproject/blob/master/ruby_training/bubble_sort.rb)
* [Paweł Cichoń solution](https://github.com/beovulf/bubble_sort_and_enumerable_methods/blob/master/bubble_sort.rb)
* [Noah Prescott's solution](https://github.com/npresco/ruby_advanced_building_blocks/blob/master/bubble_sort.rb)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/blob/master/ruby/advanced-building-blocks/bubble_sort.rb)
* [Aviv levinsky's solution](https://github.com/pugsiman/Ruby_challenges_and_projects/blob/master/Bubble_Sort/bubble.rb)
* [Alex Tsiras' solution](https://github.com/arialblack14/ruby-programming/blob/master/ruby%20building%20blocks/bubble_sort.rb)
* [Scott Bobbitt's solution](https://github.com/sco-bo/bubble_sort)
* [Maciej Panasiewicz's solution](https://github.com/Grunthor/TheOdinProject/blob/master/project_advenced_building_blocks/BubleSort.rb)
* [Adrian Manteza's solution](https://github.com/AdManteza/BubbleSort/blob/master/BubbleSort.rb)
* Add your solution above this line!


## Project 2: Enumerable Methods

You learned about the Enumerable module that gets mixed in to the Array and Hash classes (among others) and provides you with lots of handy iterator methods.  To prove that there's no magic to it, you're going to rebuild those methods.

### Your Task
1. Create a script file to house your methods and run it in IRB to test them later.
2. Add your new methods onto the existing Enumerable module.  Ruby makes this easy for you because any class or module can be added to without trouble ... just do something like:

    ```language-ruby
        module Enumerable
          def my_each
            # your code here
          end
        end
    ```

1. Create `#my_each`, a method that is identical to `#each` but (obviously) does not use `#each`.  You'll need to remember the `yield` statement.  Make sure it returns the same thing as `#each` as well.
2. Create `#my_each_with_index` in the same way.
3. Create `#my_select` in the same way, though you may use `#my_each` in your definition (but not `#each`).
4. Create `#my_all?` (continue as above)
5. Create `#my_any?`
6. Create `#my_none?`
6. Create `#my_count`
4. Create `#my_map`
6. Create `#my_inject`
7. Test your `#my_inject` by creating a method called `#multiply_els` which multiplies all the elements of the array together by using `#my_inject`, e.g. `multiply_els([2,4,5]) #=> 40`
7. Modify your `#my_map` method to take a proc instead.
8. Modify your `#my_map` method to take either a proc or a block, executing the block only if both are supplied (in which case it would execute both the block AND the proc).

**Quick Tips:**

* Remember `yield` and the `#call` method.

### Student Solutions

*[Submit a link](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) to the github repo with your files in it here with a pull request.  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Jamie's solution](https://github.com/Jberczel/odin-projects/blob/master/ruby_advanced/project2.rb)
* [Chris Oldakowski's solution](https://github.com/krzysieko/theodinproject/blob/master/advanced_ruby_blocks/enumerable.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_2_Ruby_AdvancedBlocks/MyEnumerable.rb)  
* [Afshin M. afshinator's solution](https://github.com/afshinator/playground/tree/master/Ruby-AdvancedBuildingBlocks)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_adv_building_blocks)
* [Alan Russell's solution](https://github.com/ajrussellaudio/adv_build_blocks/blob/master/enumerable_methods.rb)
* [Mazin Power's solution](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/enumerable.rb)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/ruby-advanced-building-blocks)
* [TomTom's solution](https://github.com/tim5046/projectOdin/blob/master/AdvancedBuildingBlocks/enumerable_methods.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/ruby-project-2/blob/master/my_enumerable.rb)
* [Michael Alexander's solution](https://github.com/betweenparentheses/project_advanced_bldg_blocks/blob/master/my_enumerable.rb)
* [James MacIvor's solution](https://github.com/RobotOptimist/enumerable)
* [Vincent's solution](https://github.com/wingyu/Advanced_Building_Blocks/tree/master)
* [Aleksandar's solution](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Advanced%20Building%20Blocks/lib/enum.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/enumerable_methods.rb)
* [John Quarles' solution](https://github.com/johnwquarles/Ruby-Advanced-Building-Blocks/blob/master/enumerable.rb)
* [Jack Nguyen's solution](http://github.com/jnguyen85/projects-advanced-building-blocks/blob/master/02_enumerables/enumerable.rb)
* [Vidul's solution](https://github.com/viparthasarathy/enumerable_methods/blob/master/enumerable.rb)
* [Hunter Ducharme's solution](https://github.com/hgducharme/Playground/blob/master/odin_projects/ruby_programming/advanced_building_blocks/enumberable_methods.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/blob/master/Project2/abbproject2/p2-enum.rb)
* [Tyler Travers' solution](https://github.com/ttravers17/the_odin_project/tree/master/advanced_building_blocks)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/advanced_building_blocks/enumerables.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/enumerable_methods.rb)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/advanced-building-blocks/blob/master/enumerable/my_enumerable.rb)
* [Sami Bashraheel's solution](https://github.com/sami/advanced-ruby-building-blocks/blob/master/enumerable_methods.rb)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/blob/master/enumerable_methods.rb)
* [Josh Naughton's solution](https://github.com/ThothLogos/odin-rubyprogramming/blob/master/05_enumerable_methods.rb)
* [Jason Matthews' solution](https://github.com/fo0man/advanced_building_blocks/blob/master/enumerator.rb)
* [JrodManU's solution](https://github.com/JrodManU/enumerable-methods)
* [poctek's solution](https://github.com/poctek/My_Enumerable/blob/master/My_Enumerable.rb)
* [Greg Park's solution](https://github.com/gregoryjpark/ruby_building_blocks/blob/master/enum_dups.rb)
* [Sasi Kala's solution](https://github.com/Sasikala-Ravichandran/my_ruby_projects/blob/master/enumerable_methods.rb)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/advanced_building_blocks/blob/master/enumerable.rb)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/blob/master/ruby_building_blocks_assignments/enumerable_methods.rb)
* [LongPotato's solution](https://github.com/LongPotato/Ruby_Building_Blocks/blob/master/Enumerable.rb)
* [Dorian Iacobescu's solution](https://github.com/iacobson/Odin8-Ruby-Advanced-Building_Blocks/blob/master/enumerable_methods.rb)
* [Sam Padrul's solution](https://github.com/sampadrul/Ruby-Projects/blob/master/enumerables.rb)
* [Eleanor Weigert's solution](https://github.com/mixophrygian/Ruby-Building-Blocks/blob/master/my_enumerables.rb)
* [omokoro's solution](https://github.com/omokoro/advanced_building_blocks/blob/master/enumberable.rb)
* [Brann James' solution](https://github.com/brannj/The_Odin_Project/blob/master/Advanced_Building_Blocks/enumerable_methods.rb)
* [Eduardo Frias' solution](https://github.com/feek1g/theodinproject/blob/master/rubyChallenge/enumerable.rb)
* [Andrej Dragojevic's solution](https://github.com/antrix1/The-Odin-Project/blob/master/Ruby%20Programming/Advanced%20Building%20Blocks/enumerate.rb)
* [Antonio Augusto's solution](https://github.com/antoniosb/enumerable_methods)
* [Ryan Jordan's solution](https://github.com/krjordan/advanced_building_blocks/blob/master/enumerable.rb)
* [ll14m4n's solution](https://github.com/ll14m4n/the-odin-project/blob/master/3_Ruby_building-blocks/lib/my_enumerable.rb)
* [AtActionParks's solution](https://github.com/AtActionPark/odin-ruby-advanced-building-blocks/blob/master/Enumerable_methods/lib/enumerable_methods.rb)
* [Matias Pan's solution](https://github.com/kriox26/odin_ruby/blob/master/ruby_building_blocks/enumerable_methods.rb)
* [Richard Stewart's solution](https://github.com/rickstewart/Ruby_Advanced_Building_Blocks)
* [Mark Viola's solution](https://github.com/markviola/the-odin-project/blob/master/7-more-ruby-problems-2/2%20-%20Enumerable%20Methods/enumerable_methods.rb)
* [Dan Hoying's solution](https://github.com/danhoying/advanced_building_blocks/blob/master/enumerable_methods.rb)
* [Joe Balsamo's solution](https://github.com/Joe-Balsamo/ruby_advanced_building_blocks/blob/master/enumerable_methods.rb)
* [Cody Gipson's solution](https://github.com/Cgipson06/ruby-bubble-sort/blob/master/enumerable.rb)
* [Glenn Crosby's solution](https://github.com/glennc15/TheOdinProject_Assignments/blob/master/03_RubyProgramming/02_Project_AdvancedBuildingBlocks/MyEnumerable.rb)
* [M. Edgar Joel's solution](https://github.com/edgar-/odin-project-solutions/blob/master/advanced_building_blocks/enumerable_methods.rb)
* [Miguel Oliveira's solution](https://github.com/Powerade/The-Odin-Project/tree/master/Ruby%20Programming%20Projects/Enumerables)
* [Xavier Reid's solution](https://github.com/xreid/ruby_building_blocks/blob/master/src/enumerator.rb)
* [Gb69010p's solution](https://github.com/gb69010p/AdvancedRubyBuildingBlocks/blob/master/My_Enumerable.rb)
* [Alex Chen's solution](https://github.com/Chenzilla/ruby_building_blocks/blob/master/enumerables.rb)
* [Tarek Ahmed's solution](https://github.com/tadeve96/ruby_programming_odin/blob/master/enumerable.rb)
* [John Tobillo's solution](https://github.com/jdtobill/Ruby/tree/master/challenges/enumerable)
* [Berin Larson's solution](https://github.com/larson004/the-odin-project/blob/master/Chap-03-Advanced-Ruby/advanced_building_blocks/enumerables.rb)
* [Jason Symons' solution](https://github.com/jsymons/the-odin-project/blob/master/03_ruby_programming/advanced-building-blocks/enumerable_methods.rb)
* [PiotrAleksander's solution](https://github.com/PiotrAleksander/Ruby/blob/master/Enumerable.rb)
* [AnthonyL's solution](https://github.com/AnthonyLarios/adv-building-blocks/blob/master/enumerable_methods.rb)
* [Angus Dobson's solution](https://github.com/Apneal/ruby_building_blocks/blob/master/enumerable.rb)
* [Ashley Lewis's solution](https://github.com/ashleymichal/the_odin_project/blob/master/the-odin-project/ruby/enumerable.rb)
* [Panashe Fundira's solution](https://github.com/munyari/adv_building_blocks/blob/master/enum_methods.rb)
* [pwdd's solution](https://github.com/pwdd/odinproject/blob/master/ruby_training/enumerables.rb)
* [Paweł Cichoń solution](https://github.com/beovulf/bubble_sort_and_enumerable_methods/blob/master/enumerable_methods.rb)
* [Noah Prescott's solution](https://github.com/npresco/ruby_advanced_building_blocks/blob/master/enumerable.rb)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/blob/master/ruby/advanced-building-blocks/enumerable.rb)
* [Aviv levinsky's solution](https://github.com/pugsiman/Ruby_challenges_and_projects/blob/master/Enumerable_Methods/enumerable.rb)
* [Alex Tsiras' solution](https://github.com/arialblack14/ruby-programming/blob/master/enumerable-methods/enumerable.rb)
* [Maciej Panasiewicz's solution](https://github.com/Grunthor/TheOdinProject/blob/master/project_advenced_building_blocks/EnumerableMethods.rb)
* Add your solution above this line!


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


*
