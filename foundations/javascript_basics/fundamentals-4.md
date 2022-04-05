### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

* Using arrays.
* Using built-in array methods.
* Using loops.
* Getting your hands dirty with TDD exercises.

### Arrays

Strings and numbers may be our building blocks, but as your scripts get more complex, you're going to need a way to deal with large quantities of them. Luckily, JavaScript has a couple of data types that are used for just that. An Array is simply an ordered collection of items (Strings, numbers, or other things).

1. [This tutorial](https://www.w3schools.com/js/js_arrays.asp) is a great introduction.
2. [This article](https://www.w3schools.com/js/js_array_methods.asp) covers some of the most useful built-in array methods. These fundamentals are something you'll use every day, so don't rush too much and miss out!

### Loops

Computers don't get tired, and they're really, _really_ fast! For that reason, they are well suited to solving problems that involve doing calculations multiple times. In some cases, a computer will be able to repeat a task _thousands_ or even _millions_ of times in just a few short seconds where it might take a human many hours. \(Obviously, speed here depends on the complexity of the calculation and the speed of the computer itself\). One way to make a computer do a repetitive task is using a **loop**.

1. Read this [MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Looping_code). It's a longer one, but make sure you tackle the 'Active Learning' sections at the bottom of the page.
2. Once again, same info, slightly different context from [JavaScript.info](http://javascript.info/while-for). \(Skim the info if you think you know it all, but **don't forget the tasks at the end of the page**. You learn best by _doing_.\)

### Test Driven Development

Test Driven Development \(TDD\) is a phrase you often hear in the dev world. It refers to the practice of writing automated tests that describe how your code should work before you actually write the code. For example, if you want to write a function that adds a couple of numbers, you would first write a test that uses the function and supplies the expected output. The test will fail before you write your code, and you should be able to know that your code works correctly when the test passes.

In many ways, TDD is much more productive than writing code without tests. If we didn't have the test for the adding function above, we would have to run the code ourselves over and over, plugging in different numbers until we were sure that it was working... not a big deal for a simple `add(2, 2)`, but imagine having to do that for more complicated functions, like checking whether or not someone has won a game of tic tac toe: \(`game_win(["o", null,"x",null,"x",null,"x", "o", "o"])`). If you didn't do TDD, then you might actually have to play multiple games against yourself just to test if the function was working correctly!

We will teach you the art of actually writing these tests later in the course. The following practice has the tests already written out for you. All you have to do is set up the testing environment, read the specs, and write the code that makes them pass!

### Practice

<div class="lesson-content__panel" markdown="1">
Follow the steps below to get started. Once you complete Step 1, be sure to use the README for **_each individual exercise_** in order to do them correctly.

1. Set up the files and Jest by carefully following the directions in the [repository's README](https://github.com/TheOdinProject/javascript-exercises#readme).
2. Now that you have cloned the repository and run `npm install` to install Jest, complete these exercises in the following order:
   - helloWorld (This exercise is intentionally very simple to ensure that you have set up everything properly!)
   - repeatString
   - reverseString
   - removeFromArray
   - sumAll
   - leapYears
   - tempConversion
3. Once you have a working solution, see how it compares to the exercise's given solution. Solutions for the exercises can be found on the 'solutions' branch of the repo.
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

* <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_arrays.asp">What is an array?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_arrays.asp">What are arrays useful for?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_arrays.asp">How do you access an array element?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_arrays.asp">How do you change an array element?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_arrays.asp">What are some useful array properties?</a>
* <a class="knowledge-check-link" href="https://www.w3schools.com/js/js_array_methods.asp">What are some useful array methods?</a>
* <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Looping_code#why_bother">What are loops useful for?</a>
* <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Looping_code#exiting_loops_with_break">What is the break statement?</a>
* <a class="knowledge-check-link" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Looping_code#skipping_iterations_with_continue">What is the continue statement?</a>
* <a class="knowledge-check-link" href="#test-driven-development">What is the advantage of writing automated tests?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.