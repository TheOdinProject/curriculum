function computerPlay() {
  var arr = ["rock", "paper", "scissors"];
  var choice = arr[Math.floor(Math.random() * 3)];
  console.log("computer's choice: " + choice);
  return choice;
}

function playRound(playerSelection, computerSelection) {
  var regex = /rock|paper|scissors/i;

  playerSelection = playerSelection.toLowerCase();

  if(regex.test(playerSelection)) { //1 = player wins // 2 = computer wins // 0 = tie
    if(playerSelection === "rock" && computerSelection === "paper") {
      return 2;
    } else if(playerSelection === "rock" && computerSelection === "scissors") {
      return 1;
    } else if(playerSelection === "paper" && computerSelection === "rock") {
      return 1; 
    } else if(playerSelection === "paper" && computerSelection === "scissors") {
      return 2;
    } else if(playerSelection === "scissors" && computerSelection === "rock") {
      return 2;
    } else if(playerSelection === "scissors" && computerSelection === "paper") {
      return 1;
    } else {
      return 0;
    }
  }
}

function game() {
  let playerScore = 0;
  let computerScore = 0;
  let result = "";

  for(let i = 0; i < 5; i++) {
    playerSelection = prompt("rock, paper or scissors?");
    computerSelection = computerPlay();
    result = playRound(playerSelection, computerSelection);
    if(result === 1) {
      playerScore++;
    } else if(result === 2) {
      computerScore++;
    }
    console.log("your score: " + playerScore);
    console.log("computer's score: " + computerScore);
  }

  if(playerScore > computerScore) {
    console.log("you won!");
  } else if(playerScore < computerScore) {
    console.log("computer won!");
  } else {
    console.log("game tied!");
  }
}

