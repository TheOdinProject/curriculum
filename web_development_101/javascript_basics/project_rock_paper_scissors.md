<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <script>
      function game() {
        function computerPlay() {
          let choise = ["rock", "paper", "scissors"];
          return choise[Math.floor(Math.random() * choise.length)];
        }
        function Player() {
          let coise = prompt("Type your choise");
          choise = coise.toLowerCase();
          return choise;
        }
        function playRound() {
          switch (playerSelection) {
            case "rock":
              if (playerSelection == computerSelection) {
                return "Draw";
              }
              if (computerSelection == "paper") {
                return "Rock weaker than Paper";
              } else {
                return "Rock beat scissors";
              }
              break;
            case "paper":
              if (playerSelection == computerSelection) {
                return "Draw";
              }
              if (computerSelection == "scissors") {
                return "Paper weaker than Scissors";
              } else {
                return "Paper beats Rock";
              }
              break;
            case "scissors":
              if (playerSelection == computerSelection) {
                return "Draw";
              }
              if (computerSelection == "rock") {
                return " Scissors weaker than Rock";
              } else {
                return "Scissors beat paper";
              }
              break;
            default:
              return "Something wrong!";
          }
        }
        const playerSelection = Player();
        const computerSelection = computerPlay();
        console.log(playRound(playerSelection, computerSelection));
      }
      for (let i = 1; i < 6; i++) {
        game();
        console.log("Number:" + i);
      }
    </script>
  </body>
</html>

