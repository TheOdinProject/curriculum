<!DOCTYPE html> 
<html>
<head>
    <meta charset="utf-8">
    <title>Rock paper scissors!</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>    
    
    <p id="instructions">Type rock, paper, or scissors</p>
    <input type="text" id="userInput">
    <button type="submit">shoot</button>
    <p id="p1"></p>
    <p id="p2"></p> <!--Needed to make 2nd para2 for 2nd para2 pf text, otherwise wouldve replaced 1st paragraph -->

<script> // MAKE: enter button mess w/, & case sensitive strings
        var input = document.querySelector("#userInput");
        var para1 = document.querySelector("#p1");
        var para2 = document.querySelector("#p2")
        var button = document.querySelector("button")

    //WESLEY: console says Uncaught TypeError: Cannot read property 'addEventListener' of null. I just want to be able to submit #userInput on enter!
    // document.getElementById("#userInput")
    // .addEventListener("keyup", function(event) {
    //     event.preventDefault();
    //     if(event.keyCode == 13) {
    //         document.getElementById("#userInput").click();
    //     }
    // });

function compSelect() {
    var computerChoice = ["rock", "paper", "scissors"];
    var computerPlay = computerChoice[Math.floor(Math.random() * computerChoice.length)];
    return computerPlay;
}//computer randomly selects rock,paper,scissors

function playerWins(player, comp) {
    return (comp === "rock" && player === "paper") 
        || (comp === "paper" && player === "scissors") 
        || (comp === "scissors" && player === "rock")
}

function compWins(player, comp) {
    return (comp ==="rock" && player === "scissors") 
        || (comp === "scissors" && player === "rock") 
        || (comp === "paper" && player === "rock")
}

//tells us who wins
button.onclick = function () {
    var userInput = input.value;
    var compSelection = compSelect();
   para1.textContent = "Computer chose " + compSelection + ".";
    if (compSelection === userInput) {
        para2.textContent = "It's a draw!";
    } else if (playerWins(userInput, compSelection)) {
        para2.textContent = "You win!"
    } else if (compWins(userInput, compSelection)) {
        para2.textContent = "Computer wins!"
    } else {
        para2.textContent = "Fail"
    }
}
</script>
</body>
</html>
