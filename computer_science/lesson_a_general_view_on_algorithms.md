### Introduction

In the previous project, we looked at how to solve a very simple problem like generating the fibonacci sequence both recursively and iteratively and explored their strengths and weaknesses. We then looked at the `Merge Sort` algorithm, and worked on implementing it recursively at the very least. If you attempted to implement it iteratively; you may well have found the approach to implementing it vastly different to the recursive counter part.

In this lesson, we will be looking at an overview of different common categories of problems faced in computer science, and a few of their solutions algorithms. It should be noted that these algorithms approach arrays specifically; and not other data structures that we shall look at in future.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

* Name three different sorting algorithms
* Name two different types of search algorithm, with an example of each

### Sort it out!

More often than not, regardless of whether you're doing Web Development or some other kind of software engineering; you will most likely be dealing with information of some sort and may need to store it. You could take the time to store that piece of data into the correct place to maintain a sorted data set; or you can just insert said data in and bring order to the chaos later! Arranging data in some sequential order is the task that sorting algorithms should solve.

#### Problem - We have an unsorted away, and we need to have it in sequential order

##### Merge Sort

Thankfully, you've already looked at `Merge sort` in your previous project. With this algorithm, you split the original algorithm into two chunks, and then merge sort the individual chunks, further breaking down those chunks and building them back up in sorted order. This is a `Divide and Conquer` algorithm. This is an algorithm that commonly sees use built into some languages.

##### Quicksort

A fierce competitor to `Merge Sort`, and an algorithm that commonly sees use, [Quicksort](https://en.wikipedia.org/wiki/Quicksort) is another efficient sorting algorithm that is typically faster than Merge Sort if implemented well. In the very worst cases, however, `Merge` is faster.

Quicksort is another `Divide and Conquer` algorithm, which finds a pivot some point in the array, and partitions the array into two sub arrays, depending on whether the element's value is comparatively less than or greater than the pivot. This process is repeated on both sub arrays, and the sub arrays are joined with the pivot to return the sorted array.

##### Insertion Sort

Inefficient sorting algorithm in large, very unsorted data sets; and very simple as an algorithm, [Insertion Sort](https://en.wikipedia.org/wiki/Insertion_sort) is an algorithm that normally flashes through people's minds if they're asked to put things in order. The algorithm looks at each element in an array, then searches through the array again to find the index that matches it's comparison criteria, then puts the element back in.

For heavily unsorted data sets, this method of sorting will go through your data set a large number of times, which is why this is an inefficient algorithm for such sets. For almost completed sets, however; fewer comparisons need to be made, and even fewer swaps, which gives `Insertion Sort` an advantage in these specific situations. If you were to put data into a sorted array into it's correct position, you're essentially performing an `Insertion Sort`

##### Bubble Sort

An similarly inefficient cousin to the `Insertion Sort`; [Bubble Sort](https://en.wikipedia.org/wiki/Bubble_sort) is also not a great idea for use in largely unsorted datasets. It works by comparing each two consecutive elements in an array, and swapping them if they're not in order; and once the end of the array is reached, will repeat the entire process again until no swaps need to be made.

This algorithm is mainly used as an education exercise for doing things with arrays and basic sorting.

##### Bogosort

This isn't an algorithm that you should ***ever*** use. However, it deserves a special mention for being hilariously (and intentionally) bad. As it's wiki so aptly describes it; imagine throwing a deck of cards in the air, picking up the cards at random, and repeating this until you have a sorted deck. Yeah. That's [Bogosort](https://en.wikipedia.org/wiki/Bogosort)


### Searching

So we have a data set, be it sorted or not. At some point, we're going to need to have a look through it to find some value if such a value actually exists. This problem is generally approached by algorithms falling into one of two categories:

#### Sequential Search

As the name suggests, this involves starting from one end of your data set, and through through each data point sequentially until you find the correct one if it exists. `Linear Search` is an example of this. You will have most certainly used this method when iterating through your arrays in previous projects. The biggest advantage with this paradigm is that it can reliably handle unsorted data sets.

#### Interval Search

Unlike it's sequential cousin, interval search involves starting at some data point, usually the middle of the array; and then shifting it's focus to a different focus point depending on whether the desired value is less than, or greater than, the current value being looked at. This can make the searching process considerably faster than sequential searches, with the downside of requiring the dataset to be ordered beforehand.

##### Binary Search

The classic example of an `Interval Search`, `Binary Search` starts off at the mid point of a dataset. If the mid point does not have the value the algorithm wants, the search moves to the point between the mid point and the beginning/end of the array, depending on whether the wanted value is less than or greater than the currently looked at value. This process is then repeated in the sub section of the array from beginning to mid point or mid point to end of the array. Rinse and repeat until the value is found or no value is found!

### Conclusion and remarks

In this lesson, we have gone into some detail about searching and sorting data arrays and ways of going about it, and also had a good laugh at Bogosort! We understand the strengths and weaknesses, on a high level, of some algorithms; as well as different approaches to this commonly faced problems!

It should be stressed again, like in previous lessons; that most languages will have a well written, highly efficient search/sort algorithm(s) built into the language for you to use. These are written by people with a wealth of experience. As much as you should learn how to write these algorithms as an educational exercise or curiosity; you shouldn't "reinvent the wheel" in the real world unless you have a good, well researched reason to. Or if your boss demands it!

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Do some reading on the seven algorithms mentioned above! Wikipedia is a fairly solid guide on these. 
  2. See if you can write the pseudo-code (or language code!) for these algorithms as practice! Try them on different data sets to figure out what works and what doesn't work so well!
  3. Look around the internet to see what algorithm your language uses to solve these problems. Sorting in particular!
</div>