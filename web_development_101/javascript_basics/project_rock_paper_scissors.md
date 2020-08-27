<!DOCTYPE html>
<html>
	<head>
	</head> 
  <body>
    <script>

			function computerPlay()
			{
				let computer_rng = Math.random(); 
				if (computer_rng < .3333)
				{
					return "Rock";
				}
				else if(computer_rng >= .3333 && computer_rng <.6667)
				{
					return "Paper";
				}
				else
				{
					return "Scissors";
				}
			}

			function getResult(playerSelection, computerSelection)
			{ 
			  let length_diff = playerSelection.length-computerSelection.length;

				if (length_diff==0)
				{
					console.log("This round is a tie!");
					return 0.5;
				}
				else if ((length_diff<0 && !(length_diff==-4)) || (length_diff==4))
				{
					console.log("You lose this round! " + computerSelection + " beats your " + playerSelection);
					return 0;
				}

				else
				{
					console.log("You win this round! Your "  + playerSelection + " beats " + computerSelection);
					return 1;
				}
			}

			function getPlayerSelection(error_message = "")
			{
				let playerInput = prompt(error_message + "Rock, Paper, or Scissors?");
				
				//Formatting the input string for simpler comparisons
				let playerSelection = playerInput[0].toUpperCase()+playerInput.substr(1,playerInput.length).toLowerCase();
				if(!(playerSelection=="Rock")&&!(playerSelection=="Paper")&&!(playerSelection=="Scissors"))
				{
					getPlayerSelection("Invalid input, please try again. ");
				}
				else
				{
				return playerSelection;
				}
				return playerSelection;
			}	
			
			function playRound()
			{
				let playerSelection = getPlayerSelection();
				let computerSelection = computerPlay();
				return getResult(playerSelection, computerSelection);
			}

			function game()
			{
				let score = 0;
				for(let i=1; i<6; i++)
				{
					score += playRound();
					console.log("Player: " + score.toString() + "\nComputer: " + (i-score).toString())
				}
				if(score > 5-score)
				{
					console.log("Player wins the game!"); 
				}
				else if (5-score > score)
				{
					console.log("Computer wins the game!");
				}
				else
				{
				console.log("It's a tie!");
				}
			}						
		


		</script>
	</body>
</html>
