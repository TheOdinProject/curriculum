### Introduction

We have discussed object constructors in the previous lesson. However, they are one of the many ways to organize your code. While they are fairly common and a fundamental building block of the JavaScript language, they have their flaws.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe the scope of a variable.
- Explore what closures are.
- Briefly consider the disadvantages of using constructors.
- Discuss Factory functions with examples.
- Discuss Private variables and functions concerning factory functions.
- Showcase object inheritance with the help of factory functions.
- Describe what module pattern and IIFEs are.
- Discuss encapsulation and how the module pattern helps with namespacing.

### Scoopfuls of scopes

The word "scoping" essentially asks, "Where is a certain variable available to me?" - it indicates the current context of a variable. When a variable is not declared within **any** functions, existing outside any `{ curly braces }`, they are said to be in the **global scope**, meaning that they are available everywhere. If they are within a function or `{ curly braces }`, they are known to be **locally scoped**.

Before ECMAScript 6, JavaScript had a single keyword to declare a variable, `var`. These variables can be redefined and updated, and are said to be defined within the **function scope**, meaning, they are only available within the function they are declared in.

In ECMAScript 6, the keywords `let` and `const` were introduced. While `var` variables were function scoped, these allow you to define variables that are **block scoped** - basically, scoping the variable to only be available within the closest set of `{ curly braces }` in which it was defined. These braces can be those of a `for` loop, `if-else` condition, or any other similar construct, and are called, a block. Let's see an example to sum this all up.

```javascript
// This is a global variable
let globalAge = 23;

// This is a function - and hey, a curly brace indicating a block
function printAge(age) {
  // This is a function scoped variable
  var varAge = 34;

  // This is yet another curly brace, and thus a block
  if (age > 0) {
    // This is a block-scoped variable that exists
    // within its nearest enclosing block: the if's block
    const constAge = age * 2;
    console.log(constAge);
  }

  // ERROR! We tried to access a block scoped variable
  // outside its scope
  console.log(constAge);
}

printAge(globalAge);

// ERROR! We tried to access a function scoped variable
// outside the function it's defined in
console.log(varAge);
```

Take a while to brew on that example. In the end, it's not some mind-blowing concept but there's a whole bunch of terms in there - it'll all help us understand the next mammoth - closures.

### Closures aren't scary

You know how if you needed to repeatedly get or create some value based on some kind of input, you'd use a function with parameters? For example, you could write a function that takes arguments and returns an array or string or number as a result of using those arguments. Functions are no different. You can use a function to create another function.

The best way to approach this would be to start with an example - take a look at this piece of code below.

```javascript
function makeAddingFunction(firstNumber) {
  // firstNumber is scoped anywhere within makeAddingFunction,
  // including returnedFunction
  // any variables declared here will also be accessible within returnedFunction

  // we don't need to name the returned function
  // this is just to reference more easily in explanation
  return function returnedFunction(secondNumber) {
    // secondNumber is scoped only within returnedFunction
    return firstNumber + secondNumber;
  }
}
```

We can then create our function by calling `makeAddingFunction`:

```javascript
const add5 = makeAddingFunction(5);
console.log(add5(2)); // 7

const add8 = makeAddingFunction(8);
console.log(add8(2)); // 10

const add79100105110 = makeAddingFunction(79100105110);
console.log(add79100105110(111687378)); // 79211792488
```

Instead of writing a new function every time, we just use a function to create a function for us - the same way we might write a `toFormattedDateString(date)` function and call it several times with different dates, rather than hardcoding the logic and resulting string every single time.

`returnedFunction` forms a closure around the `firstNumber` parameter. A closure refers to the combination of a function and the **surrounding state** in which the function was declared. This surrounding state, also called its **lexical environment**, consists of any local variables that were in scope at the time the closure was made. Here, `add5` is a reference to the function returned by the `makeAddingFunction(5)` call. After `makeAddingFunction(5)` finishes executing, the 5 is not cleaned up in memory because the returned function still needs it: the returned function has access to its lexical environment (which in this case, contains the `firstNumber` parameter).

This is a **crucial** behavior of functions; it allows us to associate data with functions and manipulate that data anywhere outside of the enclosing function. We can make use of this in factory functions, coming up shortly.

### So, what's wrong with constructors?

The biggest problem with constructors is that they don't provide automatic safeguards that prevent from using them wrong.

One of the key arguments is how they *look* like regular JavaScript functions, even though they do not *behave* like regular functions. As we warned in the object constructors lesson, if you try to use a constructor function without the `new` keyword, and you didn't include additional safeguards in the constructor not only does your program fail to work, but it also produces error messages that are hard to track down and understand.

Yet another issue stems from misusing `instanceof`. In other programming languages, the keyword is a reliable way to know the code with which an object was made; but in JavaScript, it checks the presence of a constructor's prototype in an object's *entire* prototype chain - which does nothing to confirm if an object was made with that constructor since the constructor's prototype can even be reassigned after the creation of an object.

Because of that, constructors have become unpopular in favor of a pattern that is similar but addresses a ton of these problems by not relying on those troublesome features: Factory Functions.

### Factory functions 🏭

These fancy-sounding functions work very similar to how constructors did, but with one key difference - they levy the power of closures. Instead of using the `new` keyword to create an object, factory functions set up and return the new object when you call the function. They do not use the prototype, which incurs a performance penalty - but as a general rule, this penalty isn’t significant unless you’re creating thousands of objects. Let's take a basic example to compare them to constructor functions.

```javascript
function User(name) {
  this.name = name;
  this.discordName = "@" + name;
}
```

Hey, this is a constructor... then this can be refactored into a factory!

```javascript
function createUser(name) {
  const discordName = "@" + name;
  return { name, discordName };
}
```

This is all very similar to the constructor, except this is just a normal function, meaning we do not need to call it with the `new` keyword.

<div class="lesson-note" markdown="1">

#### The object shorthand notation

Some may get confused by the way the returned object is written in the factory function example. In 2015, a shortcut to creating objects was added to JavaScript. Say we wanted to create an object with a name, age, and color, we would write it as follows:

```javascript
const name = "Bob";
const age = 28;
const color = "red";

const thatObject = { name: name, age: age, color: color };
```

However, now, if we have a variable with the same name as that of the property to which we are assigning it, then we can write it once!

```javascript
const nowFancyObject = { name, age, color };
```

An added advantage to this is that it's now possible to console.log values neatly! If you wanted to log the name, age and color variables together earlier, you would have done something like:

```javascript
console.log(name, age, color);
```

This would log something like `Bob 28 red`. Not *bad*, just not the clearest as to what's what. Instead, try wrapping it in some curly braces now, which makes it an object:

```javascript
// shorthand for console.log({ name: name, age: age, color: color })
console.log({ name, age, color });
```

Now it'll log as `{ name: "Bob", age: 28, color: "red" }` which is much clearer, and we didn't need to manually add labels!

### Destructuring

Yet another expression allows you to "unpack" or "extract" values from an object (or array). This is known as **destructuring**. When you have an object, you can extract a property of an object into a variable of the same name, or any named variable for an array. Take a look at the example below:

```javascript
const obj = { a: 1, b: 2 };

// equivalent of doing
// const a = obj.a;
// const b = obj.b;
const { a, b } = obj;
```

And with arrays:

```javascript
const array = [1, 2, 3, 4, 5];

// equivalent of doing
// const zerothEle = array[0];
// const firstEle = array[1];
const [zerothEle, firstEle] = array;
```

The [MDN documentation on destructuring assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment) has some great examples and should be a good read for this concept.

</div>

### Private variables and functions

Now you may be thinking - where does closure come into all of this? Factories seem to be returning an object. This is where we can extend our `User` factory to add a few more variables and introduce "private" ones. Take a look at this, now:

```javascript
function createUser(name) {
  const discordName = "@" + name;

  let reputation = 0;
  const getReputation = () => reputation;
  const giveReputation = () => { reputation++; };

  return { name, discordName, getReputation, giveReputation };
}

const josh = createUser("josh");
josh.giveReputation();
josh.giveReputation();

// logs { discordName: "@josh", reputation: 2 }
console.log({
  discordName: josh.discordName,
  reputation: josh.getReputation()
});
```

We’ve introduced a new metric for a new user - a reputation. Notice that the object we return in the factory function does not contain the `reputation` variable itself, nor any copy of its value. Instead, the returned object contains two functions - one that reads the value of the `reputation` variable, and another that increases its value by one. The `reputation` variable is what we call a "private" variable, since we cannot access the variable directly in the object instance - it can only be accessed via the closures we defined.

Concerning factory functions, a private variable or function uses closures to create smaller, dedicated variables and functions within a factory function itself - things that we do not *need* to return in the object itself. This way we can create neater code, without polluting the returned object with unnecessary variables that we create while creating the object itself. Often, you do not need every single function within a factory to be returned with the object, or expose an internal variable. You can use them privately since the property of closures allows you to do so.

In this case, we did not need control of the `reputation` variable itself. To avoid foot guns, like accidentally setting the reputation to `-18000`, we expose the necessary details in the form of `getReputation` and `giveReputation`.

<div class="lesson-note" markdown="1" >

#### Constructors and closure

Note that you could technically also use closure in constructors, by defining the methods to access a "private property" inside the constructor, instead of on the prototype. But that would make them non-inheritable, which defies the purpose of constructors.

</div>

### Prototypal inheritance with factories

In the lesson with constructors, we looked deeply into the concept of prototype and inheritance, and how to give our objects access to the properties of another. With factory functions too, there are easy ways to do that. Take another hypothetical scenario into consideration. We need to extend the `User` factory into a `Player` factory that needs to control some more metrics - there are some ways to do that:

```javascript
function createPlayer(name, level) {
  const { getReputation, giveReputation } = createUser(name);

  const increaseLevel = () => { level++; };
  return { name, getReputation, giveReputation, increaseLevel };
}
```

And there you go! You can create your User, extract what you need from it, and re-return whatever you want to - hiding the rest as some private variables or functions! In case you want to extend it, you can also use the [`Object.assign` method](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) to add on the properties you want!

```javascript
function createPlayer(name, level) {
  const user = createUser(name);

  const increaseLevel = () => { level++; };
  return Object.assign({}, user, { increaseLevel });
}
```

### The module pattern: IIFEs

<div class="lesson-note lesson-note--warning" markdown="1">

#### ES6 modules

ECMAScript 6 (released in 2015) introduced a new JavaScript feature called "modules", which are a set of syntax for importing and exporting code between different JavaScript files. For now, we will be talking more generally about the module pattern using IIFEs, which you will still see out in the wild. In a later lesson, we will cover using ES6 modules for similar purposes.

</div>

Oftentimes, you do not need a factory to produce multiple objects - instead, you are using it to wrap sections of code together, hiding the variables and functions that you do not need elsewhere as private. This is easily achievable by wrapping your factory function in parentheses and immediately calling (invoking) it. This immediate function call is commonly referred to as an Immediately Invoked Function Expression (duh) or IIFE in short. IIFEs are quite literally just function expressions that are called immediately:

```javascript
// This is an IIFE! Though not particularly useful, of course.
(() => console.log('foo'))();
```

A more helpful use of IIFEs is the pattern of wrapping "private" code inside an IIFE: the module pattern. This is often done with factory functions:

```javascript
const calculator = (function () {
  const add = (a, b) => a + b;
  const sub = (a, b) => a - b;
  const mul = (a, b) => a * b;
  const div = (a, b) => a / b;

  return { add, sub, mul, div };
})();

calculator.add(3,5); // 8
calculator.sub(6,2); // 4
calculator.mul(14,5534); // 77476
```

In this example, we have a factory function creating some basic operations that we need only once. We can wrap it in parentheses and immediately call it by adding `()` - returning the result object that we store in `calculator`. In this way we can write code, wrapping away things that we do not need as private variables and functions inside our factory function and while they are tucked inside of our module, we can use the returned variables and functions outside the factory, as necessary.

#### Encapsulating with the module pattern

At first glance, this does not seem particularly useful. If we have some code that we use only once, why not write it in the main section of our JavaScript file itself? After all, the power of factory functions lies in being, well, a factory to make multiple objects, right?

This is where we encounter the word **encapsulation** - bundling data, code, or something into a single unit, with selective access to the things inside that unit itself. While it sounds general, this is what happens when we wrap, or encapsulate our code into modules - we don't expose everything to the body of our program itself. This encapsulation leads to an effect called **namespacing**. Namespacing is a technique that is used to avoid naming collisions in our programs.

Take the calculator example into consideration. It's very easy to imagine a scenario where you can accidentally create multiple functions with the name `add`. What does `add` do - does it add two numbers? Strings? Does it take its input directly from the DOM and display the result? What would you name the functions that do these things? Instead, we can easily encapsulate them inside a module called `calculator` which generates an object with that name, allowing us to explicitly call `calculator.add(a, b)` or `calculator.sub(a, b)`.

#### Why the IIFE?

But then why not just write the factory function then call it once? Why bother with the IIFE? Well without the IIFE, we'd have to give the function a name so we can call it afterwards. Now it has a name, it's both taken a name up in that scope and also means it's reusable in that scope. That may not be desirable - we may purposely want to invoke it only once. By wrapping the factory in an IIFE, we achieve the same code flow, except we no longer need to name the function, which also means it can't be referenced later. We are packing the code that creates a calculator into what's effectively a module, then exposing only what needs to be used later in the code: the `calculator` object.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. WesBos has a beautiful and in-depth section on scopes and closures. Please check out these sections under "Module 3 - The Tricky Bits":
   - [The article on scope](https://wesbos.com/javascript/03-the-tricky-bits/scope)
   - [The article on closures](https://wesbos.com/javascript/03-the-tricky-bits/closures)
1. Read this article on [module pattern in JavaScript](https://dev.to/tomekbuszewski/module-pattern-in-javascript-56jm) by Tomek Buszewski.
1. Read [MDN's guide on closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Closures).

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How does scope work in JavaScript?](#scoopfuls-of-scopes)
- [What are closures?](#closures-arent-scary)
- [What common issues can you face when working with constructors?](#so-whats-wrong-with-constructors)
- [What are private variables in factory functions and how can they be useful?](#private-variables-and-functions)
- [How can we implement prototypal inheritance with factory functions?](#prototypal-inheritance-with-factories)
- [How does the module pattern work?](https://dev.to/tomekbuszewski/module-pattern-in-javascript-56jm)
- [What does IIFE stand for and what are they?](#the-module-pattern-iifes)
- [What is the concept of namespacing and how do factory functions help with encapsulation?](#encapsulating-with-the-module-pattern)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- This video explains [a good example of closures](https://www.youtube.com/watch?v=80O6L2Ez3GM).
- Here is an [interactive scrim on factory functions](https://v1.scrimba.com/scrim/c2aaKzcV).
- This article discusses [three different kinds of prototypal inheritance](https://medium.com/javascript-scene/3-different-kinds-of-prototypal-inheritance-es6-edition-32d777fa16c9) with some good examples.
