<!DOCTYPE html>
<html>
    <head>
        <title>
            Rock Paper Scissors
        </title>
        <meta charset="UTF-8"/>
    </head>
    <body>
        <script>
            // generate a random integer within the given range
            function randomInt(min, max)
            {
                return Math.round(Math.random() * (max - min) + min);
            }
            // generate a random computer selected move
            function computerPlay()
            {
                let randInt = randomInt(1, 3); // generate a random integer between 1 and 3
                switch (randInt)
                {
                    case 1: return "rock"; break;
                    case 2: return "paper"; break;
                    case 3: return "scissors"; break;
                }
            }
            // play a round
            function playRound(playerSelection, computerSelection, scores)
            {
                playerSelection = playerSelection.toLowerCase();
                let msg = "TBD";
                switch (playerSelection)
                {
                    case "rock": // when the player chooses rock
                    {
                        switch (computerSelection)
                        {
                            case "rock":
                            {
                                msg = "It's a tie!";
                                break;
                            }
                            case "paper":
                            {
                                scores[1]++;
                                msg = "You lose! Paper beats rock";
                                break;
                            }
                            case "scissors":
                            {
                                scores[0]++;
                                msg = "You win! Rock beats scissors";
                                break;
                            }
                        }
                        break;
                    }
                    case "paper": // when the player chooses paper
                    {
                        switch (computerSelection)
                        {
                            case "rock":
                            {
                                scores[0]++; 
                                msg = "You win! Paper beats rock";
                                break;
                            }
                            case "paper":
                            {
                                msg = "It's a tie!";
                                break;
                            }
                            case "scissors":
                            {
                                scores[1]++;
                                msg = "You lose! Scissors beats paper";
                                break;
                            }
                        }
                        break;
                    }
                    case "scissors": // when the player chooses scissors
                    {
                        switch (computerSelection)
                        {
                            case "rock": 
                            {
                                scores[1]++;
                                msg = "You lose! Rock beats scissors";
                                break;
                            }
                            case "paper":
                            {
                                scores[0]++;
                                msg = "You win! Scissors beats paper";
                                break;
                            }
                            case "scissors":
                            {
                                msg = "It's a tie!";
                                break;
                            }
                        }
                        break;
                    }
                }
                console.log(msg)
            }
            // play a game
            function game()
            {
                let scores = [0, 0]; // [playerScore, compScore]
                var computerMove;
                for (i=0; i<5; i++)
                {
                    let playerMove = prompt("Rock, paper, or scissors?")
                    computerMove = computerPlay();
                    playRound(playerMove, computerMove, scores);
                }
                if (scores[0] > scores[1])
                    return "Congratulations, you won!"
                else if (scores[0] < scores[1])
                    return "Sorry, you lost!"
                else
                    return "It's a draw, since we played 5 rounds including ties!"
            }
        </script>
    </body>
</html>
