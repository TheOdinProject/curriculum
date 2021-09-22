### This is it

You've learned a lot a different `algorithms` and `Big O` notation. You may still feel a bit nervous about navigating your way around `Big O`; but this project should give you some practical experience in how algorithms behave! 

In this project, you'll be using your language of choice for writing an `insertion sort` and a `merge sort` (if you haven't done the [previous project](http://localhost:3000/courses/computer-science/lessons/a-general-view-on-algorithms)); and testing them against large unsorted and sorted arrays. 

You will then be implementing a `Linear Search` and `Binary Search` algorithm to tackle finding an element in these arrays; keeping in mind how long it takes each algorithm to complete it's search. So let's start with the sorting!

### Project Part 1 - Insertion Sort

First, we shall explore sorting arrays in a more practical and sensible fashion, let us start by comparing `insertion sort` with our previously made `merge sort`.

In your language of choice... 

<div class="lesson-content__panel" markdown="1">
  1. Write a method `#insertion_sort` which takes an array and returns the sorted array.
    1. If you're stuck, [here is the wiki page for Insertion Sort](https://en.wikipedia.org/wiki/Insertion_sort)
  2. Check that it works against smaller arrays. 
  3. Set a variable `sorted_arr` which will be the result of your `#insertion_sort` against an array of 100000 or more values.
  4. Grab a cup of tea/coffee, it'll take a while.
  5. Use `#insertion_sort` against the sorted_arr and observe how long it takes to complete.
  6. Do the same with your previously written `#merge_sort`, and compare the two in both situations.
</div>

### Project Part 2 - Linear and Binary Search

Now that we figured out how to bring order to the chaos that is our data; let us be able to find what we want within said data with `linear search` and `binary search`. 

In your language of choice...
<div class="lesson-content__panel" markdown="1">
  1. Write a method `#linear_search` which takes an array and a desired value, and returns the desired value if found, otherwise false.
    1. If you unsure, we actually sneakily covered this very algorithm in our [previous lesson](http://localhost:3000/courses/computer-science/lessons/the-big-o)
  2. Test this method against small arrays to ensure you've got it right.
  3. Write a methond `#binary_search` which takes the same parameters and returns the same way as your `#linear_search`,
    1. We also snuck this algorithm in our [previous lesson](http://localhost:3000/courses/computer-science/lessons/the-big-o)
  4. Test this method against small *sorted* arrays to ensure you've got it right. 
  5. Test both methods against small sorted arrays where you know you will or won't find your wanted value. 
  6. Test both methods against small, deliberately unsorted arrays. Do they both work? Why, or why not?
  7. Test both methods against a very large, sorted array. Are their discrepancies in performance? Why, or why not?
</div>

### Peer Submissions
Submit a link below to this [file](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/computer_science/project_recursion.md) on the ruby course github repo with your files in it by using a pull request. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.

<details markdown="block">
  <summary> Show Peer Submissions </summary>
</details>
