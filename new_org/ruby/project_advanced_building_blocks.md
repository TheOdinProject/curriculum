# Projects: Advanced Building Blocks
*Estimated Time: 4-8 hrs*

*Don't forget to use Git to save your projects!*

## Project 1: Bubble Sort

Sorting algorithms are some of the earliest that you typically get exposed to in Computer Science.  It may not be immediately obvious how important they are, but it shouldn't be hard to think of some examples where your computer needs to sort some massive datasets during everyday operations.

One of the simpler (but more processor-intensive) ways of sorting a group of items in an array is **bubble sort**, where each element is compared to the one next to it and they are swapped if the one on the right is larger than the one on the left.  This continues until the array is eventually sorted.

Check out [this video from Harvard's CS50x on Bubble Sort](http://cs50.tv/2012/fall/shorts/bubble_sort/bubble_sort-720p.mp4).

There's also [an entry on Bubble Sort on Wikipedia](http://en.wikipedia.org/wiki/Bubble_sort) that's worth taking a look at.

![Bubble Sort](http://upload.wikimedia.org/wikipedia/commons/c/c8/Bubble-sort-example-300px.gif)

### Your Task

1. Build a method `#bubble_sort` that takes an array and returns a sorted array.  It must use the bubble sort methodology (using `#sort` would be pretty pointless, wouldn't it?).

        > bubble_sort([4,3,78,2,0,2])
        => [0,2,2,3,4,78]

2. Now create a similar method called `#bubble_sort_by` which sorts an array but accepts a block.  The block should take two arguments which represent the two elements currently being compared.  Expect that the block's return will be similar to the spaceship operator you learned about before -- if the result of the block is negative, the element on the left is "smaller" than the element on the right.  `0` means they are equal.  A positive result means the right element is greater.  Use this to sort your array.

        > bubble_sort_by(["hi","hello","hey"]) do |left,right|
        >   right.length - left.length
        > end
        => ["hi", "hey", "hello"]

## Project 2: Enumerable Methods

You learned about the Enumerable module that gets mixed in to the Array and Hash classes (among others) and provides you with lots of handy iterator methods.  To prove that there's no magic to it, you're going to rebuild those methods.

### Your Task
1. Create a script file to house your methods and run it in IRB to test them later.
2. Add your new methods onto the existing Enumerable module.  Ruby makes this easy for you because any class or module can be added to without trouble ... just do something like:
        
        module Enumerable
          def my_each
            # your code here
          end
        end

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
8. Modify your `#my_map` method to take either a proc or a block, executing the block only if both are supplied.

**Quick Tips:**
* Remember `yield` and the `#call` method.

## Additional Resources

*
