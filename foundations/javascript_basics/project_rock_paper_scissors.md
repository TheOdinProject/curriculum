### Introduction

For this project, you'll create the grade-school game: **Rock Paper Scissors** which will be played entirely in the console. To learn more, or if you're unfamiliar with the game, read this [Wikipedia article about the rock paper scissors game](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors) or this [detailed step-by-step guide about rock paper scissors.](https://www.wikihow.com/Play-Rock,-Paper,-Scissors)

<div class="lesson-note">
<h4>Student solutions</h4>
Some students' solutions below include buttons, text, and other elements. Those elements form what is known as a Graphical User Interface (GUI). You'll add those elements, the GUI, in a later lesson. So remember to push your code to GitHub.
</div>

### Quick exercise before starting

1. Identify three ways to include JavaScript in a page.
2. Check if the page includes JavaScript:
   - Write `console.log("Hello World");` in JavaScript.
   - Check if "Hello World" is logged in the browser console once you open your webpage.

### Problem solving approach

Since this is your first JavaScript program built from scratch, remember the [previous wise words from the problem-solving lesson](https://www.theodinproject.com/lessons/foundations-problem-solving). Before diving into this project, first plan or pseudocode your solution, then write the code, then ensure the code works.

### Assignment

<div class="lesson-content__panel" markdown="1">
Remember to commit early and often! To refresh your memory, check the [commit messages lesson](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages).

1. Create a new Git repository for your project.
1. Create a blank HTML document with a script tag.
   - It is best practice to link to an external JavaScript file inside this script tag. You play this game entirely on the console, so don't worry about writing anything else in the HTML file for this project.
1. Your game plays against the computer. Create a function `getComputerChoice` that will randomly `return` either 'Rock', 'Paper' or 'Scissors'.
   - Create a new function `getComputerChoice`.
   - Write the code to let `getComputerChoice` randomly `return` one of the following string values: "Rock", "Paper" or "Scissors".
   - Test that your function returns what you expect using `console.log` or [the browser developer tools](https://www.theodinproject.com/lessons/foundations-javascript-developer-tools) before you move on to the next step.
1. Your game plays turn by turn. Write a function named `playRound`, which takes the `playerSelection` and `computerSelection` to play a single round, and returns a winner announcement. 
   - Create a new function called `playRound`.
   - Define two parameters on `playRound`: `playerSelection` and `computerSelection`. Use those two parameters to pass the human and computer choices as arguments.
   - Make your function's `playerSelection` parameter case-insensitive (so users can input "rock", "ROCK", "RocK" or any other variation).
   - Write the code for your `playRound` function to `return` a string value representing the round winner, such as: "You Lose! Paper beats Rock".
   - example code:

   ~~~javascript
   function playRound(playerSelection, computerSelection) {
   // your code here!
   }
 
   const playerSelection = "rock";
   const computerSelection = getComputerChoice();
   console.log(playRound(playerSelection, computerSelection));
   ~~~

1. Your game plays for 5 rounds. Write a function called `game` which will keep score for 5 rounds, utilizing your 'playRound' function, before it declares a winner:
   - Create a new function called `game`.
   - Get the human player choice using the `prompt` method. Read [this MDN article about prompts](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt) if you need to learn more about it.  
   - Put the previous `playRound` function inside `game`.
   - Play 5 rounds by calling `playRound` 5 times.
   - Re-work your previous functions or create more helper functions if you feel the need to. Specifically, you might want to change the return values to something more useful.
   - If you already know about loops, you can use them. If not, don't worry! We cover loops in the next lesson. 

</div>
