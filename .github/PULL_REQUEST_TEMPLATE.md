This is a PR template. If you are adding a solution link to the curriculum, leave this as is. If not, delete it and write the message you wish.

Thank you,

The Odin Project team.

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Rock Paper Scissors</title>
  </head>
  <body>
    <script type="text/javascript">

      // 1. get computer choice
      const computerPlay = () => {
        const randomNum = Math.floor(Math.random()*3);
        switch (randomNum){
          case 0:
            return 'rock';
          case 1:
            return 'paper';
          case 2:
            return 'scissors';
        }
      }

      //2. get player choice
      const userPlay = () => {
        let userInput = prompt('Rock, paper, or scissors?');
        userInput = userInput.toLowerCase();
        if (userInput === 'rock' || userInput === 'paper' || userInput === 'scissors'){
          return userInput;
        } else {
          console.log('Error!  Please return a valid selection such as rock, paper or scissors.');
        }
      }

      //3. determine winner
      const determineWinner = (userChoice, computerChoice) => {
        if (userChoice === computerChoice) {
          return 'This game is a tie!';
        }

        if (userChoice === 'rock') {
          if (computerChoice === 'paper'){
            return 'Sorry, you lost!';
          } else {
            return 'You won!!! Congrats!'
          }
        }

        if (userChoice === 'paper'){
          if (computerChoice === 'scissors') {
            return 'Sorry, you lost';
          } else {
            return 'You won!  Congratulations!'
          }
        }

        if (userChoice === 'scissors'){
          if (computerChoice === 'rock') {
            return 'Sorry, you lost!'
          } else {
            return "You've won!  Congrats to you!";
          }
        }
      }

      //4. Play the game
      const game= () => {
        const userChoice = userPlay();
        const computerChoice = computerPlay();
        console.log(`You threw ${userChoice}`);
        console.log(`Computer threw ${computerChoice}`);
        console.log(determineWinner(userChoice, computerChoice));
      }

      game();
      game();
      game();
      game();
      game();


    </script>
  </body>
</html>

