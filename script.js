let computerPlay = function () {
    let computerPick = Math.floor(Math.random()*3);
    if (computerPick === 0) {
        computerPick = 'rock';
    } else if (computerPick === 1) {
        computerPick = 'paper';
    } else {
        computerPick = 'scissors';
    }
    return computerPick;
}

let playerPlay = function() {
    let temp = window.prompt('Please enter rock, paper, or scissors!');
    return temp.toLowerCase();
}

let computerScore = 0;
let playerScore = 0;

let winner = function (computerSelection, playerSelection) {
    console.log ('Computer played ' + computerSelection + ", you played " + playerSelection + ".")
    if (computerSelection === playerSelection) {
        return 'Tie! Try again.'
    }
    else if (computerSelection === 'rock') {
        if (playerSelection === 'paper') {
            playerScore ++;
            return 'You win! Paper beats rock!'
        }
        else {
            computerScore ++;    
            return 'Computer wins! Rock beats scissors!'
        }
    }
    else if (computerSelection === 'paper') {
        if (playerSelection === 'scissors') {
            playerScore ++;
            return 'You win! Scissors beat paper!';
        }
        else {
            computerScore ++;
            return 'Computer wins! Paper beats rock!';
        }
    }
    else {
        if (playerSelection === 'rock') {
            playerScore ++;
            return 'You win! Rock beats scissors!'
        }
        else {
            computerScore ++;
            return 'Computer wins! Scissors beat paper!'
        }
    }

}



let game = function () {
    for (let i = 0; i < 5; i++) {
        console.log(winner(computerPlay(), playerPlay()));
    }
    if (playerScore > computerScore) {
        console.log('Player won ' + playerScore + ', computer won ' + computerScore + '. Player wins the tournament!' );
    }
    else if (computerScore > playerScore) {
        console.log('Computer won ' + computerScore + ', player won ' + playerScore + '. Computer wins the tournament!' );
    }
    else {
        console.log('Five games played, but due to ties there is no clear tournament winner.');
    }
}

game();