By this point you will have learned and had a chance to practice the most common object-creation and organization patterns in JavaScript.  But that is just the _tip_ of the iceberg. More important than learning the syntax for factory functions or modules is figuring out how to use them effectively.

This whole series of lessons has been about the "Object Oriented Programming" paradigm (OOP).  The basics of creating objects and classes are relatively straightforward. But it is not straightforward to decide what to put in each object, or when to make a new object, or when to let an object 'inherit' from another one.

Luckily there are several concepts and principles that can guide us into making good decisions when it comes to our objects.  This lesson is an introduction to the most important of those concepts.  Keep in mind that there is not usually a very clear answer to your application design questions.  Some patterns and ideas are obviously better than others, but there is often some trade-off when deciding where to put a specific function. In other words.. these principles are not _rules_- they're helpful guidelines.  

As you read these resources it might help to go back to some of the projects you've already done and think about how what you've written measures up to the examples you see.  And of course, as you move on keep these things in mind when crafting new projects

## Single Responsibility

One of the most important things to remember as you craft your objects is the __Single Responsibility Principle__ which states that a class (or object or module.. you get the point) should only have _one_ responsibility.  Here's a really common example, most of our code has functions to update and write things to the DOM in addition to our application logic.  It's a _really_ good idea to separate out your DOM stuff from the application logic.

So instead of this:

~~~javascript
function is_game_over() {
  
  // game over logic goes here!
  
  if (gameOver){
    const gameOverDiv = document.createElement('div')
    gameOverDiv.classList.add('game-over')
	gameOverDiv.textContent = `${this.winner} won the game!`
    document.body.appendChild(gameOverDiv)
  }
}
~~~

You should extract all the DOM manipulation into it's own module and use it like so:

~~~javascript
function is_game_over() {
  
  // game over logic goes here!
  
  if (gameOver){
    DOMStuff.gameOver(this.winner)
  }
}
~~~

In fact - the function `is_game_over` shouldn't be calling the DOM function anyway that should go elsewhere (directly in the game-loop)

> The Single Responsibility Principle is the first of a commonly found set of 5 design principles called the __SOLID__ principles.   Both of the following articles mention the acronym __SOLID__ before going on to talk about Single Responsibility.  Single Responsibility is definitely the most relevant of the 5.  Feel free to dig into the rest of the SOLID principles if you like.. but pay special attention to Single Responsibility.

1. Read [This Article](http://aspiringcraftsman.com/2011/12/08/solid-javascript-single-responsibility-principle/).
2. [This article](https://thefullstack.xyz/solid-javascript/) hits the same topic, and also covers the rest of 'SOLID' concisely.
3. ..and [one more](https://medium.com/@cramirez92/s-o-l-i-d-the-first-5-priciples-of-object-oriented-design-with-javascript-790f6ac9b9fa) for good measure



## Loosely Coupled Objects

Obviously all of our objects are intended to work together to form our final application.  You should take care, however, to make sure that your individual objects can stand alone as much as possible. __Tightly coupled__ objects are objects that rely so heavily on each other that removing or changing one will mean that you have to completely change another one - a real bummer.

This one is related pretty strongly to 'Single Responsibility' but takes a different angle.  As an example, if we were writing a game wanted to completely change how the User Interface worked, we should be able to do that without completely reworking the game logic.  So we should be able to start off writing our game using primarily `console.logs()` and then add in the a bunch of `DOM` functions later without touching the game logic.

1. [This article](https://www.innoarchitech.com/scalable-maintainable-javascript-coupling/) explains it pretty well.
2. The best book we've ever read on this subject is [Practical Object Oriented Design In Ruby](http://www.poodr.com/).  Unfortunately it is not free.. and not JavaScript.  We feel confident in recommending it anyway.  If you don't know Ruby, it is a clear enough language that you don't really need to learn it to follow the examples and the content in the book is sincerely fantastic.
