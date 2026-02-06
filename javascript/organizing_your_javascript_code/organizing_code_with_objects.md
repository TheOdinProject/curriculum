### Introduction

In our JavaScript fundamentals course, you should have learned the [basics of using objects](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/fundamentals-part-5) to store and retrieve data. In this lesson, we'll start with a little refresher, then explore using objects in more detail. Folks on the Ruby track, you'll have a little more experience with some of these concepts already, but this lesson will still be good to go through as JavaScript is a little more flexible with its use of objects.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Using objects to organize data.
- Using objects to organize functionality.
- Object methods and the `this` keyword.

### Refresher

There are multiple ways to define objects in JavaScript, but in many cases **object literal** syntax is used as follows:

```javascript
const myObject = {
  property: "Value!",
  otherProperty: 77,
  "obnoxious property": function() {
    // do stuff!
  },
};
```

There are also 2 ways to get information out of an object: dot notation and bracket notation.

```javascript
// dot notation
console.log(myObject.property); // "Value!"

// bracket notation
console.log(myObject["obnoxious property"]); // [Function]
```

Which method you use will depend on context. Dot notation is cleaner and is usually preferred, but there are plenty of circumstances when it is not possible to use it. For example, `myObject."obnoxious property"` won't work because that property is a string with a space in it. Likewise, you cannot use variables in dot notation:

```javascript
const variable = "property";

// "undefined" because it's looking for a property named "variable" in our object
console.log(myObject.variable);

// this is equivalent to myObject["property"] and returns "Value!"
console.log(myObject[variable]);
```

### Objects as a data structure

You've already been introduced to the basic use of a JavaScript object - storing related information with key/value pairs. This is one of the simplest ways you can begin to organize your code! Take these examples from a 'tic tac toe' game - first without objects:

```javascript
// without objects
const playerOneName = "tim";
const playerTwoName = "jenn";
const playerOneMarker = "X";
const playerTwoMarker = "O";
```

Now using objects:

```javascript
// with objects
const playerOne = {
  name: "tim",
  marker: "X",
};

const playerTwo = {
  name: "jenn",
  marker: "O",
};
```

At first glance, the first doesn't seem so bad... but the benefits of the second approach are huge! Grouping related data together into objects allows you to pass the data around easily. For example:

```javascript
function gameOver(winningPlayer) {
  console.log("Congratulations!");
  console.log(`${winningPlayer.name} (${winningPlayer.marker}) is the winner!`);
}
```

Instead of having to have separate parameters for the name and the marker, we have just the one for the entire object and now we have access to all the properties within. If we end up adding more properties to the player objects and needing them in the `gameOver` function, again, we have access to that already since we passed the whole object in, rather than into individual parameters.

But what if we aren't making a simple 2-player game? Something more complicated such as an online shopping site with a large inventory? Using objects to group together each particular item's name, price, description and other things is the only way to go. You will continue to use and see objects used in this way throughout the curriculum.

### Objects as a design pattern

The grouping power of objects isn't just useful for organizing data, it's useful for organizing *functionality* as well! Using objects for this purpose is one of the core tenants of Object Oriented Programming (OOP), which is a programming paradigm based on the concept of "objects", which can contain data and code: data in the form of fields (often known as attributes or properties), and code in the form of procedures (often known as methods). In OOP, computer programs are designed by making them out of objects that interact with one another.

This means we're not limited to storing data in objects, we can store logic as well via **methods** (which are just functions that are part of an object), then use those methods to interact with the data.

Nearly *anything* you can think about can be described as an object. To do so, all you have to do is ask yourself is "What properties (physical or conceptual) does my thing have?", and "How can I interact with it?". The properties or attributes of a *thing* are expressed as properties, and the ways you can interact with that thing are expressed as methods.

Let's take an example of some *thing* - we'll choose a lightbulb. A lightbulb can have a color, and it can be in either an "on" state, or an "off" state. These might be expressed as properties of a lightbulb object:

```javascript
const lightbulb = {
  color: "cool white", // this lightbulb is white
  isLit: false, // and is currently "off"
};
```

You may want to have the ability to switch a lightbulb from its unlit state to its lit state, or vice-versa. To do that, you might add a method.

<span id="this-keyword"></span>The easiest way to get started creating methods to interact with your objects might be combining object literal syntax with JavaScript's `this` keyword. The `this` keyword is used to refer to the object a particular method is called from.

```javascript
const lightbulb = {
  color: "cool white",
  isLit: false,

  // a method is simply a function assigned to a property
  switchOn: function() {
    this.isLit = true;
  },
  // shorthand for adding a method to an object literal
  switchOff() {
    this.isLit = false;
  },
};

lightbulb.switchOn();
console.log(lightbulb.isLit); // true - we switched it on
```

<div class="lesson-note lesson-note--warning" markdown="1">

#### Arrow functions and "this"

The `this` keyword behaves differently inside arrow functions compared to traditional function expressions (which includes the shorthand syntax). We don't need to dive into how or why it differs yet, just know that if you used arrow functions in the above example, they would not behave as you expect.

</div>

These methods use the `this` keyword to refer to the object they get called from (`lightbulb`). The `this` keyword can be used to read and assign properties of an object in exactly the same way you would for any other variable that points to an object.

#### Objects for more abstract concepts

Moving past physical items, we could also try to describe something a little bit more abstract like a game as an object. Since we've already explored Rock Paper Scissors in Foundations, let's use that as an example.

A rock paper scissors game might involve a couple of basic things:

- Players' scores
- The ability to play a round (and playing a round should update a player's score)

And might also include a couple nice-to-haves:

- The ability to determine the current winning player
- The ability to restart the game

So, at its most basic, an object that represents the game might look something like this (assuming we're playing against a computer player):

```javascript
const rps = {
  playerScore: 0,
  computerScore: 0,
  playRound(playerChoice) {
    // code to play the round, update score if needed, then return the result
  },
};
```

And if we fleshed it out, our object may come out to look something like this:

```javascript
const rps = {
  playerScore: 0,
  computerScore: 0,
  playRound(playerChoice) {
    // code to play the round, update score if needed, then return the result
  },
  getWinningPlayer() {
    // return the player with the most points ("player", "computer", or "tie")
  },
  reset() {
    // reset both players' scores to 0
  },
};
```

Let's play a bit and see who's in the lead!

```javascript
rps.playRound("rock"); // returns "player" because we're awesome at RPS
console.log(rps.playerScore); // 1 - we won and so our score increased

rps.playRound("rock"); // returns "computer" because... luck...
console.log(rps.computerScore); // 1

rps.playRound("scissors"); // returns "player" because we're awesome at RPS (again)
console.log(rps.playerScore); // 2
console.log(rps.getWinningPlayer()); // "player" since we're 2-1 up
```

We've had enough fun for a day so let's reset everything for the next person.

```javascript
rps.reset();
console.log(rps.playerScore); // 0
console.log(rps.computerScore); // 0
```

<div class="lesson-note" markdown="1">

#### Underscore properties

Out in the wild, you may see code with object properties that start with `_` e.g. `_someProperty`. This is purely a developer convention that indicates the property is intended to be "private". A private property is one that's only meant for internal use and not meant to be read or called outside of the object itself (such as helper methods).

JavaScript does not actually have the concept of real private properties for objects, at least not for object literals. Developers historically would add a leading `_` to indicate a property should be treated as if it was private, even if technically they'd still be accessible outside of the object internals ("public"). There are ways to implement actual privacy (which would actually prevent accessing something outside of the object itself) but they involve more advanced things and will be covered in later lessons.

</div>

### Objects as machines

Sometimes, you may want to create objects that embody complex concepts rather actual, physical items - similar to the RPS game above. Objects can be used to represent almost anything you can think of, and it's impossible to give a comprehensive list of examples. However, a few examples might be:

- An object that manages other objects, such as an "inventory" object that contains a list of items, and actions that can be done with those items.
- An object that can listen for events that happen, and respond appropriately (think of `.addEventListener` on DOM elements)
- A "Debt" object that keeps track of a debt owed, how much has been paid, and how much of the debt is remaining.

You may have trouble figuring out what public interface of these objects might contain at first. These sorts of things come with experience, and concepts taught in later lessons can help as well. One way you might conceptualize these objects, though, might be to imagine them as little 'machines' you're making out of code.

The properties of the machine could be thought of displays that might show information such as:

- A list of the items you've collected, the total amount of items you can carry, and how much you're currently carrying
- A list of functions that are listening for an event
- The person who owes a particular debt, and the original amount owed.

The methods of your machine might be akin to buttons and such that make the machinde *do* a specific thing, such as:

- Remove an item you own from a list, add a new item, upgrade an item, craft a new item
- Fire all the functions that are listening to a 'click' event, or add a new function to listen to the 'click' event
- Pay an amount of money towards a debt, and determine how much more money is owed on a debt

Again, objects can be used to represent almost anything you can think of, the limit is your imagination!

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Check out [DevSage's video explanation of the `this` keyword](https://www.youtube.com/watch?v=cwChC4BQF0Q) that gives a different perspective on how its context changes, as well as scenarios in which `this` behaves unexpectedly. Don't worry too much about the part on constructor functions at the end, as they will be covered in another lesson.

1. Try modelling the behavior of a piggy bank as an object:
   1. You should be able to interact with the object via a method that allows you to deposit coins.
      - For now, use a string to represent the name of a coin. Ex. `piggyBank.deposit('penny')`
      - You should keep the coin around by storing it in some kind of list.
   1. The object should also have a property or method that tells you how much money you have saved as a number.
      - For simplicity, using only the smallest subunit of a given currency is acceptable.
      - Ex: If there are 5 US quarters in the piggy bank, then the number `125` for '125 cents' is acceptable.
   1. You should be able to read the list of all coins that are currently in the piggy bank.
   1. Add a method to the piggy bank object to remove a specific type of coin from the piggy bank if it's available.
      - Ensure you can still get the correct savings after removing coins!
   1. Lastly, create a way to remove all the money from the jar and start fresh.

1. Try to model something else as an object! Try to keep it simple, but have fun with it!

#### Extra credit

1. You may have exposed the list that the piggy bank uses to track coins as a public property. Depending on how you implemented the piggy bank, modifying this list without using something like a `deposit` or `withdraw` method on the object could throw some of it's properties out of wack, like the one that tells you the amount of savings you've accrued.

   Additionally, adding an unexpected value to this list by modifying it directly could cause errors within your piggy bank methods. Let's try to ensure that doesn't happen!
   - Indicate that the list of coins the piggy bank uses is a **private property** of the object.
   - Create a **public method** that gives the user a *copy* of the list that they can manipulate to their hearts content without breaking the piggy bank object.

1. Try creating a couple 'coin' objects to deposit into the piggy bank instead of using a string.
   - A coin object might contain properties like the name of the coin, and it's value (preferably in the same unit the piggy bank measures it's savings).
   - Make sure that your piggy bank object is still able to keep track of savings and remove coins correctly after this change!
   - After making this change, consider how you are calculating savings for the piggy bank compared to before. Do you prefer working with the objects or the strings more?
   - Consider how the piggy bank might check for a correct string vs checking for an object with the correct properties when depositing. Which seems easier? Does one seem more flexible than the other?

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are two ways you can use objects to organize code?](#objects-as-a-data-structure)
- [What is a method?](#objects-as-a-design-pattern)
- [What is the `this` keyword used for?](#this-keyword)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [JavaScript Tutorial's article on the `this` keyword](https://www.javascripttutorial.net/javascript-this/) covers how `this` changes in various situations.
