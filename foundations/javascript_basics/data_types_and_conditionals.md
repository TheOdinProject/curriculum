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
1. Go through [the W3Schools lesson on string methods](https://www.w3schools.com/js/js_string_methods.asp) to learn a bit more about what you can do with strings... be sure to take a peek at [the String Reference page](https://www.w3schools.com/jsref/jsref_obj_string.asp) near the bottom, and do the exercises at the end!
1. Vocabulary time: a **method** is a bit of functionality built into the language or specific data types. In [the W3Schools lesson on string methods](https://www.w3schools.com/js/js_string_methods.asp), you've learned about a few methods that can be used on strings, such as `replace` and `slice`. There are still many more built-in string methods which [the MDN documentation for strings provides an exhaustive reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String). You are not expected to memorize these but the documentation will be a very useful reference to revisit, so bookmark it!

### Conditionals

Now it's time for the fun stuff...  So far, we haven't done much with our programming that you couldn't do with basic math skills. Sure, we've told our computer how to do the math, which makes it quicker, but the essence of programming is teaching the computer how to make decisions to do more involved things. Conditionals are how we do that.

1. Step one in learning about conditionals is making sure you have a good grasp on [comparisons](http://javascript.info/comparison).
1. W3Schools also has a [lesson on conditionals in JavaScript](https://www.w3schools.com/js/js_if_else.asp).
1. JavaScript.info has a [good tutorial on logical operators](http://javascript.info/logical-operators). A little heads up regarding this reading's tasks: there will be questions where you see `alert()` with a number or string inside the parenthesis. What's happening here will be discussed later in the curriculum. Some of the answers may not make sense now, but they are accurate, and you will understand them as you progress in the curriculum. Don't worry too much about it now!
1. The [MDN article on conditionals](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals) reinforces the concept and provides several interesting examples of how you could use it building websites.
1. JavaScript.info's [lesson on `if/else`](http://javascript.info/ifelse) covers the same basic concept \(read through it as a review!\) and - more importantly - offers the usual 'tasks' at the bottom of the page!
1. [Learn about the `switch` statement](https://javascript.info/switch), which is handy when you have multiple conditions.

### Assignment

<div class="lesson-content__panel" markdown="1">

To give you a good bit of practice, we have created replit.com exercises for you to play with. We believe it's best to practice programming on your *own* computer rather than in an online environment, but we'll get to that soon enough.

Be sure to do the lessons in the order presented here. Pressing "run" at the top will run the code. Read all directions, watch the terminal, and read all the errors. Don't forget to use 'console.log' extensively.

To get started, create a free replit account and click "Fork" or "Remix" to access the exercises.
Note: Feel free to browse the files on the left column to gain familiarity with it.

<div class="lesson-note lesson-note--warning" markdown="1">

#### Replit and AI

Replit recently introduced an AI assistant, which is on by default. Before trying any of the exercises, you should first disable it, in order to prevent it from spoiling the exercise. You can do so by clicking on the button labeled AI in the bottom left corner of the code view and then unchecking the "Enable" checkbox.
</div>

- [Exercise 1](https://replit.com/@OdinProject/troubleshooting#troubleshooting.js)
  - In this exercise, you will be working out of the file called `troubleshooting.js`.
- [Exercise 2](https://replit.com/@OdinProject/enter-a-number#script.js)
  - You will be working out of `script.js`, and you will use the console in the 'webview' pane to check your work. To access the console, click the wrench icon, which is located on the right side of the address bar within the 'webview' pane.
- [Exercise 3](https://replit.com/@OdinProject/lets-do-some-math#math.js)
  - You will be working out of `math.js`.
- [Exercise 4](https://replit.com/@OdinProject/direction-follow#follow.js)
  - You will be working out of `follow.js`.

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
- [What is the difference between the slice/substring/substr string methods?](https://www.w3schools.com/js/js_string_methods.asp)
- [What are the three logical operators, and what do they stand for?](http://javascript.info/logical-operators)
- [What are the comparison operators?](https://javascript.info/comparison)
- [What are truthy and falsy values?](https://javascript.info/ifelse#boolean-conversion)
- [What are the falsy values in JavaScript?](https://javascript.info/ifelse#boolean-conversion)
- [What are conditionals?](https://www.w3schools.com/js/js_if_else.asp)
- [What is the syntax for an if/else conditional?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#basic_if...else_syntax)
- [What is the syntax for a switch statement?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#switch_statements)
- [What is the syntax for a ternary operator?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#ternary_operator)
- [What is nesting?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/conditionals#nesting_if...else)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Regular expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions), commonly known as regex, is a tool that matches or locates patterns in strings for string validation. However, it's important to know [when you shouldn't use regular expressions](https://softwareengineering.stackexchange.com/questions/113237/when-you-should-not-use-regular-expressions). There are other various methods to process strings, and regex can be slower in comparison.
- [Web Dev Simplified's Regular Expressions In 20 Minutes](https://www.youtube.com/watch?v=rhzKDrUiJVk)
