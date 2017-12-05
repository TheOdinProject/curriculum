##  Functions

Things are about to get _really_ exciting.  So far you have been writing an impressive amount of code to solve various problems but that code has not been as useful as it could be.  Imagine taking one of your scripts and bundling it into a little package that you could use over and over again without having to rewrite or change the code.  That's the power of functions and they're used _constantly_ in JavaScript.

1. [Another lengthy MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Functions) is a good place to start.  Pay special attention to the sections on 'Function Scope'.  Scope is one topic that commonly trips up both beginner and intermediate coders so it pays to spend some time with it up front.  
2. Read this article about [return values](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Return_values).  
3. Next, read [this one](http://javascript.info/function-basics) from Javascript.info.  We've mentioned this before, but JavaScript has changed a bit over the years and functions have recently recieved some innovation.  This article covers one of the more useful new abilities: 'default parameters'. \(and don't forget the 'tasks' at the end!!\)  
4. Finally, read [one more article](http://javascript.info/function-expressions-arrows) about functions in Javascript that will give you a little more context.  Another relatively new feature in modern JavaScript is the `arrow function`. Which is introduced in this article.  Arrow functions are useful, but not incredibly crucial so don't worry about them too much just yet.  We include them here because you are likely to encounter them as you move forward, and it's better that you have at least _some_ idea of what you're looking at whenever they crop up.

##    Practice

Let's write some functions!  Write these in the `script` tag of a skeleton html file.  If you've forgotten how to set it up, review the instructions from __fundamentals 1__.

For now just write each function and test the output with `console.log`.

###   Warm up

1. Write a function called `add7` that takes one number and returns that number + 7.
2. Write a function called `multiply` that takes 2 numbers and returns their product.
3. Write a function called `capitalize` that takes a string and returns that string with _only_ the first letter capitalized.  Make sure that it can take strings that are lowercase, UPPERCASE or BoTh.
4. Write a function called `lastLetter` that takes a string and returns the very last letter of that string:
   1. `lastLetter("abcd")` should return `"d"`

###   A simple game

1. Write a function that plays a single round of Rock Paper Scissors.  The function should take a string 'Rock', 'Paper' or 'Scissors', should randomly pick a choice for the computer and then return a string that declares the winner of the round like so: `"You Lose! Paper beats Rock"`
   1. If the input is NOT an appropriate option, return a message that says `"Invalid input"`
   2. make your function case insensitive (so users can input `rock`, `ROCK`, `RocK` or any other variation)
2. Expand on the previous function by writing a NEW function called `game()`.  Use the previous function _inside_ of this one to play a 5 round game that keeps score and reports a winner or loser at the end.
   1. At this point you should still just be using `console.log()` to display the results of each round and the winner at the end.
   2. use `prompt()` to get input from the user. [Read the docs here if you need to.](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt)
   3. Feel free to re-work your previous function if you need to.  Specifically, you might want to change the return value to something more useful.
   4. Feel free to create more "helper" functions if you think it would be useful.
