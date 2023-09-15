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

These fancy sounding functions work very similar to how constructors did, but with one key difference - they levy the power of closures. Instead of using `new` to create an object, factory functions simply set up and return the new object when you call the function.

### Assignment

1. wesbos article on scoping
1. mdn article on closures
1. tarikkh's article on why constructors are bad.