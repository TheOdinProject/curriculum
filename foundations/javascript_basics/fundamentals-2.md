### Introduction

There are a few extremely common types of data that you will encounter in JavaScript, and these lessons on fundamentals will give us a really strong foundation in all of them.  Before we start digging deep, however, [this article](http://javascript.info/types) will give you a quick overview of the most common ones.

### Lesson Overview

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

Depending on what kind of work you're doing, you might end up working more with pieces of text rather than numbers. A __string__ is simply a piece of text... and is a fundamental building block of the language.

1. Read and code along with [yet another MDN tutorial](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings) on the topic.
2. Go through [this lesson](https://www.w3schools.com/js/js_string_methods.asp) to learn a bit more about what you can do with strings... be sure to take a peek at [the String Reference](https://www.w3schools.com/jsref/jsref_obj_string.asp) page near the bottom, and do the exercises at the end!
3. Vocabulary time: a __method__ is a bit of functionality that is built into the language or into specific data types. In [the previous W3Schools exercise](https://www.w3schools.com/js/js_string_methods.asp), you learned a few methods that can be used on strings, such as `replace` and `slice`. An exhaustive list of methods that can be used on strings can be found [here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String).

### Conditionals

Now it's time for the fun stuff...  So far we haven't done much with our programming that you couldn't do with simple math skills.  Sure, we've told our computer how to do the math, so that makes it quicker, but the essence of programming is teaching the computer how to make decisions in order to do more involved things.  Conditionals are how we do that.

1. Step one in learning about conditionals is making sure you have a good grasp on [comparisons](http://javascript.info/comparison).
2. [This tutorial](https://www.w3schools.com/js/js_if_else.asp) is a great first glance at conditionals in JavaScript.
3. [This tutorial](http://javascript.info/logical-operators) will teach you about logical operators. A little heads up regarding this reading's tasks; there will be questions where you see `alert()` (with a number or string inside of the parenthesis), what's happening here will be discussed later in the curriculum. Some of the answers may not make sense now but they are accurate and will come to be understood as you progress in the curriculum. Don't worry too much about it now!
4. [This article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals) reinforces the concept and provides several interesting examples of how you could use it building websites.
5. [This article](http://javascript.info/ifelse) covers the same basic concept \(read through it as a review!\) and - more importantly - offers the usual 'tasks' at the bottom of the page!
6. [This article](https://javascript.info/switch) teaches you about the `switch` statement, which comes in handy when you have multiple conditions.

### Assignment

<div class="lesson-content__panel" markdown="1">

To give you a good bit of practice, we have created some replit.com exercises for you to play with. We believe that it's best to practice programming on your _own_ computer, rather than in an online environment, but we'll get to that soon enough.

Be sure to do the lessons in order presented here. Pressing "run" at the top will run the code. Read all directions, watch the terminal, and read all the errors. Don't forget to use 'console.log' extensively.

To get started, create a free replit account and click "Fork" or "Remix" in order to have access to the exercises.
Note: Feel free to browse the files on the left column in order to gain familiarity with it.

- [Exercise 1](https://replit.com/@OdinProject/troubleshooting#troubleshooting.js)
  - In this exercise, you will be working out of the file called troubleshooting.js
- [Exercise 2](https://replit.com/@OdinProject/enter-a-number#script.js)
  - You will be working out of script.js, and you will use the console in the 'webview' pane to check your work. To access the console, click the wrench icon, which is located on the right side of the address bar within the 'webview' pane.
- [Exercise 3](https://replit.com/@OdinProject/lets-do-some-math#math.js)
  - You will be working out of math.js
- [Exercise 4](https://replit.com/@OdinProject/direction-follow#follow.js)
  - You will be working out of follow.js

</div>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.


- Regular expressions, commonly known as regex, are a tool that matches or locates patterns in strings for string validation. Although it shouldn't be your immediate solution this early on, you can still use this resource to understand how websites know that `myemail@com` isn't a valid email address. On top of that, other solutions to filter out strings exist, and regex is considered a slow operation.

- [The Net Ninja's Regular Expressions Tutorial](https://www.youtube.com/playlist?list=PL4cUxeGkcC9g6m_6Sld9Q4jzqdqHd2HiD).
- [When to avoid regular expressions](https://softwareengineering.stackexchange.com/questions/113237/when-you-should-not-use-regular-expressions).

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- <a class="knowledge-check-link" href="https://javascript.info/types#summary">What are the eight data types in JavaScript?</a>
- <a class="knowledge-check-link" href="https://javascript.info/types#objects-and-symbols">Which data type is NOT primitive?</a>
- <a class="knowledge-check-link" href="https://javascript.info/types#the-null-value">What is the relationship between null and undefined?</a>
- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#single_quotes_vs._double_quotes">What is the difference between single, double, and backtick quotes for strings?</a>
- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#concatenating_strings">What is the term for joining strings together?</a>
- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#concatenating_strings">Which type of quote lets you embed variables/expressions in a string?</a>
- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#concatenating_strings">How do you embed variables/expressions in a string?</a>
- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Strings#escaping_characters_in_a_string">How do you use escape characters in a string?</a>
- <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_string_methods.asp">What is the difference between the slice/substring/substr string methods?</a>
- <a class="knowledge-check-link" href="http://javascript.info/logical-operators">What are the three logical operators and what do they stand for?</a>
- <a class="knowledge-check-link" href="https://javascript.info/comparison">What are the comparison operators?</a>
- <a class="knowledge-check-link" href="https://javascript.info/ifelse#boolean-conversion">What are truthy and falsy values?</a>
- <a class="knowledge-check-link" href="https://javascript.info/ifelse#boolean-conversion">What are the falsy values in JavaScript?</a>
- <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_if_else.asp">What are conditionals?</a>
- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#basic_if...else_syntax">What is the syntax for an if/else conditional?</a>
- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#switch_statements">What is the syntax for a switch statement?</a>
- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#ternary_operator">What is the syntax for a ternary operator?</a>
- <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#nesting_if...else">What is nesting?</a>