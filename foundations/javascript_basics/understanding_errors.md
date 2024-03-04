### Introduction

Reading and understanding error messages is a requirement as a developer. At first glance, many beginners shrink away from error messages as they appear to be “scary” and difficult to understand because they include terms one may not be familiar with. However, error messages provide developers with a treasure trove of knowledge, and tell you everything you need to know about how to resolve them! Being able to parse error messages and warnings without fear will enable you to effectively debug your applications, receive meaningful help from others, and empower yourself to push forward when faced with an error.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Name at least three kinds of JavaScript errors.
- Identify two parts of an error message that help you find where the error originates.
- Be able to understand how to research and resolve errors.

### The anatomy of an error

An error is a type of object built into the JS language, consisting of a name/type and a message. Errors contain crucial information that can assist you in locating the code responsible for the error, determining why you have this error, and resolving the error.

<div class="lesson-note lesson-note--tip" markdown=1>

For all examples in this lesson, you should run the code in the browser's console.

</div>

Let’s assume we have written the following code:

```javascript
const a = "Hello";
const b = "World";

console.log(c);
```

This code will run, but it will generate an error. In technical terms, this is called "throwing" an error. The first part of an error displays the type of error. This provides the first clue as to what you're dealing with. We’ll learn more about the different error types later in the lesson. In this example, we have a `ReferenceError`.

![Reference Error Example](https://cdn.statically.io/gh/TheOdinProject/curriculum/175b5ef2a1b4758a7b75f4ef43d7e27203e5707b/foundations/javascript_basics/understanding_errors/imgs/00.png)

A `ReferenceError` is thrown when one refers to a variable that is not declared and/or initialized within the current scope. In our case, the error message explains that the error has occurred because `c is not defined`. Different errors of this type have different messages based on what is causing the `ReferenceError`. For example, another message you may run into is `ReferenceError: can't access lexical declaration 'X' before initialization`. As we can see, this points to a completely different reason than our original `ReferenceError` above. Understanding both the error type and the error message is crucial to comprehending why you are receiving the error.

The next part of an error gives us the name of the file in which you can find the error (in this case, our `script.js`), and also the line number. This allows you to easily navigate to the problematic line in your code. Here, the error originates from the fourth line of `script.js`, which is displayed as a link under the error message with the text `at script.js:4`. If you click this link, most browsers will navigate to the exact line of code and the rest of your script in the Sources tab of the Developer Tools. Sometimes your browser's console will also display the column (or character) in the line at which the error is occurring. In our example, this would be `at script.js:4:13`.

Another important part of an error is the **stack trace**. This helps you understand when the error was thrown in your application, and what functions were called that led up to the error. So, for example, if we have the following code:

```javascript
const a = 5;
const b = 10;

function add() {
  return c;
}

function print() {
  add();
}

print();
```

Our function `print()` should call on `add()`, which returns a variable named `c`, which currently has not been declared. The corresponding error is as follows:

![Reference Error Stack Trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/284f0cdc998be7e4751e29e8458323ad5d320303/foundations/javascript_basics/understanding_errors/imgs/01.png)

The stack trace tells us that:

1. `c is not defined` in scope of `add()`, which is declared on line 5.
1. `add()` was called by `print()`, which was declared on line 9.
1. `print()` itself was called on line 12.

Thus the stack trace lets you trace the evolution of an error back to its origin, which here is the declaration of `add()`.

### Common types of errors

These are some of the most common errors you will encounter, so it’s important to understand them.

#### Syntax error

A syntax error occurs when the code you are trying to run is not written correctly, i.e., in accordance with the grammatical rules of JavaScript. For example this:

```javascript
function helloWorld() {
  console.log "Hello World!"
}
```

will throw the following error, because we forgot the parentheses for `console.log()`!

![Syntax Error Example](https://cdn.statically.io/gh/TheOdinProject/curriculum/284f0cdc998be7e4751e29e8458323ad5d320303/foundations/javascript_basics/understanding_errors/imgs/02.png)

[MDN - SyntaxError](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SyntaxError)

#### Reference error

We covered reference errors in the first example in this lesson, but it’s important to remember that these arise because whatever variable you are trying to reference does not exist (within the current scope) - or it has been spelled incorrectly!

[MDN - ReferenceError](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/ReferenceError)

#### Type error

These errors are thrown for a few different reasons:

Per MDN, a `TypeError` may be thrown when:

> - an operand or argument passed to a function is incompatible with the type expected by that operator or function;
> - or when attempting to modify a value that cannot be changed;
> - or when attempting to use a value in an inappropriate way.

Say we have two strings that you would like to combine to create one message, such as below:

```javascript
const str1 = "Hello";
const str2 = "World!";
const message = str1.push(str2);
```

![Type Error Example](https://cdn.statically.io/gh/TheOdinProject/curriculum/4ed59981b4ce2c60b5b83bf7415d3127b61821f5/foundations/javascript_basics/understanding_errors/imgs/03.png)

Here, we get a `TypeError` with a message stating that `str1.push is not a function`. This is a common error message that confuses learners because you might know that `.push()` is certainly a function (for example, if you have used it to add items to *arrays* before). But that’s the key - `.push()` is not a String method, it’s an Array method. Hence, it is “not a function” that you can find as a String method. If we change `.push()` to `.concat()`, a proper String method, our code runs as intended! A good note to keep in mind when faced with a `TypeError` is to consider the data type you are trying to run a method or operation against. You'll likely find that it is not what you think, or the operation or method is not compatible with that type.

[MDN - TypeError](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError)

### Tips for resolving errors

At this point, you might be wondering how we can resolve these errors.

1. Read the error *carefully* and try to understand it on your own.
1. Next, Google the error! Chances are, you can find a fix or explanation on StackOverflow or in the documentation. If nothing else, you will receive more clarity as to why you are receiving this error.
1. Use the debugger! As previously mentioned, the debugger is great for more involved troubleshooting, and is a critical tool for a developer. You can set breakpoints, view the value of any given variable at any point in your application’s execution, step through code line by line, and more! It is an extremely valuable tool and every programmer should know how to use it. [This tutorial dives into the Chrome Debugger](https://developer.chrome.com/docs/devtools/javascript/). Warning: In point 4 of step 3 of the tutorial, devtools will pause on the second line rather than at the declaration of the function. Don't worry this is expected.
1. Make use of the console! `console.log()` is a popular choice for quick debugging. For more involved troubleshooting, using the debugger might be more appropriate, but using `console.log()` is great for getting immediate feedback without needing to step through your functions. There are also other useful methods such as `console.table()`, `console.trace()`, and more! You can find additional methods [here](https://www.w3schools.com/jsref/obj_console.asp).

### Errors vs. warnings

Lastly, many people are met with warnings and treat them as errors. Errors will stop the execution of your program or whatever process you may be attempting to run and prevent further action. Warnings, on the other hand, are messages that provide you insight on potential problems that may not necessarily crash your program at runtime, or at all! While you should address these warnings if possible and as soon as possible, warnings are not as significant as errors and are more likely to be informational. Warnings are typically shown in yellow, while errors are typically shown in red. Though these colors are not a rule, frequently there will be a visual differentiation between the two, regardless of the platform you are encountering them on.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Work through [this lesson on MDN](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/What_went_wrong). Be sure to download their starter code that has intentional errors.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [What are three reasons why you may see a TypeError?](#type-error)
- [What is the key difference between an error and a warning?](#errors-vs-warnings)
- [What is one method you can use to resolve an error?](#tips-for-resolving-errors)

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- [MDN JavaScript Errors Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Errors)
