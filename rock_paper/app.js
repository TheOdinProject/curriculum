const moves = document.querySelector("#moves");
const playerScore = document.querySelector("#p-score");
const computerScore = document.querySelector("#c-score");
const round = document.querySelector(".round");
const gameOver = document.querySelector(".game-over");
const results = document.querySelector("#results");
const restart = document.querySelector(".btn");

restart.addEventListener("click", () => {
  window.location.reload();
});

const computerPlay = () => {
  let num = Math.floor(Math.random() * 3 + 1);
  let choice;
  if (num === 1) {
    choice = "rock";
  } else if (num === 2) {
    choice = "paper";
  } else {
    choice = "scissor";
  }
  return choice;
};
const playRound = (playerSelection, computerSelection) => {
  let playerS = parseInt(playerScore.textContent);
  let computerS = parseInt(computerScore.textContent);

  if (playerSelection === computerSelection) {
    round.textContent = "It's Tie";
  } else if (
    (playerSelection === "paper" && computerSelection === "rock") ||
    (playerSelection === "rock" && computerSelection === "scissor") ||
    (playerSelection === "scissor" && computerSelection === "paper")
  ) {
    round.textContent = `You win! ${playerSelection} beats ${computerSelection}`;
    playerScore.textContent = playerS + 1;
  } else if (
    (playerSelection === "rock" && computerSelection === "paper") ||
    (playerSelection === "scissor" && computerSelection === "rock") ||
    (playerSelection === "paper" && computerSelection === "scissor")
  ) {
    round.textContent = `You lose! ${computerSelection} beats ${playerSelection}`;
    computerScore.textContent = computerS + 1;
  }
};
const endGame = () => {
  if (playerScore.textContent === "5") {
    gameOver.style.visibility = "visible";
    results.textContent = "Congratulations! You are the winner.";
    results.classList.add("winner");
    moves.removeEventListener("click", makeMOve);
  } else if (computerScore.textContent === "5") {
    gameOver.style.visibility = "visible";
    results.textContent =
      "Unfortunately, you lost and the computer is the winner.";
    results.classList.add("loser");
    moves.removeEventListener("click", makeMOve);
  }
};
const makeMOve = (e) => {
  const playerMove = e.target.alt;
  const computerMove = computerPlay();
  if (!playerMove) return;
  playRound(playerMove, computerMove);
  endGame();
};

moves.addEventListener("click", makeMOve);
