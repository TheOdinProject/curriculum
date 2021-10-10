### The fun begins!

This project assumes you already have experience with loops, and that you've been doing some practice with your programming outside of this Computer Science course. This project will putting your ability to use recursion through a basic test, and allowing you to compare what you do with recursion with what you do with iteration (loops). This project will also help you understand that everything that can be done with recursion can be done with iteration; although the iteration solution may be more difficult to figure out...

### Starting Small - Fibonacci

This is an age-old classic example of something that can be solved recursively. The [Fibonacci Sequence](http://en.wikipedia.org/wiki/Fibonacci_number) is a sequence where each number, or term, is the sum of the two terms before it; with the first two terms being 0 and 1. So your sequence is the following:

0, 1, 1, 2, 3, ...

### Assignment 1

In your language of choice... 

<div class="lesson-content__panel" markdown="1">
  1. Write a method `#fibs` which takes a number and returns that many members of the fibonacci sequence.  Use iteration for this solution.
  2. Now write another method `#fibs_rec` which solves the same problem recursively.
  3. Run both these programs to find the first 5 terms. The result should look something like the example above!
  4. Make a mental note of how long both these programs to solve your problem for 5 terms.
  5. Now run both of these programs to find the first 30 terms.
  6. Is there any noticeable differences in performance between the two programs? Can you figure out why?
</div>

### Student Solutions
Submit a link below to this [file](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/computer_science/project_recursion.md) on the ruby course GitHub repo with your files in it by using a pull request. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/CONTRIBUTING.md) for how.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
</details>


### Project - Merge Sort

This is a classic algorithm question; and one that lends itself *very* well to recursion, the topic at hand! It is an algorithm which, as the name suggests, tackles the problem of sorting data sets. This method of sorting arrays may be alien to you at first; but the main thing to keep in mind that this is a `Divide and Conquer` algorithm. Here is some background viewing to understand what merge sort is:

### Background Viewing

The first step is to actually understand what the merge sort algorithm is doing:

1. Check out [this introductory video](https://youtu.be/Ns7tGNbtvV4) from Harvard's CS50x course.
2. Check out [this more detailed explanation](https://www.youtube.com/watch?v=uEbdK2CG_B8&feature=youtu.be&t=1h2m) by David J. Malan (watch only until 1:14:00).
3. [Merge Sort -- How it Works part 1](https://www.youtube.com/watch?v=OAsokGNa18k) and [Merge Sort -- How it Works part II](http://www.youtube.com/watch?v=nNhpFO9CmPs) on YouTube give you a more formal look at this problem if you're still unclear.

### Assignment 2
<div class="lesson-content__panel" markdown="1">
  1. Build a method `#merge_sort` that takes in an array and returns a sorted array, using a recursive merge sort methodology.
  2. Tips:
      1. Think about what the base case is and what behavior is happening again and again and can actually be delegated to someone else (e.g. that same method!).
      2. It may be helpful to check out the background videos again if you don't quite understand what should be going on.
  3. (OPTIONAL) Build a second method `#merge_sort_iter` that achieves merging behaviour, but iteratively rather than recursively.
</div>

### Student Solutions
Submit a link below to this [file](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/computer_science/project_recursion.md) on the ruby course GitHub repo with your files in it by using a pull request. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/CONTRIBUTING.md) for how.

<details markdown="block">
  <summary> Show Student Solutions </summary>
</details>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Another look at [merge sort](http://www.sorting-algorithms.com/merge-sort)
* For more attempts at recursion try the first 5 problems in [Project Euler](https://projecteuler.net/problems)
