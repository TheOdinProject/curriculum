### Introduction

Congratulations on making it to one of the last lessons in Foundations! By this point, you have learned many of the fundamentals of JavaScript. In this lesson, you will learn about Objects - a collection of key-value pairs - as well as some more powerful and commonly used array methods. Before you know it, you'll have a better understanding of how powerful objects and arrays are and how both can be an indispensable part of your JavaScript tool kit!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Creating objects.
- Accessing object properties.
- Being able to use multiple object operators.
- Being able to use some powerful array functions.

### Objects

Objects are a *very* important part of the JavaScript language, and while for the most part you can accomplish simple and even intermediate tasks without worrying about them, any real project that you're going to attempt is going to feature Objects. The uses of Objects in JavaScript can get deep relatively quickly, so for the moment we're only going to cover the basics.  There'll be an in-depth dive later.

1. This javascript.info [article on objects](https://javascript.info/object) is the best place to get started.
2. [The MDN tutorial](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Basics) isn't bad either, so check it out if you need another take on the subject.

### Intermediate/advanced array magic

Besides being a quick and handy way to store data, arrays also have a set of functions for manipulating that data in very powerful ways.  Once you begin to master these functions you will start to see ways to use them all over the place! There are really only a handful of these functions... but as you'll soon see, the possibilities of what you can do with them are near endless.

As an example of what we mean, let's consider a `sumOfTripledEvens` function. It will:

- Take in an array
- For every even number, it will triple it
- Then it will sum all those even numbers

Currently, if you wanted to implement a function like that you may write something similar to this:

```javascript
function sumOfTripledEvens(array) {
  let sum = 0;
  for (let i = 0; i < array.length; i++) {
    if (array[i] % 2 === 0) {
      sum += array[i] * 3;
    }
  }
  return sum;
}
```

We have a function `sumOfTripledEvens` that takes in an `array`, it then iterates through the array and for every even number it adds triple that number to sum. After the `for` loop is complete, it returns the sum.

So that works, but there are more elegant ways of going about this. For instance, you could re-write the above as follows:

```javascript
function sumOfTripledEvens(array) {
  return array
    .filter(x => x % 2 === 0)
    .map(x => x * 3)
    .reduce((accumulator, current) => accumulator + current, 0);
}
```

In the above function we use 3 array methods that accomplish the same task. Let's assume we input the array `[4, 5, 1, 10, 2, 5, 9]`. To break it down:

- `.filter` will take our `array` and remove all non-even numbers from it, so it the result will be `[4, 10, 2]`.
- `.map` will take the result of `.filter` and then transform all those numbers into triple numbers, it's result will be `[12, 30, 6]`.
- `.reduce` will take the result of `.map` and convert that array to a single value. The way it does this is by storing the sum in the `accumulator` variable, which we initialise to `0` as the second argument of the function. Then, it will iterate through the array returned by `.map` and add every element to `accumulator`, finally returning the accumulator.
- Finally, it returns the output of `.reduce` from the function.

In the end, we have a function that is more concise, readable and less prone to bugs.

For a quick recap of these array methods, consider this picture which should visually explain them in terms of sandwiches:

![Alt text](https://static.observableusercontent.com/thumbnail/bea194824f0d5842addcb7910bb488795c6f80f143ab5332b28a317ebcecd603.jpg)

Don't worry if you don't fully understand these methods at this point, the above example is just a teaser to demonstrate their power. The assignment material provided will go deeper into the specifics of these functions.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Start out by watching [this video](https://www.youtube.com/watch?v=HB1ZC7czKRs) from Wes Bos.  To follow along, use your local Javascript30 repository. If you don't have the repo yet, clone it from [here](https://github.com/wesbos/JavaScript30).
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

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

* [What is the difference between objects and arrays?](https://javascript.info/object#summary)
* [How do you access object properties?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Basics#bracket_notation)
* [What is `Array.prototype.map()` useful for?](https://www.youtube.com/watch?v=HB1ZC7czKRs&t=233s)
* [What is `Array.prototype.reduce()` useful for?](https://youtu.be/HB1ZC7czKRs?t=467)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

* Learn about the 'arguments' object on this [page about function parameters](https://www.w3schools.com/js/js_function_parameters.asp).
