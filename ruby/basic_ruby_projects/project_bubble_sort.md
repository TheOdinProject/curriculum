### Introduction
Sorting algorithms are some of the earliest that you typically get exposed to in Computer Science.  It may not be immediately obvious how important they are, but it shouldn't be hard to think of some examples where your computer needs to sort some massive datasets during everyday operations.

One of the simpler (but more processor-intensive) ways of sorting a group of items in an array is **bubble sort**, where each element is compared to the one next to it and they are swapped if the one on the left is larger than the one on the right.  This continues until the array is eventually sorted.

Check out [this video from Harvard's CS50x on Bubble Sort](https://www.youtube.com/watch?v=8Kp-8OGwphY).

There's also [an entry on Bubble Sort on Wikipedia](http://en.wikipedia.org/wiki/Bubble_sort) that's worth taking a look at.

<img src="https://cdn.statically.io/gh/TheOdinProject/curriculum/284f0cdc998be7e4751e29e8458323ad5d320303/ruby_programming/basic_ruby_projects/bubble_sort/img/00.gif" class="lesson-content__small-image" markdown="1">

### Assignment

<div class="lesson-content__panel" markdown="1">

* Build a method `#bubble_sort` that takes an array and returns a sorted array.  It must use the bubble sort methodology (using `#sort` would be pretty pointless, wouldn't it?).

~~~ruby
> bubble_sort([4,3,78,2,0,2])
=> [0,2,2,3,4,78]
~~~
</div>