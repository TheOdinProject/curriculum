### Introduction

For this project, you will create the game **Rock Paper Scissors**. This game will be played entirely on the console. To learn more, or if you're not familiar with the game, read this [Wikipedia article](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors) or this [detailed step-by-step guide.](https://www.wikihow.com/Play-Rock,-Paper,-Scissors)

<div class="lesson-note">
Some of the student solutions below contain buttons, text, and other elements. These elements make up what is called a graphical user interface (GUI). You'll create the GUI in a later lesson. In the meantime, remember to commit your code to GitHub.
</div>

### Quick exercise before starting

1. Identify three ways to include JavaScript in a webpage.
2. Check if the webpage includes JavaScript:
   - Write `console.log("Hello World")` in JavaScript.
   - Check if "Hello World" is logged in the browser console once you open your webpage.

### Problem solving approach
Remember the [previous wise words from the Problem Solving lesson](https://www.theodinproject.com/lessons/foundations-problem-solving) because this is your first JavaScript program built from scratch. Before you start this project, follow these steps for each step of the project:

1. Plan or pseudocode your solution.
2. Write the code.
3. Test your code to make sure it works.

### Assignment

<div class="lesson-content__panel" markdown="1">
Remember to commit early and often! To refresh your memory, check out the [commit messages lesson](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages).

#### Step 1: initial structure

1. Create a new Git repository for your project.
1. Create a blank HTML document with a script tag.

It's best practice to link to an external JavaScript file inside this script tag. Using an external JavaScript file keeps your HTML file clean and organized.

You don't have to write additional code in the HTML file. This game is played entirely on the console.

#### Step 2: get computer choice function

Your game will be played against the computer. Create a function named `getComputerChoice` that randomly returns 'Rock', 'Paper' or 'Scissors':

1. Create a new function named `getComputerChoice`.
1. Write the code to let `getComputerChoice` randomly `return` one of the following string values: "Rock", "Paper" or "Scissors". 
   - **Hint**: The [Math.random](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) method returns a random number that's greater than or equal to 0 and less than 1. Think about how you can use this to conditionally return one of the multiple choices.
1. Test that your function returns what you expect using `console.log` or [the browser developer tools](https://www.theodinproject.com/lessons/foundations-javascript-developer-tools) before advancing to the next step.

#### Step 3: play round function

Your game will be played round by round. Write a function named `playRound` that takes the human and computer player choices as arguments, plays a single round and returns a winner announcement:

1. Create a new function named `playRound`.
1. Define two parameters on `playRound`: `playerChoice` and `computerChoice`. Use those two parameters to take the human and computer choices as arguments.
1. Make your function's `playerSelection` parameter case-insensitive. Players should be able to input "rock", "ROCK", "RocK" or other variations.
1. Write the code for your `playRound` function to `return` a string value representing the round winner, such as: "You Lose! Paper beats Rock".

Example code:

~~~javascript
function playRound(playerChoice, computerChoice) {
// your code here!
}

const playerSelection = "rock";
const computerSelection = getComputerChoice();

console.log(playRound(playerSelection, computerSelection));
~~~

#### Step 4: game function
Your game will play 5 rounds. Write a function named `game` that uses `playRound` to play 5 rounds, keeps score, and declares a winner at the end:

1. Create a new function named `game`.
1. Get the human player choice using the `prompt` method. Read [this MDN article about prompt method](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt) learn more about it.
1. Put the previous `playRound` function inside `game`.
1. Play 5 rounds by calling `playRound` 5 times.
   - **Hint**: When you assign a function call to a variable, the return value of that function is assigned to the variable. Accessing the variable afterward will only provide the assigned value; it doesn't recall the function. You need to recall the choice functions to get new choices for each round.

Re-work your previous functions or create more helper functions if necessary. Specifically, you may want to change the return values to something more useful.

If you already know about loops, you can use them. If not, don't worry! Loops will be covered in the next lesson.

</div>
