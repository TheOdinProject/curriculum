### Introduction

We've learned about the **module pattern** in a previous lesson and played around with using them to help organize our variables and functions. At some point in the last few projects, you may have even wondered, "How would we manage more complex projects? Files would get too long! It would be great if we could split our code up into multiple files for organization!". Using multiple files would be extremely handy for this exact reason.

While the module pattern used to play a big part in helping us manage this, the release of ES6 (sometimes referred to as ES2015) gave us actual "modules" and thus they are often referred to as "ES6 modules" or "ESM".

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain what ES6 modules are and how to import and export from them.
- Describe the difference between default and named exports.
- Explain the main differences between CommonJS modules and ES6 modules.

### Before ES6 modules: The global scope problem

<div class="lesson-note" markdown="1">

Even though `let`/`const` and arrow functions were not around before ES6, we will still use them in our pre-ES6 examples. They won't change how things work regarding the global scope and the module pattern, which is the main focus of this section.

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

### Import and export

How do we actually import and export? In true JavaScript fashion, we don't have just one but two types of importing and exporting: `default` and `named`, and they essentially do the same kind of thing but very slightly differently. They can even be mixed and matched in the same file.

For now, we'll just show you the different import/export syntaxes. Afterwards, we'll show you how to link scripts as ES6 modules, as it's not quite the same as before.

#### Named exports

Let's use our `one.js` and `two.js` examples from before. First, we'll need to export our greeting and farewell strings from `one.js`.

To export something as a **named export**, we can either stick the `export` keyword in front of its declaration, or add an `export { }` somewhere in the file (typically the end), where the curly braces contain a list of the names of the things to export. Either method is fine to use, and we can export as many things as we liked as named exports.

```javascript
// one.js
export const greeting = "Hello, Odinite!";
export const farewell = "Bye bye, Odinite!";
```

Or on a separate line:

```javascript
// one.js
const greeting = "Hello, Odinite!";
const farewell = "Bye bye, Odinite!";
export { greeting, farewell };
```

Now to import these variables in `two.js`! Remember that we can control what we import, so if we only need the `greeting` variable, we could just import that on its own. If another file needed the `farewell` variable (or both), then that file could import what it needs. Don't import it? Can't use it. To do named imports, we must specify the names of the things we want to import inside `{ }` and provide the path to the file we're importing from (when we deal with importing third-party libraries later, you can just use the name of the library instead of a full file path).

Note that [you cannot use template strings for the file path](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import#module-name), only single or double-quoted strings.

```javascript
// two.js
import { greeting, farewell } from "./one.js";

console.log(greeting); // "Hello, Odinite!"
console.log(farewell); // "Bye bye, Odinite!"
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

#### Default exports

In contrast to named exports, a file can only default export a single thing. Something exported this way does not have a name attached to it, so when you import it somewhere, you can decide what name to give it.

To export something from a file as a default export, we can also do it inline by prepending `export default` to the appropriate declaration, or we can export it at the end of the file, this time *without* any curly braces. Again, either way is perfectly fine. Note that if you want to inline default export a variable, the `default` keyword *replaces* the variable declaration so you export the expression directly.

Let's default export our greeting string from `one.js`.

```javascript
// one.js
export default "Hello, Odinite!";
```

Or on a separate line:

```javascript
// one.js
const greeting = "Hello, Odinite!";
export default greeting;
```

Now in our `two.js`, we can default import that string. Remember, since we're importing something that was default exported, we can name it whatever we want. Even though the variable was called `greeting` in `one.js`, we don't have to call it that in `two.js` if we don't want to. When default importing, we don't use curly braces, which are for named importing.

```javascript
// two.js
import helloOdinite from "./one.js";

console.log(helloOdinite); // "Hello, Odinite!"
```

You can use both default and named exports in the same file. Confusingly enough, there isn't really a universally agreed-upon rule for when to use either, outside of the fact that a file can have multiple named exports but only one default export. When it comes to only needing to export a single thing from a module, some people prefer using a default export whereas some prefer using a single named export. Both work so use whatever you prefer, or if working in a team, whatever the team prefers.

Let's default export the greeting string from `one.js`, and export the farewell string as a named export.

```javascript
// one.js
export default "Hello, Odinite!";
export const farewell = "Bye bye, Odinite!";
```

We can then import them both in `two.js`. We need to default import the greeting string (which also means we can name it whatever we want) and named import the farewell string.

```javascript
// two.js
import greeting, { farewell } from "./one.js";

console.log(greeting); // "Hello, Odinite!"
console.log(farewell); // "Bye bye, Odinite!"
```

### Entry points

When we use ESM, instead of adding every JavaScript file to our HTML in order, we only need to link a single file - the **entry point**.

```html
<script src="two.js" type="module"></script>
```

Why is `two.js` our entry point? Well, in our above examples, `two.js` imports variables from `one.js`, meaning `two.js` depends on `one.js`, so we have the following **dependency graph**:

```text
importer  depends on  exporter
two.js <-------------- one.js
```

When we load `two.js` as a module, the browser will see that it depends on `one.js` and load the code from that file as well. If we instead used `one.js` as our entry point, the browser would see that it does not depend on any other files, and so would do nothing else. Our code from `two.js` would not be used, and nothing would get logged!

If we had another file, `three.js`, that exported something and `two.js` imported from it, then `two.js` would still be our entry point, now depending on both `one.js` and `three.js`.

```text
two.js <-------------- one.js
              └------- three.js
```

Or perhaps instead of `two.js`, `one.js` imports from `three.js`. In which case, `two.js` would still be our entry point and depend on `three.js` indirectly through `one.js`.

```text
two.js <-------------- one.js <-------------- three.js
```

Note that we only needed the one script tag, as the browser will handle the additional file dependencies for us. We also did not need to add the `defer` attribute, as `type="module"` will automatically defer script execution for us.

If you had coded along with the IIFE example at the start of the lesson, try rewriting the JavaScript to use `import` and `export`, and link only the entry point as a module script. Due to browser security reasons, ES6 modules cannot be loaded if you open the HTML file directly in the browser, so make sure you use Visual Studio Code's [Live Preview extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server) if you aren't already.

### CommonJS

Along the way, you may have bumped into something called CommonJS (CJS), which uses syntax like `require` and `module.exports` instead of `import` and `export`. You may remember seeing this in our JavaScript exercises in the Foundations course (you've come a long way)! This is a module system that was designed for use with Node.js that works a little differently than ESM, and is not something that browsers will be able to understand.

CJS is still used quite a lot in Node.js code, though in recent years, ESM in Node.js has been gaining popularity. For the time being, we are focused on writing code to run in the browser, so we will be spending time with ESM. If you are taking the Full Stack JavaScript pathway, then we will cover CJS in more detail later in the Node.js course.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. As per usual, you can learn most about JavaScript keywords and concepts from the MDN docs, so check out the [docs on export](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export) and [docs on import](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import). There are little extras about them we have not covered in this lesson, such as aliases and namespace imports.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Before ES6 modules, how would you privatize a variable from being accessible in other files?](#before-es6-modules-the-global-scope-problem)
- [Before ES6 modules, how would you expose variables to be accessible in later files?](#before-es6-modules-the-global-scope-problem)
- [What are some benefits of writing code in modules?](#introduction)
- [What is the difference between default and named exports?](#default-exports)
- [What is an entry point?](#entry-points)
- [How do you link a module script in HTML?](#entry-points)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- This video on [ES6 Modules by Web Dev Simplified](https://youtu.be/cRHQNNcYf6s) summarizes much of the ESM topics discussed in this lesson. At the end, he mentions `nomodule` and support for older browsers that were unable to support ESM. Nowadays, this is not a concern as ESM is supported by basically every browser in common use.
- Here is a [brief comparison of CommonJS modules and ES6 modules](https://blog.logrocket.com/commonjs-vs-es-modules-node-js/).
