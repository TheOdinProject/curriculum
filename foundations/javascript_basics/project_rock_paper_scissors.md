### Introduction

In this project, we'll create a simple implementation of the classic grade-school game "rock paper scissors". If you're unfamiliar with this game, check out this [Wikipedia article](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors) or this [detailed step-by-step guide](https://www.wikihow.com/Play-Rock,-Paper,-Scissors).

We'll start by playing the game entirely from the browser console. Later on, **we'll revisit this project to add a Graphical User Interface (GUI) with buttons and text**. So don't forget to save the code on GitHub! Some student solutions below might already have a GUI, but we'll cover that in a later lesson. Let's get started with a few quick exercises before we start the project!


### Quick exercises before starting

1. Identify three ways to include JavaScript in a page.
2. Test it out! Write `console.log("Hello World");` in JavaScript and check to see if it displays in the browser's console.

Before we dive into the project, remember that this is your first JavaScript program built from scratch. So, don't forget the previous lesson on problem-solving. Plan your solution before writing any code and test each piece as you build to ensure it works before moving on to the next step!

### Assignment

<div class="lesson-content__panel" markdown="1">
Don't forget to commit early & often! You can [reference the Commit Message lesson here](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages)!

1. Start a new Git repository for your project.
2. Create a blank HTML document with a script tag.
    - **Tip**: We highly recommend writing the code in an external JavaScript file and linking it to the HTML file. This game is played entirely from the console, so don't worry about writing anything else in the HTML file.
3. Your game is going to play against the computer, so begin writing a new function called `getComputerChoice` that will randomly return either `"Rock"`, `"Paper"`, or `"Scissors"`. We'll use this function to make the computer play.
    - **Tip**: Use the console to make sure this returns the expected output before moving to the next step!
4. Write a new function called `playRound` that plays a single round of Rock Paper Scissors. This `playRound` function should have two parameters: `playerSelection` and `computerSelection`, both taking string arguments. Then, return a string that declares the winner of the round, like so: `"You Lose! Paper beats Rock"`
    *   Make sure your `playerSelection` parameter is case-insensitive so that users can input `rock`, `ROCK`, `RocK`, or any other variation.
   -  **Important note:** you want to `return` the results of `playRound` call, *not* `console.log` them. You're going to use what you `return` later on, so let's test this function by using console.log to see the results:

      ~~~javascript
      function playRound(playerSelection, computerSelection) {
        // your code here!
      }
 
      const playerSelection = "rock";
      const computerSelection = getComputerChoice();
      console.log(playRound(playerSelection, computerSelection));
      ~~~

5. Write a new function called `game` that plays a 5 round game, keeps the game's score, and reports a winner or loser at the end. Use the previous function *inside* this `game` function.
    *   You have not officially learned how to "loop" over code to repeat function calls... If you already know about loops from somewhere else or feel like learning more, feel free to use them. If not, don't worry! Just call your `playRound` function 5 times in a row. In the next lesson, we will cover loops.
    *   At this point, you should be using `console.log` to display the results of each round and the winner at the end.
    *   Use the `prompt` function to get input from the user. [Read the docs here if you need to.](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt)
    *   Feel free to re-work your previous functions if you need to. Specifically, you might want to change the return value to something more useful.
    *   Feel free to create more "helper" functions if you think they would be useful.

</div>
