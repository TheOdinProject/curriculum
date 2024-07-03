### Introduction

In our JavaScript fundamentals course, you should have learned the [basics of using objects](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/fundamentals-part-5) to store and retrieve data. Let's start with a little refresher.

There are multiple ways to define objects, but in many cases **object literal** syntax is used as follows:

```javascript
const myObject = {
  property: 'Value!',
  otherProperty: 77,
  "obnoxious property": function() {
    // do stuff!
  }
};
```

There are also 2 ways to get information out of an object: dot notation and bracket notation.

```javascript
// dot notation
myObject.property; // 'Value!'

// bracket notation
myObject["obnoxious property"]; // [Function]
```

Which method you use will depend on context. Dot notation is cleaner and is usually preferred, but there are plenty of circumstances when it is not possible to use it. For example, `myObject."obnoxious property"` won't work because that property is a string with a space in it. Likewise, you cannot use variables in dot notation:

```javascript
const variable = 'property';

myObject.variable; // this gives us 'undefined' because it's looking for a property named 'variable' in our object

myObject[variable]; // this is equivalent to myObject['property'] and returns 'Value!'
```

If you are feeling rusty on using objects, now might be a good time to go back and review the content in our [object basics lesson](https://www.theodinproject.com/lessons/foundations-object-basics) from our JavaScript Basics course.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Using objects to organize data.
- Using objects to organize functionality.
- Object methods and the `this` keyword
- Public and private interfaces

### Objects as a data structure

You've already been introduced to the basic use of a JavaScript object- storing related information with key/value pairs. This is one of the simplest ways you can begin to organize your code! Take these examples from a 'tic tac toe' game:

```javascript
// example one
const playerOneName = "tim";
const playerTwoName = "jenn";
const playerOneMarker = "X";
const playerTwoMarker = "O";

// example two
const playerOne = {
  name: "tim",
  marker: "X"
};

const playerTwo = {
  name: "jenn",
  marker: "O"
};
```

At first glance, the first doesn't seem so bad.. and it actually takes fewer lines to write than the example using objects, but the benefits of the second approach are huge! Grouping related data together into objects allows you to pass the data around easily. Let me demonstrate:

```javascript
function printName(player) {
  console.log(player.name);
}
```

This is something that you just could NOT do with the example one setup. Instead, every time you wanted to print a specific player's name, you would have to remember the correct variable name and then manually console.log it:

```javascript
console.log(playerOneName);
console.log(playerTwoName);
```

Again, this isn't *that* bad... but what if you *don't know* which player's name you want to print?

```javascript
function gameOver(winningPlayer){
  console.log("Congratulations!");
  console.log(winningPlayer.name + " is the winner!");
}
```

Or, what if we aren't making a 2 player game, but something more complicated such as an online shopping site with a large inventory? In that case, using objects to keep track of each particular item's name, price, description and other things is the only way to go. You will continue to use and see objects used in this way throughout the curriculum.

### Objects as a design pattern

The grouping power of objects isn't just useful for organizing data- it's useful for organizing *functionality* as well! Using objects for this purpose is one of the core tenants of Object Oriented Programming (OOP).

The inroductory paragraph for Object Oriented Programming on Wikipedia says this:

> Object-oriented programming (OOP) is a programming paradigm based on the concept of objects, which can contain data and code: data in the form of fields (often known as attributes or properties), and code in the form of procedures (often known as methods). In OOP, computer programs are designed by making them out of objects that interact with one another.

Essentially, what this means is that code can be organized into objects that contain not only data, but also **methods** (or functions on an object) that interact with that data.

Nearly *anything* you can think about can be described as an object. To do so, all you have to do is ask yourself is "What properties (physical or conceptual) does my thing have?", and "How can I interact with it?". The properties or attributes of a *thing* are expressed as properties, and the ways you can interact with that thing are expressed as methods.

Let's take an example of some thing- we'll choose a lightbulb. A lightbulb can have a color, and it can be in either an 'on' state, or an 'off' state. These might be expressed as properties of a lightbulb object:

```javascript
const lightbulb = {
  lightColor: 'fluorescent white',  // this lightbulb is white,
  lit: false                        // and is currently 'off'
}
```

You may want to have the ability to switch a lightbulb from it's unlit state to it's lit state, or vice-versa. To do that, you might add a *method*.

The easiest way to get started creating methods to interact with your objects might be combining Object Literal syntax with JavaScript's `this` keyword. The `this` keyword is used to refer to the object a particular method is called from.

The following is an example of using the `this` keyword to add two methods to our object, `switchOn`, and `switchOff`:

```javascript
const lightbulb = {
  lightColor: 'fluorescent white',
  lit: false,

  // shorthand syntax for adding methods to objects
  switchOn() {
    this.lit = true
  },
  switchOff() {
    this.lit = false
  }
}

lightbulb.switchOn() 
lightbulb.lit // true - we switched it on
```

These methods use the `this` keyword to refer to the object they get called from (`lightbulb`). The `this` keyword can be used to access and modify properties of an object in exactly the same way you would for any other variable that points to an object.

Feel free to copy this code in the console and experiment with it! If you're inclined, perhaps you could create a method to change the color of the light, as if it's one of those fancy RGB LEDs those gamer nerds and keyboard enthusiasts seem to like so much.

Moving past physical objects, we could also try to describe something like a game as an object. Since we've already explored Rock Paper Scissors in Foundations, let's use that as an example.

A rock paper scissors game might involve a couple basic things:

- Players' scores
- The ability to play a round (and playing a round should update a player's score)

And might also include a couple nice-to-haves

- The ability to determine the current winning player
- The ability to restart the game

So, at it's most basic, an object that represents the game might look something like this (assuming we're playing against a computer player):

```javascript
const rps = {
  playerScore: 0,
  computerScore: 0,
  playRound(playerChoice) {
    // code to play the round... (and update the scores when a player wins)
  }
}
```

And if we fleshed it out, our object may come out to look something like this:

```javascript
const rps = {
  playerScore: 0,
  computerScore: 0,
  playRound(playerChoice) {
    const options = ['rock', 'paper', 'scissors']

    // if an invalid choice is chosen, throw an error
    if(!options.includes(playerChoice.toLowerCase())) {
      throw new Error(`Expected 'rock', 'paper', or 'scissors', but got ${playerChoice}`)
    }
    
    // get the computer's choice
    const computerChoice = options[Math.floor(Math.random() * 3)]


    // determine the winner, apply points if necessary, and return who won
    if(playerChoice.toLowerCase() === computerChoice) {
      return "tie"
    } else if(
      (playerChoice === 'rock' && computerChoice === 'scissors') ||
      (playerChoice === 'paper' && computerChoice === 'rock') ||
      (playerChoice === 'scissors' && computerChoice === 'paper')
    ) {
      this.playerScore++
      return "player"
    } else {
      this.computerScore++
      return 'computer'
    }
  },
  getWinningPlayer() {
    if(this.playerScore === this.computerScore) {
      return 'tie'
    } else if (this.playerScore > this.computerScore) {
      return 'player'
    } else {
      return 'computer'
    }
  },
  reset() {
    this.playerScore = 0;
    this.computerScore = 0;
  }
}

rps.playRound('rock') // returns 'player' if we win...
rps.playerScore       // ...and our score would have increased

// We also have the ability to check the winner and reset the game at any time
rps.getWinningPlayer() // 'player', if we won above round
rps.reset()
```

You may be looking at this code and thinking that you personally prefer to split your code between more functions than you see here, but also recognize that those functions may not really be a useful interaction point for anyone using your object.

But, there is no rule saying that you can't add those functions to your object as well! A common convention is to prefix methods and properties that you don't intend other people to use with an underscore (`_`). This convention conveys to others that "These things are meant to be used internally by this object, please interact with the other available methods and properties on this object's interface instead".

Let's see what that looks like!

```javascript
const rps = {
  _options: ['rock', 'paper', 'scissors'],
  _getRandomChoice() {
    const randomIndex = Math.floor(Math.random() * 3)
    return this._options[randomIndex]
  },
  _isTie(playerChoice, computerChoice) {return playerChoice === computerChoice},
  _isPlayerWinner(playerChoice, computerChoice) {
    if(
      (playerChoice === 'rock' && computerChoice === 'scissors') ||
      (playerChoice === 'paper' && computerChoice === 'rock') ||
      (playerChoice === 'scissors' && computerChoice === 'paper')
    ) {
      return true
    } else {
      return false
    }
  },
  playerScore: 0,
  computerScore: 0,
  playRound(playerChoice) {
    // if an invalid choice is chosen, throw an error
    if(!this._options.includes(playerChoice)) {
      throw new Error(`Expected 'rock', 'paper', or 'scissors', but got ${playerChoice}`)
    }
    
    // get the computer's choice
    const computerChoice = this._getRandomChoice()

    // determine the winner, apply points if necessary, and return who won
    if(this._isTie(playerChoice, computerChoice)) {
      return "tie"
    } else if(this._isPlayerWinner(playerChoice, computerChoice)) {
      this.playerScore++
      return "player"
    } else {
      this.computerScore++
      return 'computer'
    }
  },
  getWinningPlayer() {
    if(this.playerScore === this.computerScore) {
      return 'tie'
    } else if (this.playerScore > this.computerScore) {
      return 'player'
    } else {
      return 'computer'
    }
  },
  reset() {
    this.playerScore = 0;
    this.computerScore = 0;
  }
}
```

Another name for these might also be **private properties**/**private methods**, and even though object literal syntax doesn't provide a way to truly prevent people from using them, you will later learn about other methods of creating objects that *can*.

Private properties/methods aren't strictly required, but they can help make the intended use of the object more understandable, and when used thoughtfully, even protect certain properties (like the player's scores) from being modified in ways that you may not have intended. Back off, cheaters!

The methods and properties you *do* intend for others to use on your objects might be considered your object's **public interface**. Having a good, well thought out interface on your objects is important- not only because it makes your object pleasant to use by you and others, but also to keep objects flexible and extensible in the future.

This idea of grouping related functionality within an object is *extremely powerful*, and can often result in more organized, understandable code.

Furthermore, with the various object creation methods you'll learn throughout this section of the curriculum, you'll be able to easily duplicate and reuse objects like these! Imagine you have a website where users can create and play *multiple* rock-paper-scissor games at once. Managing the data and interacting with each of those games would be no sweat with objects!

<div class="lesson-note lesson-note--tip" markdown="1">

#### Objects As Machines
  
When you want to organize some data and functionality together in this way, but you're having trouble figuring out what kinds of properties and methods an object might contain when it's not an actual, physical item, another way you might conceptualize this idea might be to imagine the object as a little 'machine' you're making out of code that does something useful.

The properties of the machine could be thought of displays that might show information it's collected or been given to it so far, if it can currently be interacted with, what the machine has counted for a player's score... or about a billion other things, depending on what your object does.

The methods of your machine might be akin to buttons and such that make the machinde *do* a specific thing. A method might give your object new information to store in some way, turn your machine from on 'on' to 'off', allow you to input information to play a game, or switch between the turns of two different players.

Again, objects can be used to represent almost anything you can think of, the limit is your imagination! It's impossible for us to give a comprehensive list of examples.

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Check out this [video explanation](https://www.youtube.com/watch?v=cwChC4BQF0Q) on the `this` keyword from DevSage that gives a different perspective on how its context changes, as well as scenarios in which `this` behaves unexpectedly. Don't worry too much about the part on constructor functions at the end, as they will be covered in another lesson.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are two ways you can use objects to organize code?](#objects-as-a-data-structure)
- [What is a 'method'?](#objects-as-a-design-pattern)
- [What is the `this` keyword used for?](#objects-as-a-design-pattern)
- [What methods should exist as part of an object's public interface?](#objects-as-a-design-pattern)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [The Principles of Object-Oriented JavaScript](https://www.amazon.com/Principles-Object-Oriented-JavaScript-Nicholas-Zakas/dp/1593275404) book by
Nicholas C. Zakas is really great to understand OOP in JavaScript, which explains concepts in-depth, which explores JavaScript's object-oriented nature, revealing the language's unique implementation of inheritance and other key characteristics, it's not free but it's very valuable.
- [JavaScript Tutorial's article on the `this` keyword](https://www.javascripttutorial.net/javascript-this/) covers how `this` changes in various situations.
