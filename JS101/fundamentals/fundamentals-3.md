#Fundamentals 3

##Arrays

Strings and numbers may be our building blocks but, as you can probably imagine, as your scripts get larger and more complex you're going to need a way to deal with large numbers of them.  Luckily, JavaScript has a couple of data types that are used for just that.  An Array is simply an ordered collection of items (Strings, numbers, or other things).

1. [This tutorial](https://www.w3schools.com/js/js_arrays.asp) is a great introduction.  
2. [This article](https://www.w3schools.com/js/js_array_methods.asp) covers some of the most useful built-in array methods.  These fundamentals are something you'll use every day, so don't rush too much and miss out!

##Loops

Computers don't get tired, and they're really _really_ fast!  For that reason they are well suited to solving problems that involve doing calculations multiple times.  In some cases a computer will be able to repeat a task _thousands_ or even _millions_ of times in just a few short seconds where it might take a human many hours. \(obviously speed here depends on the complexity of the calculation and the speed of the computer itself\).  One way to make a computer do a repetitive task is using a **loop**

1. Read this [MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Looping_code).  It's a longer one, but make sure you tackle the 'Active Learning' sections at the bottom of the page.  
2. Once again, same info, slightly different context from [JavaScript.info](http://javascript.info/while-for) \(Skim the info if you think you know it all, but **don't forget the tasks at the end of the page**.  You learn best by _doing_\)

##Practice

### Test Driven Development

Test Driven Development \(TDD\) is a phrase you hear thrown around quite a lot in the dev world.  Basically it refers to the practice of writing automated tests that describe exactly how you want your code to work before you actually write that code.  For example, if you want to write a function that adds a couple of numbers, you would first write a test that uses the function and supplies the expected output.  Before you write your code the test will fail, and you should be able to know that your code works correctly when the tests pass.

In many ways TDD is much more productive than writing code without tests.  If we didn't have the test for the adding function above, we would have to run the code ourselves over and over, plugging in different numbers until we were sure that it was working... not a big deal for a simple `add(2, 2)`, but imagine having to do that for more complicated functions, like checking whether or not someone has won a game of tic tac toe: \(`game_win(["o", null,"x",null,"x",null,"x", "o", "o"])`) If you didn't do TDD then you might actually have to play multiple games against yourself just to test if the function was working correctly!

For the moment we are not going to teach you how to write these tests, because it can be a bit of an art in and of itself.  The following exercises have the tests already written out for you. All you have to do is read the specs and write the code that makes them pass!  The very first exercise \(`01-helloWorld`\) is intentionally very simple and walks you through the process of running the tests and making them pass.

### Good Luck!

Check out our exercises repository [here](https://github.com/TheOdinProject/javascript-exercises) and follow the directions in the README for getting set up.

Complete the following exercises:

- helloWorld
- repeatString
- reverseString
- removeFromArray
- sumAll
- leapYears
- tempConversion