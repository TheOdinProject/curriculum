### Introduction

We're going to make an implementation of grade-school classic "rock paper scissors". If you don't know what that is check the [Wikipedia article](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors) or [this](https://www.wikihow.com/Play-Rock,-Paper,-Scissors) detailed step-by-step. For the moment we're just going to play the game from the browser console, but **we will revisit this project in a later lesson and add a Graphical User Interface with buttons and text,** so don't forget to keep the code on GitHub! You might notice some 'Live Preview' links in the student solutions that have a GUI - this is coming in a later lesson. When you get there don't forget to come back and add your link!

### Quick exercises before starting

1. Identify three ways to include JavaScript in a page.
1. Test it out! Write `console.log("Hello World");` in JavaScript and check to see if it displays in the browser's console.

Finally, this is your first JavaScript program built from scratch, so don't forget the previous lesson on problem solving. Plan your solution out before writing any code, and test each piece as you build to ensure it is working before moving on to the next!

### Assignment

<div class="lesson-content__panel" markdown="1">
Don't forget to commit early & often! You can [reference the Commit Message lesson here](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages)!

1. Start a new Git repo for your project.
1. Create a blank HTML document with a script tag (Hint: it is best practice to link an external .js file). This game is going to be played completely from the console, so don't worry about putting anything else in there.
1. Your game is going to play against the computer, so begin with a function called `getComputerChoice` that will randomly return either 'Rock', 'Paper' or 'Scissors'. We'll use this function in the game to make the computer's play. *Tip: use the console to make sure this is returning the expected output before moving to the next step!*
1. Write a function that plays a single round of Rock Paper Scissors. The function should take two parameters - the `playerSelection` and `computerSelection` - and then return a string that declares the winner or tie of the round like so: `"You Lose! Paper beats Rock"`

   - Make your function's playerSelection parameter case-insensitive (so users can input `rock`, `ROCK`, `RocK` or any other variation).

1. **Important note:** you want to `return` the results of this function call, *not* `console.log()` them. You're going to use what you `return` later on, so let's test this function by using console.log to see the results:

   ```javascript
   function playRound(playerSelection, computerSelection) {
     // your code here!
   }

   const playerSelection = "rock";
   const computerSelection = getComputerChoice();
   console.log(playRound(playerSelection, computerSelection));
   ```

1. Write a NEW function called `playGame()`. Use the previous function *inside* of this one to play a five round game that keeps score and reports a winner or loser at the end.
   - You have not officially learned how to "loop" over code to repeat function calls... if you already know about loops from somewhere else (or if you feel like doing some more learning) feel free to use them. If not, don't worry! Just call your `playRound` function 5 times in a row. Loops are covered in the next lesson.
   - At this point you should be using `console.log()` to display the results of each round and the winner at the end.
   - Use `prompt()` to get input from the user. [Read the docs here if you need to.](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt)
   - Feel free to re-work your previous functions if you need to. Specifically, you might want to change the return value to something more useful.
   - Feel free to create more "helper" functions if you think it would be useful.

</div>
<div class="lesson-note" markdown="1">
When making interactive projects, like this one, you might be tempted to add more features, improve interactivity, user experience, design and styling of your website, and so on.

We recommend not doing that, and saving this effort for your portfolio projects.

For more information on learning mindset and portfolio pieces read [Part 5](https://dev.to/theodinproject/learning-code-f56) and [Part 7](https://dev.to/theodinproject/strategically-building-your-portfolio-1km4) of [Becoming a TOP Success Story](https://dev.to/theodinproject/becoming-a-top-success-story-mindset-3dp2)
</div>
