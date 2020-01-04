
<!DOCTYPE html>
<html>
    <script>
        function getRandomInt(max){
            return Math.floor(Math.random() * Math.floor(max))
        }
        
        function computerPlay() {
            var move = getRandomInt(3)
            if (move == 0){
                return 'Rock';
            }
            else if (move == 1){
                return 'Paper'
            }
            else
            return 'Scissors'
        }

        function playerSelection (){
            var selection = prompt("Please choose Rock, Paper, or Scissors")
            return selection;
        }

        function printResult (playerSelection, computerSelection, result){
            console.log("Player: " + playerSelection + " Computer: " + computerSelection + " Result: " + result)
        }

        function playRound(playerSelection, computerSelection){
            playerSelection = playerSelection.toLowerCase()
            computerSelection = computerSelection.toLowerCase()
            var result = ""

            if (playerSelection == computerSelection){
                result = "Tie Game" 
            }
            else if (playerSelection == 'rock' && computerSelection == 'scissors'){
                result = "You Win!"
            }
            else if (playerSelection == 'rock' && computerSelection == 'paper'){
                result = "You Lose!"
            }
            else if (playerSelection == 'paper' && computerSelection == 'scissors'){
                result = "You Lose!"
            }
            else if (playerSelection == 'paper' && computerSelection == 'rock'){
                result = "You Win!"
            }
            else if (playerSelection == 'scissors' && computerSelection == 'paper'){
                result = "You Win!"
            }
            else if (playerSelection == 'scissors' && computerSelection == 'rock'){
                result = "You Lose!"
            }
            printResult(playerSelection,computerSelection,result)
            return result
        }

        function game(){
            gamesWon = 0
            for (let i = 1; i < 6; i++) {
                var player = playerSelection()
                var computer = computerPlay()
                result = playRound(player,computer)
                if (result == "You Win!"){
                    gamesWon++
                }
                console.log("Games Won: " + gamesWon + " Total Games Played: " + i)
            }
        }
        game()
    </script>
</html>
