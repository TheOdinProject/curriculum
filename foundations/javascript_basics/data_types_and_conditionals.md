### Introduction

There are a few extremely common types of data that you will encounter in JavaScript, and these lessons on the fundamentals will give you a really strong foundation in all of them. However, before we start digging deep, read through this [overview of the most common data types in JavaScript](http://javascript.info/types).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Name the eight data types in JavaScript.
- Understand the difference between single, double, and backtick quotes.
- Embed a variable/expression in a string.
- Understand what a method is.
- Name the three logical operators.
- Understand what the comparison operators are.
- Understand what conditionals are.
- Understand what nesting is.
- Understand what truthy and falsy values are.

### Strings

Depending on what kind of work you're doing, you might end up working more with pieces of text rather than numbers. A **string** is a piece of text... and is a fundamental building block of the language.

1. Read and code along with this [MDN tutorial on strings in JavaScript](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings). Skip the `Concatenation in context` section, as it covers concepts we will cover in a later lesson on DOM Manipulation.
1. Go through [the W3Schools lesson on string methods](https://www.w3schools.com/js/js_string_methods.asp) to learn a bit more about what you can do with strings.
1. Vocabulary time: a **method** is a bit of functionality built into the language or specific data types. In [the W3Schools lesson on string methods](https://www.w3schools.com/js/js_string_methods.asp), you've learned about a few methods that can be used on strings, such as `replace` and `slice`. The [MDN documentation for strings](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) provides an exhaustive reference for many more built-in string methods. You are not expected to memorize these but the documentation will be a very useful reference to revisit, so bookmark it!

### Conditionals

Now it's time for the fun stuff...  So far, we haven't done much with our programming that you couldn't do with basic math skills. Sure, we've told our computer how to do the math, which makes it quicker, but the essence of programming is teaching the computer how to make decisions to do more involved things. Conditionals are how we do that.

1. Step one in learning about conditionals is making sure you have a good grasp on [comparisons](http://javascript.info/comparison).
1. JavaScript.info has a [good tutorial on logical operators](http://javascript.info/logical-operators). A little heads up regarding this reading's tasks: there will be questions where you see `alert()` with a number or string inside the parenthesis. What's happening here will be discussed later in the curriculum. Some of the answers may not make sense now, but they are accurate, and you will understand them as you progress in the curriculum. Don't worry too much about it now!
1. The [MDN article on conditionals](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals) is a great introduction to various ways to write conditional code.
1. JavaScript.info's [lesson on `if/else`](http://javascript.info/ifelse) covers the same basic concept \(read through it as a review!\) and - more importantly - offers the usual 'tasks' at the bottom of the page!
1. [Learn about the `switch` statement](https://javascript.info/switch), which is handy when you have multiple conditions.

### Assignment

<div class="lesson-content__panel" markdown="1">

To give you a good bit of practice, we have created JavaScript exercises for you to play with. They contain tests that are used to make sure that your code works like it is supposed to. Anywhere you see `return`, it just means that when the function finishes running, it will spit back whatever comes after `return`. In future lessons, we will go into much further detail regarding these concepts, so just hang in there for now!

Be sure to follow the order presented here. Read all the directions, watch the terminal, and read all the errors.

1. Follow the [instructions in the README of our `javascript-exercises` repository](https://github.com/TheOdinProject/javascript-exercises#how-to-use-these-exercises) to set up your local environment. Once you have forked the repository, cloned it and installed Jest, review each README file prior to completing the following exercises in order (which are all in the `foundations/` directory):
    - `01_helloWorld` (This exercise is intentionally very beginner-friendly to ensure that you have everything set up properly!)
    - `02_addNumbers`
    - `03_numberChecker`
    - `04_mathEquations`
    - `05_joinStrings`

Note: Solutions for these exercises can be found in the `solution` folder of each exercise.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the eight data types in JavaScript?](https://javascript.info/types#summary)
- [Which data type is NOT primitive?](https://javascript.info/types#objects-and-symbols)
- [What is the relationship between null and undefined?](https://javascript.info/types#the-null-value)
- [What is the difference between single, double, and backtick quotes for strings?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#single_quotes_double_quotes_and_backticks)
- [What is the term for joining strings together?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#embedding_javascript)
- [Which type of quote lets you embed variables/expressions in a string?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#embedding_javascript)
- [How do you embed variables/expressions in a string?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#embedding_javascript)
- [How do you use escape characters in a string?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#including_quotes_in_strings)
- [What is the difference between the slice/substring string methods?](https://www.w3schools.com/js/js_string_methods.asp)
- [What are the three logical operators, and what do they stand for?](http://javascript.info/logical-operators)
- [What are the comparison operators?](https://javascript.info/comparison)
- [What are truthy and falsy values?](https://javascript.info/ifelse#boolean-conversion)
- [What are the falsy values in JavaScript?](https://javascript.info/ifelse#boolean-conversion)
- [What is the syntax for an if/else conditional?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#basic_if...else_syntax)
- [What is the syntax for a switch statement?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#switch_statements)
- [What is the syntax for a ternary operator?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#ternary_operator)
- [What is nesting?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#nesting_if...else)
