/*
		document.getElementById("srch").onclick = function (e) {
			window.location.href = "https://www.google.com";
		}

		document.getElementById('input').type = function (event) {
			window.location.href = "https://www.google.com";
		}

		*/
		const gameboard = document.querySelector("#gameboard");
		const tip = document.querySelector(".tipmsg");

		gameboard.addEventListener("mousedown", (e)=> {
			e.preventDefault();
			window.location.reload(true);
		});

		gameboard.addEventListener("mouseover", (e)=> {
			e.preventDefault();
			tip.style.display = "block";
		});



		// Computer Play

		const computerSlet = computerPlay();

		function computerPlay() {

			var choise = Math.random();
			if (choise < 0.34) {
				return 'rock';
			} else if ( choise <= 0.67) {
				return 'papper';
			} else {
				return "scissors";
			}

		}

		const playerSelection =  prompt( " Take a pick | rock, papper, and scissors !! ", playerSlet());


		function playerSlet(selection) {

		 if ( selection === "papper") {
				return "papper";
			} else if (selection === "scissors") {
				return "scissors";
			} else if (selection === "rock") {
				return "rock";
			}
		}

		function playRound(playerSelection,computerSlet) {
			if (playerSelection === computerSlet) {
				return "It's a tie";
			}
			if (playerSelection === "rock") {
				if (computerSlet === "scissors") {
					return "You Win";
				} else {
					return `You lose ! ${computerSlet} beats ${playerSelection} | Try Again !`;
				}
			}



			if (playerSelection === "scissors") {
				if (computerSlet === "papper") {
					return "You Win";
				} else {
					return `You lose ! ${computerSlet} beats ${playerSelection} | Try Again !`;
				}
			}



			if (playerSelection === "papper") {
				if (computerSlet === "rock") {
					return "You Win";
				} else {
					return `You lose ! ${computerSlet} beats ${playerSelection} | Try Again !`;
				}
			}


		}


		document.getElementById("txt").innerHTML = ("<p> <b> Player </b> " +  "<span>" + playerSelection + "</span>"  + " <br><hr> " + " <b> Computer </b> | "  +  computerSlet  + "</p><hr>");
		document.getElementById("results").innerHTML= playRound(playerSelection, computerSlet);



		/*

		// Player|Choise
		var playerChoice = prompt('Do you Choise rock, papper or scissors');

		if ( !playerChoice) {
			document.write('<p>Player 1, you cheated! Refresh this screen and fight like a man.</p>');

		} else {
			// Display your choise
			document.write("<p>Player 1:" + "" + playerChoice + "</p>");
		}

		var computerPlay = Math.random();
		if (computerPlay < 0.34) {
			computerPlay = "rock";
		} else if ( computerPlay <= 0.67) {
			computerPlay = "papper";
		} else {
			computerPlay = " scissors";
		}

		document.write("<p>Computer:" + " " + computerPlay +"</p>");

		var playRound = (choice1, choice2) => {
			if (choice1 === choice2) {
				return "It's a tie";
			}
			if (choice1 === "rock") {
				if(choice2 === "scissors") {
					return "You Win";
				} else {
					return "You lose! Try again"
				}
			}

			if(choice1 === "scissors") {
				if (choice2 === "papper") {
					return "You Win";
				} else {
					return "You lose! Try again";
				}
			}

			if (choice1 === "papper") {
				if (choice2 === "rock") {
					return "You Win";
				} else {
					return "You lose! Try again";
				}
			}


		}

		var results = playRound(playerChoice,computerPlay);

		document.write("<br><hr><br>" + results);

		*/
