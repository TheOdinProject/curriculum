### Introduction

We've learned about the **module pattern** in a previous lesson and played around with using them to help organize our variables and functions. At some point in the last few projects, you may have even wondered, "How would we manage more complex projects? Files would get too long! It would be great if we could split our code up into multiple files for organization!". Using multiple files would be extremely handy, as we could more easily separate our code into groups of related functions and values without having to scroll through one ridiculously long file.

While the module pattern used to play a big part in helping us manage this, the release of ES6 (sometimes referred to as ES2015) gave us actual "modules" and thus they are often referred to as "ES6 modules" or "ESM".

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain what ES6 modules are and how to import and export from them.
- Describe the difference between default and named exports.
- Explain the main differences between CommonJS modules and ES6 modules.
- Understand what npm is.

### Before ES6 modules: The global scope problem

<div class="lesson-note" markdown="1">

Even though `let`/`const` and arrow functions were not around before ES6, we will still use them in our pre-ES6 examples, as they won't change how things work regarding the global scope and the module pattern, which is the primary point.

</div>

Let's say we have two scripts, `one.js` and `two.js`, and we link them in our HTML as separate scripts.

```html
<script src="one.js" defer></script>
<script src="two.js" defer></script>
```

```javascript
// one.js
const greeting = "Hello, Odinite!";
```

```javascript
// two.js
console.log(greeting);
```

When we open the HTML, we see `"Hello, Odinite!"` getting logged to the console, even though `greeting` was never defined in `two.js`! That's because the two scripts were loaded one after the other into the same global scope, as if we wrote only one file with the two lines in that order. If we put the `two.js` script tag first, we would instead get an error that `greeting is not defined`, as it would try to do the console log before we define the variable.

This means that even if we use multiple JavaScript files, they will still end up sharing the same global scope. Our top-level variables are not safe!

Before ESM, we could wrap some things in an IIFE, which would cause it to run just the same, but now any variables inside them are scoped to that function and not globally.

```javascript
// one.js
(() => {
    const greeting = "Hello, Odinite!";
})();
```

Now, we get an error in the console that `greeting is not defined`, because there is no global variable called `greeting` for us to log! But what if we wanted only *some* things to be exposed to other files? We can return those things from our IIFE into the global scope and keep the other things private!

```javascript
// one.js
const greeting = (() => {
    const greetingString = "Hello, Odinite!";
    const farewellString = "Bye bye, Odinite!";
    return greetingString;
})();
```

Now, the global variable `greeting` will contain `"Hello, Odinite!"` and so our code from `two.js` successfully logs this to the console. However, our private `farewellString` variable is not global, so that cannot be accessed anywhere in `two.js`. Through this, we are able to choose what to expose from one file to be made available to all files that follow it! This is why IIFEs were often called the "module pattern", because they allowed us to write modular code across multiple files before we were given "real modules".

But now, with ESM, we no longer need to use IIFEs for this specific purpose.

### ES6 modules

With ESM, we have a little more control over things. Each file has its own private scope by default, and not only can we choose what things we export from that file, we can also choose what things we import into other files. So just because we export something, it doesn't mean it's automatically available elsewhere; it will only be available in another file if we explicitly import it there. Lots of control!

<div class="lesson-note" markdown="1">

#### Module scope is not the global scope

When using ESM, each module has its own private scope, where we use import/export to communicate between files. A top-level variable in a module will not be accessible in the global scope.

</div>

#### Entry point

When we use ESM, instead of adding every JavaScript file to our HTML in order, we only need to link a single file - the **entry point**.

Take our original `one.js` and `two.js` example and pretend we've written the import/exports using ES6 module syntax (we'll get to that shortly). `two.js` depends on `one.js` for the `greeting` variable, so we have the following **dependency graph**:

```text
        depends on
two.js <----------- one.js
```

Therefore, `two.js` is our entry point. When we load `two.js` as a module, the browser will see that it depends on `one.js` and load the code from that file as well. If we instead loaded `one.js` as our entry point, the browser would see that it does not depend on any other files, and so leave it at that. Our code from `two.js` would be ignored, and nothing gets logged!

You can add external scripts to HTML as ESM by adding only the appropriate entry point file, like this:

```html
<script src="two.js" type="module"></script>
```

Note that we did not need to link `one.js`, as the browser will handle that for us when it sees what `two.js` depends on. We also did not need to add the `defer` attribute, as `type="module"` automatically defers script execution for us.

But how do we actually import and export? Confusingly, there are two types of importing and exporting: `default` and `named`, and they can even be mixed and matched in the same file.

#### Default exports

**We can only default export a single "thing" from a single file.** Something default exported from a file does not have a name attached to it; when you import it somewhere, you can decide what to call it when importing. To export something from a file as a default export, we either add to the file `export default XXXXXX`, where `XXXXXX` is the name of the thing we want to export, or we can stick `export default` at the start of the thing to export when it's declared. Either way is fine. Note that if you `export default` a variable inline, `default` replaces `let`/`const`.

Let's see about default exporting our `greeting` variable from the original `one.js` (no IIFE).

```javascript
// one.js
const greeting = "Hello, Odinite!";
export default greeting;

// We could also default export it inline, like this
export default greeting = "Hello, Odinite!";
```

Now in our `two.js`, we can default import that string! Remember, since we're importing something that was default exported, we can name it whatever we want. It doesn't have to be called `greeting` if you don't want it to be. We just have to give it a name and provide the path to the file we're importing from.

```javascript
// two.js
import helloOdinite from "./one.js";

console.log(helloOdinite); // "Hello, Odinite!"
```

But what if you had multiple separate things to export from `one.js`?

#### Named exports

Named exports are actually exported with the name they were declared with, which means we have to import them by their name as well. We either do it inline like before just without `default` (meaning we need the `let`/`const` here) or add to the file an `export { }`, where the curly braces contain a list of the names of the things to export as named exports.

```javascript
// one.js
const greeting = "Hello, Odinite!";
const farewell = "Bye bye, Odinite!";
export { greeting, farewell };

// Or inline
export const greeting = "Hello, Odinite!";
export const farewell = "Bye bye, Odinite!";
```

Now to import these named exports in `two.js`! Remember that we can control what we import, so if we only need the `greeting` variable, we could just import that on its own! If another file needed the `farewell` variable (or both), then that file could import what it needs. The `{ }` specifies that the things inside were exported as named exports.

```javascript
// two.js
import { greeting, farewell } from "./one.js";

console.log(greeting); // "Hello, Odinite!"
console.log(farewell); // "Bye bye, Odinite!"
```

A file can both export something as a default export and any number of named exports. Confusingly enough, there isn't really a universally agreed-upon rule for when to use either, outside of the fact that a file can have multiple named exports but only one default export. Use whatever works for you, or in the future, when working in a team, whatever your team prefers if they prefer a certain system.

```javascript
// one.js
export default greeting = "Hello, Odinite!";
export const farewell = "Bye bye, Odinite!";
```

```javascript
// two.js
import greeting, { farewell } from "./one.js";
```

<div class="lesson-note lesson-note--warning" markdown="1">

#### Named imports/exports aren't the same as object literals!

Using `{ }` with named imports/exports is special syntax and is not related in any way to declaring object literals or [destructuring objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#object_destructuring).

```javascript
export { greeting, farewell };

import { greeting, farewell } from "./one.js";
```

In the above, we are not exporting an object containing `greeting` and `farewell` keys, nor are we destructuring an object with those keys when importing. We are just using named import/export syntax.

</div>

### CommonJS

Along the way, you may have bumped into something called "CommonJS" (a.k.a. CJS), which uses syntax like `require` and `module.exports`. We use this for our JavaScript exercises from Foundations! This is a module system that was designed for use with NodeJS that works a little differently than ESM, and is not something that browsers will be able to understand.

CJS is still used quite a lot in NodeJS code, though in recent years, ESM has become more popular there. For the time being, we are focused on writing code to run in the browser, so we will be spending time with ESM. If you are taking the Full Stack JavaScript pathway, then we will cover CJS in more detail later in the NodeJS course.

### npm

**npm** (no capitals!) is a package manager, a gigantic repository of plugins, libaries, and other tools, which provides us with a command-line tool we can use to install these tools (that we call "packages") in our applications. Then we will have all our installed packages' code locally, which we can then import into our own files. We can even publish our own code to npm!

You may recall installing npm in the Foundations course in order to install the Jest testing framework to do the JavaScript exercises. Funnily enough, [npm does not stand for "Node Package Manager"](https://twitter.com/npmjs/status/105690425242820608), though you will often see it referred to as such.

If you are in the Full Stack Ruby on Rails pathway, you will have already been introduced to Yarn, an alternative package manager. For this course, we will be using npm.

As our applications get more complex and more and more files are needed (whether they are our own files or files from packages we installed and imported), managing many of these dependencies can become rather troublesome, especially when packages get updated. This is even more so when we consider that we may end up sending *many* JavaScript files to the browser to download. In the next lesson, we will talk through bundlers, a tool that lets us write multiple files that are better for us to work with, then bundle them together into fewer smaller files (that do exactly the same thing) which will be sent to the browser instead.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. As per usual, you can learn most about JavaScript keywords and concepts from the MDN docs, so check out the [docs on export](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export) and [docs on import](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import). There are little extras about them we have not covered in this lesson, such as aliases and namespace imports.
1. Read a bit about npm, packages, and dependencies:
   1. [Installing packages with npm](https://docs.npmjs.com/downloading-and-installing-packages-locally).
   1. Read about [the `package.json` file](https://docs.npmjs.com/creating-a-package-json-file), the file that stores much of the information for our app, including all the packages installed in it. npm uses this file to do things like install the right packages, update to the correct versions etc.
   1. Any packages we install are called "dependencies", but if any packages are only used during the development process and their code is not needed for the user-facing app (such as the Jest testing framework), we call them [development dependencies](https://dev.to/mshertzberg/demystifying-devdependencies-and-dependencies-5ege).
1. Here is a great little [history lesson about JavaScript and managing packages across multiple files](https://peterxjang.com/blog/modern-javascript-explained-for-dinosaurs.html). Only read up to "Using a JavaScript module bundler (webpack)", as we will cover bundlers and webpack in the next lesson.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Before ES6 modules, how would you privatize a variable from being accessible in other files?](#before-es6-modules-the-global-scope-problem)
- [Before ES6 modules, how would you expose variables to be accessible in later files?](#before-es6-modules-the-global-scope-problem)
- [What are some benefits of writing code in modules?](#introduction)
- [What is an entry point?](#entry-point)
- [How do you link a module script in HTML?](#entry-point)
- [What is the difference between default and named exports?](#default-exports)
- [What is npm?](#npm)
- [What file does npm use that contains all information about dependencies?](https://docs.npmjs.com/creating-a-package-json-file)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- This video on [ES6 Modules by Web Dev Simplified](https://youtu.be/cRHQNNcYf6s) summarizes much of the ESM topics discussed in this lesson. At the end, he mentions `nomodule` and support for older browsers that were unable to support ESM. Nowadays, ESM is supported by nearly every browser, certainly ones that will be in common use, and so you will not need to worry about browser compatibility for this.
- Here is a [brief comparison of CommonJS modules and ES6 modules](https://blog.logrocket.com/commonjs-vs-es-modules-node-js/).
