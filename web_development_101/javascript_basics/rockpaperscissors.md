<!DOCTYPE html>
<html>
    <head>
        <title>rockpaperscissors</title>
    </head>
    <body>
        <script>
        

            function computerPlay(){
                //computer randomly selects Rock, Paper or Scissor
                var computerChoice = Math.random()

                if (computerChoice < 0.34) {
                    return ('rock')
                } 
                else if(computerChoice <= 0.67) {
                    return ('paper')
                } 
                else {
                    return ('scissors')
                } 
            }

            function playRound(playerSelection, computerSelection){

                playerSelection = playerSelection.toLowerCase();

                if (playerSelection == 'rock' && computerSelection == 'scissors'){
                    playerScore++;
                    alert("Rock beats Scissor! 1 Point!");
                    return ("Rock beats Scissor! 1 Point!");
                }

                else if (playerSelection == 'rock' && computerSelection == 'paper'){
                    computerScore++;
                    alert("Paper beats Rock! 1 Point Computer!");
                    return("Paper beats Rock! 1 Point Computer!");
                }

                else if (playerSelection == 'paper' && computerSelection == 'rock'){
                    playerScore++;
                    alert("Paper beats Rock! 1 Point!");
                    return("Paper beats Rock! 1 Point!");
                }

                else if (playerSelection == 'paper' && computerSelection == 'scissors'){
                    computerScore++;
                    alert("Scissor beats Paper! 1 Point Computer!");
                    return("Scissor beats Paper! 1 Point Computer!");
                }

                else if (playerSelection == 'scissors' && computerSelection == 'paper'){
                    playerScore++;
                    alert("Scissor cuts Paper! 1 Point!");
                    return("Scissor cuts Paper! 1 Point!");
                }

                else if (playerSelection == 'scissors' && computerSelection == 'rock'){
                    computerScore++;
                    alert("Rock stomps Scissor! 1 Point Computer!");
                    return("Rock stomps Scissor! 1 Point Computer!");
                }
                else if (playerSelection == computerSelection){
                    alert("It's a tie! Try again!");
                    return("It's a tie! Try again!");
                }
            }
            
            function game(){
                const playerSelection = prompt("Rock, Paper, Scissors?");
                const computerSelection = computerPlay();
                console.log(playRound(playerSelection, computerSelection));
            }
            
            function results (){
                console.log("Computer Score: " + computerScore + " Player Score: " + playerScore);
                if (computerScore > playerScore){
                    console.log("Computer Wins the Game!");
                } 
                else if (computerScore < playerScore){
                    console.log("You Beat the Computer!");
                }
                else{
                    console.log("It's a Tie!");
                }
            }

            //Main Code
            var computerScore = 0;
            var playerScore = 0;

            for (var round = 0; round < 5; round++) {
                game();
            }

            results()

            prompt 
        </script>
    </body>
</html>