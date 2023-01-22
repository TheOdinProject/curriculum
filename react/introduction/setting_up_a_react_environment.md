### Introduction

You now know _what_ React is, you might even have an idea of _where_ to use it, it's time to start figuring out _how_. 

This lesson is going to cover starting a new React project on your own machine, as well as some useful tools to help you along the way. We'll also explain some of the problems that may arise (and how to avoid them).

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

* How React projects can be created.
* How to use Create React App.
* How to format the code in React projects.
* What are React Developer Tools.

### Many Paths

There are multiple ways to start using React in your projects, from attaching a set of `<script>` tags which serve React from a [CDN](https://en.wikipedia.org/wiki/Content_delivery_network), to robust [toolchains](https://en.wikipedia.org/wiki/Toolchain) and [frameworks](https://en.wikipedia.org/wiki/Web_framework) that are highly configurable and allow for increased scalability and optimization.

Some examples of these toolchains:

* [Create React App](https://create-react-app.dev/)
* [Vite's React Config](https://vitejs.dev/)
* [Gatsby](https://www.gatsbyjs.com/)
* [NextJS](https://nextjs.org/)

Why do we need these toolchains? Can't we just make our own as we see fit?

Yes, but it's _hard_. React is a complex beast and there are many moving parts. Before you can start writing any sort of code that provides functionality, you would need to configure _at least_ the following:

* Package Management ([NPM](https://www.npmjs.com/), [Yarn](https://yarnpkg.com/))
* Module bundling ([Webpack](https://webpack.js.org/), [Parcel](https://parceljs.org/))
* Compilation ([Babel](https://babeljs.io/))
* React itself

All of this, and sometimes _much more_ is required to get a React project and development environment up and running.

### Simplifying The Process

Now that you understand what is involved with starting a React project from scratch, you can breathe a sigh of relief as you learn that we can get started with a _single terminal command_.

This terminal command is a feature of the beginner-friendly [Create React App](https://create-react-app.dev/), or CRA for short, a tool developed by the folks over at Meta which we will be using from here on out. It requires minimal configuration and provides extremely useful tools straight out of the box, allowing us to get straight to the learning. Let's get started!

### Creating A React App

Fire up a terminal instance, `cd` over to the folder containing your projects and enter the following command:

~~~
npx create-react-app my-first-react-app
~~~

Note that we use `npx` here (not `npm`), this is not a typo, `npx` is a package runner that allows the execution of packages without them being installed locally on your machine. [Check out this Geeks for Geeks article on the difference between `npx` and `npm`.](https://www.geeksforgeeks.org/what-are-the-differences-between-npm-and-npx/)

Once this process has completed, we should confirm that all has gone well:

~~~
cd my-first-react-app
npm start
~~~

Provided that everything has gone according to plan, you should be greeted with a new browser tab containing a lovely spinning React logo:

![Create React App Starting Page](https://cdn.statically.io/gh/TheOdinProject/curriculum/57b310c24455ef4862b08a7828fd7a912e80a34a/react/introduction/setting_up_a_react_environment/imgs/cra_start.png)

Congratulations! You've created your first React app.

### Delving Deeper

Let's take a closer look at our new project. Inside you will find some folders, as well as `package.json`, `package-lock.json`, `.gitignore`, and `README.md` files. The `README.md` contains some useful information that you should take the time to skim through now.

The `public` folder is where all of the static assets related to your app will go. This could include images, icons, information files for the browser, and perhaps most importantly—the `index.html` file.

Inside of the `src` folder is where you will find the code that runs your app. The `index.js` file here serves as the entry point of the application. Let's open the `index.js` file and see if we can understand what's going on:

~~~js
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
~~~

Whoa! There's quite a lot here. You are not expected to recognize much of this (if any) right now. Here's a brief rundown of what is happening here:

1. We import `React` itself, and its fellow `ReactDOM` package.
2. We import some CSS styling (you may recognize this syntax from the Webpack material).
3. We import the `App` component from `App.jsx`, so that we may place (render) it within the DOM.
4. We import the `reportWebVitals()` function, which can be used for app analytics.
5. We create a `root` object by invoking `React.createRoot` with an element from our `index.html`.
6. We invoke the `render` method which is attached to our `root` object, with some very interesting looking syntax inside the parentheses.
7. We call the function `reportWebVitals()`, at this stage this can safely be ignored.

All of this may understandably look unlike anything you've seen up until now, but have no fear, once you've spent the time with this course, you'll know exactly what all of this does, and _much more_.

### Keeping It Clean

Another of the useful features of Create React App is that it ships with [ESLint](https://eslint.org/). You could also set up [Prettier](https://prettier.io/) to help keep your React code as clean as can be.

### Developer Tools

As you progress with React, your projects will undoubtedly become larger and larger, and include more and more components, with increasing levels of functionality.

When this happens, it becomes very useful to be able to track (and make live changes to) the moving parts inside of your app for the purposes of understanding and debugging your code. To this end we can make use of a Chrome extension called [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en).

We recommend installing this and becoming comfortable with using it as early as possible as it is an invaluable tool for effective React development.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Review this material by reading through [CRA's Getting Started page](https://create-react-app.dev/docs/getting-started).
2. Check out this [guide for React Developer Tools](https://www.pluralsight.com/guides/debugging-components-with-react-developer-tools) to begin learning how to utilize it effectively (don't worry if you can't yet understand some of the language).
3. Try to clean up your `my-first-react-app` project so that it no longer displays the default page, see if you can get it to display a "Hello, World!" message instead.
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

* <a class="knowledge-check-link" href="#many-paths">What are some of the ways we can start a new React project?</a>
* <a class="knowledge-check-link" href="#many-paths">Why should we initially be using premade toolchains instead of making our own?</a>
* <a class="knowledge-check-link" href="#simplifying-the-process">What is Create React App, why would we use it?</a>
* <a class="knowledge-check-link" href="#creating-a-react-app">What command can we run to scaffold a new React project using CRA?</a>
* <a class="knowledge-check-link" href="#delving-deeper">What is in the `public` folder?</a>
* <a class="knowledge-check-link" href="#delving-deeper">What is in the `src` folder?</a>
* <a class="knowledge-check-link" href="#developer-tools">Why are the React Developer Tools useful?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

* [Creating a React Application by The Net Ninja](https://www.youtube.com/watch?v=kVeOpcw4GWY)
