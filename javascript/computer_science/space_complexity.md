### Introduction

In the last lesson, we focused on measuring complexity from the perspective of time. We learned about the various ways in which algorithm complexity can be measured and why Big O was the preferred way. We also showed some examples of how this applied to measuring the time complexity of an algorithm.

In this lesson, we'll focus on space complexity and see how the same notations we've already learned can be used to measure how a change in input for our algorithms can affect the amount of memory it uses.

When we talk about memory, we mean primary memory, which is the working memory available to your system to execute algorithms. You can read more about the topic in this [GeeksforGeeks Primary Memory article](https://www.geeksforgeeks.org/primary-memory/).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What do we mean by space complexity.
- Why is it important to consider how our algorithm uses memory space.
- How do we measure space complexity.

### What do we mean by space complexity?

Space complexity can be considered to be the total space used by an algorithm relative to the size of the input. Thinking back to the previous lesson, you'll recall that we don't consider the efficiency of an algorithm in how it performs in one specific instance of that algorithm running. Instead, we want to know how the efficiency changes when the size of the input changes.

Measuring space complexity considers the space used by your algorithm input and auxiliary space. Auxiliary space is the extra space used by the algorithm. These can be things like temporary variables created during the execution of the algorithm. They won't have a lasting impact on memory space but during the execution of the algorithm will need to be considered. Therefore, you can consider the space complexity to be the total amount of working memory our algorithm needs.

### The importance of considering space complexity

If you do any of your own research into algorithm efficiency, you'd be forgiven for assuming that space complexity isn't all that important. Most articles you'll read on the subject spend all or the majority of the time covering time complexity and if they do mention space complexity at all, it's pretty much a footnote.

There are some fair arguments for why. Memory these days is pretty cheap compared to processing power, and therefore it's often easier to get around space constraints by increasing primary memory, for example by buying more [RAM](https://en.wikipedia.org/wiki/Random-access_memory). It's also fair to say that most algorithms you write will probably deal with very manageable input sizes, and therefore space doesn't really become a problem. You'll invariably run into an issue with your program being slow before you have any issues with memory being used up.

On the flip side, although memory is cheap, your hardware will usually have a fixed amount. You can't expand memory easily on the fly in most scenarios. When the problem is one of time, you can just allow the program to run for longer and it will eventually come back with a result. You can't do this with space.

On balance, you'll probably come across problems in which the time it takes to execute is more important than the space it uses, but knowing about measuring space complexity will mean when you do run into a situation where there are space constraints, you'll be prepared to handle it.

### Measuring space complexity

The good news is that we measure space complexity in exactly the same way as time complexity. You already learned about Big O in the last lesson, so you already know how to measure the efficiency of your code. The difference is that you'll need to think about how your algorithm is utilizing memory rather than time.

The first thing to know is that, like time complexity, we measure space complexity by considering all steps including any constants, and then we drop the constants when applying a Big O Notation to the algorithm. So we may have an algorithm that uses memory in Linear Complexity as the input changes, and in doing so creates 3 temporary variables. So we can think of the complexity of our algorithm as O(N) + 3 auxiliary variables using memory. Because those 3 variables are the same no matter our input size, we don't concern ourselves with them when considering the space complexity of our algorithm. So we'd say the space complexity is O(N). This should be familiar to you from the time complexity lesson.

As a reminder the Big O Notations are:

- O(1) - Constant Complexity
- O(log N) - Logarithmic Complexity
- O(N) - Linear Complexity
- O(N log N) - N x log N Complexity
- O(n&#178;) - Quadratic Complexity
- O(n&#179;) - Cubic Complexity
- O(2&#8319;) - Exponential Complexity
- O(N!) - Factorial Complexity

Let's work through some examples. We won't go through every possible complexity because most don't apply for the data structures you'll be familiar with and use the most. We'll cover the most common ones.

#### O(1) - Constant complexity

Consider this example

```js
function multiply(num1, num2) {
  return num1 * num2;
}
```

Here it should hopefully be clear that no matter the arguments we pass to the function call, only a single value is created (the product of the numbers). It doesn't change. Therefore, we can consider the space this takes is always O(1).

#### O(N) - Linear complexity

Most data structures you come across will have a space complexity of O(N). That makes sense - when you increase the number of items in your data structure, it increases the space that data structure occupies in a linear way.

```js
function sumArr(arr) {
  const copyArr = arr.slice();
  let sum = 0;
  copyArr.forEach((number) => {
    sum += number;
  });
  return sum;
}
```

We wrote this in a slightly more verbose way than you'd normally write it in JavaScript to make it a little clearer. Here we have a method which accepts an array. Within, we have two variables. One called `sum` and the other `copyArr` which holds a copy of the array passed in. We then have a `forEach` loop that iterates over the array. The amount of space that this algorithm takes depends on the array that is passed to it. It could be 3 elements in the array or 300. When we don't know the length of the array, we refer to it as N, so we have N + 1 variable called `sum`. We know that we drop constants with Big O, so we are left with N, or O(N) for its Big O notation.

Why did we make a copy of the array? That will be discussed in a later section.

The complexity is replicated no matter the data structure:

```js
function sumObjectValues(obj) {
  const copyObject = { ...obj };
  let sum = 0;
  Object.values(copyObject).forEach((value) => {
    sum += value
  });
  return sum;
}
```

Here as the object size increases, the space it uses grows in a linear way.

#### Other complexities

As we've stated, many data structures share O(N) space complexity, and therefore you won't write many algorithms with a space complexity that differs.

You do find some recursive functions that may have a different space complexity and some sorting algorithms. You normally won't have much reason to consider anything else though.

In the last lesson one of the assignments was a link to the [Big-O cheat sheet](https://www.bigocheatsheet.com/). If you take another look at it now, you may have a better appreciation for just how amazing it is as a reference for space and time complexity. If you scroll down to the data structures and then the sorting algorithms section, you'll see it gives you the time and space complexities. Notice just how many are O(N), especially for data structures. Many sorting algorithms have just O(1) space complexity, something to keep in mind as you come across different sorting algorithms during your learning.

That's why we won't be diving into examples for other Big O notations with space complexity. We'd have to come up with convoluted examples that wouldn't represent most code you'll write. If you do come across a good real world example in your own code, then do let us know and we may consider adding it here for others to consider.

#### Other considerations

One of the common areas that causes confusion when considering space complexity is what constitutes using space in the context of an algorithm. In an earlier example we wrote methods that duplicated an array and object argument. We did that to be explicit. But what if we'd written the method as:

```js
function sumArr(arr) {
  let sum = 0;
  arr.forEach((number) => {
    sum += number;
  });
  return sum;
}
```

When a data structure is passed in as the argument, especially for languages that pass arrays by reference rather than value, it can be a bit unclear if that method considers the space used by that data structure when calculating its space complexity. If we didn't count it, then it would be easy for all our methods to have great space usage on paper because we put the onus on the caller to allocate that space. If we did count it, but the data structure was created for use by many different methods, then the space complexity for all those methods is O(N) when they aren't utilizing additional space. Then consider that if your method receives an array as an input and loops it, an index must be created for the loop which uses additional space.

The first answer to [analyzing space complexity](https://cs.stackexchange.com/questions/127933/analyzing-space-complexity-of-passing-data-to-function-by-reference) provides some great context to the question and gives some thought-provoking answers.

Ultimately when you consider Big O measures the worst-case scenario, it would be easier to err on the side of caution and do consider the space of arguments passed to your method.

### Wrapping up

Measuring the complexity of your algorithms, whether time or space, can be difficult. It takes practice and consideration. For most practice code you write, it's not something that will cross your mind, especially as you wrestle with getting your code to work.

Once your code is working though, and you might be looking to refactor it, it's definitely worth taking a moment to consider if the code is as efficient as it could be. Are you creating unnecessary variables? Or does your algorithm use a data structure with a worse time complexity for what it's mostly used for than another data structure would have been?

On top of these considerations, you also need to balance the readability of your code. If you start introducing [memoization](https://en.wikipedia.org/wiki/Memoization) in order to make your code more efficient, does it mean it's much harder to understand? Is that trade-off worth it? Ultimately, you need to make a call on it. Our advice would be to consider the readability first, and look to refactor for better efficiency if there is a clear impact on performance.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [this article on big O and space complexity](https://dev.to/mwong068/big-o-space-complexity-lcm). It isn't detail heavy but does a good job explaining things clearly, and does lightly cover recursive functions. The code examples are in Ruby, but you should be able to follow along.
1. [This article on recursion and space complexity](https://dev.to/elmarshall/recursion-and-space-complexity-13gc) offers a little more context to recursive functions and their space complexity.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [What is space complexity?](#what-do-we-mean-by-space-complexity)
- [How do we measure space complexity?](#measuring-space-complexity)
- [What are the main considerations we should take into account when optimising code?](#other-considerations)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
