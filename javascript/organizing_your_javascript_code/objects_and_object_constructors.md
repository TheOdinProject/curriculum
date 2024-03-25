### Introduction

In our JavaScript fundamentals course, you should have learned the [basics of using objects](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/fundamentals-part-5) to store and retrieve data. Let's start with a little refresher.

There are multiple ways to define objects but in most cases, it is best to use the **object literal** syntax as follows:

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

- How to write an object constructor and instantiate the object.
- Describe what a prototype is and how it can be used.
- Explain prototypal inheritance.
- Understand the basic do's and don't's of prototypal inheritance.
- Explain what the `this` keyword is.

### Objects as a design pattern

One of the simplest ways you can begin to organize your code is by grouping things into objects. Take these examples from a 'tic tac toe' game:

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

At first glance, the first doesn't seem so bad.. and it actually takes fewer lines to write than the example using objects, but the benefits of the second approach are huge! Let me demonstrate:

```javascript
function printName(player) {
  console.log(player.name);
}
```

This is something that you just could NOT do with the example one setup. Instead, every time you wanted to print a specific player's name, you would have to remember the correct variable name and then manually `console.log` it:

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

Or, what if we aren't making a 2 player game, but something more complicated such as an online shopping site with a large inventory? In that case, using objects to keep track of an item's name, price, description and other things is the only way to go. Unfortunately, in that type of situation, manually typing out the contents of our objects is not feasible either. We need a cleaner way to create our objects, which brings us to...

### Object constructors

When you have a specific type of object that you need to duplicate like our player or inventory items, a better way to create them is using an object constructor, which is a function that looks like this:

```javascript
function Player(name, marker) {
  this.name = name;
  this.marker = marker;
}
```

and which you use by calling the function with the keyword `new`.

```javascript
const player = new Player('steve', 'X');
console.log(player.name); // 'steve'
```

Just like with objects created using the Object Literal method, you can add functions to the object:

```javascript
function Player(name, marker) {
  this.name = name;
  this.marker = marker;
  this.sayName = function() {
    console.log(this.name)
  };
}

const player1 = new Player('steve', 'X');
const player2 = new Player('also steve', 'O');
player1.sayName(); // logs 'steve'
player2.sayName(); // logs 'also steve'
```

### Exercise

Write a constructor for making "Book" objects. We will revisit this in the project at the end of this lesson. Your book objects should have the book's `title`, `author`, the number of `pages`, and whether or not you have `read` the book.

Put a function into the constructor that can report the book info like so:

```javascript
theHobbit.info(); // "The Hobbit by J.R.R. Tolkien, 295 pages, not read yet"
```

Note: It is almost *always* best to `return` things rather than putting `console.log()` directly into the function. In this case, return the `info` string and log it after the function has been called:

```javascript
console.log(theHobbit.info());
```

### The prototype

Before we go much further, there's something important you need to understand about JavaScript objects. All objects in JavaScript have a `prototype`. The `prototype` is another object that the original object *inherits* from, which is to say, the original object has access to all of its `prototype`'s methods and properties.

Let's break it down.

#### 1. All objects in JavaScript have a prototype

Pretty straightforward sentence here! Every object in JavaScript has a `prototype`. So for example, the `player1` and `player2` objects from before, (created with the `Player(name, marker)` object constructor) also have a `prototype`. Now, what does having a `prototype` mean? What even is a `prototype` of an object?

#### 2. The prototype is another object

This sentence also seems pretty straightforward! The `prototype` *is just another object* - again, like the `player1` and the `player2` objects. The `prototype` object can have properties and functions, just as these `Player` objects have properties like `.name`, `.marker`, and functions like `.sayName()` attached to them.

#### 3. ...that the original object *inherits* from, and has access to all of its prototype's methods and properties

Here, the "original object" refers to an object like `player1` or `player2`. These objects are said to "inherit", or in other words, these objects have access to the `prototype`'s properties or functions, if they have been defined. For example, if there was a `.sayHello()` function defined on the `prototype`, `player1` can access the function just as if it was its own function - `player1.sayHello()`. But it's not just `player1` who can call the `.sayHello()` function, even `player2` can call it, since it's defined on the `prototype`! Read on to know the details of how it works and how you could do this yourself!

#### Accessing an object's prototype

Conceptually, you now might feel like you know, or at least have an idea of what a `prototype` of an object is. But how do you *know* or actually *see* what the prototype of an object is? Let's find out. You can try running the following code in the developer console of your browser. (Make sure you've created the `player1` and `player2` objects from before!)

```javascript
Object.getPrototypeOf(player1) === Player.prototype; // returns true
Object.getPrototypeOf(player2) === Player.prototype; // returns true
```

Now, to understand this code, let's use the three points from earlier:

1. **All objects in JavaScript have a `prototype`**:
   - You can check the object's `prototype` by using the [`Object.getPrototypeOf()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getPrototypeOf) function on the object, like `Object.getPrototypeOf(player1)`.
   - The return value (result) of this function refers to the `.prototype` property of the Object Constructor (i.e., `Player(name, marker)`) - `Object.getPrototypeOf(player1) === Player.prototype`.
1. **The prototype is another object...**
   - The *value* of the Object Constructor's `.prototype` property (i.e., `Player.prototype`) contains the `prototype` object.
   - The *reference* to this value of `Player.prototype` is stored in every `Player` object, every time a `Player` object is created.
   - Hence, you get a `true` value returned when you check the Objects prototype - `Object.getPrototypeOf(player1) === Player.prototype`.
1. **...that the original object *inherits* from, and has access to all of its prototype's methods and properties**:
   - As said in the earlier point, every `Player` object has a value which refers to `Player.prototype`. So: `Object.getPrototypeOf(player1) === Object.getPrototypeOf(player2)` (returns `true`).
   - So, any properties or methods defined on `Player.prototype` will be available to the created `Player` objects!

The last sub-item needs a little more explanation. What does defining 'on the `prototype`' mean? Consider the following code:

```javascript
Player.prototype.sayHello = function() {
   console.log("Hello, I'm a player!");
};

player1.sayHello(); // logs "Hello, I'm a player!"
player2.sayHello(); // logs "Hello, I'm a player!"
```

Here, we defined the `.sayHello` function 'on' the `Player.prototype` object. It then became available for the `player1` and the `player2` objects to use! Similarly, you can attach other properties or functions you want to use on all `Player` objects by defining them on the objects' prototype (`Player.prototype`).

#### Object.getPrototypeOf() vs. .\_\_proto__ vs. [[Prototype]]

Unlike what we have done so far using `Object.getPrototypeOf()` to access an object's `prototype`, the same thing can also be done using the `.__proto__` property of the object. However, this is a non-standard way of doing so, and [deprecated](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto). Hence, it is not recommended to access an object's `prototype` by using this property. However, the same code can thus be rewritten to become:

```javascript
// Don't do this!
player1.__proto__ === Player.prototype; // returns true
player2.__proto__ === Player.prototype; // returns true
```

In some places, like legacy code, you might also come across `[[Prototype]]`, which is just another way of talking about the `.__proto__` property of an object, like `player1.[[Prototype]]`.

This explanation about the `prototype` might have been a lot, so remember to take a breather before moving on!

#### Prototypal inheritance

Now, you may also have a question - what use is an object's `prototype`? What is the purpose of defining properties and functions on the `prototype`?

We can narrow it down to two reasons:

1. We can define properties and functions common among all objects on the `prototype` to save memory. Defining every property and function takes up a lot of memory, especially if you have a lot of common properties and functions, and a lot of created objects! Defining them on a centralized, shared object which the objects have access to, thus saves memory.
1. The second reason is the name of this section, **Prototypal Inheritance**, which we've referred to in passing earlier, in the introduction to the Prototype. In recap, we can say that the `player1` and `player2` objects *inherit* from the `Player.prototype` object, which allows them to access functions like `.sayHello`.

Let's now try to do the following:

```javascript
// Player.prototype.__proto__
Object.getPrototypeOf(Player.prototype) === Object.prototype; // true

// Output may slightly differ based on the browser
player1.valueOf(); // Output: Object { name: "steve", marker: "X", sayName: sayName() }
```

What's this `.valueOf` function, and where did it come from if we did not define it? It comes as a result of `Object.getPrototypeOf(Player.prototype)` having the value of `Object.prototype`! This means that `Player.prototype` is inheriting from `Object.prototype`. This `.valueOf` function is defined on `Object.prototype` just like `.sayHello` is defined on `Player.prototype`.

How do we know that this `.valueOf` function is defined on `Object.prototype`? We make use of another function called `.hasOwnProperty`:

```javascript
player1.hasOwnProperty('valueOf'); // false
Object.prototype.hasOwnProperty('valueOf'); // true
```

Now where did this [`.hasOwnProperty` function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty) come from? A quick check helps:

```javascript
Object.prototype.hasOwnProperty('hasOwnProperty'); // true
```

Essentially, this is how JavaScript makes use of `prototype` - by having the objects contain a value - to point to `prototype`s and inheriting from those prototypes, and thus forming a chain. This kind of inheritance using prototypes is hence named as Prototypal inheritance. JavaScript figures out which properties exist (or do not exist) on the object and starts traversing the chain to find the property or function, like so:

1. Is the `.valueOf` function part of the `player1` object? No, it is not. (Remember, only the `name`, `marker` and `sayName` properties are part of the `Player` objects.)
1. Is the function part of the `player1`'s prototype (the `Object.getPrototypeOf(player1)` value, i.e., `Player.prototype`)? No, only the `.sayHello` function is a part of it.
1. Well, then, is it part of `Object.getPrototypeOf(Player.prototype)` (=== `Object.prototype`)? Yes, `.valueOf` is defined on `Object.prototype`!

However, this chain does not go on forever, and if you have already tried logging the value of `Object.getPrototypeOf(Object.prototype)`, you would find that it is `null`, which indicates the end of the chain. And it is at the end of this chain that if the specific property or function is not found, `undefined` is returned.

Note:

1. Every `prototype` object inherits from `Object.prototype` by default.
1. An object's `Object.getPrototypeOf()` value can only be *one* unique `prototype` object.

#### Recommended method for prototypal inheritance

Now, how do you utilize Prototypal Inheritance? What do you need to do to use it? Just as we use `Object.getPrototypeOf()` to 'get' or view the `prototype` of an object, we can use `Object.setPrototypeOf()` to 'set' or mutate it. Let's see how it works by adding a `Person` Object Constructor to the `Player` example, and making `Player` inherit from `Person`!

```javascript
function Person(name) {
  this.name = name;
}

Person.prototype.sayName = function() {
  console.log(`Hello, I'm ${this.name}!`);
};

function Player(name, marker) {
  this.name = name;
  this.marker = marker;
}

Player.prototype.getMarker = function() {
  console.log(`My marker is '${this.marker}'`);
};

Object.getPrototypeOf(Player.prototype); // returns Object.prototype

// Now make `Player` objects inherit from `Person`
Object.setPrototypeOf(Player.prototype, Person.prototype);
Object.getPrototypeOf(Player.prototype); // returns Person.prototype

const player1 = new Player('steve', 'X');
const player2 = new Player('also steve', 'O');

player1.sayName(); // Hello, I'm steve!
player2.sayName(); // Hello, I'm also steve!

player1.getMarker(); // My marker is 'X'
player2.getMarker(); // My marker is 'O'
```

From the code, we can see that we've defined a `Person` from whom a `Player` inherits properties and functions, and that the created `Player` objects are able to access both the `.sayName` and the `.getMarker` functions, in spite of them being defined on two separate `prototype` objects! This is enabled by the use of the `Object.setPrototypeOf()` function. It takes two arguments - the first is the one which inherits and the second argument is the one which you want the first argument to inherit from. This ensures that the created `Player` objects are able to access the `.sayName` and `.getMarker` functions through their prototype chain.

Note:

Though it seems to be an easy way to set up Prototypal Inheritance using `Object.setPrototypeOf()`, the prototype chain has to be set up using this function *before* creating any objects. Using `setPrototypeOf()` after objects have already been created can result in performance issues.

A warning... this doesn't work:

```javascript
Player.prototype = Person.prototype;
```

because it will set `Player.prototype` to directly refer to `Person.prototype` (i.e. not a copy), which could cause problems if you want to edit something in the future. Consider one more example:

```javascript
function Person(name) {
  this.name = name;
}

Person.prototype.sayName = function() {
  console.log(`Hello, I'm ${this.name}!`);
};

function Player(name, marker) {
  this.name = name;
  this.marker = marker;
}

// Don't do this!
// Use Object.setPrototypeOf(Player.prototype, Person.prototype)
Player.prototype = Person.prototype;

function Enemy(name) {
  this.name = name;
  this.marker = '^';
}

// Not again!
// Use Object.setPrototypeOf(Enemy.prototype, Person.prototype)
Enemy.prototype = Person.prototype;

Enemy.prototype.sayName = function() {
  console.log('HAHAHAHAHAHA');
};

const carl = new Player('carl', 'X');
carl.sayName(); // Uh oh! this logs "HAHAHAHAHAHA" because we edited the sayName function!
```

If we had used `Object.setPrototypeOf()` in this example, then we could safely edit the `Enemy.prototype.sayName` function without changing the function for `Player` as well.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read up on the concept of the prototype from the articles below.
   1. Read the article [Understanding Prototypes and Inheritance in JavaScript](https://www.digitalocean.com/community/tutorials/understanding-prototypes-and-inheritance-in-javascript) from Digital Ocean. This is a good review of prototype inheritance and constructor functions, featuring some examples.
   1. To go a bit deeper into both the chain and inheritance, spend some time with [JavaScript.Info's article on Prototypal Inheritance](http://javascript.info/prototype-inheritance). As usual, doing the exercises at the end will help cement this knowledge in your mind. Don't skip them! Important note: This article makes heavy use of `**proto**` which is not generally recommended. The concepts here are what we're looking for at the moment. We will soon learn another method or two for setting the prototype.
1. You might have noticed us using the `this` keyword in object constructors and prototype methods in the examples above.

   1. [Dmitri Pavlutin's article on the `this` keyword](https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/) is very comprehensive and covers how `this` changes in various situations. You should have a solid understanding of the concept after reading it. Pay special attention to the pitfalls mentioned in each section.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Write an object constructor and instantiate the object.](#object-constructors)
- [Describe what a prototype is and how it can be used.](#the-prototype)
- [Explain prototypal inheritance.](https://javascript.info/prototype-inheritance)
- [Understand the basic do's and don't's of prototypal inheritance.](#recommended-method-for-prototypal-inheritance)
- [How does `this` behave in different situations?](https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Lydia Hallie has a [visual article on prototypal inheritance](https://dev.to/lydiahallie/javascript-visualized-prototypal-inheritance-47co) and [prototype inheritance by Programming With Avelx](https://www.youtube.com/watch?v=sOrtAjyk4lQ) explains the Prototype concept with graphics and beginner friendly language. Try using these resources if you want another perspective to understand the concept.
- This [`Object.create` video by FunFunFunction](https://www.youtube.com/watch?v=CDFN1VatiJA) explains the method with great details about it, he walks through what it is, why `Object.create` exists in JavaScript, and how to use `Object.create`. Also you can check this [`Object.create` method video by techsith](https://www.youtube.com/watch?v=MACDGu96wrA) for another point of view on extending objects.
- [The Principles of Object-Oriented JavaScript](https://www.amazon.com/Principles-Object-Oriented-JavaScript-Nicholas-Zakas/dp/1593275404) book by
Nicholas C. Zakas is really great to understand OOP in JavaScript, which explains concepts in-depth, which explores JavaScript's object-oriented nature, revealing the language's unique implementation of inheritance and other key characteristics, it's not free but it's very valuable.
- The first answer on this StackOverflow question regarding [defining methods via the prototype vs in the constructor](https://stackoverflow.com/questions/9772307/declaring-javascript-object-method-in-constructor-function-vs-in-prototype/9772864#9772864) helps explain when you might want to use one over the other.
- [A Beginner’s Guide to JavaScript’s Prototype](https://medium.com/free-code-camp/a-beginners-guide-to-javascript-s-prototype-9c049fe7b34) and [JavaScript Inheritance and the Prototype Chain](https://medium.com/free-code-camp/javascript-inheritance-and-the-prototype-chain-d4298619bdae) from Tyler Mcginnis has great examples to help you understand Prototype and Prototype Chain better from the beginner's perspective.
- This video from Akshay Saini is an easy way to understand the [concept of Prototype, Prototype Chain and prototypal inheritance.](https://www.youtube.com/watch?v=wstwjQ1yqWQ).
- [Interactive Scrim on objects and object constructors.](https://scrimba.com/scrim/co2624f87981575448091d5a2)
- Check out this video explanation on the  [`this` keyword from DevSage](https://www.youtube.com/watch?v=cwChC4BQF0Q) that gives a different perspective on how its context changes, as well as scenarios in which `this` behaves unexpectedly.
