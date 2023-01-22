### Warmup: Fibonacci

The [Fibonacci Sequence](http://en.wikipedia.org/wiki/Fibonacci_number), which sums each number with the one before it, is a great example of a problem that can be solved recursively.

### Assignment 1

<div class="lesson-content__panel" markdown="1">
  1. Using iteration, write a function `fibs` which takes a number and returns an array containing that many numbers from the fibonacci sequence. Using an example input of `8`, this method should return the array `[0, 1, 1, 2, 3, 5, 8, 13]`.
  2. Now write another method `fibsRec` which solves the same problem recursively.  This can be done in just a couple of lines (or 1 if you're crazy, but don't consider either of these lengths a requirement... just get it done).
</div>

In order to run these functions you'll need to run it from somewhere. You can run scripts from the command line using the node command installed with nodejs. You can read about the common ways to do this [here](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/command-line/node-run-cli.en.md).

#### Understanding Recursive Fibonacci

Did you figure it out? Congratulations! But do you really understand what is taking place? If you need some help understanding what's going on with this method, give [Khan Academy's Stepping Through Recursive Fibonacci Function video](https://www.youtube.com/watch?v=zg-ddPbzcKM) a watch. If you prefer to read, [Recursive Fibonacci Explained](https://medium.com/launch-school/recursive-fibonnaci-method-explained-d82215c5498e) is also very helpful!

### Project: Merge Sort
  
Sorting algorithms are a great way to get to grips with recursion.  One such algorithm is [Merge Sort](http://en.wikipedia.org/wiki/Merge_sort), a type of sort that lends itself well to recursion and can be much faster than other algorithms such as bubble sort on the right data sets.  You'll build a function which sorts a given array but uses a "merge sort" function for doing so.

It can be a bit strange to wrap your head around, but just remember you're "dividing and conquering" the problem.

### Background Viewing

The first step is to actually understand what the merge sort algorithm is doing:

1. Check out this [introductory video from Harvard's CS50x course](https://youtu.be/Ns7tGNbtvV4).
2. Check out this more [detailed video explanation by David J. Malan](https://www.youtube.com/watch?v=uEbdK2CG_B8&feature=youtu.be&t=1h2m) (watch only until 1:14:00).
3. [The concept of merging](https://youtu.be/6pV2IF0fgKY) and [Merge Sort -- How it Works part ](https://youtu.be/mB5HXBb_HY8) on YouTube give you a more formal look at this problem if you're still unclear.
4. (Optional) Play with this [Merge Sort Visualizer](https://www.hackerearth.com/practice/algorithms/sorting/merge-sort/visualize/) to get a better feel for exactly what is happening during a Merge Sort.

### Assignment 2
<div class="lesson-content__panel" markdown="1">
  1. Build a function `mergeSort` that takes in an array and returns a sorted array, using a recursive merge sort methodology.
  2. Tips:
      1. Think about what the base case is and what behavior is happening again and again and can actually be delegated to someone else (e.g. that same method!).
      2. It may be helpful to check out the background videos again if you don't quite understand what should be going on.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* Another look at [merge sort](http://www.sorting-algorithms.com/merge-sort)
* Visualize and [understand](https://www.educative.io/courses/recursion-for-coding-interviews-in-javascript/NEZ7kKgMJKK) the memory allocation for recursive functions
* For more attempts at recursion try the first 5 problems in [Project Euler](https://projecteuler.net/problems)
