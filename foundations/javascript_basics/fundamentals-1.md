Let's dive right in to JavaScript!

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

* How do you declare a variable?
* What are three different ways to declare a variable?
* Which one should you use when?
* What are the rules for naming variables?
* What are operators, operands, and operations?
* What is concatenation and what happens when you add numbers and strings together?
* What are the different types of operators in JavaScript?
* What is the difference between `==` and `===`?
* What are operator precedence values?
* What are the increment/decrement operators?
* What is the difference between prefixing and post-fixing them?
* What are assignment operators?
* What is the "Unary +" Operator?

### How to Run JavaScript Code

All JavaScript we will be writing in the majority of the Foundations course will be run via the browser. Later lessons in Foundations and the NodeJS path will show you how to run JavaScript outside of the browser environment. Outside of these lessons, for now you should always default to running your JavaScript in the browser unless otherwise specified, otherwise you may run into unexpected errors.

The simplest way to get started is to simply create an HTML file with the JavaScript code inside of it.  Type the basic HTML skeleton into a file on your computer somewhere:

~~~html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Page Title</title>
</head>
<body>
  <script>
    // Your JavaScript goes here!
    console.log("Hello, World!")
  </script>
</body>
</html>
~~~

Save and open this file up in a web browser (you can use Live Server to do this!) and then <span id="access-devTools-console">open up the browser's console by right-clicking on the blank webpage and selecting "Inspect" or "Inspect Element".  In the 'Developer Tools' pane find and select the 'Console' tab</span>, where you should see the output of our `console.log` statement.


> <span id="console-log">`console.log()` is the command to print something to the developer console in your browser. You can use this to print the results from any of the following articles and exercises to the console.</span> We encourage you to code along with all of the examples in this and future lessons.

Another way to include JavaScript in a webpage is through an external script. This is very similar to linking external CSS docs to your website. 

~~~html
  <script src="javascript.js"></script>
~~~

JavaScript files have the extension `.js` similar to `.css` for stylesheets. External JavaScript files are used for more complex scripts.

### Variables

You can think of variables as simply "storage containers" for data in your code. <span id="variable-declaration">Until recently there was only one way to create a variable in JavaScript &mdash; the `var` statement. But in the newest JavaScript versions we have two more ways &mdash; `let` and `const`.</span>

1. [This variable tutorial](http://javascript.info/variables) will explain you everything you need to know! Be sure to do the __Tasks__ at the end. Information won't stick without practice!

The above tutorial mentioned this, but it's important enough to note again: `let` and `const` are both relatively new ways to declare variables in JavaScript. <span id="avoid-var">In _many_ tutorials (and code) across the internet you're likely to encounter `var` statements. Don't let it bother you! There's nothing inherently wrong with `var`, and in most cases `var` and `let` behave the same way. But sometimes the behavior of `var` is _not_ what you would expect. Just stick to `let` (and `const`) for now.</span> The precise differences between `var` and `let` will be explained later.

### Numbers

Numbers are the building blocks of programming logic!  In fact, it's hard to think of any useful programming task that doesn't involve at least a little basic math... so knowing how numbers work is obviously quite important.  Luckily, it's also fairly straightforward.

1. [This W3Schools lesson](https://www.w3schools.com/js/js_arithmetic.asp) followed by [this one](https://www.w3schools.com/js/js_numbers.asp), are good introductions to what you can accomplish with numbers in JavaScript.
2. [This MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Math) covers the same info from a slightly different point of view, while also teaching you how to apply some basic math in JavaScript. There's much more that you can do with numbers, but this is all you need at the moment.
3. Read through \(and code along with!\) [this article](http://javascript.info/operators) about operators in Javascript.  Don't forget to do the "Tasks" at the bottom of the page!  It will give you a pretty good idea of what you can accomplish with numbers (among other things!) in JavaScript.

### Practice

<div class="lesson-content__panel" markdown="1">
Try the following exercises (and don't forget to use `console.log()`!):

1. Add 2 numbers together! (just type  `console.log(23 + 97)`   into your html file)
2. Add a sequence of 6 different numbers together.
3. Print the solution to the following equation: `(4 + 6 + 9) / 77`
   1. Answer should be approximately `0.24675`
4. Let's use variables!
   1. Type the following at the top of the script tag: `let a = 10`
   2. In the console `console.log(a)` should print `10`
   3. Try the following: `9 * a`
   4. and this: `let b = 7 * a` (returns `undefined` \*) and then `console.log(b)`
5. You should be getting the hang of this by now... try this sequence:
   1. Declare a constant variable `max` with the value `57`
   2. Set another variable `actual` to `max - 13`
   3. Set another variable `percentage` to `actual / max`
   4. If you type `percentage` in the console and press enter you should see a value like `0.7719`
6. Take a few minutes to keep playing around with various things in your script tag.  Eventually, we will learn how to actually make those numbers and things show up on the webpage, but all of this logic will remain the same, so make sure you're comfortable with it before moving on.

_* As you might have noticed by running Javascript code in the console, the console prints the result of the code it executes (called a return statement). You will learn more about these in the next lessons, however for now it is good to remember that a declaration with an assignment (such as `let b = 7 * a`) returns `undefined` and so you cannot declare and assign a value to a variable and read its value in the same line.`_
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

[Hacker Noon on why you shouldn't use `var` anymore](https://hackernoon.com/why-you-shouldnt-use-var-anymore-f109a58b9b70)

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* <a class="knowledge-check-link" href="#variable-declaration">Name the three ways to declare a variable?</a>
* <a class="knowledge-check-link" href="#avoid-var">Which of the three variable declarations should you avoid and why?</a>
* <a class="knowledge-check-link" href="https://javascript.info/variables#variable-naming">What rules should you follow when naming variables?</a>
* <a class="knowledge-check-link" href="https://javascript.info/operators#string-concatenation-with-binary">What should you look out for when using the `+` operator with numbers and strings?</a>
* <a class="knowledge-check-link" href="https://javascript.info/operators#remainder"> How does the `%` operator work?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_numbers.asp"> Explain the difference between `==` and `===`.</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_numbers.asp">When would you receive a `NaN` result?</a>
* <a class="knowledge-check-link" href="https://javascript.info/operators#increment-decrement">How do you increment and decrement a number?</a>
* <a class="knowledge-check-link" href="https://javascript.info/operators#increment-decrement">Explain the difference between prefixing and post-fixing increment/decrement operators.</a>
* <a class="knowledge-check-link" href="https://javascript.info/operators#operator-precedence">What is operator precedence and how is it handled in JS?</a>
* <a class="knowledge-check-link" href="#access-devTools-console"> How do you access developer tools and the console?</a>
* <a class="knowledge-check-link" href="#console-log">How do you log information to the console?</a>
* <a class="knowledge-check-link" href="https://javascript.info/operators#numeric-conversion-unary">What does unary plus operator do to string representations of integers?</a>
