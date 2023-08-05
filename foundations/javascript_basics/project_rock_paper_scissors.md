### Introduction

For this project, you'll create a console-only version of the grade-school game: **Rock Paper Scissors**. To learn more, or if you're unfamiliar with the game, read this [Wikipedia article](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors) or this [detailed step-by-step guide](https://www.wikihow.com/Play-Rock,-Paper,-Scissors)

<div class="lesson-note">
<h4>Student solutions</h4>
Some students' solutions below include buttons, text, and other elements. Those elements form what is known as a Graphical User Interface (GUI). You'll add those elements—the GUI, in a later lesson. So remember to push your code to GitHub.
</div>

### Quick exercise before starting
1. Identify three ways to include JavaScript in a page.
2. Check if the page includes JavaScript:
   - Write `console.log("Hello World");` in JavaScript.
   - Check if `console.log("Hello World");` logs in the browser's console.

### Problem solving approach

Remember the [previous lesson on problem solving](https://www.theodinproject.com/lessons/foundations-problem-solving) before diving into the project. Plan your solution—write the code—and then ensure the code works.

### Assignment

<div class="lesson-content__panel" markdown="1">
Remember to commit early and often! To refresh your memory, check the [commit messages lesson](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages).

1. Create a new Git repository for your project.
1. Create a blank HTML document with a script tag.
   1. We recommend writing the code in an external JavaScript file and linking it to the HTML file. You play this game entirely on the console, so don't worry about writing anything else in the HTML file.
1. Your game plays against the computer—create a function to `return` the computer's choice:
   1. Create a new function called `getComputerChoice`.
   1. Make `getComputerChoice` *randomly* `return` one of the following string values: `"Rock"`, `"Paper"` or `"Scissors"`.
   1. Remember to test what your function returns with [browser's developer tools](https://www.theodinproject.com/lessons/foundations-javascript-developer-tools) or `console.log`.
1. Your game plays turn by turn—create a function to take the human and computer choices, then `return` the round winner:
   1. Create a new function called `playRound`.
   1. Define two parameters on `playRound`: `playerSelection` and `computerSelection`. Use those two parameters to take the human and computer choices as arguments.
   1. Make `playRound` `return` a string value representing the round winner, such as: `"You Lose! Paper beats Rock"`.

   ~~~javascript
   function playRound(playerSelection, computerSelection) {
   // your code here!
   }
 
   const playerSelection = "rock";
   const computerSelection = getComputerChoice();
   console.log(playRound(playerSelection, computerSelection));
   ~~~

1. Your game plays for 5 rounds, and reports the winner or loser after the 5 rounds—create a function to represent the game:
   1. Create a new function called `game`.
   1. Get the human player choice using `prompt` function. To learn about `prompt`, check the [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt)
   1. Put the previous function—`playRound`—inside `game`.
   1. Play 5 rounds by calling `playRound` 5 times.
   1. If you know about loops, use them. If not, don't worry! We cover loops in the next lesson. 

</div>
