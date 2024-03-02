### Introduction

Congratulations on making it to one of the last lessons in Foundations! By this point, you have learned many of the fundamentals of JavaScript. In this lesson, you will learn about Objects - a collection of key-value pairs - as well as some more powerful and commonly used array methods.

Before you know it, you'll have a better understanding of how powerful objects and arrays are and how both can be an indispensable part of your JavaScript tool kit!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Creating objects.
- Accessing object properties.
- Using multiple object operators.
- Using the `map`, `filter` and `reduce` array methods.

### Objects

Objects are a *very* important part of the JavaScript language, and while for the most part you can accomplish simple and even intermediate tasks without worrying about them, any real project that you're going to attempt is going to feature Objects. The uses of Objects in JavaScript can get deep relatively quickly, so for the moment we're only going to cover the basics. There'll be an in-depth dive later.

1. This JavaScript.info [article on objects](https://javascript.info/object) is the best place to get started.
1. The [MDN tutorial](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Basics) isn't bad either, so check it out if you need another take on the subject.

### Intermediate/advanced array magic

Besides being a quick and handy way to store data, arrays also have a set of functions for manipulating that data in very powerful ways. Once you begin to master these functions you will start to see ways to use them all over the place! There are really only a handful of these functions, but as you'll soon see, the possibilities of what you can do with them are near endless.

As an example of what we mean, let's consider a `sumOfTripledEvens` function. It will:

1. Take in an array.
1. For every even number, it will triple it.
1. Then it will sum all those even numbers.

Can you try thinking of how you could implement a function like that using pseudocode?

1. We need to perform an operation only on the even numbers.
1. We need to transform *those* numbers by multiplying them by 3.
1. Finally, we need to add the result up from the previous transformation.

So using that logic, you may end up implementing something like this:

```javascript
function sumOfTripledEvens(array) {
  let sum = 0;
  for (let i = 0; i < array.length; i++) {
    // Step 1: If the element is an even number
    if (array[i] % 2 === 0) {
      // Step 2: Multiply this number by three
      const tripleEvenNumber = array[i] * 3;

      // Step 3: Add the new number to the total
      sum += tripleEvenNumber;
    }
  }
  return sum;
}
```

In the above code, there are 3 important snippets to consider:

- `if (array[i] % 2 === 0)`: checks if a given number is even.
- `array[i] * 3;`: multiply this number by three.
- `sum += tripleEvenNumber`: add that number to the total.

Every single piece solves a crucial problem with our code.
But it is possible to make the function more concise and readable by using some built-in array methods.
These methods are slightly more complicated than you've been used to, so let's take a moment to understand how to use them.

#### The map method

`map` is one such function. It expects a `callback` as an argument, which is a fancy way to say "I want you to pass another function as an argument to my function".

Let's say we had a function `addOne`, which takes in `num` as an argument and outputs that `num` increased by 1.
And let's say we had an array of numbers, `[1, 2, 3, 4, 5]` and we'd like to increment all of these numbers by 1 using our `addOne` function.
Instead of making a `for` loop and iterating over the above array, we could use our `map` array method instead, which **automatically** iterates over an array for us.
We don't need to do any extra work aside from simply passing the function we want to use in:

```javascript
function addOne(num) {
  return num + 1;
}
const arr = [1, 2, 3, 4, 5];
arr.map(addOne); // Outputs [2, 3, 4, 5, 6]
```

This is a much more elegant approach, what do you think? For simplicity, we could also define an inline function right inside of `map` like so:

```javascript
const arr = [1, 2, 3, 4, 5];
arr.map((num) => num + 1); // Outputs [2, 3, 4, 5, 6];
```

#### The filter method

`filter` is somewhat similar to `map`. It still iterates through the array and applies the callback function on every item. However, instead of transforming the values in the array, it returns the original values of the array, but only IF the callback function returns `true`.
Let's say we had a function, `isOdd` that returns either `true` if a number is odd or `false` if it isn't.

The `filter` method expects the `callback` to return either `true` or `false`. If it returns `true`, the value is included in the output. Otherwise, it isn't.
Consider the array from our previous example, `[1, 2, 3, 4, 5]`.
If we wanted to remove all even numbers from this array, we could use `.filter()` like this:

```javascript
arr.filter(isOdd); // Outputs [1, 3, 5];
```

- `filter` will iterate through `arr` and pass **every value** into the `isOdd` callback function, one at a time.
- `isOdd` will return `true` when the value is odd, which means this value is included in the output.
- If it's an even number, `isOdd` will return `false` and not include it in the final output.

#### The reduce method

Finally, let's say that we wanted to multiply all of the numbers in our `arr` together like this: `1 * 2 * 3 * 4 * 5`.
First, we'd have to declare a variable `total` and initialize it to 1. Then, we'd iterate through the array with a `for` loop and multiply the `total` by the current number.

But we don't actually need to do all of that, we have our `reduce` method that will do the job for us. Just like `.map()` and `.filter()` it expects a callback function.
However, there are two key differences with this array method:

- The callback function takes two arguments instead of one. The first argument is the `accumulator`, which is the current value of the result *at that point in the loop*. The first time through, this value will either be set to the `initialValue` (described in the next bullet point), or the first element in the array if no `initialValue` is provided. The second argument for the callback is the `current` value, which is the item currently being iterated on.
- It also takes in an `initialValue` as a second argument (after the callback), which helps when we don't want our initial value to be the first element in the array. For instance, if we wanted to sum all numbers in an array, we could call reduce without an `initialValue`, but if we wanted to sum all numbers in an array and add 10, we could use 10 as our `initialValue`.

```js
const arr = [1, 2, 3, 4, 5];
arr.reduce((total, currentItem) => total * currentItem, 1); // Outputs 120;
```

In the above function, we:

- Pass in a callback function, which is `(total, currentItem) => total * currentItem`.
- Initialize total to `1` in the second argument.

So what `.reduce()` will do, is it will once again go through every element in `arr` and apply the `callback` function to it. It then changes `total`, without actually changing the array itself. After it's done, it returns `total`.

#### Summary

You've learnt about the three powerful array methods which are `map`, `filter` and `reduce`. They allow us to write shorter code that is more readable and less prone to bugs.

For a quick recap of these array methods, consider this picture which should visually explain them in terms of sandwiches:

![example of filter, map and reduce methods being used to visually represent making a sandwich](https://static.observableusercontent.com/thumbnail/bea194824f0d5842addcb7910bb488795c6f80f143ab5332b28a317ebcecd603.jpg)

Let's do some quick practice before your assignment! Rewrite the `sumOfTripledEvens(array)` function using these three methods.

Once you are finished and you've tested that your function works correctly, check out the solution below.

<details markdown="block"><summary>Solution</summary>

```javascript
function sumOfTripledEvens(array) {
  return array
    .filter((num) => num % 2 === 0)
    .map((num) => num * 3)
    .reduce((acc, curr) => acc + curr);
}
```

</details>

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Start out by watching [this video](https://www.youtube.com/watch?v=HB1ZC7czKRs) from Wes Bos. To follow along, use your local Javascript30 repository. If you don't have the repo yet, clone it from [here](https://github.com/wesbos/JavaScript30).
1. Watch and code with [Part 2](https://www.youtube.com/watch?v=QNmRfyNg1lw) of Wes Bos's array series.
1. For a more comprehensive and in-depth guide to array methods in JavaScript, you can also check out this [array method guide](https://javascript.info/array-methods). This resource covers each method in detail, with examples and explanations of their usage.
1. At this point you just need a little more practice!  Go back to the [JavaScript exercises repository](https://github.com/TheOdinProject/javascript-exercises) that we introduced in the [Fundamentals Part 4](https://www.theodinproject.com/lessons/foundations-fundamentals-part-4) assignment. Review each README file prior to completing the following exercises in order:
    - `08_calculator`
    - `09_palindromes`
    - `10_fibonacci`
    - `11_getTheTitles`
    - `12_findTheOldest`

Note: Solutions for these exercises can be found in the `solution` folder of each exercise.

If you feel yourself getting overwhelmed or stuck, don't be afraid to go back and review or ask for help on our [Discord](https://discord.gg/fbFCkYabZB)!

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is the difference between objects and arrays?](https://javascript.info/object#summary)
- [How do you access object properties?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Basics#bracket_notation)
- [What is `Array.prototype.map()` useful for?](https://www.youtube.com/watch?v=HB1ZC7czKRs&t=233s)
- [What is `Array.prototype.filter()` useful for?](https://www.youtube.com/watch?v=HB1ZC7czKRs&t=84s)
- [What is `Array.prototype.reduce()` useful for?](https://youtu.be/HB1ZC7czKRs?t=467)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Learn about the `arguments` object on this [page about function parameters](https://www.w3schools.com/js/js_function_parameters.asp).
