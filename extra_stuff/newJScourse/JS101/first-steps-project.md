# REMOVE THIS SECTION
this should be a simple-ish project that uses the things students should know at this point including:
1. variables
2. numbers/operators
3. strings
4. arrays (and array functions like forEach and map)

students will NOT know about functions or DOM interaction at this point, so the project should be suitably straightforward.

probably we'll roll something a lot like FCC's 'algorithm scripting' projects
just simple(ish) problems to solve.  Maybe 5-6 of them.

Could use a test-first repo, much like the ruby stuff, or could be in a repl.it project (need to research those)

# lesson starts here (remove this heading)
At this point, you should have a pretty good feel for how to write and run Javascript code in a few different contexts.  If you don't then you should definitely go back and check out the "Running Javascript" lesson. In general it is best to write an run code in a text editor on your own machine rather than in online environments, but for simple projects like this one using an online repl is acceptable.  In any case, it's time for you to start writing your own code to practice what you've learned so far!

### Assignment 1
Look at this code:
```javascript
const birthYear = 1948
const thisYear = 1965
const firstName = "Carlos"
const lastName = "Stevenson"

const greeting = "Hello! My name is " + firstName + " " + lastName + " and I am " + (thisYear - birthYear) + " years old."

console.log(infoString)
```
Can you tell what it does? Ok, it's pretty simple, so I doubt there's any mystery there, but just to check yourself, go ahead and paste the code and run it wherever you've decided to do your work today.

Now, delete the code and try to recreate it without looking at the original example.  For reference you can copy in these comments, so you can remember everything you need to do:

```javascript
// 4 variables: first name, last name, current year, and birth year.
// a 5th variable that is constructed from the previous 4, it should contain a greeting with the person's full name and their age.
//print the greeting with console.log
```
Once you've gotten that (congratulations BTW) let's change the code to make it a little easier to read:
1. add 2 more variables: `fullName` and `age`
2. change the greeting string to use `fullName` and `age` instead of doing the calculations in the string itself. (the greeting should look _something_ like this: `"Hello, my name is " + fullName`)
3. do NOT simply type the full name and age into the new variables, but set them using the calculations that were originally done in the greeting.

### Assignment 2
In a browser the _simplest_ way to get user input is by using the `prompt()` function.(we'll cover _better_ ways to do that in a later lesson) It's used like this:
```javascript
let number = prompt('what is your favorite number?')
console.log(number)
```
Pretty easy right?  Good.  Gonna need that for this assignment.  Note: since we're using `prompt()` for this assignment, you'll need to run your code in a browser rather than on the command line.

Write a script that figures out a student's score on a test:
1. Prompt the user for the number of points possible on the test and store it in a variable.
2. Prompt the user for the number of points the student missed and store it in a variable.
3. Calculate and print out (using `console.log`) the student's percentage score.  Try to figure out the math yourself!
4. To test yourself, enter the following info and see if you get the right answer: 
    - Points possible: 50, Points missed: 13, Score: 74%
    - Points possible: 75, Points missed: 44, Score: 41.3% (ouch 😬)
5. (BONUS) that last example will have given you a long repeating decimal.  Rounding in Javascript is relatively simple but you haven't learned how to do it yet.  See if you can figure out how to round your percentages to only 1 decimal point. Don't try to hack it yourself... There's a built in method that will do the work for you just google it!

### Assignment 3
Let's pretend that we have some code that not only calculates scores for us, but also stores them in an array like this:
```javascript
const scores = [44, 65, 98, 97, 78, 55, 98, 79]
```
If we have that array, there are many useful things we can do... many of which you'll learn in greater depth later.  For now try this:
1. Copy that scores array into the top of your code.
2. Calculate and log the sum of all the scores. (you can do this more efficiently using loops, but don't worry about that yet, we'll learn that in the next lesson.  Just add them all together manually... there are 8 values in the array)  For reference, the correct answer is `614`.
3. Calculate the average test score. (it's `76.75`)
4. Print out the scores list sorted from lowest to highest! (Gonna need to google that one and that's OK!)
5. Calculate and print the difference between the lowest and highest scores (which would naturally be the first and last items in the array after it's been sorted) Answer: `54`

### Assignment 4
_Complete this assignment in your browser's console (It's good to know several ways to do this stuff.)_
Let's pretend you've opened up a coffee shop and you're looking for a wildly inefficient way to keep track of your customer's orders... OK that's not fair, but at this point we need the practice using arrays, and don't _quite_ have the tools needed to build a useful system.  This is an assignment that we will revisit in later lessons to create something that's actually usable.
1. In your browser's console create an empty array called `orders`.
2. As customers come in and order their lattes and muffins you need to add their orders to the array, but be careful: your service is first-come first-serve, so you have to add their orders onto the END of the array, and then as you start preparing the orders, you need to remove the orders from the beginning of the array.
3. go a head and add these orders to the end of your array:
  - `"latte"`
  - `"banana muffin"`
  - `"coffee, black"`
4. You begin preparing the first order, so remove it from the top of the list.
5. Print the list to see what to prepare next.
6. another customer comes in and orders an `"iced grandioso purple chocolatte with salted caramel"`, so go a head and add that one to the end.
7. The muffin is ready, so remove it from the list.
8. Another customer orders a `"glazed donut"`
9. Another customer orders a `"latte"`
10. Another customer orders an `"iced coffee"`
11. You're getting overwhelmed... check the number of orders you still have to make (i.e. the length of the array), it should be `5` at this point, which is too much for you to handle, so you lock the door so no more customers can enter.
12. One by one you finish the rest of the orders and remove them from the beginning of the array until it is empty.
13. Toss they keys to the place to whoever ordered the purple chocolatte and run away. 