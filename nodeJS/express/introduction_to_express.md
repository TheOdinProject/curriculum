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

Finally, we tell our server to listen for requests on port 3000 of our [localhost](https://simple.wikipedia.org/wiki/Localhost) (which is basically just the computer's local connection). 3000 is an arbitrary and somewhat conventional default choice, but you can technically use any unused port (e.g. Vite's dev server uses port 5173 by default). Back in your terminal, if you enter `node index.js` then all being well, you should see `My first Express app - listening on port 3000!` logged. Congratulations! Your first Express server is now running.

### A request's journey

Now that our server is running and listening on port 3000, let's send it a request. In a browser, navigate to `http://localhost:3000/` (if you omit the last `/` then the browser will invisibly add it for you). All this does is tell the browser to send a `GET` request to the `/` route of whatever server is at port 3000 of our localhost (which is our Express server!) and display in the window whatever it receives in response.

Whenever you navigate to any web URL this way, this is essentially what you are doing. Navigating to `https://theodinproject.com/paths` via the address bar is simply telling the browser to send a `GET` request to the `/paths` route at `https://theodinproject.com`.

Once you navigate to `http://localhost:3000/`, you should see `Hello, world!` appear in the window. Let's break down how our Express code above got us here.

When our server receives our `GET` request, Express stores the request in a [`request` object](https://expressjs.com/en/4x/api.html#req). This request gets passed through a chain of functions we call `middleware functions` until eventually, a middleware function tells Express to actually respond to the request and to end the process there.

In our example, the request comes through as a `GET` request to the `/` route. This matches the route handler we have.

```javascript
app.get("/", (req, res) => res.send("Hello, world!"));
```

We will break down routes and route handlers in more detail in a later lesson, but to summarise the above line, it tells Express "if a `GET` request comes through to the `/` route, run the request through the following chain of middleware functions". Here, we only have a single middleware function in this chain.

Express takes the callback function we gave it and passes the request object into the first parameter, and a [`response` object](https://expressjs.com/en/4x/api.html#res) into the second parameter. Our callback tells the response object to respond to the request by `.send`ing the string `"Hello, world!"`.

There is no more code to run, the function returns and Express has been told to respond to the request. Therefore, Express ends the request here. Meanwhile, the browser receives our server's response and displays it on screen, which is our `"Hello, world!"` string. We could send nearly anything in response. We could even [tell Express to send a file](https://expressjs.com/en/api.html#res.sendFile).

### Nodemon

When you run your server with `node index.js`, if you make any changes to any of the server's files, these changes will not be reflected in the server unless you restart it by interrupting the process and rerunning `node index.js`. Similar to how Webpack and Vite's dev servers would restart and rebuild your site when you make a change to a file, you can use [Nodemon](https://www.npmjs.com/package//nodemon) to run your `index.js` file. Any changes to JavaScript and JSON files in the project directory will automatically make Nodemon restart your server. Convenient!

Our recommendation would be to add it as a dev dependency and write an npm script that runs `nodemon index.js`.

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
