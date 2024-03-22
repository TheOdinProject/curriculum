### Introduction

You know *what* React is and you might even have an idea of *where* to use it. Now, it's time to start figuring out *how*.

This lesson is going to cover starting a new React project on your machine, as well as some useful tools to help you along the way. We'll also explain some of the problems that may arise (and how to avoid them).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How React projects can be created.
- How to use Vite to create new React projects.
- How to format the code in React projects.
- What React Developer Tools are.

### Many paths

There are multiple ways to start using React in your projects, from attaching a set of `<script>` tags which serve React from a [CDN](https://en.wikipedia.org/wiki/Content_delivery_network), to robust [toolchains](https://en.wikipedia.org/wiki/Toolchain) and [frameworks](https://en.wikipedia.org/wiki/Web_framework) that are highly configurable and allow for increased scalability and optimization.

Some examples of these toolchains include:

- [Vite's React Config](https://vitejs.dev/)
- [Gatsby](https://www.gatsbyjs.com/)
- [NextJS](https://nextjs.org/)
- [Create React App](https://create-react-app.dev/) (Deprecated)

Why do we need these toolchains? Can't we just make our own as we see fit?

Yes, but it's *hard*. React is a complex beast and there are many moving parts. Before you can start writing any sort of code that provides functionality, you would need to configure *at least* the following:

- Package Management ([NPM](https://www.npmjs.com/), [Yarn](https://yarnpkg.com/))
- Module bundling ([Webpack](https://webpack.js.org/), [Parcel](https://parceljs.org/))
- Compilation ([Babel](https://babeljs.io/))
- React itself

All of this, and sometimes *much more* is required to get a React project and development environment up and running.

<div class="lesson-note" markdown=1>

#### A note on Create React App

Create React App, or CRA, was the official way to scaffold new React projects since its introduction in 2016. Unfortunately, owing to many reasons, CRA was deprecated in early 2023. Read this [extensive comment by one of React's maintainers](https://github.com/reactjs/react.dev/pull/5487#issuecomment-1409720741) if you're curious. Due to CRA's popularity, you'll see it mentioned in many tutorials and guides. However, it's no longer recommended to use for new projects.

</div>

### Simplifying the process

Now that you understand what is involved with starting a React project from scratch, you can breathe a sigh of relief to learn that we can get started with a *single terminal command*.

Vite builds frontend tools for developers and it leverages the latest technologies under the hood to provide a great developer experience. Fortunately, it also caters to the React ecosystem. We will use Vite's CLI to quickly create a template React project. It requires minimal configuration and provides extremely useful tools right out of the box, allowing us to get straight to the learning. Let's get started!

### Creating a React app

Please make sure that you are using the *LTS version of Node*, otherwise errors may occur. Fire up a terminal instance, `cd` into the folder containing your projects, and enter the following command:

```bash
npm create vite@latest my-first-react-app -- --template react
```

If you see the following output, enter `y` and then press <kbd>enter</kbd>:

```bash
Need to install the following packages:
  create-vite@5.X.X
Ok to proceed? (y)
```

Once the command has executed, it should output the next steps for you to follow:

```bash
cd my-first-react-app
npm install
npm run dev
```

Provided everything has gone according to plan, head over to `localhost:5173`, where you'll be greeted with the following page:

![Vite React template homepage](https://cdn.statically.io/gh/TheOdinProject/curriculum/73199c4e9e43e8d87f8759e026c13b63fcfe73c7/react/introduction/setting_up_a_react_environment/imgs/vite_react_homepage.png)

Congratulations! You've created your first React app.

<div class="lesson-note lesson-note--tip" markdown=1>

As you might've noticed by now, you can replace `my-first-react-app` with the name of your project.

</div>

### Delving deeper

Let's take a closer look at our new project. Inside you will find some folders, as well as `package.json`, `package-lock.json`, `.gitignore`, and `README.md` files. The `README.md` contains some useful information that you should take the time to skim through now.

The `public` folder is where all of the static assets related to your app will go. This could include images, icons, and information files for the browser.

Inside the `src` folder is where you will find the code that runs your app. The `main.jsx` file here serves as the entry point of the application. Let's open the `main.jsx` file and see if we can understand what's going on:

```jsx
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
```

Whoa! There's quite a lot here. You are not expected to recognize much of this (if any) right now. Here's a brief rundown of what is happening:

1. We import `React` itself and its fellow `ReactDOM` package.
1. We import the `App` component from `App.jsx`, so that we may place (render) it within the DOM.
1. We import some CSS styling (you may recognize this syntax from the Webpack material).
1. We create a `root` object by invoking `ReactDOM.createRoot` with an element from our `index.html`.
1. We invoke the `render` method which is attached to our `root` object, with some very interesting-looking syntax inside the parentheses.

All of this may look different from anything you've seen, but have no fear! Once you've finished this course, you'll know exactly what all of this does, and *much more*.

### Keeping it clean

The starter project ships with [ESLint](https://eslint.org/). If you haven't been doing it or simply forgot about it from our [linting lesson](https://www.theodinproject.com/lessons/node-path-javascript-linting), be sure to also set up [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier) to help keep your React code as clean as can be.

### Developer tools

As you progress with React, your projects will undoubtedly become larger and larger and include more and more components, with increasing levels of functionality.

When this happens, it's useful to be able to track (and make live changes to) the moving parts inside of your app for understanding and debugging your code. To this end, we can use a Chrome extension called [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en).

We recommend installing this and becoming comfortable using it as early as possible as it's an invaluable tool for effective React development.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Review this material by reading through [Vite's Getting Started Page](https://vitejs.dev/guide/).
1. Check out this [guide for React Developer Tools](https://web.archive.org/web/20230127083036/https://www.pluralsight.com/guides/debugging-components-with-react-developer-tools) to begin learning how to use it (don't worry if you don't understand some of the details yet).
1. Try to clean up your `my-first-react-app` project so that it no longer displays the default page. See if you can get it to display a "Hello, World!" message instead.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are some of the ways we can start a new React project?](#many-paths)
- [Why should we initially be using pre-made toolchains instead of making our own?](#many-paths)
- [What is Vite and why would we use it?](#simplifying-the-process)
- [What command can we run to scaffold a new React project using Vite?](#creating-a-react-app)
- [What is in the `public` folder?](#delving-deeper)
- [What is in the `src` folder?](#delving-deeper)
- [Why are the React Developer Tools useful?](#developer-tools)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
