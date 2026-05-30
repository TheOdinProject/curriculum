### Introduction

Test Driven Development, or TDD for short, is a *big* deal in the modern development landscape. This is a concept that we introduced way back in our Fundamentals section with our JavaScript Exercises. The main idea is that you start working on your code by writing automated tests *before* writing the code that is being tested. There are tons of benefits to working like this, all of which will be discussed in the resources below.

There are many test-running systems available in JavaScript: [Mocha](https://mochajs.org/), [Jasmine](https://jasmine.github.io/), [Tape](https://github.com/substack/tape) and [Jest](https://jestjs.io/) to name a few. Fortunately, the syntax for each one is very similar. They all have their own set of special features, but the basic syntax is almost identical, so in the end it doesn't matter which one you use. In fact, picking which library to use for this curriculum has been quite tricky!  

This lesson is going to center around **Jest**. We have found that it has one of the best resources for explaining JavaScript testing, as well as fantastic documentation. In the end, writing tests is less about the syntax and more about the TDD philosophy.  The most important issues are knowing **why** we write tests and **what** we test rather than how.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain the basics of TDD.
- Get up and running with Jest.
- Write basic tests.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read about the [basic process and the benefits of TDD](https://web.archive.org/web/20211123190134/http://godswillokwara.com/index.php/2016/09/09/the-importance-of-test-driven-development/).
1. Watch at least the first 3 videos of [the Unit Testing in JavaScript video series](https://www.youtube.com/playlist?list=PL0zVEGEvSaeF_zoW9o66wa_UCNE3a7BEr).
1. Follow along to [Jest's Getting Started tutorial](https://jestjs.io/docs/getting-started) until you reach the "Additional Configuration" section. Jest also provides global variables like `test` and `expect`, but if you're using ESLint, you'll need to explicitly import these in your test files to prevent linting errors (see the "Using ESLint" section in the same tutorial).

   <div class="lesson-note lesson-note--tip" markdown="1">

   #### Using ES6 import statements with Jest

   By default, the current version of Jest will not recognize ESM, which is why you will see their guides use CJS syntax (e.g. `module.exports`). In order for you to be able to use ESM with Jest, you will need to do following:

   1. Install `@babel/preset-env`:

      ```bash
      npm install --save-dev @babel/preset-env
      ```

   1. Create a `babel.config.js` in the project root with the following contents:

      ```javascript
      export default {
        presets: [["@babel/preset-env", { targets: { node: "current" } }]],
      };
      ```

   This will allow you to write ESM's `import`/`export` syntax instead of `require`/`module.exports`; you do not need to change anything else in the guide and Jest can be run as normal. Behind the scenes, Babel will convert your ESM to CJS before running Jest (it won't overwrite your actual files as this all happens in memory).

   </div>

1. Read and follow the [Using Matchers](https://jestjs.io/docs/using-matchers) document on the main Jest website.  This one demonstrates some of the other useful functions you can use in your tests.
1. This article explains more about [the why/how and value behind TDD](https://jrsinclair.com/articles/2016/one-weird-trick-that-will-change-the-way-you-code-forever-javascript-tdd/) and also includes some great examples of how to apply it.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the benefits of TDD?](https://web.archive.org/web/20211123190134/http://godswillokwara.com/index.php/2016/09/09/the-importance-of-test-driven-development/)
- [What are some common jest matchers?](https://jestjs.io/docs/using-matchers#common-matchers)
