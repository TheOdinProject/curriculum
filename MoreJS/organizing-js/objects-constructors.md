# Plain Old JavaScript Objects and Object Constructors

## A refresher

Back in the JavaScript fundamentals course you should have learned the basics of using objects to store and retrieve data. Lets start with a little refresher.

There are multiple ways to define objects but in almost _every_ case it is best to use the _object literal_ syntax as follows:

```javascript
const myObject = {
  property: 'Value!',
  otherProperty: 77,
  "obnoxious property": function() {
  		// do stuff!
	}
}
```

There are also 2 ways to get information out of an object: dot notation and bracket notation.

```javascript
// dot notation
myObject.property // 'Value!'

// bracket notation
myObject["obnoxious property"] // [Function]
```

Which method you use will depend on context.  Dot notation is cleaner and is usually preferred, but there are plenty of circumstances when it is not possible to use it. For example: `myObject."obnoxious property"` won't work because that property is a string with a space in it.  Likewise, you can not use variables in dot notation:

```javascript
const variable = 'property'

myObject.variable // this gives us 'undefined' because it's literally looking for a property named 'variable' in our object

myObject[variable] // 'Value!'
```

If you are feeling rusty on using objects, now might be a good time to go back and review the content in __Fundamentals 3__ from our JavaScript101 course.

## Objects as a Design Pattern

One of the simplest ways you can begin to organize your code is by simply grouping things into objects.  Take these examples from a 'tic tac toe' game:

```javascript
// example one
const playerOneName = "tim"
const playerTwoName = "jenn"
const playerOneMarker = "X"
const playerTwoMarker = "O"

// example two
const playerOne = {
  name: "tim",
  marker: "X"
}

const playerTwo = {
  name: "jenn",
  marker: "O"
}
```

At first glance the first doesn't seem so bad.. and it actually takes fewer lines to write than the example using objects, but the benefits are huge! Let me demonstrate:

```javascript
function printName(player) {
  console.log(player.name)
}
```

This is something that you just could NOT do with the example one setup.  Instead, every time you wanted to print a specific player's name you would have to remember the correct variable name and then manually `console.log` it:

```javascript
console.log(playerOneName)
console.log(playerTwoName)
```

Again, this isn't _that_ bad... but what if you _don't know_ which player's you want to print?

```javascript
function gameOver(winningPlayer){
  console.log("Congraulations!")
  console.log(winningPlayer.name + " is the winner!")
}
```

Or, what if we aren't making a 2 player game, but something much more complicated such as an online shopping site with a large inventory?  In that case I'm sure it's obvious that using objects to keep track of an item's name, price, description and other things is the way to go.

HOWEVER: To make that type of thing possible we're going to want a cleaner way to create our objects than simply typing every item into an object literal, which brings us to:

## Object Constructors

When you have a specific type of object that you are going to want to have multiples like our player or inventory items a better way to create them is using an object constructor, which is really just a function that looks like this:

```javascript
function Player(name, marker) {
  this.name = name
  this.marker = marker
}
```

and which you use by calling the function with the keyword `new`.

```javascript
const player = new Player('steve', 'X')
console.log(player.name) // 'steve'
```

Just like with objects created using the Object Literal method you can add functions to the object:

```javascript
function Player(name, marker) {
  this.name = name
  this.marker = marker
  this.sayName = function() {
    console.log(name)
  }
}

const player1 = new Player('steve', 'X')
const player2 = new Player('also steve', 'O')
player1.sayName() // logs 'steve'
player2.sayName() // logs 'also steve'
```



### Exercise

Write a prototype "Library" script for storing books.  Use an Object Constructor to create objects that have the book's `title`, `author`,  the number of `pages`, and whether or not you have `read` the book

Put a function into the constructor that can report the book info like so

```javascript
book.info() // "The Hobbit by J.R.R. Tolkien, 295 pages, not read yet"
```

Add a function to the script (not the constructor) that can take user's input (through the command line, using prompt, or using an html form) and store book objects into an array.

Your final function should look something like this:

```javascript
let myLibrary = []

function Book() {
  // the constructor...
}

function addBookToLibrary() {
  // do stuff here
}
```



## The Prototype

Before we go much further, there's something important you need to understand about JavaScript objects.  All objects in JavaScript have a `prototype`. Stated simply, the prototype is another object that the original object _inherits_ from, which is to say, the original object has access to all of it's prototype's methods and properties.

This concept is an important one, so you've got some reading to do.  Make sure you really get this before moving on!

1. [This article](http://javascriptissexy.com/javascript-prototype-in-plain-detailed-language/) is a straightforward introduction and demonstration of the concept.  It also covers constructors again.. good time for a review!  The important bits here, once you've covered the basics are 'Prototype based inheritance' and the 'Prototype chain'
2. To go a bit deeper into both the chain and inheritance spend some time with [this great article](http://javascript.info/prototype-inheritance).  As usual, doing the exercises at the end will help cement this knowledge in your mind.  Don't skip them!  Important note:  this article makes heavy use of `__proto__` which is not generally recommended.  The concepts here are what we're looking for at the moment.  We will soon learn another method or two for setting the prototype.

If you've understood the concept of prototype then this next bit about constructors will not be confusing at all!

```javascript
function Student(name) {
  this.name = name
  this.grade = grade
}

Student.prototype.sayName = function() {
  console.log(this.name)
}
Student.prototype.goToProm = function() {
  // eh.. go to prom?
}
```

If you're using constructors to make your objects it is best to define functions on the `prototype` of that object.  Doing so means that a single instance of each function will be shared between all of the Student objects.  If we declare the function directly in the constructor like we did when they were first introduced that function would be duplicated every time a new Student is created.  In this example of course that wouldn't really matter much, but in a project that is creating thousands of objects it really can make a difference.

### Recommended Method for Prototypal Inheritance

So far you have seen several ways of making an object inherit the prototype from another object.  At this point in history the recommended way of setting an Objects prototype uses `Object.create` (and [here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create) is the documentation for that method.)  `Object.create` very simply returns a new object with the specified prototype and any additional properties you want to add.  For our purposes you use it like so:

```javascript
function Student() {
}

Student.prototype.sayName = function() {
  console.log(this.name)
}

function EighthGrader(name) {
  this.name = name
  this.grade = 8
}

EighthGrader.prototype = Object.create(Student.prototype)

const carl = new EighthGrader("carl")
carl.sayName() // console.logs "carl"
carl.grade // 8
```

You can probably figure out what's going on here.  After creating the constructor for EighthGrader we set it's prototype to a new object that has a copy of `Student.prototype`.

A warning... this doesn't work:

```javascript
EighthGrader.prototype = Student.prototype
```

because it will literally set EighthGrader's prototype to Student.prototype (i.e. not a copy), which could cause problems if you want to edit something in the future.  Consider one more example:

```javascript
function Student() {
}

Student.prototype.sayName = function() {
  console.log(this.name)
}

function EighthGrader(name) {
  this.name = name
  this.grade = 8
}

EighthGrader.prototype = Student.prototype

function NinthGrader(name) {
  this.name = name
  this.grade = 9
}

NinthGrader.prototype = Student.prototype
NinthGrader.prototype.sayName = function() {console.log("HAHAHAHAHAHA")}

const carl = new EighthGrader("carl")
carl.sayName() //uh oh! this logs "HAHAHAHAHAHA" because we edited the sayName function!
```



# Project

Let's go ahead and make that library application something usable!

1. Set up your project with skeleton HTML/CSS and JS files.
2. All of your book objects are going to be stored in a simple array, so either copy the code from the example earlier, or recreate it here.  We need a constructor for the book objects and a function that can add the books to the Library array.
3. Hook the array up to your HTML with a `render()` function that loops through the array and displays each book on the page.  You can display them in some sort of table, or each on their own "card"
4. Add a "NEW BOOK" button that brings up a form allowing users to input the details for the new book: author, title, number of pages, whether or not it's been read and anything else you might want.
5. Add a button on each book's display to remove the book from the library.
6. add a button on each book's display to change it's `read` status.
7. Optional -we haven't learned any techniques for actually storing our data anywhere, so when the user refreshes the page all of their books will disappear! If you want, you are capable of adding some persistence to this library app using one of the following techniques:
   1. localStorage ([docs here](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)) allows you to save data on the user's computer. The downside here is that the data is ONLY accessible on the computer that it was created on.  Even so, it's pretty handy!  Set up a function that saves the whole library array to localStorage every time a new book is created, and another function that looks for that array in localStorage when your app is first loaded. (make sure your app doesn't crash if the array isn't there!)
   2. Firebase ([check it out!](https://firebase.google.com/docs/?authuser=0)) is an online database that can be set up relatively easily, allowing you to save your data to a server in the cloud!  Teaching you how to use it is beyond the scope of this tutorial, but it is almost definitely within your skillset.  If you're interested, check out [this video](https://www.youtube.com/watch?v=noB98K6A0TY) to see what it's all about.



