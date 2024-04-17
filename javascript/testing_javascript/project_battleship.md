### Introduction

It's time to really flex your muscles. Test Driven Development (TDD) can certainly feel uncomfortable at first, but becomes more natural with practice. We're going to implement the classic game 'Battleship'. If you've never played it, or need a refresher, you can read about [Battleship's rules](https://en.wikipedia.org/wiki/Battleship_(game)) and you can [play an online version of Battleship](http://en.battleship-game.org/).

Since we're doing TDD, it's important that you don't get overwhelmed. Take it one step at a time. Write a test, then make it pass.

We have not yet discussed testing the appearance of a webpage, which requires a separate set of tools and is outside the scope of this unit. Therefore, you should not test the DOM for this assignment. Instead, do your best to isolate every bit of application functionality from the actual DOM manipulation bits.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Begin your app by creating the `Ship` class/factory (your choice).
   1. Your 'ships' will be objects that include their length, the number of times they've been hit and whether or not they've been sunk.
   1. **REMEMBER** you only have to test your object's public interface. Only methods or properties that are used outside of your 'ship' object need unit tests.
   1. Ships should have a `hit()` function that increases the number of 'hits' in your ship.
   1. `isSunk()` should be a function that calculates whether a ship is considered sunk based on its length and the number of hits it has received.
1. Create a `Gameboard` class/factory.
   1. Note that we have not yet created any User Interface. We should know our code is coming together by running the tests. You shouldn't be relying on `console.log` or DOM methods to make sure your code is doing what you expect it to.
   1. Gameboards should be able to place ships at specific coordinates by calling the ship factory or class.
   1. Gameboards should have a `receiveAttack` function that takes a pair of coordinates, determines whether or not the attack hit a ship and then sends the 'hit' function to the correct ship, or records the coordinates of the missed shot.
   1. Gameboards should keep track of missed attacks so they can display them properly.
   1. Gameboards should be able to report whether or not all of their ships have been sunk.
1. Create a `Player` class/factory.
    1. There will be two types of players in the game, 'real' players and 'computer' players.
    1. Each player object should contain it's own gameboard.
1. Import your classes/factories into another file, and drive the game using event listeners to interact with your objects. Create a module that helps you manage actions that should happen in the DOM.
    1. At this point it is appropriate to begin crafting your User Interface.
    1. Set up a new game by creating Players. For now just populate each player's Gameboard with predetermined coordinates. You are going to implement a system for allowing players to place their ships later.
    1. We’ll leave the HTML implementation up to you for now, but you should display both the player’s boards and render them using information from the Gameboard class/factory.
        - You'll need methods to render each player's Gameboard, so put them in an appropriate module.
    1. Your event listeners should step through the game turn by turn using only methods from other objects. If at any point you are tempted to write a new function, step back and figure out which class or module that function should belong to.
    1. For attacks, let the user click on a coordinate in the enemy Gameboard. Send the user input to methods on your objects, and re-render the boards to display the new information.
        - Players should take turns playing the game by attacking the enemy Gameboard. If you feel the need to keep track of the current player's turn, it's appropriate to manage that in this module, instead of another mentioned object.
        - The game is played against the computer, so make the ‘computer’ players capable of making random plays. The computer does not have to be smart, but it should know whether or not a given move is legal (i.e. it shouldn’t shoot the same coordinate twice).
    1. Create conditions so that the game ends once one player’s ships have all been sunk. This function is also appropriate for this module.
1. Finish it up by implementing a system that allows players to place their ships. For example, you can let them type coordinates for each ship or have a button to cycle through random placements.

#### Extra credit

Make your battleship project more impressive by introducing any of these modifications.

- Implement drag and drop to allow players to place their ships.
- Create a 2-player option that lets users take turns by passing the laptop back and forth, or by spinning the monitor around on a desktop. Implement a 'pass device' screen so that players don't see each other's boards!
- Polish the intelligence of the computer player by having it try adjacent slots after getting a 'hit'.

</div>
