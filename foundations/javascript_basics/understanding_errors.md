### Introduction

Reading and understanding error messages is a requirement as a developer. At first glance, many beginners shrink away from error messages as they appear to be “scary” and difficult to understand because they include terms one may not be familiar with. However, error messages provide developers with a treasure trove of knowledge, and tell you everything you need to know about how to resolve them! Being able to parse error messages and warnings without fear will enable you to be able to effectively debug your applications, receive meaningful help from others, and empower yourself to push forward when faced with an error.

### Learning Outcomes

- Name at least three kinds of Javascript errors
- Identify two parts of an error message that help you find where the error originates
- Be able to understand how to research and resolve errors

### The Anatomy of an Error

Errors contain crucial information that can assist you in locating the code responsible for the error, determining why you have this error, and resolving the error. **Note**: For all examples in this lesson, you should run the code in the browser's console.

Let’s assume we have written the following code:

~~~js
const a = "Hello"
const b = "World"

console.log(c)
~~~

This code will run, but it will throw an error. The first part of an error displays the type of error. In this example, we have a `ReferenceError`.
<img width="615" alt="Screen Shot 2021-05-17 at 12 16 37 PM" src="https://user-images.githubusercontent.com/22967723/118543890-c1dce500-b709-11eb-94f3-bbd6757d4e31.png">


We’ll learn more about the different error types later in the lesson. Error types denote the kind of error, which gives us clues about how to address them, and why they may arise.

In this case, a `ReferenceError` is an error that is thrown when one attempts to reference a variable that is not currently declared within the scope where we attempted to reference the variable. The error message also explains this, by stating that `c is not defined`. Different kinds of errors can have different messages based on what is actually causing the `ReferenceError`. For example, another message you may run into that is also a `ReferenceError` is `ReferenceError: can't access lexical declaration 'X' before initialization`. As we can see, this points to a completely different reason than our original `ReferenceError` above. Understanding both the error type and the error message is crucial to comprehending why you are receiving the error.

The next part of an error gives us the line of code, as well as the file in which you can find the error (in this case, our `script.js`). This allows you to easily navigate to the problematic line in your code. Here, the error originates from the fifth line of `script.js`, which is displayed as a link under the error message with the text `at script.js:5`. If you click this link, most browsers will navigate to the exact line of code and the rest of your script in the Sources tab of the Developer Tools. Additionally, sometimes your browser's console will also display the column (or character) in the line at which the error is occurring. This may be shown as `at script.js:5:12`. 

Another important part of an error is the stack trace. While the line number helps you locate the line in your code, the stack trace helps you understand when the error was thrown in your application, and what functions were called that lead up to running the lines of code responsible for the error. So for example, if we have the following code:

~~~js
const a = 5;
const b = 10;

function add() {
  return c;
}

function print() {
  add();
}

print();
~~~

Our function `print()` should call on `add()`, which returns a variable named `c`, which currently has not been declared. The corresponding error is as follows:

<img width="620" alt="Screen Shot 2021-05-17 at 12 15 06 PM" src="https://user-images.githubusercontent.com/22967723/118543770-90641980-b709-11eb-8c85-4f49195901bc.png">

The stack trace tells us that:

1. `c is not defined` in scope of `add()`, which is declared on line 5
2. `add()` was called by `print()`, which was declared on line 9
3. `print()` itself was called on line 12.
   The stack trace allows you to follow the execution of functions to find the code responsible for throwing the error .

### Common Types of Errors

These are some of the most common errors you will encounter, so it’s important to understand them.

#### Syntax Error

A syntax error occurs when the code you are trying to run is syntactically incorrect. For example this:

~~~js
function helloWorld() {
  console.log "Hello World!"
}
~~~

will throw the following error, because we forgot the parenthesis for `console.log()`!
<img width="602" alt="Screen Shot 2021-05-17 at 12 15 11 PM" src="https://user-images.githubusercontent.com/22967723/118543788-9823be00-b709-11eb-8f2a-3e4f64cee880.png">
[MDN - SyntaxError](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SyntaxError)

#### Reference Error

We covered reference errors in the first example in this lesson, but it’s important to remember that these arise because whatever variable you are trying to reference does not exist.

[MDN - ReferenceError](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/ReferenceError)

#### Type Error

These errors are thrown for a few different reasons:

Per MDN, a `TypeError` may be thrown when:

> - an operand or argument passed to a function is incompatible with the type expected by that operator or function;
> - or when attempting to modify a value that cannot be changed;
> - or when attempting to use a value in an inappropriate way.

Say we have two strings that you would like to combine to create one message such as below:

~~~js
const str1 = "Hello";
const str2 = "World!";
const message = str1.push(str2);
~~~
<img width="621" alt="Screen Shot 2021-05-17 at 12 14 12 PM" src="https://user-images.githubusercontent.com/22967723/118543650-6579c580-b709-11eb-981d-4bdb74966ba4.png">

Here, we get a `TypeError` with a message stating that `str1.push is not a function`. This is a common error message that confuses learners, because we know that `.push()` is certainly a function! You’ve probably used it to add items to _arrays_ before, but that’s the key- `.push()` is not a String method, it’s an Array method. Hence, it is “not a function” that you can find as a String method. If we change `.push()` to `.concat()`, a proper String method, our code runs as intended! A good note to keep in mind when faced with a `TypeError` is to consider the type you are trying to run a method or operation against. You'll likely find that it is not what you intend, or the operation or method is not compatible with that type.

[MDN - TypeError](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError)

### Tips for Resolving Errors

At this point, you might be wondering how we can resolve these errors.

1. Read the error *carefully* and try to understand it on your own.
2. Next, Google the error! Chances are, you can find a fix or explanation on StackOverflow or in the documentation. If anything, you will receive more clarity as to why you are receiving this error.
3. Use the debugger! As previously mentioned, the debugger is great for more involved troubleshooting, and is a critical tool for a developer. You can set breakpoints, view the value of any given variable at any point in your application’s execution, step through code line by line, and more! It is an extremely valuable tool and every programmer should know how to use it. [This tutorial dives into the Chrome Debugger](https://developer.chrome.com/docs/devtools/javascript/). 
4. Make use of the console! `console.log()` is a popular choice for quick debugging. For more involved troubleshooting, using the debugger might be more appropriate, but using `console.log()` is great for getting immediate feedback without needing to step through your functions. There are also other useful methods such as `console.table()`, `console.trace()`, and more! You can find additional methods [here](https://www.w3schools.com/jsref/obj_console.asp).


### Errors VS. Warnings

Lastly, many people are met with warnings and treat them as errors. Errors will stop the execution of your program or whatever process you may be attempting to run and prevent further action. Warnings, on the other hand, are messages that provide you insight on potential problems that may not necessarily crash your program at runtime, or at all! While you should address and resolve these warnings if possible and as soon as possible, warnings are not as significant as errors and are more likely to be informational. Warnings are typically shown in yellow, while errors are typically shown in red. While these colors are not a rule, frequently there will be a visual differentiation between the two regardless of the platform you are encountering them on.

### Exercise:

Work through [this lesson on MDN](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/What_went_wrong). Be sure to download their starter code that has intentional errors.

### Additional Resources:

[MDN Javascript Errors Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Errors)

### Knowledge Check:

- What are three reasons why you may see a TypeError?
- What is the key difference between an error and a warning?
- What is one method you can use to resolve an error?
