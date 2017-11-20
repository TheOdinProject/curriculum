You made it! By now you should have a _really_ firm grasp on the fundamentals of JavaScript.  Of course there's plenty more to learn, but you should be able to create quite a bit at this point.  Our final project is going to try to combine everything you've learned so far.. you're going to be making an on-screen calculator using JavaScript, HTML and CSS.

As usual with these things there are elements of this project that are not going to be trivially easy for you, but if you've been following the course so far you definitely have everything you need to finish it.  We're going to walk you through the various steps you can take, but again, how you actually implement them is up to you!

Here are some use cases (abilities you project needs to have):

1. Your calculator is going to contain functions for all of the basic math operators you typically find on simple calculators, so start by creating functions for the following items and testing them in your browser's console.
   1. add
   2. subtract
   3. multiply
   4. divide
2. Create a new function `operate` that takes an operator and 2 numbers and then calls one of the above functions on the numbers.
3. Create a basic HTML calculator with buttons for each digit, each of the above functions and an "Equals" key.
   1. Do not worry about wiring up the JS just yet.
   2. There should also be a display for the calculator, go ahead and fill it with some dummy numbers so you can get it looking right.
   3. Add a "clear" button.
4. Create the functions that populate the display when you click the number buttons... you should be storing the 'display value' in a variable somewhere for use in the next step.
5. Make the calculator work! You'll need to store the first number that is input into the calculator when a user presses an operator, and also save which operation has been chosen and then `operate()` on them when the user presses the "=" key.
   1. You should already have the code that can populate the display, so once `operate()` has been called, update the display with the 'solution' to the operation.
6. Gotchas: watch out for and fix these bugs if they show up in your code:
   1. Users should be able to string together several operations and get the right answer: `12 + 7 - 5 * 3` etc.
   2. You should round answers with long decimals so that they don't overflow the screen.
   3. Pressing "clear" should wipe out any existing data.. make sure the user is really starting fresh after pressing "clear"
   4. Display a snarky error message if the user tries to divide by 0... don't let it crash your calculator!
7. EXTRA CREDIT: Users can get floating point numbers if they do the math required to get one, but they can't type them in yet.  Add a `.` button and let users input decimals!  Make sure you don't let them type more than one though: `12.3.56.5`. It is hard to do math on these numbers. \(disable the decimal button if there's already one in the display\)
8. EXTRA CREDIT: Make it look nice!  This can be a good portfolio project... but not if it's UGLY.  At least make the  operations a different color from the keypad buttons.
9. EXTRA CREDIT: Add a "backspace" button, so the user can undo if they click the wrong number.
10. EXTRA CREDIT: Add keyboard support!



