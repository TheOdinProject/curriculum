### Introduction

Use what you have learnt about recursion so far to tackle two classic problems that can leverage recursion: Fibonacci and Merge Sort.

#### Fibonacci

The [Fibonacci Sequence](http://en.wikipedia.org/wiki/Fibonacci_number), is a numerical sequence where each number is the sum of the two numbers before it. Eg. 0, 1, 1, 2, 3, 5, 8, 13 are the first eight digits in the sequence.

You should already be thinking that perhaps this can be solved iteratively rather than recursively, and you would be correct. Nevertheless generating the sequence recursively is an excellent way to better understand recursion.

To understand how recursion works with Fibonacci watch this step-through video from [Khan Academy](https://www.youtube.com/watch?v=zg-ddPbzcKM).

#### Merge sort

A significant part of computer science is dedicated to sorting data. An algorithm which uses the 'divide and conquer' approach of recursion is able to reduce a sorting problem to smaller and smaller sub-problems.

Merge sort is one such sorting algorithm, and can be much faster than other algorithms such as bubble sort on the right data sets. Essentially merge sort recurses through an array of unsorted data until it reaches its smallest sub-set, a single item. Of course an array with a single item is considered sorted. Merge sort then merges the single items back together in sorted order. Pretty clever!

To understand what the merge sort algorithm is doing check out these resources:

1. Watch this [introductory video from Harvard's CS50x course](https://youtu.be/Ns7tGNbtvV4).
1. Watch this more [detailed video explanation by David J. Malan](https://youtu.be/4oqjcKenCH8?t=6248) (watch only until 1:58:33).
1. [The concept of merging](https://youtu.be/6pV2IF0fgKY) and [Merge Sort -- How it Works part](https://youtu.be/mB5HXBb_HY8) on YouTube give you a more formal look at this problem if you're still unclear.
1. (Optional) Play with this [Merge Sort Visualizer](https://www.hackerearth.com/practice/algorithms/sorting/merge-sort/visualize/) to get a better feel for exactly what is happening during a Merge Sort.

### Assignment

<div class="lesson-content__panel" markdown="1">

First up create a file and tackle the fibonacci sequence:

1. Using iteration, write a method `#fibs` which takes a number and returns an array containing that many numbers from the Fibonacci sequence. Using an example input of `8`, this function should return the array `[0, 1, 1, 2, 3, 5, 8, 13]`.
1. Now write another method `#fibs_rec` which solves the same problem recursively.
1. Test both versions of your methods by passing in various lengths as arguments.

Hopefully you were able to solve the problem with recursion! If you need some help understanding what's going on with this function, there are some additional resources linked at the end of this page.

Once you have a firm grasp on solving Fibonacci with recursion, create a new file and work on a merge sort:

1. Build a method `#merge_sort` that takes in an array and returns a sorted array, using a recursive merge sort methodology. An input of `[3, 2, 1, 13, 8, 5, 0, 1]` should return `[0, 1, 1, 2, 3, 5, 8, 13]`, and an input of `[105, 79, 100, 110]` should return `[79, 100, 105, 110]`.

Tips:

- Think about what the base case is and what behavior is happening again and again and can actually be delegated to someone else (e.g. that same method!).
- It may be helpful to check out the background videos again if you don't quite understand what should be going on.

</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- An extensive written JavaScript solution for [recursive Fibonacci](https://www.scaler.com/topics/fibonacci-series-in-javascript/)
- Another look at [merge sort](http://www.sorting-algorithms.com/merge-sort)
- Visualize and [understand](https://www.educative.io/courses/recursion-for-coding-interviews-in-javascript/NEZ7kKgMJKK) the memory allocation for recursive functions
- For more attempts at recursion try the first 5 problems in [Project Euler](https://projecteuler.net/problems)
