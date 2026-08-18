### Introduction

**Bubble Sort** is one of the simplest sorting algorithms to understand. It works by repeatedly comparing **adjacent elements** in an array and swapping them if they are in the wrong order.

The name comes from the way larger elements gradually "bubble" toward the end of the array after each pass.

For example, given:

```js
[5, 3, 8, 4, 2]

5 > 3  → swap → [3, 5, 8, 4, 2]
5 < 8  → no swap
8 > 4  → swap → [3, 5, 4, 8, 2]
8 > 2  → swap → [3, 5, 4, 2, 8]
```
After the first pass, the largest value (8) is in its correct position at the end.

The algorithm then repeats the process on the remaining unsorted portion of the array until the entire array is sorted.

Bubble Sort is not an efficient sorting algorithm for large datasets, but it is useful for learning fundamental algorithmic concepts such as iteration, comparison, swapping, optimization, and time complexity.

Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

* Understand how Bubble Sort works.
* Learn how adjacent elements are compared and swapped.
* Implement Bubble Sort using JavaScript.
* Understand the purpose of multiple passes through an array.
* Learn about the best-case and worst-case time complexity of Bubble Sort.
* Understand how Bubble Sort can be optimized.
* 
* Assignment
1. Learn the basic idea behind ⁠Bubble Sort and how repeatedly swapping adjacent elements can sort an array.
2. Work through Bubble Sort by hand using an unordered array such as [5, 3, 8, 4, 2].
3. Write a JavaScript function that takes an array and sorts it using Bubble Sort.
4. Modify your implementation so that it stops early if an entire pass occurs without making any swaps.
5. Test your implementation with arrays that are already sorted, reverse sorted, and randomly ordered.
6. Compare Bubble Sort with the Merge Sort algorithm you implemented previously. Think about why Merge Sort performs better on large datasets.

Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can’t answer a question, review the material, but keep in mind you are not expected to memorize or master every detail.

* What is the basic idea behind Bubble Sort?
* Why does Bubble Sort compare adjacent elements?
* What happens to the largest unsorted element after one complete pass?
* Why does Bubble Sort require multiple passes through the array?
* What is the worst-case time complexity of Bubble Sort?
* What is the best-case time complexity of an optimized Bubble Sort?
* What does the swapped variable accomplish in an optimized implementation?
* Is Bubble Sort an in-place sorting algorithm? Why?
* Is Bubble Sort stable? Why?
* Why is Bubble Sort generally unsuitable for sorting large datasets?
* How does Bubble Sort compare with Merge Sort in terms of time complexity?