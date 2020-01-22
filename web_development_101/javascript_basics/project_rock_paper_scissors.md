<!DOCTYPE html>
<html>
<head>
    <title>ROCK PAPER SCISSORS</title>
</head>

<body>


<script>


var name=prompt("What is your name?");
var playerScore=0;
var computerScore=0;

function game(RockPaperScissors) {

var playerChoice =prompt((name) + ", do you choose ROCK, PAPER, or SCISSORS?").toUpperCase();
var computerChoice=computerPlay();


function computerPlay() {    
computerChoice = Math.random();
if (computerChoice <.34) {
computerChoice="ROCK";
} else if (computerChoice <=.67){
computerChoice="PAPER";
} else {
computerChoice="SCISSORS"
}
return computerChoice;
}


function RockPaperScissors (playerChoice, computerChoice) {

if (playerChoice == "ROCK" && computerChoice == "PAPER") {
computerScore++;
return "Paper covers Rock. Poor Rock is blind, and is of no use. Therefore, " + name + ", you and your Rock LOSE." ;
} 
else if (playerChoice == "ROCK" && computerChoice == "SCISSORS") {
playerScore++;
return "Rock has lived up to the hype, destroying the sharp edges of Scissor. Therefore, " + name + ", you and your Rock WIN! " ;
} 
else if (playerChoice == "PAPER" && computerChoice == "ROCK") {
playerScore++;
return "Paper has spread its wings and has blinded Rock, covering it completely. Therefore, " + name + ", you and your Paper WIN!" ;
}
else if (playerChoice == "PAPER" && computerChoice == "SCISSORS") {
computerScore++;
return "Scissors took one look at Paper and sliced him. Gruesome end for Paper. Therefore, " + name + ", you and your Paper LOSE.";
}
else if (playerChoice == "SCISSORS" && computerChoice == "ROCK") {
computerScore++;
return "Rock annihilates Scissors, leaving him dented and defeated. Therefore, " + name + ", you and your Scissors LOSE. ";
}
else if (playerChoice == "SCISSORS" && computerChoice == "PAPER") {
playerScore++;
return "Scissors slices Paper instantly. Brutal end for Paper. Therefore, " + name + ", you and your Scissors WIN!";
}
else {
return "The most dull end to a game. A tie. ZzzZzZzzZz" ;
}
}





//console.log("The player has selected: " + playerChoice);  
//console.log("The computer has selected: " + computerChoice);
console.log(RockPaperScissors(playerChoice, computerChoice));
console.log("PLAYER: " + playerScore + " " + "CPU: " + computerScore);

}    
    
game();
game(); 
game(); 
game(); 
game();     

function winner(playerScore, computerScore) {
if (playerScore > computerScore) {
return "Congrats, " + name + ", you win!" ;
}
else if (playerScore < computerScore) {
return "My apologies to you, " + name + ", but you have been defeated." ;
}
else {
return "Tie game. Yuck.";
}
}

console.log(winner (playerScore, computerScore));    

</script>




</body>



</html>
