<html>
    <body>
        <script>
            function computerPlay(){
                let arr = ["rock","paper","scissors"];
                let random = arr[Math.floor(Math.random() * arr.length)]
                return random;
                }
                let playerScore = 0;
                let computerScore = 0;
                function playRound(playerSelection,computerSelection){
                    if(playerSelection == "rock" && computerSelection == "scissors" ||
                    playerSelection == "paper" && computerSelection =="rock" ||
                    playerSelection == "scissors" && computerSelection =="paper"){
                    playerScore ++;
                    return "You won. " + playerSelection + " beats " + computerSelection;
                    }else if(playerSelection == "rock" && computerSelection == "paper" ||
                            playerSelection == "paper" && computerSelection =="scissors" ||
                            playerSelection == "scissors" && computerSelection =="rock"){
                            computerScore++;
                            return "You lose. " + computerSelection + " beats " + playerSelection;
                    }else{
                        return "It's a tie. " + "Computer choosed: " + computerSelection;
                    }
                }
                function game(){
                let numberOfGames = prompt("How many games do you want to play?");
                for(let i = 1; i <= numberOfGames; i++){
                    let playerSelection = prompt("Enter your choice:").toLowerCase();
                    console.log(playRound(playerSelection,computerPlay().toLowerCase()))
                }
                if(playerScore > computerScore){
                    return "Result: You are the winner";
                }else if(playerScore == computerScore){
                    return "Result: It's a tie";
                }else{
                    return "Reasult: Computer is a winner"
                }
                }
            </script>
    </body>
</html>