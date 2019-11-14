<script>
    const MOVE = ["rock", "paper", "scissors"]
function computerPlay() {
    // random a index from 0 to 2
    let randomIndex = Math.floor(Math.random()*3)
    return MOVE[randomIndex]
}

function playGround(playerSelection, computerSelection) {
    playerSelection = playerSelection.toLowerCase()
    switch (playerSelection) {
        case MOVE[0]:
            if (computerSelection === MOVE[0]) {
                return "Even"
            } else if (computerSelection === MOVE[2]) {
                return "You win " + MOVE[0] + " beats " + MOVE[2]
            } else {
                return "You lose " + MOVE[1] + " beats " + MOVE[0] 
            }

        case MOVE[1]:
            if (computerSelection === MOVE[1]) {
                return "Even"
            } else if (computerSelection === MOVE[0]) {
                return "You win " + MOVE[1] + " beats " + MOVE[0]
            } else {
                return "You lose " + MOVE[2] + " beats " + MOVE[1] 
            }

        case MOVE[2]:
            if (computerSelection === MOVE[2]) {
                return "Even"
            } else if (computerSelection === MOVE[1]) {
                return "You win " + MOVE[2] + " beats " + MOVE[1]
            } else {
                return "You lose " + MOVE[0] + " beats " + MOVE[2] 
            }
    }
}

function game(n) {
    let score = {
        "player" : 0,
        "computer" : 0
    }

    for (let i = 0; i < n; i++) {
        let computerSelection = computerPlay()
        let playerSelection = prompt("Enter your move:")
        let result = playGround(playerSelection, computerSelection)
        if (result.indexOf("win") > 0) {
            score.player += 1
        } else if (result.indexOf("lose") > 0) {
            score.computer += 1
        }
        console.log(result)
    } 
    if (score.player > score.computer) {
        console.log("Player win")
    } else if (score.player < score.computer) {
        console.log("Computer win")
    } else {
        console.log("Even bro")
    }
}
</script>