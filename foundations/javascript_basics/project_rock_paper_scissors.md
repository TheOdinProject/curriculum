### Introduction

For this project, you'll create a console-only version of the grade-school game: Rock Paper Scissors. To learn more—or if you're unfamiliar with the game, read this [Wikipedia article](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors) or this [detailed step-by-step guide](https://www.wikihow.com/Play-Rock,-Paper,-Scissors).
<div class="lesson-note">
<h4>Student solutions</h4>
Some students' solutions below include buttons, text, and other elements—those elements form what is known as a Graphical User Interface (GUI). You'll add those elements—a GUI, in a later lesson. So remember to push your code to GitHub.
</div> 

### Quick exercise before starting

1. Identify three ways to include JavaScript in a page.
2. Check if you are including the JavaScript correctly:
   - Write `console.log("Hello World");` in JavaScript.
   - Check if `console.log("Hello World");` logs in the browser's console.

Before we dive into the project—and since this is your first JavaScript program built from scratch, remember the [previous lesson on problem-solving](https://www.theodinproject.com/lessons/foundations-problem-solving). Plan your solution before writing the code—then write the code—and lastly, ensure the code works before moving to the next step.

### Assignment

<div class="lesson-content__panel" markdown="1">
Remember to commit early and often! To refresh your memory, refer to the lesson about [commit messages](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages).

1. Start a new Git repository for your project.
1. Create a blank HTML document with a script tag.
   <div class="lesson-note lesson-note--tip">
   We recommend writing the code in an external JavaScript file and linking it to the HTML file. You play this game entirely on the console, so don't worry about writing anything else in the HTML file.
   </div>
1. Your game plays against the computer—you need a function that returns the computer choice:
   1. Create a new function called `getComputerChoice`.
   1. Make `getComputerChoice` *randomly* `return` one of the following string values: `"Rock"`, `"Paper"` or `"Scissors"`.
   <div class="lesson-note lesson-note--tip">
   Remember to test what your function returns with the browser dev tools or by using console.log.
   </div>
1. Your game plays turn by turn—you need a function that takes the human and computer choices—then returns the round winner:
   1. Create a new function called `playRound`.
   1. Define two parameters on `playRound`: `playerSelection` and `computerSelection`. Use those two parameters to take the human and computer choices as arguments.
   1. Make `playRound` `return` a string value that represents the winner of the round, such as: `"You Lose! Paper beats Rock"`.

   ~~~javascript
   function playRound(playerSelection, computerSelection) {
  // your code here!
   }
 
   const playerSelection = "rock";
   const computerSelection = getComputerChoice();
   console.log(playRound(playerSelection, computerSelection));
   ~~~

1. Finally, your game plays for 5 rounds, and then report the winner or loser after those 5 rounds—you need a function that represents the entire game:
   1. Create a new function called `game`.
   1. Get the human player choice using `prompt` function. To learn more about `prompt`, refer to the [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt)
   1. Put the previous function—`playRound`—inside `game`.
   1. Play 5 rounds by calling `playRound` 5 times in a row.
   <div class="lesson-note lesson-note--tip">
   If you already know about loops or feel like learning more, feel free to use them. If not, don't worry! We cover loops in the next lesson. 
   </div>

</div>
