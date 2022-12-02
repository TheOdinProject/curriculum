### Introduction
In our JavaScript fundamentals course, you should have learned the [basics of using objects](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/fundamentals-part-5) to store and retrieve data. Let's start with a little refresher.

There are multiple ways to define objects but in most cases, it is best to use the __object literal__ syntax as follows:

~~~javascript
const myObject = {
  property: 'Value!',
  otherProperty: 77,
  "obnoxious property": function() {
    // do stuff!
 }
}
~~~

There are also 2 ways to get information out of an object: dot notation and bracket notation.

~~~javascript
// dot notation
myObject.property // 'Value!'

// bracket notation
myObject["obnoxious property"] // [Function]
~~~

Which method you use will depend on context. Dot notation is cleaner and is usually preferred, but there are plenty of circumstances when it is not possible to use it. For example, `myObject."obnoxious property"` won't work because that property is a string with a space in it. Likewise, you cannot use variables in dot notation:

~~~javascript
const variable = 'property'

myObject.variable // this gives us 'undefined' because it's looking for a property named 'variable' in our object

myObject[variable] // this is equivalent to myObject['property'] and returns 'Value!'
~~~

If you are feeling rusty on using objects, now might be a good time to go back and review the content in [__Fundamentals 5__](https://www.theodinproject.com/lessons/foundations-fundamentals-part-5) from our JavaScript Basics course.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

- Write an object constructor and instantiate the object.
- Describe what a prototype is and how it can be used.
- Explain prototypal inheritance.
- Understand the basic do's and don't's of prototypical inheritance.
- Explain what `Object.create` does.
- Explain what the `this` keyword is.

### Objects as a Design Pattern

One of the simplest ways you can begin to organize your code is by simply grouping things into objects. Take these examples from a 'tic tac toe' game:

~~~javascript
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
~~~

At first glance, the first doesn't seem so bad.. and it actually takes fewer lines to write than the example using objects, but the benefits of the second approach are huge! Let me demonstrate:

~~~javascript
function printName(player) {
  console.log(player.name)
}
~~~

This is something that you just could NOT do with the example one setup. Instead, every time you wanted to print a specific player's name, you would have to remember the correct variable name and then manually `console.log` it:

~~~javascript
console.log(playerOneName)
console.log(playerTwoName)
~~~

Again, this isn't _that_ bad... but what if you _don't know_ which player's name you want to print?

~~~javascript
function gameOver(winningPlayer){
  console.log("Congratulations!")
  console.log(winningPlayer.name + " is the winner!")
}
~~~

Or, what if we aren't making a 2 player game, but something more complicated such as an online shopping site with a large inventory? In that case, using objects to keep track of an item's name, price, description and other things is the only way to go. Unfortunately, in that type of situation, manually typing out the contents of our objects is not feasible either. We need a cleaner way to create our objects, which brings us to...

### Object Constructors

When you have a specific type of object that you need to duplicate like our player or inventory items, a better way to create them is using an object constructor, which is a function that looks like this:

~~~javascript
function Player(name, marker) {
  this.name = name
  this.marker = marker
}
~~~

and which you use by calling the function with the keyword `new`.

~~~javascript
const player = new Player('steve', 'X')
console.log(player.name) // 'steve'
~~~

Just like with objects created using the Object Literal method, you can add functions to the object:

~~~javascript
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
~~~



### Exercise

Write a constructor for making "Book" objects. We will revisit this in the project at the end of this lesson. Your book objects should have the book's `title`, `author`, the number of `pages`, and whether or not you have `read` the book.

Put a function into the constructor that can report the book info like so:

~~~javascript
theHobbit.info() // "The Hobbit by J.R.R. Tolkien, 295 pages, not read yet"
~~~

Note: It is almost _always_ best to `return` things rather than putting `console.log()` directly into the function. In this case, return the `info` string and log it after the function has been called:

~~~javascript
console.log(theHobbit.info());
~~~

### The Prototype

Before we go much further, there's something important you need to understand about JavaScript objects. All objects in JavaScript have a `prototype`. Stated simply, the `prototype` is another object that the original object _inherits_ from, which is to say, the original object has access to all of its `prototype`'s methods and properties.

Let's break it down.

#### 1. All objects in JavaScript have a `prototype`

Pretty straightforward sentence here! Every object in JavaScript has a `prototype`. So for example, the `player1` and `player2` objects from before, (created with the `Player(name, marker)` object constructor) also have a `prototype`. Now, what does having a `prototype` mean? What even is a `prototype` of an object?

#### 2. Stated simply, the `prototype` is another object...

This sentence also seems pretty straightforward! The `prototype` _is just another object_ - again, like the `player1` and the `player2` objects. The `prototype` object can have properties and functions, just as these `Player` objects have properties like `.name`, `.marker`, and functions like `.sayName()` attached to them.

#### 3. ...that the original object _inherits_ from, and has access to all of its `prototype`'s methods and properties

Here, the "original object" refers to an object like `player1` or `player2`. These objects are said to "inherit", or simply said, these objects have access to the `prototype`'s properties or functions, if they have been defined. For example, if there was a `.sayHello()` function defined on the `prototype`, `player1` can access the function just as if it was it's own function - `player1.sayHello()`. But it's not just `player1` who can call the `.sayHello()` function, even `player2` can call it, since it's defined on the `prototype`! Read on to know the details of how it works and how you could do this yourself!

#### Accessing an object's `prototype`

Conceptually, you now might feel like you know, or at least have an idea of what a `prototype` of an object is. But how do you _know_ or actually _see_ what the prototype of an object is? Let's find out. You can try running the following code in the developer console of your browser. (Make sure you've created the `player1` and `player2` objects from before!)

~~~javascript
player1.__proto__ === Player.prototype // returns true
player2.__proto__ === Player.prototype // returns true
~~~

Now, to understand this code, let's use the three points from earlier:

1. **All objects in JavaScript have a `prototype`**:

   1a. You can check the object's `prototype` by using the `.__proto__` property of the object, like `player1.__proto__`.

   1b. This `.__proto__` property refers to the `.prototype` property of the Object Constructor (i.e., `Player(name, marker)`) - `player1.__proto__ === Player.prototype`.

2. **The prototype is another object**: 

   2a. The _value_ of the Object Constructor's `.prototype` property (i.e., `Player.prototype`) contains the `prototype` object. 
   
   2b. The _reference_ to this value of `Player.prototype` is stored in every `Player` object's `.__proto__` property, every time a `Player` object is created. 
   
   2c. Hence, you get a `true` value returned when you compute `player1.__proto__ === Player.prototype`.

3. **...that the original object _inherits_ from, and has access to all of its prototype's methods and properties**: 

   3a. As said in the earlier point, every `Player` object's `.__proto__` property refers to `Player.prototype`: `player1.__proto__ === player2.__proto__` (returns `true`).
   
   3b. So, any properties or methods defined on `Player.prototype` will be available to the created `Player` objects!
   
Point 3b needs a little more explanation. What does defining 'on the `prototype`' mean? Consider the following code:

~~~javascript
Player.prototype.sayHello = function() {
   console.log("Hello, I'm a player!");
}

player1.sayHello() // logs "Hello, I'm a player!"
player2.sayHello() // logs "Hello, I'm a player!"
~~~

Here, we defined the `.sayHello` function 'on' the `Player.prototype` object. It then became available for the `player1` and the `player2` objects to use! Similarly, you can attach other properties or functions you want to use on all `Player` objects by defining them on the objects' prototype (`Player.prototype`).

#### `Object.getPrototypeOf()` vs. `.__proto__` vs. `[[Prototype]]`

As you have seen above, accessing an object's `prototype` was done using the `.__proto__` property of the object. However, this is a non-standard way of doing so, and it is recommended to access an object's `prototype` by using the [`Object.getPrototypeOf()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getPrototypeOf) function. The same code can thus be rewritten to become:

~~~javascript
Object.getPrototypeOf(player1) === Player.prototype // returns true
Object.getPrototypeOf(player2) === Player.prototype // returns true
~~~

In some places you might also come across `[[Prototype]]`, which is just another way of talking about the `.__proto__` property of an object, like `player1.[[Prototype]]`.

This explanation about the `prototype` might have been a lot, so remember to take a breather before moving on!

#### Prototypal Inheritance

Now, you may also have a question - what's with the `__proto__` / `[[Prototype]]` of an object pointing to its `prototype`? What is the purpose of defining properties and functions on the `prototype`?

We can narrow it down to two reasons:

1. We can define properties and functions common among all objects on the `prototype` to save memory. Defining every property and function takes up a lot of memory, especially if you have a lot of common properties and functions, and a lot of created objects! Defining them on a centralized, shared object which the objects have access to, thus saves memory.

2. The second reason is the name of this section, **Prototypal Inheritance**, which we've referred to in passing earlier, in the introduction to the Prototype. In recap, we know that can say that the `player1` or `player2` objects _inherit_ from the `Player.prototype` object, like with the `.sayHello` function, by being able to access it.

Let's now try to do the following:

~~~javascript
// Player.prototype.__proto__ 
Object.getPrototypeOf(Player.prototype) === Object.prototype // true

// Output may slightly differ based on the browser
player1.valueOf() // Output: Object { name: "steve", marker: "X", sayName: sayName() } 
~~~

What's this `.valueOf` function, and where did it come from if we did not define it? It comes as a result of `Player.prototype.__proto__` having the value of `Object.prototype`! This means that `Player.prototype` is inheriting from `Object.prototype`. This `.valueOf` function is defined on `Object.prototype` just like `.sayHello` is defined on `Player.prototype`.

Essentially, this is how JavaScript makes use of `prototype` and `__proto__` - by having the `__proto__` values of objects point to `prototype`s and inheriting from those prototypes, and thus forming a chain. This kind of inheritance using prototypes is hence named as Prototypal inheritance. JavaScript figures out which properties exist (or do not exist) on the object and starts traversing the chain to find the property or function, like so:

1. Is the `.valueOf` function part of the `player1` object? No, it is not. (Remember, only the `name`, `marker` and `sayName` properties are part of the `Player` objects.)

2. Is the function part of the `player1`'s prototype (the `player1.__proto__` value, i.e., `Player.prototype`)? No, only the `.sayHello` function is a part of it.

3. Well, then, is it part of `Player.prototype.__proto__` (=== `Object.prototype`)? Yes, `.valueOf` is defined on `Object.prototype`!

However, this chain does not go on forever, and if you have already tried logging the value of `Object.prototype.__proto__`, you would find that it is `null`, which indicates the end of the chain. And it is at the end of this chain that if the specific property or function is not found, `undefined` is returned.

Note:

1. Every `prototype` object inherits from `Object.prototype` by default.

2. An object's `.__proto__` property can only point to ONE `prototype` object at a time. 

#### Recommended Method for Prototypal Inheritance

So far you have seen several ways of making an object inherit the prototype from another object. At this point in history, the recommended way of setting the prototype of an object is `Object.create` ([here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create) is the documentation for that method). `Object.create` very simply returns a new object with the specified prototype and any additional properties you want to add. For our purposes, you use it like so:

~~~javascript
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
~~~

You can probably figure out what's going on here. After creating the constructor for EighthGrader, we set its prototype to a new object that has a copy of `Student.prototype`.

A warning... this doesn't work:

~~~javascript
EighthGrader.prototype = Student.prototype
~~~

because it will literally set EighthGrader's prototype to Student.prototype (i.e. not a copy), which could cause problems if you want to edit something in the future. Consider one more example:

~~~javascript
function Student() {
}

Student.prototype.sayName = function() {
  console.log(this.name)
}

function EighthGrader(name) {
  this.name = name
  this.grade = 8
}

// don't do this!!!
EighthGrader.prototype = Student.prototype

function NinthGrader(name) {
  this.name = name
  this.grade = 9
}

// noooo! not again!
NinthGrader.prototype = Student.prototype

NinthGrader.prototype.sayName = function() {console.log("HAHAHAHAHAHA")}

const carl = new EighthGrader("carl")
carl.sayName() //uh oh! this logs "HAHAHAHAHAHA" because we edited the sayName function!
~~~

If we had used `Object.create` in this example, then we could safely edit the `NinthGrader.prototype.sayName` function without changing the function for `EighthGrader` as well.


### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read up on the concept of the prototype from the articles below. 
   1. [JavaScriptIsSexy's article on the prototype](https://web.archive.org/web/20200513181548/https://javascriptissexy.com/javascript-prototype-in-plain-detailed-language/) is a straightforward introduction and demonstration of the concept. It also covers constructors again.. good time for a review! The important bits here, once you've covered the basics, are 'Prototype-based inheritance' and the 'Prototype chain'.
   2. To go a bit deeper into both the chain and inheritance, spend some time with [JavaScript.Info's article on Prototypal Inheritance](http://javascript.info/prototype-inheritance). As usual, doing the exercises at the end will help cement this knowledge in your mind. Don't skip them! Important note: This article makes heavy use of `__proto__` which is not generally recommended. The concepts here are what we're looking for at the moment. We will soon learn another method or two for setting the prototype.
2. You might have noticed us using the `this` keyword in object constructors and prototype methods in the examples above.
   1. [Dmitri Pavlutin's article on the `this` keyword](https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/) is very comprehensive and covers how `this` changes in various situations. You should have a solid understanding of the concept after reading it. Pay special attention to the pitfalls mentioned in each section.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* [This article](https://dev.to/lydiahallie/javascript-visualized-prototypal-inheritance-47co) from Lydia Hallie and [This video](https://www.youtube.com/watch?v=sOrtAjyk4lQ) from Avelx explains the Prototype concept with graphics and simple language. Try using these resources if you want another perspective to understand the concept.
* [This video](https://www.youtube.com/watch?v=CDFN1VatiJA) from mpj explains `Object.create` method with great details about it, he walks through what it is, why `Object.create` exists in JavaScript, and how to use `Object.create`. Also you can check [This video](https://www.youtube.com/watch?v=MACDGu96wrA) from techsith to understand another point of view of extending objects from others by `Object.create`.
* [The Principles of Object-Oriented JavaScript](https://www.amazon.com/Principles-Object-Oriented-JavaScript-Nicholas-Zakas/dp/1593275404) book by
Nicholas C. Zakas is really great to understand OOP in javascript, which explains concepts simply and in-depth, which explores JavaScript's object-oriented nature, revealing the language's unique implementation of inheritance and other key characteristics, it's not free but it's very valuable.
* [This stack overflow question](https://stackoverflow.com/questions/9772307/declaring-javascript-object-method-in-constructor-function-vs-in-prototype/9772864#9772864) explains the difference between defining methods via the prototype vs defining them in the constructor.
* [A Beginner’s Guide to JavaScript’s Prototype](https://medium.com/free-code-camp/a-beginners-guide-to-javascript-s-prototype-9c049fe7b34) and [JavaScript Inheritance and the Prototype Chain](https://medium.com/free-code-camp/javascript-inheritance-and-the-prototype-chain-d4298619bdae) from Tyler Mcginnis has great examples to help you understand Prototype and Prototype Chain better from the beginner's perspective.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='#object-constructors'>Write an object constructor and instantiate the object.</a>
- <a class="knowledge-check-link" href='#the-prototype'>Describe what a prototype is and how it can be used.</a>
- <a class="knowledge-check-link" href='https://javascript.info/prototype-inheritance'>Explain prototypal inheritance.</a>
- <a class="knowledge-check-link" href='#recommended-method-for-prototypal-inheritance'>Understand the basic do's and don't's of prototypical inheritance.</a>
- <a class="knowledge-check-link" href='https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create'>Explain what `Object.create` does</a>
- <a class="knowledge-check-link" href='https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/'>How does `this` behave in different situations?</a>
