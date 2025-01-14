### Introduction

You made it! By now you should have a *really* firm grasp on the fundamentals of JavaScript. Of course there's plenty more to learn, but you should be able to create quite a bit at this point. Our final project is going to combine everything you've learned so far: you're going to make an on-screen calculator using JavaScript, HTML, and CSS.

As usual with these things, there are elements of this project that are not going to be trivial for you, but if you've been following the course so far, you definitely have everything you need to finish it. We're going to walk you through the various steps you can take, but again, how you actually implement them is up to you!

### Warning

<div class="lesson-note" markdown="1">

Before you get started with the project, we need to cover a word of warning. As you look into how to evaluate complex mathematical statements in JavaScript, you will likely come across the tantalizing [`eval()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval) function. However, this function can be very dangerous and MDN does a good job documenting why you should [never use eval](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#never_use_direct_eval!)! You'll need to build your own functions to evaluate expressions as part of this project. On the same note, when researching how to calculate expressions, you may encounter solutions that suggest that you return a `new Function()` that evaluates a string. Similarly to `eval()`, this should not be used [due to potential pitfalls of evaluating insecure data](https://stackoverflow.com/questions/4599857/are-eval-and-new-function-the-same-thing). Besides, where's the fun in solutions that do all the work for you? Let's get to it!

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

Don't forget to commit early & often! You can reference the [Commit Messages lesson](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages) here!

Here are some use cases (expectations about your project):

1. Your calculator is going to contain functions for all of the basic math operators you typically find on calculators, so start by creating functions for the following items and testing them in your browser's console:
   - add
   - subtract
   - multiply
   - divide
1. A calculator operation will consist of a number, an operator, and another number. For example, 3 + 5. Create three variables, one for each part of the operation. You'll use these variables to update your display later.
1. Create a new function `operate` that takes an operator and two numbers and then calls one of the above functions on the numbers.
1. Create a basic HTML calculator with buttons for each digit and operator (including `=`).
   - Don't worry about making them functional just yet.
   - There should also be a display for the calculator. Go ahead and fill it with some dummy numbers so it looks correct.
   - Add a "clear" button.
1. Create the functions that populate the display when you click the digit buttons. You should store the content of the display (the number) in a variable for use in the next step.
1. Make the calculator work! You'll need to store the first and second numbers input by the user and then `operate()` on them when the user presses the `=` button, according to the operator that was selected between the numbers.
   - You should already have the code that can populate the display, so once `operate` has been called, update the display with the result of the operation.
   - This is the hardest part of the project. You need to figure out how to store all the values and call the `operate` function with them. Don't feel bad if it takes you a while to figure out the logic.
1. Gotchas: watch out for and fix these bugs if they show up in your code:
   - **Your calculator should not evaluate more than a single pair of numbers at a time.** Example: you enter a number (`12`), followed by an operator button (`+`), a second number button (`7`), and a second operator button (`-`). Your calculator should then do the following: first, evaluate the initial pair of numbers (`12 + 7`), then display the result of that calculation (`19`). Finally, use that result (`19`) as the first number in a new calculation, along with the next operator (`-`). An example of the behavior we're looking for can be seen in this [student's calculator live preview](https://mrbuddh4.github.io/calculator/).
   - You should round answers with long decimals so that they don't overflow the display.
   - Pressing `=` before entering all of the numbers or an operator could cause problems!
   - Pressing "clear" should wipe out any existing data. Make sure the user is really starting fresh after pressing "clear".
   - Display a snarky error message if the user tries to divide by 0... and don't let it crash your calculator!
   - Make sure that your calculator only runs an operation when supplied with two numbers and an operator by the user. Example: you enter a number (`2`), followed by an operator button (`+`). You press the operator button (`+`) a second consecutive time. Your calculator should not evaluate this as (`2 + 2`) and should not display the result (`4`). If consecutive operator buttons are pressed, your calculator should not run any evaluations, it should only take the last operator entered to be used for the next operation.

#### Extra credit

- Users can get floating point numbers if they do the math required to get one, but they can't type them in yet. Add a `.` button and let users input decimals! Make sure you don't let them type more than one though, like: `12.3.56.5`. Disable the `.` button if there's already a decimal separator in the display.
- Add a "backspace" button, so the user can undo their last input if they click the wrong number.
- Add keyboard support!

</div>
