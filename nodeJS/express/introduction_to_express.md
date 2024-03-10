### Introduction

In the previous lesson, you got up and running with Node. You learned how to read and write data from files on the server, and use those to serve up a multi-page website. You may have found this a somewhat verbose and cumbersome process and may have even wondered how on Earth we would manage more complex procedures.

In this course, we are going to be using a backend framework called [Express](https://expressjs.com/). It will handle some of the more cumbersome things for us, and make the things we did previously far simpler. Express itself is an intentionally barebones and unopinionated framework; it allows us to do many things how we want, and to extend it with only the features we need. While this gives us great flexibility in how we do things, it can be a little tricky deciding between multiple viable options at times.

Going forward, we will be diving into how we can use Express in various ways, such as to create a full stack application utilising the `Model View Controller` (MVC) pattern, as well as to create a REST API just like ones you will have used before for things such as the Weather App project or the React Shopping Cart. Along the way, we will be learning about things like databases, authentication, and much more. There is a lot to take in, so take it steady and do not be afraid to ask our community for help in [our Discord server](https://discord.gg/theodinproject)!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what Express is.
- Describe the relationship between Express and Node.
- Set up a basic Express server.
- Describe how an incoming request is processed and ultimately responded to by the server.
- Describe what a middleware function is.
- Describe how to use `nodemon` to automatically restart your application when a change is made.

### Setting up Express

Let's make a basic Express app. You can start by running `npm init` and filling in each option to create a `package.json`. Once that's created, we can install the Express dependency.

```bash
npm install express
```

We can now create an `index.js` file that will serve as the starting point for our Express server. We could name this anything we want - common alternatives are `app.js` and `main.js`, but since the default option for setting up your `package.json` is `index.js`, we will go with that. Inside that file, we will have the following:

```javascript
const express = require("express");
const app = express();

app.get("/", (req, res) => res.send("Hello, world!"));

const PORT = 3000;
app.listen(PORT, () => console.log(`My first Express app - listening on port ${PORT}!`));
```

Let's break this down. Firstly, we import `express` using `require()`, then we call it to create the actual server that we store in the `app` variable. While you can technically do this here in one line via `const app = require("express")();`, very often you will need features that come from properties on `express`. Many of these features will be covered in later lessons.

We then have a `route handler` - the line beginning with `app.get`. We will come back to this in a moment.

Finally, we tell our server to listen for requests on port 3000. 3000 is just an arbitrary and somewhat conventional default choice, but you can technically use any unused port (e.g. Vite's dev server uses port 5173 by default). Back in your terminal, if you enter `node index.js` then all being well, you should see `My first Express app - listening on port 3000!` logged. Congratulations! Your first Express server is now running.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. A RESOURCE ITEM
   - AN INSTRUCTION ITEM
1. A PRACTICE ITEM
   - A TASK ITEM

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
