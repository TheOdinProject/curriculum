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
        >   right.length - left.length
        > end
        => ["hi", "hey", "hello"]
    ```

### Student Solutions

*[Submit a link](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) to the github repo with your files in it here with a pull request.  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Jamie's solution (submitted Apr-14,2014)](https://github.com/Jberczel/odin-projects/blob/master/ruby_advanced/project1.rb)
* [Chris Oldakowski's solution](https://github.com/krzysieko/theodinproject/blob/master/advanced_ruby_blocks/bubble_sort.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_2_Ruby_AdvancedBlocks/bubble_sort.rb)
* [Afshin M., afshinator - (Nov 2013)](https://github.com/afshinator/playground/tree/master/Ruby-AdvancedBuildingBlocks)
* [Aniruddh Agarwal's solution](https://github.com/aniruddhagarwal/odin-projects/blob/master/bubble_sort/bubble_sort.rb)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_adv_building_blocks)
* [Alan Russell's solution](https://github.com/ajrussellaudio/adv_build_blocks/blob/master/bubble_sort.rb)
* [Mazin Power's solution](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/bubble.rb)
* [Sessl's solution](https://github.com/Sessl/ruby_work/blob/master/bubble_sort.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/ruby-project-2/blob/master/bubble_sort.rb)
* [Peter's solution](https://github.com/peterhurford/sorts/blob/master/bubblesort.rb)
* [Michael Alexander's solution](https://github.com/betweenparentheses/project_advanced_bldg_blocks/blob/master/bubble_sort.rb)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Project-Odin-Work-Files/blob/master/bubble_sort.rb)
* [James MacIvor's solution](https://github.com/RobotOptimist/bubblesort)
* [Dave Charnuska's solution](https://github.com/charleszardo/Odin_Project/blob/master/bubble_sort.rb)
* [Vincent's solution](https://github.com/wingyu/Advanced_Building_Blocks/tree/master)
* [Roman's Solution](https://github.com/RomanADavis/Ruby-Building-Blocks/tree/master/bubble_sort)
* [Aleksandar's solution](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Advanced%20Building%20Blocks/lib/bubble_sort.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/Ruby_Building_Blocks)
* [John Quarles' solution](https://github.com/johnwquarles/Ruby-Advanced-Building-Blocks/blob/master/bubble_sort.rb)
* [Jack Nguyen's solution](http://github.com/jnguyen85/projects-advanced-building-blocks/blob/master/01_bubble_sort/bubble_sort.rb)
* [Vidul's solution](https://github.com/viparthasarathy/bubble_sort/blob/master/bubble_sort_method.rb)
* [Maggie Baker's solution](https://github.com/maggiedbaker/Odin_Project/blob/master/bubble_sort.rb)
* [Hunter Ducharme's solution (Dec. 18th, 2014)](https://github.com/hgducharme/Playground/blob/master/odin_projects/ruby_programming/advanced_building_blocks/bubble_sort.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/abbproject1/blob/master/p1-bubble.rb)
* [Tyler Travers' solution](https://github.com/ttravers17/the_odin_project/tree/master/advanced_building_blocks)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/advanced_building_blocks/bubble_sort_by.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/bubble_sort.rb)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/blob/master/bubble_sort.rb)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/advanced-building-blocks/blob/master/bubble_sort/bubble_sort.rb)
* [Sami Bashraheel's solution](https://github.com/sami/advanced-ruby-building-blocks/blob/master/bubble_sort.rb)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/blob/master/bubble_sort.rb)
* *Your solution here...*


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

* [Jamie's solution (submitted Apr-14,2014)](https://github.com/Jberczel/odin-projects/blob/master/ruby_advanced/project2.rb)
* [Chris Oldakowski's solution](https://github.com/krzysieko/theodinproject/blob/master/advanced_ruby_blocks/enumerable.rb)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/blob/master/Project2_2_Ruby_AdvancedBlocks/MyEnumerable.rb)  
* [Afshin M., afshinator - (Nov 2013)](https://github.com/afshinator/playground/tree/master/Ruby-AdvancedBuildingBlocks)
* [Aniruddh Agarwal's solution](https://github.com/aniruddhagarwal/odin-projects/blob/master/enumerables.rb)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_adv_building_blocks)
* [Alan Russell's solution](https://github.com/ajrussellaudio/adv_build_blocks/blob/master/enumerable_methods.rb)
* [Mazin Power's solution](https://github.com/muzfuz/CodeLessons/blob/master/RubyBuildingBlocks/enumerable.rb)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/ruby-advanced-building-blocks)
* [TomTom's solution](https://github.com/tim5046/projectOdin/blob/master/AdvancedBuildingBlocks/enumerable_methods.rb)
* [Tommy Noe's solution](https://github.com/thomasjnoe/ruby-project-2/blob/master/my_enumerable.rb)
* [Michael Alexander's solution](https://github.com/betweenparentheses/project_advanced_bldg_blocks/blob/master/my_enumerable.rb)
* [James MacIvor's solution](https://github.com/RobotOptimist/enumerable)
* [Dave Charnuska's solution](https://github.com/charleszardo/Odin_Project/blob/master/enumerable.rb)
* [Vincent's solution](https://github.com/wingyu/Advanced_Building_Blocks/tree/master)
* [Aleksandar's solution](https://github.com/Rodic/Odin-Ruby-Projects/blob/master/Projects:%20Advanced%20Building%20Blocks/lib/enum.rb)
* [Lara Finnegan's solution](https://github.com/lcf0285/Ruby_Building_Blocks/blob/master/enumerable_methods.rb)
* [John Quarles' solution](https://github.com/johnwquarles/Ruby-Advanced-Building-Blocks/blob/master/enumerable.rb)
* [Jack Nguyen's solution](http://github.com/jnguyen85/projects-advanced-building-blocks/blob/master/02_enumerables/enumerable.rb)
* [Vidul's solution](https://github.com/viparthasarathy/enumerable_methods/blob/master/enumerable.rb)
* [Hunter Ducharme's solution (Dec. 18th, 2014)](https://github.com/hgducharme/Playground/blob/master/odin_projects/ruby_programming/advanced_building_blocks/enumberable_methods.rb)
* [Artur Janik's solution](https://github.com/ArturJanik/abbproject2/blob/master/p2-enum.rb)
* [Tyler Travers' solution](https://github.com/ttravers17/the_odin_project/tree/master/advanced_building_blocks)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/blob/master/Chapter_03-Advanced_Ruby/advanced_building_blocks/enumerables.rb)
* [Dominik Stodolny's solution](https://github.com/dstodolny/ruby_building_blocks/blob/master/lib/enumerable_methods.rb)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/advanced-building-blocks/blob/master/enumerable/my_enumerable.rb)
* [Sami Bashraheel's solution](https://github.com/sami/advanced-ruby-building-blocks/blob/master/enumerable_methods.rb)
* [hiendinhngoc's solution](https://github.com/hiendinhngoc/TheOdinProject/blob/master/enumerable_methods.rb)
* *Your solution here...*


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


*
