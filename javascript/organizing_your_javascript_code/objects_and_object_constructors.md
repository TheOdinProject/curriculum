### Introduction

Now that you've got a basic understanding of *why* and *how* you might use objects to organize data and functionality, it's important to learn some basic strategies for creating duplicates (often called **instances**) of objects, and using existing types of objects as a base for creating new ones through **inheritance**.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to write an object constructor and instantiate the object.
- What a prototype is and how it can be used.
- Prototypal inheritance.
- Basic do's and don'ts of prototypal inheritance.
- How the `this` keyword behaves in different situations.

### Object constructors

Manually typing out the contents of all of our objects with object literals is not always feasible. When you have a specific type of object that you need to make multiple of, a better way to create them is using an object constructor, which is really just a function:

```javascript
function Player(name, marker) {
  this.name = name;
  this.marker = marker;
}
```

The only difference is that you use it by calling the function with the keyword `new`:

```javascript
const player = new Player("steve", "X");
console.log(player.name); // "steve"
```

This is not the same as calling `Player("steve", "X")` (without the `new` keyword). <span id="new-keyword">When we call a function with `new`, it creates a new object, makes `this` inside the function refer to that object, and makes that object inherit from the function's `.prototype` property (more on that later). The new object is then returned (even though we don't specify a `return` value in the constructor function).</span>

Just like with objects created using the object literal method, you can add functions to the object:

```javascript
function Player(name, marker) {
  this.name = name;
  this.marker = marker;
  this.sayName = function() {
    console.log(this.name);
  };
}

const player1 = new Player("steve", "X");
const player2 = new Player("also steve", "O");
player1.sayName(); // logs "steve"
player2.sayName(); // logs "also steve"
```

<div class="lesson-note lesson-note--warning" markdown="1" >

#### Safeguarding constructors

Since constructors can be called without using `new` by mistake, which would cause hard-to-track errors as it won't do all the new object and `this` binding stuff, we should safeguard them. You can use the `new.target` meta-property like this, which will throw an error if `Player` is called without `new`:

```javascript
function Player(name, marker) {
  if (!new.target) {
    throw Error("You must use the 'new' operator to call the constructor");
  }
  this.name = name;
  this.marker = marker;
  this.sayName = function() {
    console.log(this.name);
  };
}
```

</div>

### Exercise

Write a constructor for making "Book" objects. We will revisit this in the next project. Your book objects should have the book's `title`, `author`, the number of `pages`, and whether or not you have `read` the book.

Put a function `info()` into the constructor that can report the book info like so:

```javascript
console.log(theHobbit.info()); // "The Hobbit by J.R.R. Tolkien, 295 pages, not read yet"
```

<div class="lesson-note lesson-note--tip" markdown="1">

#### console.log vs return

We use examples of functions that call `console.log()` for demonstration, but instead of making functions directly log things, it's generally more sensible to make them `return` values. That way, you can pass the values wherever you wish without being tied to whatever that function does; you may not always want to log the value.

</div>

### The prototype

Before we go much further, there's something important you need to understand about JavaScript objects. All objects in JavaScript have a **prototype**, otherwise referred to as its `[[Prototype]]`. The `[[Prototype]]` is another object that the original object *inherits* from, which is to say, the original object has access to all of its `[[Prototype]]`'s methods and properties.

Let's break it down.

#### 1. All objects in JavaScript have a [[Prototype]]

Pretty straightforward sentence here! Every object in JavaScript has a `[[Prototype]]`. So for example, the `player1` and `player2` objects from before, (created with the `Player(name, marker)` object constructor) also have a `[[Prototype]]`. Now, what does having a `[[Prototype]]` mean? What even is a `[[Prototype]]` of an object?

#### 2. The [[Prototype]] is another object

This sentence also seems pretty straightforward! The `[[Prototype]]` *is just another object* - again, like the `player1` and the `player2` objects. The `[[Prototype]]` object can have properties and functions, just as these `Player` objects have properties like `.name`, `.marker`, and functions like `.sayName()` attached to them.

#### 3. ...that the original object inherits from, and has access to all of its [[Prototype]]'s methods and properties

Here, the "original object" refers to an object like `player1` or `player2`. These objects are said to "inherit", or in other words, these objects have access to the `[[Prototype]]`'s properties or functions, if they have been defined. For example, if there was a `.sayHello()` function defined on the `[[Prototype]]`, `player1` can access the function just as if it was its own function - `player1.sayHello()`. But it's not just `player1` who can call the `.sayHello()` function, even `player2` can call it, since it's defined on its `[[Prototype]]`! Read on to know the details of how it works and how you could do this yourself!

#### Accessing an object's [[Prototype]]

Conceptually, you now might feel like you know, or at least have an idea of what a `[[Prototype]]` of an object is. But how do you *know* or actually *see* what the prototype of an object is? Let's find out. You can try running the following code in the developer console of your browser. (Make sure you've created the `player1` and `player2` objects from before!)

```javascript
Object.getPrototypeOf(player1) === Player.prototype; // returns true
Object.getPrototypeOf(player2) === Player.prototype; // returns true
```

Now, to understand this code, let's use the three points from earlier:

1. **All objects in JavaScript have a `[[Prototype]]`**:
   - You can check the object's `[[Prototype]]` by using the [`Object.getPrototypeOf()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getPrototypeOf) function on the object, like `Object.getPrototypeOf(player1)`.
   - `Object.getPrototypeOf(player1)` will return the object at the `.prototype` property of the `Player` constructor (i.e. `Player.prototype`).
1. **The `[[Prototype]]` is another object...**
   - The *value* of the `Player.prototype` contains an object.
   - A *reference* to `Player.prototype` is stored in every instance of a `Player` object as its `[[Prototype]]`.
   - Hence, `true` is returned when you get `player1`'s `[[Prototype]]` and check for referential equality against the object at `Player.prototype`.
1. **...that the original object *inherits* from, and has access to all of its `[[Prototype]]`'s methods and properties**:
   - So, any properties or methods defined on `Player.prototype` will be available to the created `Player` objects!

The last sub-item needs a little more explanation. What does defining 'on the prototype' mean? Consider the following code:

```javascript
Player.prototype.sayHello = function() {
  console.log("Hello, I'm a player!");
};

player1.sayHello(); // logs "Hello, I'm a player!"
player2.sayHello(); // logs "Hello, I'm a player!"
```

Here, we defined the `.sayHello` function 'on' the `Player.prototype` object. It then became available for the `player1` and the `player2` objects to use! Similarly, you can attach other properties or functions you want to use on all `Player` objects by defining them on the objects' `[[Prototype]]` (which is `Player.prototype`).

<div class="lesson-note" markdown="1">

#### .\_\_proto__

In some docs or codebases, you may see `.__proto__` being used on an object to get or set its `[[Prototype]]` instead of using `Object.getPrototypeOf()` or `Object.setPrototypeOf()`. This is due to historical reasons; [`.__proto__` is a non-standard and deprecated approach](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto), so it is not recommended to use it to access an object's `[[Prototype]]`.

</div>

<div class="lesson-note" markdown="1">

#### Object.getPrototypeOf() vs .prototype

A common cause of confusion comes from dealing with the `.prototype` property of constructor functions.

`.prototype` is a property of functions that determines what a new object instance's `[[Prototype]]` will be set to when the function is called with `new`. `.prototype` is *not* for accessing an object's `[[Prototype]]` - that's what `Object.getPrototypeOf()` is for.

</div>

#### Prototypal inheritance

Now, you may also have a question - what use is an object's `[[Prototype]]`? What is the purpose of defining properties and functions on a prototype?

We can narrow it down to two reasons:

1. We can define properties and functions common among all objects on a prototype to save memory. Defining every property and function takes up a lot of memory, especially if you have a lot of common properties and functions, and a lot of created objects! Defining them on a centralized, shared object which the objects have access to, thus saves memory.
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
player1.hasOwnProperty("valueOf"); // false
Object.prototype.hasOwnProperty("valueOf"); // true
```

Now where did this [`.hasOwnProperty` function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty) come from? A quick check helps:

```javascript
Object.prototype.hasOwnProperty("hasOwnProperty"); // true
```

Essentially, this is how JavaScript makes use of prototypes. An object inherits from its `[[Prototype]]` object which in turn inherits from its own `[[Prototype]]` etc., thus forming a chain. This kind of inheritance using prototypes is hence named as Prototypal inheritance. JavaScript figures out which properties exist (or do not exist) on the object and starts traversing the chain to find the property or function, like so:

1. Is the `.valueOf` function part of the `player1` object? No, it is not. (Remember, only the `name`, `marker` and `sayName` properties are part of the `Player` objects.)
1. Is the function part of the `player1`'s `[[Prototype]]` (the `Object.getPrototypeOf(player1)` value, i.e., `Player.prototype`)? No, only the `.sayHello` function is a part of it.
1. Well, then, is it part of `Object.getPrototypeOf(Player.prototype)` (=== `Object.prototype`)? Yes, `.valueOf` is defined on `Object.prototype`!

However, this chain does not go on forever, and if you have already tried logging the value of `Object.getPrototypeOf(Object.prototype)`, you would find that it is `null`, which indicates the end of the chain. And it is at the end of this chain that if the specific property or function is not found, `undefined` is returned.

Note:

1. Every prototype object inherits from `Object.prototype` by default, whether directly or indirectly.
1. An object's `Object.getPrototypeOf()` value can only be *one* value (an object cannot have multiple `[[Prototype]]`s).

#### Recommended method for prototypal inheritance

Now, how do you utilize Prototypal Inheritance? What do you need to do to use it? Just as we use `Object.getPrototypeOf()` to 'get' or view the `[[Prototype]]` of an object, we can use `Object.setPrototypeOf()` to 'set' or mutate it. Let's see how it works by adding a `Person` Object Constructor to the `Player` example, and making `Player` inherit from `Person`!

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
  console.log(`My marker is "${this.marker}"`);
};

Object.getPrototypeOf(Player.prototype); // returns Object.prototype

// Now make `Player` objects inherit from `Person`
Object.setPrototypeOf(Player.prototype, Person.prototype);
Object.getPrototypeOf(Player.prototype); // returns Person.prototype

const player1 = new Player("steve", "X");
const player2 = new Player("also steve", "O");

player1.sayName(); // Hello, I'm steve!
player2.sayName(); // Hello, I'm also steve!

player1.getMarker(); // My marker is "X"
player2.getMarker(); // My marker is "O"
```

From the code, we can see that we've defined a `Person` from whom a `Player` inherits properties and functions, and that the created `Player` objects are able to access both the `.sayName` and the `.getMarker` functions, in spite of them being defined on two separate `.prototype` objects! This is enabled by the use of the `Object.setPrototypeOf()` function. It takes two arguments - the first is the one which inherits and the second argument is the one which you want the first argument to inherit from. This ensures that the created `Player` objects are able to access the `.sayName` and `.getMarker` functions through their prototype chain.

Note:

Though it seems to be an easy way to set up Prototypal Inheritance using `Object.setPrototypeOf()`, the prototype chain has to be set up using this function *before* creating any objects. Using `setPrototypeOf()` after objects have already been created can result in performance issues.

A warning... this doesn't work:

```javascript
Player.prototype = Person.prototype;
```

Both `Player.prototype` and `Person.prototype` become the exact same object in memory. This means any changes made to `Player.prototype` will also affect `Person.prototype`, which is not the intended behavior. Instead, we should make `Player.prototype` inherit from `Person.prototype`, rather than making them the same object. Consider one more example:

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
  this.marker = "^";
}

// Not again!
// Use Object.setPrototypeOf(Enemy.prototype, Person.prototype)
Enemy.prototype = Person.prototype;

Enemy.prototype.sayName = function() {
  console.log("HAHAHAHAHAHA");
};

const carl = new Player("carl", "X");
carl.sayName(); // Uh oh! this logs "HAHAHAHAHAHA" because we edited the sayName function!
```

If we had used `Object.setPrototypeOf()` in this example, then we could safely edit the `Enemy.prototype.sayName` function without changing the function for `Player` as well.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read up on the concept of the prototype from the articles below.
   1. Read the article [Understanding Prototypes and Inheritance in JavaScript](https://www.digitalocean.com/community/tutorials/understanding-prototypes-and-inheritance-in-javascript) from Digital Ocean. This is a good review of prototype inheritance and constructor functions, featuring some examples.
   1. To go a bit deeper into both the chain and inheritance, spend some time with [JavaScript.Info's article on Prototypal Inheritance](http://javascript.info/prototype-inheritance). As usual, doing the exercises at the end will help cement this knowledge in your mind. Don't skip them! Important note: This article makes heavy use of `__proto__` which is not generally recommended. The concepts here are what we're looking for at the moment. We will soon learn another method or two for setting the prototype.
1. You might have noticed us using the `this` keyword in object constructors and prototype methods in the examples above. [JavaScript Tutorial's article on the `this` keyword](https://www.javascripttutorial.net/javascript-this/) covers how `this` changes in various situations. Pay special attention to the pitfalls mentioned in each section.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How do you write an object constructor and instantiate the object?](#object-constructors)
- [How can you prevent that an object constructor is called without using the keyword `new`?](#safeguarding-constructors)
- [What is a prototype and how can it be used?](#the-prototype)
- [What is prototypal inheritance?](https://javascript.info/prototype-inheritance)
- [What are the basic do's and don't's of prototypal inheritance?](#recommended-method-for-prototypal-inheritance)
- [How does `this` behave in different situations?](https://www.javascripttutorial.net/javascript-this/)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- This [`Object.create` method video by techsith](https://www.youtube.com/watch?v=MACDGu96wrA) provides another point of view on how to use `Object.create` to extend objects by setting the prototype.
- The first answer on this StackOverflow question regarding [defining methods via the prototype vs in the constructor](https://stackoverflow.com/questions/9772307/declaring-javascript-object-method-in-constructor-function-vs-in-prototype/9772864#9772864) helps explain when you might want to use one over the other.
- [Interactive Scrim on objects and object constructors.](https://scrimba.com/scrim/co2624f87981575448091d5a2)
- Check out this video explanation on the  [`this` keyword from DevSage](https://www.youtube.com/watch?v=cwChC4BQF0Q) that gives a different perspective on how its context changes, as well as scenarios in which `this` behaves unexpectedly.
