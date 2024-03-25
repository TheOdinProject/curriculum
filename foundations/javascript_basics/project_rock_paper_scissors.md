### Introduction

For this project, you will create the game [Rock Paper Scissors](https://www.wikihow.com/Play-Rock,-Paper,-Scissors). This game will be played entirely in the console.

<div class="lesson-note">
Some of the student solutions below contain buttons, text, and other elements. These elements are part of what is called a graphical user interface (GUI). You'll create the GUI in a later lesson. In the meantime, remember to commit your code to GitHub.
</div>

### Problem solving approach

Since this is the first JavaScript project being built from scratch, it's important to remember the wise words from the [Problem Solving lesson](https://www.theodinproject.com/lessons/foundations-problem-solving). For each step in this project, be sure to do the following

1. Plan or pseudocode your solution.
1. Write the code.
1. Test your code to make sure it works.

### Assignment

<div class="lesson-content__panel" markdown="1">
Remember to commit early and often! To refresh your memory, check out the [commit messages lesson](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages).

#### Step 1: Initiate the project structure

1. Create a new Git repository for your project.
1. Create a blank HTML document with a script tag.
1. Check if the webpage includes JavaScript:
   - Write `console.log("Hello World")` in JavaScript.
   - Check if "Hello World" is logged in the browser console once you open your webpage.

It's best practice to link to an external JavaScript file inside this script tag. Using an external JavaScript file keeps your HTML file clean and organized.

You don't have to write additional code in the HTML file. This game is played entirely via the console.

#### Step 2: Write the logic to get the computer choice

Your game will be played against the computer. You will write a function that randomly returns "Rock", "Paper" or "Scissors".

1. Create a new function named `getComputerChoice`.
1. Write the code so that `getComputerChoice` will randomly `return` one of the following string values: "Rock", "Paper" or "Scissors".
   - **Hint**: The [Math.random](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) method returns a random number that's greater than or equal to 0 and less than 1. Think about how you can use this to conditionally return one of the multiple choices.
1. Test that your function returns what you expect using `console.log` or [the browser developer tools](https://www.theodinproject.com/lessons/foundations-javascript-developer-tools) before advancing to the next step.

#### Step 3: Write the logic to play a single round

Your game will be played round by round. You will write a function that takes the human and computer player choices as arguments, plays a single round and returns a winner announcement.

1. Create a new function named `playRound`.
1. Define two parameters for `playRound`: `playerChoice` and `computerChoice`. Use these two parameters to take the human and computer choices as arguments.
1. Make your function's `playerSelection` parameter case-insensitive so that players can input "rock", "ROCK", "RocK", or other variations.
1. Write the code for your `playRound` function to `return` a string value representing the round winner, such as: "You lose! Paper beats Rock".

Example code:

```javascript
function playRound(playerChoice, computerChoice) {
  // your code here!
}

const playerSelection = "rock";
const computerSelection = getComputerChoice();

console.log(playRound(playerSelection, computerSelection));
```

#### Step 4: Write the logic to entire the play the game

Your game will play 5 rounds. You will write a function named `playGame` that calls `playRound` to play 5 rounds, keeps score, and declares a winner at the end.

1. Create a new function named `playGame`.
1. Get the human player choice using the `prompt` method. Read this [MDN article about the prompt method](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt) learn more about it.
1. Put the previous `playRound` function inside `playGame`.
1. Play 5 rounds by calling `playRound` 5 times.
   - **Hint**: When you assign a function call to a variable, the return value of that function is assigned to the variable. Accessing the variable afterward will only provide the assigned value; it doesn't recall the function. You need to recall the choice functions to get new choices for each round.
   - Re-work your previous functions or create more helper functions if necessary. Specifically, you may want to change the return values to something more useful.
   - If you already know about loops, you can use them. If not, don't worry! Loops will be covered in the next lesson.

</div>
<div class="lesson-note" markdown="1">
When making interactive projects, like this one, you might be tempted to add more features, improve interactivity, user experience, design and styling of your website, and so on.

We recommend not doing that, and saving this effort for your portfolio projects.

For more information on learning mindset and portfolio pieces read [Part 5](https://dev.to/theodinproject/learning-code-f56) and [Part 7](https://dev.to/theodinproject/strategically-building-your-portfolio-1km4) of [Becoming a TOP Success Story](https://dev.to/theodinproject/becoming-a-top-success-story-mindset-3dp2)
</div>
