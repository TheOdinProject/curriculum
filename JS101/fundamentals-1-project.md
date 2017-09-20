At this point, you should have a pretty good feel for how to write and run Javascript code in a few different contexts.  If you don't then you should definitely go back and check out the "Running Javascript" lesson. In general it is best to write an run code in a text editor on your own machine rather than in online environments, but for simple projects like this one using an online repl is acceptable.  In any case, it's time for you to start writing your own code to practice what you've learned so far!

### Assignment 1

Look at this code:

```javascript
const birthYear = 1948
const thisYear = 1965
const firstName = "Carlos"
const lastName = "Stevenson"

const greeting = "Hello! My name is " + firstName + " " + lastName + " and I am " + (thisYear - birthYear) + " years old."

console.log(greeting)
```

Can you tell what it does? Ok, it's pretty simple, so I doubt there's any mystery there, but just to check yourself, go ahead and paste the code and run it wherever you've decided to do your work today.

Now, delete the code and try to recreate it without looking at the original example.  For reference you can copy in these comments, so you can remember everything you need to do:

```javascript
// 4 variables: first name, last name, current year, and birth year.
// a 5th variable that is constructed from the previous 4, it should contain a greeting with the person's full name and their age.
// print the greeting with console.log
```

Once you've gotten that \(congratulations BTW\) let's change the code to make it a little easier to read:

1. add 2 more variables: `fullName` and `age`  
2. change the greeting string to use `fullName` and `age` instead of doing the calculations in the string itself. \(the greeting should look _something_ like this: `"Hello, my name is " + fullName`\)  
3. do NOT simply type the full name and age into the new variables, but set them using the calculations that were originally done in the greeting.

### Assignment 2

In a browser the _simplest_ way to get user input is by using the `prompt()` function. \(we'll cover _better_ ways to do that in a later lesson\) `prompt()` is used like this:

```javascript
let number = prompt('what is your favorite number?')
console.log(number)
```

Pretty easy right? Good. Gonna need that for this assignment... if you're still confused check out [this article.](http://javascript.info/alert-prompt-confirm) Note: since we're using `prompt()` for this assignment, you'll need to run your code in a browser \(jsbin or codepen will work\) rather than on the command line. \(LINK TO 'Running Javascript' Lesson Here!!!\)

Write a script that figures out a student's score on a test:

1. Prompt the user for the number of points possible on the test and store it in a variable.  
2. Prompt the user for the number of points the student missed and store it in a variable.  
3. Calculate and print out \(using `console.log`\) the student's percentage score.  Try to figure out the math yourself!  
4. To test yourself, enter the following info and see if you get the right answer:

* Points possible: 50, Points missed: 13, Score: 74%
* Points possible: 75, Points missed: 44, Score: 41.3% \(ouch 😬\)
  1. \(BONUS\) that last example will have given you a long repeating decimal.  Rounding in Javascript is relatively simple but you haven't learned how to do it yet.  See if you can figure out how to round your percentages to only 1 decimal point. Don't try to hack it yourself... There's a built in method that will do the work for you just google it!

### Assignment 3

Let's pretend that we have some code that not only calculates scores for us, but also stores them in an array like this:

```javascript
const scores = [44, 65, 98, 97, 78, 55, 98, 79]
```

If we have that array, there are many useful things we can do... many of which you'll learn in greater depth later.  For now try this:

1. Copy that scores array into the top of your code.  
2. Calculate and log the sum of all the scores. \(you can do this more efficiently using loops, but don't worry about that yet, we'll learn that in the next lesson.  Just add them all together manually... there are 8 values in the array\)  For reference, the correct answer is `614`.  
3. Calculate the average test score. \(it's `76.75`\)  
4. Print out the scores list sorted from lowest to highest! \(Perfectly fine if you need to google how to sort an array\)  
5. Calculate and print the difference between the lowest and highest scores \(which would naturally be the first and last items in the array after it's been sorted\) Answer: `54`

