### Warmup: Fibonacci

The [Fibonacci Sequence](http://en.wikipedia.org/wiki/Fibonacci_number), which sums each number with the one before it, is a great example of a problem that can be solved recursively.

### Assignment 1

<div class="lesson-content__panel" markdown="1">
  1. Using iteration, write a method `#fibs` which takes a number and returns an array containing that many numbers from the Fibonacci sequence. Using an example input of `8`, this method should return the array `[0, 1, 1, 2, 3, 5, 8, 13]`.
  1. Now write another method `#fibs_rec` which solves the same problem recursively.
</div>

#### Understanding recursive Fibonacci

Did you figure it out? Congratulations! But do you really understand what is taking place? If you need some help understanding what's going on with this method, give [Khan Academy's Stepping Through Recursive Fibonacci Function video](https://www.youtube.com/watch?v=zg-ddPbzcKM) a watch. If you prefer to read, [Recursive Fibonnaci Explained](https://medium.com/launch-school/recursive-fibonnaci-method-explained-d82215c5498e) is also very helpful!

### Project: merge sort

We spent some time early on dealing with sorting (e.g. bubble sort).  Now it's time to take another look at sorting with [Merge Sort](http://en.wikipedia.org/wiki/Merge_sort), a type of sort that lends itself well to recursion and can be much faster than bubble sort on the right data sets.  You'll build a method which sorts a given array but uses a "merge sort" method for doing so.

It can be a bit strange to wrap your head around, but just remember you're "dividing and conquering" the problem.
<div class="lesson-note lesson-note--warning" markdown="1">
  The Wikipedia article above uses merge sort examples written in C-like code. This code will likely look quite different from what you're used to. Don't waste time trying to understand the specifics of the language, and just focus on the idea it is trying to get across.
</div>

### Background viewing

The first step is to actually understand what the merge sort algorithm is doing:

1. Check out this [introductory video from Harvard's CS50x course](https://youtu.be/Ns7tGNbtvV4).
1. Check out this more [detailed video explanation by David J. Malan](https://youtu.be/4oqjcKenCH8?t=6248) (watch only until 1:58:33).
1. [Merge Sort -- How it Works part 1](https://www.youtube.com/watch?v=OAsokGNa18k) and [Merge Sort -- How it Works part II](http://www.youtube.com/watch?v=nNhpFO9CmPs) on YouTube give you a more formal look at this problem if you're still unclear.
1. (Optional) Play with this [Merge Sort Visualizer](https://www.hackerearth.com/practice/algorithms/sorting/merge-sort/visualize/) to get a better feel for exactly what is happening during a Merge Sort.

### Assignment 2

<div class="lesson-content__panel" markdown="1">
  1. Build a method `#merge_sort` that takes in an array and returns a sorted array, using a recursive merge sort methodology. An input of `[3, 2, 1, 13, 8, 5, 0, 1]` should return `[0, 1, 1, 2, 3, 5, 8, 13]`, and an input of `[105, 79, 100, 110]` should return `[79, 100, 105, 110]`.
  2. Tips:
      1. Think about what the base case is and what behavior is happening again and again and can actually be delegated to someone else (e.g. that same method!).
      2. It may be helpful to check out the background videos again if you don't quite understand what should be going on.
</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Another look at [merge sort](http://www.sorting-algorithms.com/merge-sort)
- For more attempts at recursion try the first 5 problems in [Project Euler](https://projecteuler.net/problems)
