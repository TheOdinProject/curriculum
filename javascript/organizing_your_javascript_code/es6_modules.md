### Introduction

Separate from the **module pattern** that we discussed in an earlier lesson, "modules" is a feature that arrived with ES6. ES6 modules are starting to appear in many code bases around the net and getting them up and running will give us a chance to explore some new parts of the JavaScript ecosystem, so it's going to be a worthy excursion!

Don't be fooled! We're going to cover much more than just the new module syntax in this lesson! Before we can really *use* these modules, we're going to have to learn about **npm** and **webpack**, which are both topics that will be *very* useful to you even beyond this lesson. In the end, the modules themselves are simple to implement, so we're going to take this chance to learn about a few other things.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain what npm is and where it was commonly used before being adopted on the frontend.
- Describe what `npm init` does and what `package.json` is.
- Know how to install packages using npm.
- Describe what a JavaScript module bundler like webpack is.
- Explain what the concepts "entry" and "output" mean in relation to webpack.
- Briefly explain what a development dependency is.
- Explain what "transpiling code" means and how it relates to front-end development.
- Briefly describe what a task runner is and how it's used in front-end development.
- Describe how to write an npm automation script.
- Explain one of the main benefits of writing code in modules.
- Explain "named" exports and "default" exports.

### The history of JavaScript

Why do we even need or want this stuff? What do you gain from all of this added complexity? These are good questions... with good answers.

- Read [this article](https://peterxjang.com/blog/modern-javascript-explained-for-dinosaurs.html) for a bit of a history lesson. It's long, but it puts what we're doing here in great perspective. This article is a bit older, and those who have coded along with the example have frequently run into issues, so we don't suggest that you code along (you'll be following along with the official Webpack documentation later). Nevertheless, this article is extremely important conceptually and really clarifies the 'WHY' of the rest of this lesson.

### npm

The **node package manager** is a command-line tool that gives you access to a gigantic repository of plugins, libraries and tools. If you have done our Fundamentals course, you will probably have encountered it when you [installed the Jest testing framework](https://github.com/TheOdinProject/javascript-exercises#how-to-use-these-exercises) to do our exercises.

Read through the npm links below but don't worry about running any of the commands on your computer. This section is about growing your awareness of npm. You will have an opportunity to use what you learn here in upcoming projects.

1. Take a couple minutes to read the [About npm](https://docs.npmjs.com/getting-started/what-is-npm) page - a great introduction to npm.
1. [This tutorial](https://docs.npmjs.com/downloading-and-installing-packages-locally) teaches you how to install packages with npm.
1. [This tutorial](https://docs.npmjs.com/creating-a-package-json-file) covers the `package.json` file, which you can use to manage your project's dependencies.
1. Read [this article on development dependencies](https://dev.to/moimikey/demystifying-devdependencies-and-dependencies-5ege) to learn what they are and how to use them. **NOTE:** The author of the article clarifies something potentially confusing in [this comment](https://dev.to/moimikey/demystifying-devdependencies-and-dependencies-5ege#comment-5ea4). After reading about and practicing with Webpack in this lesson, you should come back to the aforementioned comment and understand what they meant.
1. If you run into trouble at any point you can check out [the official docs page](https://docs.npmjs.com/) for more tutorials and documentation.

### Yarn?

At some point, you will probably run into [Yarn](https://yarnpkg.com/en/) - a replacement for the default `npm`. For the most part, it does the same things, though it *does* have a few more features. Recent versions of `npm` have incorporated some of the best features of Yarn, so using it won't offer you any real advantages at this point in your career. It *is* a fine package manager, however, and may be worth your consideration in the future.

### Webpack and bundlers

So far, your projects have had relatively basic file structures. As project complexity grows, so too will the benefits of well-organized code. A project consisting of a single, long file with lots of code can be made easier to navigate and maintain by being broken down into multiple smaller files (modules). Further benefits of writing code in modules will come below when we introduce ES6 modules.

But there's a problem! The browser would need to make a separate HTTP request for each file. The more files you have, the more costly this becomes, particularly on slower networks and would only increase if you also imported third-party libraries into your app.

What if we had a way to write multiple files and/or import multiple third-party libraries but eventually combine them all into fewer files at the end so the browser did not have to make so many requests?

Enter bundlers. Give a bundler a starting file (an entry point) and it will build a dependency graph of the modules and dependencies starting from that file, then combine them into a single output file. Provide multiple entry points and it will do the same for each separately. You can read more about why we use bundlers and how they work in [this short article](https://snipcart.com/blog/javascript-module-bundler).

Webpack is one such tool for bundling modules. There is a lot of talk across the net about how difficult and complex it is to set up and use, but at the moment our needs are few and the setup is basic enough. In fact, you can see an example of getting it up and running on the front page of [their website](https://webpack.js.org/).

Webpack *is* a very powerful tool, and with that power comes a decent amount of complexity. Don't let it scare you off! The basic configuration is not difficult and proficiency with webpack looks *amazing* on resumes.

To get us started, we are going to refer to the official documentation.

1. Code along with all of the steps of [this tutorial](https://webpack.js.org/guides/getting-started/) ("Basic Setup" through "Conclusion").

Let's discuss what's going on there. After installing webpack using npm, we set up a project that required an external library (lodash - check it out [here](https://lodash.com/) if it's new to you) using a `script` tag. The site lists a few reasons why this is probably *not* ideal and then steps through using webpack to accomplish the same thing.

Let us revisit two key words mentioned earlier - **entry** and **output**. In the above link's example, we rearranged the files into a `src` and `dist` folder. Technically, we could have called those folders anything, but those names are typical. `src` is our *source* directory. In other words, `src` is where we write all of the code that webpack is going to bundle up for us. When webpack runs, it goes through all of our files starting at any entry points we give it, looks for any `import` statements and then compiles *all* of the code we need to run our site into a single file per entry point inside of the `dist` folder (short for *distribution*). In this example, we have a single entry point - `/src/index.js`. The **output** file is the compiled version - `dist/main.js`.

- Browse [this document](https://webpack.js.org/concepts/) for more details. We'll talk plugins and loaders in another lesson.

### ES6 modules (finally!)

Before ES6, there was no straightforward way to handle multiple JavaScript files for a single page in a browser. Outside of the browser, in a runtime like Node (remember how you used Node to run the Jest tests for the JavaScript exercises back in the Foundations course?), you could use something called `CommonJS modules` but that was only for Node and not the browser. Fortunately, we now have ES6 modules which work in both (although Node still uses CommonJS by default and you need to do a tiny bit of tweaking to get it to understand ES6 module syntax).

Now that we (sorta) understand what webpack is doing, it's time to discuss the syntax for ES6 modules (otherwise known as ESM). There are only 2 components to it - **import** and **export**.

The import statement is the same thing that you used during the webpack tutorial so it should be familiar by now.

```javascript
// a file called functionOne.js
const functionOne = () => console.log('FUNCTION ONE!');

export { functionOne };
```

```javascript
// another JS file
import { functionOne } from './functionOne';

functionOne(); // this should work as expected!
```

There are *many* benefits to writing your code in modules. One of the most compelling is code reuse. If, for instance, you have written some functions that manipulate the DOM in a specific way, putting all of those into their own file as a 'module' means that you can copy that file and reuse it very easily!

There are also the same benefits as when using factory functions or the module pattern (the module pattern and ES6 modules are not the same things; this naming convention is frustrating). With the introduction of ES6 Modules, the module pattern (IIFEs) is not needed anymore, though you might still encounter them in the wild. When using ES6 modules, only what is exported can be accessed in other modules by importing. Additionally, any declarations made in a module are not automatically added to the global scope. By using ES6 modules, you can keep different parts of your code cleanly separated, which makes writing and maintaining your code much easier and less error-prone. Keep in mind that you can *definitely* export constructors, classes and factory functions from your modules.

To pull it all together, let's write a module and then include it in our code. We are going to continue from where the webpack tutorial left off. Before beginning, your file directory should look something like this:

```
├── dist
│   ├── main.js
│   └── index.html
├── src
│   └── index.js
├── package-lock.json
├── package.json
└── webpack.config.js
```

In addition, you should be able to bundle and run webpack by typing `npx webpack` in the terminal, (or `npm run build` if you're using the example project created on the previous section.) .

Add a new file to the `src` directory called `myName.js` with the following contents:

``` javascript
const myName = (name) => 'Hi! My name is ' + name;

export default myName;
```

Then, in `src/index.js`, import and use your new function:

```javascript
// import your function
import myName from './myName';

function component() {
  const element = document.createElement('div');

  // use your function!
  element.textContent = myName('Cody');
  return element;
}

document.body.appendChild(component());
```

Easy! Now, if you run `npx webpack` in your project directory, your page should show our new function being used.

There are two different ways to use exports in your code: named exports and default exports. Which option you use depends on what you're exporting. Take a moment to look at the [MDN documentation about the export declaration](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export) and the [MDN documentation about the import declaration](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import) which give great examples for the different syntax on import and export.

Here is an example with named exports, which you will most often use when you have multiple values to export in a module:

```javascript
// a file called myModule.js
const functionOne = () => 'ONE';
const functionTwo = () => 'TWO';

export {
  functionOne,
  functionTwo
};
```

And to import them:

```javascript
// index.js in /src folder
import {functionOne, functionTwo} from './myModule';
```

Using this pattern gives you the freedom to only import the functions you need in the various files of your program. So it's perfectly fine to only import `functionOne` if that's the only one you need.

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [Explain what npm is and where it was commonly used before being adopted on the frontend.](https://peterxjang.com/blog/modern-javascript-explained-for-dinosaurs.html)
- [Describe what `npm init` does and what `package.json` is.](https://docs.npmjs.com/creating-a-package-json-file)
- [Know how to install packages using npm.](https://docs.npmjs.com/downloading-and-installing-packages-locally)
- [Describe what a JavaScript module bundler like webpack is.](https://peterxjang.com/blog/modern-javascript-explained-for-dinosaurs.html)
- [Explain what the concepts "entry" and "output" mean in relation to webpack.](#webpack-knowledge-check)
- [Briefly explain what a development dependency is.](https://dev.to/moimikey/demystifying-devdependencies-and-dependencies-5ege)
- [Explain what "transpiling code" means and how it relates to frontend development.](https://peterxjang.com/blog/modern-javascript-explained-for-dinosaurs.html)
- [Briefly describe what a task runner is and how it's used in frontend development.](https://peterxjang.com/blog/modern-javascript-explained-for-dinosaurs.html)
- [Describe how to write an npm automation script.](https://peterxjang.com/blog/modern-javascript-explained-for-dinosaurs.html)
- [Explain one of the main benefits of writing code in modules.](#module-knowledge-check)
- [Explain "named exports" and "default exports".](#exports-knowledge-check)

### Additional resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental.

- [Watch this video about ES6 Modules by Web Dev Simplified](https://youtu.be/cRHQNNcYf6s) if you find video lessons easier to absorb. It covers the same topics as discussed in this lesson.
- Here is [a brief comparison of CommonJS modules and ES6 modules](https://blog.logrocket.com/commonjs-vs-es-modules-node-js/).
