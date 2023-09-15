### Why not constructors?

We have discussed about object constructors in the previous lesson. However, they are simply one of the many ways to organize your code. While they are fairly common in the code seen about the internet and a fundamental building block of Javascript language, they have their own flaws.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- A LESSON OVERVIEW ITEM.

### Scoopfuls of scopes

The word "scoping" essentially asks, "where is a certain variable available to me?" - it indicates the current context of a variable. When a variable is not declared within **any** functions, existing outside any `{ curly braces }`, they are said to be in the **global scope**, meaning that they are available everywhere. If they are within them, they are known to be **locally scoped**.

Before 2016, Javascript had a single keyword to declare a variable, `var`. These variables can be **redefined** and **updated**, and are said to be defined within the **function scope**, meaning, they are only available within the function they are declared in.

Post 2016, the keywords `let` and `const` were introduced. While `var` variables were function scoped, these allow you to defined variables that are **block scoped** - basically, scoping the variable to only be available within the closest set of `{ curly braces }` in which it was defined. These braces can be those of a `for` loop, `if-elseif` condition, or any other such construct, and are called, a block. Let's see an example to sum this all up.

~~~javascript
let globalAge = 23; // This is a global variable

function printAge (age) { // This is a function - and hey, a curly brace indicating a block
  var varAge = 34; // This is a function scoped variable

  if (age > 0) { // This is yet another curly brace, and thus a block
    const constAge = age * 2; // This is a block scoped variable that exists in it's closest outer block, the if's in this case
    console.log(constAge);
  }

  console.log(constAge); // ERROR! We tried to access a block scoped variable outside it's scope
}

printAge(globalAge);
console.log(varAge); // ERROR! We tried to access a function scoped outside the function it's defined in
~~~

Take a while to brew on that example. At the end, it's not some mind blowing concept but there's definitely a whole bunch of terms in there - it'll all help us understand the next mammoth - closures.

### Closures aren't scary

The best way to approach this would be to start with an example - take a look at this piece of code below.

~~~javascript
function makeAdding (first) { // "first" is scoped within the makeAdding function
  return function resulting (second) { // "second" is scoped within the resulting function
    return first + second;
  }
} // but we've not seen an example of a **function** being returned, thus far - how do we use it?

const add5 = makeAdding(5);
console.log(add5(2)) // logs 7
~~~

There's a lot going on, so let's break it down:

1. The `makeAdding` function takes an argument, `first`, and returns another **function** (which we have named as `add5` while using).
1. When an argument is passed to the returned function (in our case, `add5`), it returns the result of adding up the number passed earlier to the number passed now (`first` to `second`).

Now, while it may sound good at first glance, you can already be raising your eyebrows at the second statement. As we've learnt, the `first` variable is scoped within the `makeAdding` function. When we declare and use `add5`, however, we're **outside** it. How does the `first` variable still exist, ready to be added when we pass an argument to the `add5` function? This is where we encounter the concept of closures.

Functions in Javascript form closures. A closure refers to the combination of a function and the **surrounding state** within which a function was declared in. This surrounding state, also called it's lexical environment, consists of any local variables that was in scope at the time the closure was made. Here, `add5` is a reference to the `resulting` function, created when the `makeAdding` function is executed, thus it has access to the lexical environment of the `resulting` function, which contains the `first` variable, making it be available for use, rather that deleting it for being out of scope.

This is a **crucial** behaviour for function - which allows us to correlate things around a function and work on them anywhere outside it. If you're still confused, take a small detour to examine the *second point* under [the assignments](#assignment) - no need to read the entire thing for now, anything from and after "Emulating private methods with closures" will be discussed further down this lesson, and you can come back to them when you encounter the assignment section.

### So, what's wrong with constructors?

One of the key arguments against constructors, in fact, the biggest argument is how they *look* like regular Javascript functions, even though they do not *behave* like regular function. If you try to use a constructor function without the `new` keyword, not only does your program fail to work, it also produces error messages that are hard to track down and understand. 

While still seen in code, these problems led to use of a pattern that was similar to constructors but addessed a ton of these problems: Factory Functions.

### Factory functions 🏭

These fancy sounding functions work very similar to how constructors did, but with one key difference - they levy the power of closures. Instead of using the `new` keyword to create an object, factory functions simply set up and return the new object when you call the function. Let's take a basic example to compare them to constructor functions.

~~~javascript
const User = function (name) {
  this.name = name;
  this.discordName = "@" + name;
} // hey, this is a constructor - this can be refactored into a factory, then!

function createUser (name) {
  const discordName = "@" + name;
  return { name, discordName };
} // and that's very similar, except since it's just a function, we don't need a new keyword
~~~

<div class="lesson-note" markdown="1">

### The object shorthand notation

Some may get confused by the way the returned object is written in the factory function example. In 2015, a shortcut to creating objects was added to Javascript. Say we wanted to make an object with a name, age and color. We'd write it as the following:

~~~javascript
const name = "Bob";
const age = 28;
const color = "red";

const thatObject = { name: name, age: age, color: color };
~~~

However, now, if we have a variable with the same name as that of the property to which we are assigning it to, we can simply write it once!

~~~javascript
const nowFancyObject = { name, age, color };
~~~

An added advantage to this is that it's now possible to console.log values neatly!

~~~javascript
// If you wanted to log these values, earlier, you would have done the following
console.log(name, age, color);
// which would have resulted in a mess - Bob 28 red

// Try wrapping it in some { curly braces } now, which makes it an object!
console.log({ name, age, color });
// now it logs as - { name: "Bob", age: 28, color: "red" }
~~~

</div>

### Private variables and functions

Now you may be thinking - where does closure come into all of this? Factories seem to simply be returning an object. This is where we can extend our `User` factory to add a few more variables and introduce "private" ones. Take a look at this, now:

~~~javascript
function createUser (name) {
  const discordName = "@" + name;

  let reputation = 0;
  const getReputation = () => reputation;
  const giveReputation = () => reputation++;

  return { name, discordName, getReputation, giveReputation };
}

const josh = createUser("josh");
josh.giveReputation();
josh.giveReputation();

console.log({ name: josh.discordName, reputation: josh.getReputation }); 
// logs { name: "josh", reputation: 2 }
~~~

We've introduced a new metric for a new user, a reputation, and in our returned object, added two new functions to control this reputation count. Sounds about right? But notice that we did not return the reputation count, *itself*. Instead, we used the power of closure to let it remain hidden, as a detail of implemenation, and offered a function to check it's value at any time and increase it's value by one. This, is what we call a "private" variable.

With respect to factory functions, a private variable or function uses closures to create smaller, dedicated variables and functions within a factory function itself - things that we do not *need* to return in the object itself. This way we can create neater code, without polluting the returned object with unnecessary variables that we create while creating the object itself. Often, you do not need every single function within a factory to be returned with the object, or expose an internal variable. You can use them privately, since the property of closures allows you to do so.

In this case, we did not need control of reputation itself. To avoid footguns, like accidentally setting the reputation count to `-18000`, we simply expose the necessary details in the form of `getReputation` and `giveReputation`.

### Prototypal inhertance with factories

In the lesson with constructors, we looked deeply into the concept of prototype and inheritance, how to give our objects access to the properties of another. With factory functions too, there are easy ways to do that. Take another hypothetical scenario into consideration. We need to extend the `User` factory into a `Player` factory that need to control some more metrics - there are some ways to do that:

~~~javascript
function createPlayer (name, level) {
  const { discordName, getReputation } = createUser(name);

  const increaseLevel = () => level++;
  return { name, discordName, getReputation, increaseLevel };
}
~~~

And there you go! You can simply create your own User, extract what you need from it, and re-return whatever you want to - hiding the rest as some private variables or functions! In case you want to simply extend on it, you can also use the [`Object.assign` method]() to add on the properties you want!

~~~javascript
function createPlayer (name, level) {
  const user = createUser(name);

  const increaseLevel = () => level++;
  return Object.assign({}, user, { increaseLevel });
}
~~~

### Assignment

1. wesbos article on scoping
1. mdn article on closures
1. tarikkh's article on why constructors are bad.