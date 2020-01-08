let x;
let y;
let scorePlayer = 0;
let scoreComputer = 0;

function computerSelection(){
    y=Math.floor(Math.random()* 3)
    if (y == 3){
        y="rock"
        cpu.textContent = "Computer: Rock";
        return y;
    } else if (y == 2){
        y="scissors"
        cpu.textContent = "Computer: Scissors";
        return y;
    } else{
        y = "paper"
        cpu.textContent = "Computer: Paper";
        return y;
    }
}
function game(){
    y=computerSelection();
    logicofgame();
    scoreShow.textContent="You: " + scorePlayer + ":" +  scoreComputer + " CPU";
    x=0;
}
function logicofgame(){
    if( x === y ){
        round.textContent = "Draw"
        scoreComputer += .5;
        scorePlayer += .5;
    } else if ((x==="rock" && y === "scissors")||(x === "scissors" && y === "paper")||(x === "paper" && y === "rock")){
        round.textContent = "You win this round"
        scorePlayer++;
    }else if ((y==="rock" && x === "scissors")||(y === "scissors" && x === "paper")||(y === "paper" && x === "rock")){
        round.textContent = "You lose this round"
        scoreComputer++;
    }
}
const score = document.querySelector(".score");

const scoreShow = document.createElement('h3');
const cpu = document.createElement('h4');
const round = document.createElement('h4');
scoreShow.classList.add("score");
cpu.classList.add("score");
round.classList.add("score");
score.appendChild(scoreShow);
score.appendChild(cpu);
score.appendChild(round);




const rock = document.querySelector("#rock");
rock.addEventListener('click',()=>{
    x="rock";
    game();
}) 
const paper = document.querySelector("#paper");
paper.addEventListener('click',()=>{
    x="paper";
    game();
}) 
const scissors = document.querySelector("#scissors");
scissors.addEventListener('click',()=>{
    x="scissors";
    game();
}) 

const btn = document.querySelector('#btn');
btn.onclick = () => alert(x);
rock.appendChild(secondDiv);