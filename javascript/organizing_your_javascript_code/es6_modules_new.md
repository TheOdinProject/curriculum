### Introduction

We've learned about the **module pattern** in a previous lesson, and played around with using them to help organise our variables and functions. At some point in the last few projects, you may have even wondered "How would we manage more complex projects? Files would get too long! It would be great it we could split our code up into multiple files for organisation!". While the module pattern used to play a big part in helping us manage this, the release of ES6 (sometimes referred to as ES2015) gave us actual "modules", and thus they are often referred to as "ES6 modules".

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain what ES6 modules are, and how to import and export from them
- Describe the difference between default and named exports
- Explain the main differences between CommonJS modules and ES6 modules
- Understand what npm is

### Before ES6 modules - the global scope problem

<div class="lesson-note" markdown="1">

Even though `let`/`const` and arrow functions were not around before ES6, we will still use them in our pre-ES6 examples, as they won't change how things work regarding the global scope and the module pattern, which is the primary point.

</div>

Let's say we have 2 scripts, `one.js` and `two.js`, and we link them in our HTML as separate scripts.

```html
<script src="one.js" defer></script>
<script src="two.js" defer></script>
```

```javascript
// one.js
const greeting = "Hello, odinite!";
```

```javascript
// two.js
console.log(greeting);
```

When we open the HTML, we see `"Hello, odinite!"` getting logged to the console, even though `greeting` was never defined in `two.js`! That's because the two scripts were loaded one after the other into the same global scope, as if we wrote only one file with the two lines in that order. If we put the `two.js` script tag first, we would instead get an error that `greeting is not defined`, as it would try to do the console log before we define the variable.

This means that even if we use multiple JavaScript files, they will still end up sharing the same global scope. Our top-level variables are not safe!

Before ES6 modules, we could wrap some things in an IIFE, which would cause it to run just the same, but now any variables inside them are scoped to that function and not globally.

```javascript
// one.js
(() => {
    const greeting = "Hello, odinite!";
})();
```

Now, we get an error in the console that `greeting is not defined`, because there is no global variable called `greeting` for us to log! But what if we wanted only *some* things to be exposed to other files? We can return those things from our IIFE into the global scope, and keep the other things private!

```javascript
// one.js
const greeting = (() => {
    const greetingString = "Hello, odinite!";
    const farewellString = "Bye bye, odinite!";
    return greetingString;
})();
```

Now, the global variable `greeting` will contain `"Hello, odinite!"` and so our code from `two.js` successfully logs this to the console. However, our private `farewellString` variable is not global, so that cannot be accessed anywhere in `two.js`. Through this, we are able to choose what to exposed from one file to be made available to all files that follow it! This is why IIFEs were often called the "module pattern", because they allowed us to write modular code before we were given "real modules".

But now with ES6 modules, we no longer need to use IIFEs for this specific purpose.

### ES6 modules

With ES6 modules, we have a little more control over things. Each file has its own private scope by default, and not only can we choose what things we export from that file, we can also choose what things we import into other files. So just because we export something, it doesn't mean it's automatically available elsewhere - it will only be available in another file if we also explicitly import it there. Lots of control!

#### Entry point

When we use ES6 modules, instead of adding every JavaScript file to our HTML in order, we only need to link a single file - the **entry point**.

Take our `one.js` and `two.js` example and pretend we've written the import/exports using ES6 module syntax (we'll get to that shortly). `two.js` depends on `one.js` for the `greeting` variable, so we have the following **dependency graph**:

```text
        depends on
two.js <----------- one.js
```

Therefore, `two.js` is our entry point. When we load `two.js` as a module, the browser will see that it depends on `one.js` then load the code from that file as well. If we instead loaded `one.js` as our entry point, the browser would see that it does not depend on any other files, and so leave it at that. Our code from `two.js` would be ignored and nothing gets logged!

You can add external scripts to HTML as ES6 modules by adding only the appropriate entry point file like so:

```html
<script src="two.js" type="module"></script>
```

Note that we did not need to link `one.js`, as the browser will handle that for us when it sees what `two.js` depends on. We also did not need to add the `defer` attribute, as `type="module"` automatically defers script execution for us.

But how do we actually import and export? Confusingly, there are two types of importing and exporting, `default` and `named`, and they can even be mixed and matched in the same file.

#### Default exports



#### CommonJS

### npm

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [From inside to outside, what is the order of box-model properties?](#the-box-model)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
