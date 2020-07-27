function computerPlay() {
    // generate computer output
    let play = Math.floor((Math.random() * 3) + 1);
    switch (play) {
        case 1: 
            return "rock";
            break;
        case 2:
            return "paper";
            break;
        case 3:
            return "scissors";
            break;
    }
}

function playRound(playerSelection, compSelection) {
    if (playerSelection == compSelection) {
        return "Tie!"
    }
    switch (playerSelection) {
        case "rock":
            if (compSelection == "paper") {
                return "You lose! Paper beats Rock.";
                break;
            }
            else {
                return "You win! Rock beats Scissors.";
                break;
            }
        case "paper":
            if (compSelection == "scissors") {
                return "You lose! Scissors beats Paper.";
                break;
            }
            else {
                return "You win! Paper beats Rock."
                break;
            }
        case "scissors":
            if (compSelection == "rock") {
                return "You lose! Rock beats Scissors.";
                break;
            }
            else {
                return "You win! Scissors beats Paper";
                break;
            }
        }
    }

function game() {
    let playerScore = 0;
    let compScore = 0;
    let result = " "
    let check = true;
    
    for (i = 0; i < 5; i++) {
        // check for allowed input
        check = true;
        while (check) {
            playerSelection = prompt("Enter Rock, Paper or Scissors: ").toLowerCase();
            if (playerSelection == "rock" || playerSelection == "scissors" || playerSelection =="paper") {
                check = false;
            }
        }
       
        console.log(playerSelection);
        compSelection = computerPlay();
        result = playRound(playerSelection, compSelection);
        if ((result.slice(0, 5)) == "You w") {
            playerScore += 1;
        }
        else if ((result.slice(0, 5)) == "You l") {
            compScore += 1;
        }
        console.log(result);
        console.log("Player score: " + playerScore);
        console.log("Computer score: " + compScore);
    }
    if (playerScore > compScore) {
        console.log("You won!");
    }
    else if (compScore > playerScore) {
        console.log("You lost! Oh no.");
    }
    else {
        console.log("Tie!");
    }
}

let compSelection = "";
let playerSelection = "";

game();