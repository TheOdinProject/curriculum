let player_wins = 0;
let computer_wins = 0;
var player_name=prompt('What is Your Name?')

function set_name(player_name){
    if(player_name == false || player_name == null){
        document.getElementById('player_name').textContent = 'Player';
    }else{
        document.getElementById('player_name').textContent = player_name;
    }
}
set_name(player_name);



function get_random(){
    return Math.floor(Math.random()*3);
}

function computer_play(){
    let options = ['rock','paper','scissors']
    return options[get_random()]
}

function winner(player_wins,computer_wins){
    if(player_wins == 5 || computer_wins ==5){
        if(player_wins >computer_wins){
            winner_result.textContent='You Won :) '
        }else{
            winner_result.textContent='You Lose :('
        }
    }
}

function play_round(player_choice){

    if(player_wins == 5 || computer_wins == 5){
        alert('Game Over')
        reset();
    }else{    
        let computer_choice = computer_play()

        if(player_choice == computer_choice){
            round_result.textContent = 'Tie,Try Again'
        }else if(player_choice == 'rock'){
            if (computer_choice =='paper'){
                computer_wins++;
                round_result.textContent = 'Paper beats Rock :('
            }else{
                player_wins++;
                round_result.textContent = 'Rock beats Scissors :)'
            }
        }else if(player_choice == 'paper'){
            if(computer_choice == 'rock'){
                player_wins++;
                round_result.textContent = 'Paper beats Rock :)'
            }else{
                computer_wins++;
                round_result.textContent = 'Scissors beats Paper :('
            }
        }else if(player_choice == 'scissors'){
            if(computer_choice == 'paper'){
                player_wins++;
                round_result.textContent = 'Scissors beats Paper :)'
            }else{
                computer_wins++;
                round_result.textContent = 'Rock beats Scissors:('
            }
        }
        document.getElementById('human').textContent = player_wins.toString();
        document.getElementById('computer').textContent = computer_wins.toString();
        winner(player_wins,computer_wins)
    }
}



function reset(){
    computer_wins =0;
    player_wins = 0;
    round_result.textContent=''
    winner_result.textContent = ''
    document.getElementById('computer').textContent=computer_wins.toString();
    document.getElementById('human').textContent = player_wins.toString();
}

const clicke = document.querySelectorAll('img')
clicke.forEach((choice) =>{
    choice.addEventListener('click',function(){play_round(choice.id)})
})

const round_result = document.querySelector('#round_result');
const winner_result = document.querySelector('#winner_result');
const reset_button = document.querySelector('button');
reset_button.addEventListener('click',reset)

