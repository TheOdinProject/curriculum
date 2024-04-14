### Introduction

In the previous section, you got up and running with Node. You learned how to read and write data from files on the server, allowing you to serve up a multi-page website. You may have found this process somewhat verbose and cumbersome, and may have even wondered how on Earth we would manage more complex use cases.

In this course, we will be using a backend framework called [Express](https://expressjs.com/), which will handle many of the implementation details for us. Express itself is an intentionally barebones and unopinionated framework; it allows us to do many things how we want, and to extend it with only the features we need. However, while this gives us great flexibility in how we do things, it can be a little tricky deciding between multiple viable options at times.

Going forward, we will be diving into how we can use Express in various ways, such as to create a full-stack application using the Model View Controller (MVC) pattern, as well as to create a REST API just like ones you will have used before for things such as the Weather App or the React Shopping Cart projects. There is a lot to take in, so take it steady, and do not be afraid to ask our community for help in the [TOP Discord server](https://discord.gg/theodinproject)!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Set up a basic Express server.
- Describe how an incoming request is processed and ultimately responded to by the server.
- Describe what a middleware function is.
- Describe how to use `nodemon` to automatically restart your application when a change is made.

### Setting up Express

Let's make a basic Express app. Inside a new directory, start by running `npm init -y` to create a `package.json`. Once that's created, we can install the Express dependency.

```bash
npm install express
```

We can now create an `app.js` file that will serve as the starting point for our Express server. We could name this file anything we want, such as `index.js` or `main.js`, but we will use the same name used in the Express documentation. Inside `app.js`, we will have the following:

```javascript
const express = require("express");
const app = express();

app.get("/", (req, res) => res.send("Hello, world!"));

const PORT = 3000;
app.listen(PORT, () => console.log(`My first Express app - listening on port ${PORT}!`));
```

Let's break this down. We import `express` then call it to initialize the `app` variable. This is our server.

We then have a `route` - the line beginning with `app.get`. We will come back to this in a moment.

Finally, we tell our server to listen for incoming requests requests on whatever port we specify in our  of our [localhost](https://simple.wikipedia.org/wiki/Localhost) (which is basically just the computer's local connection). While port 3000 is the default choice, you can use any unused port (for example, Vite's dev server uses port 5173 by default). Back in your terminal, if you run `node app.js` then all being well, you should see `My first Express app - listening on port 3000!` logged.

Congratulations! Your first Express server is now running.

<div class="lesson-note" markdown="1">

#### The port variable

For demonstration purposes, we hardcoded a fixed port number above. Usually, the port number would come from an environment variable with a fallback value in case the environment variable does not exist.

```javascript
const PORT = process.env.PORT || 3000;
```

If the specified port is already in use, we can change the environment variable value without editing the source code. Also, some hosting services configure their own ports which may differ from a fix value hardcoded in.

</div>

### A request's journey

Now that our server is up and running on port 3000, let's send it a request! In a browser, navigate to `http://localhost:3000/` (don't worry if you forget the slash `/` at the end; the browser will silently add it for you if so). This action tells the browser to send a `GET` request to the `/` path of whatever server is listening at port 3000 on our localhost (which is our Express server!) and display in the window whatever it receives in response.

Whenever you navigate to any web URL this way, this is essentially what you are doing. Navigating to `https://theodinproject.com/paths` via the address bar is just telling the browser to send a `GET` request to the `/paths` path at `https://theodinproject.com`, then display what it receives in response.

Once you navigate to `http://localhost:3000/`, you should see `Hello, world!` appear in the window. Magic, right?

When our server receives our `GET` request, Express stores the request in a [request object](https://expressjs.com/en/4x/api.html#req). This request gets passed through a chain of functions we call `middleware functions` until eventually, a middleware function tells Express to respond to the request.

In our example, the request comes through as a `GET` request to the `/` path. This matches the route we have in our `app.js` file.

```javascript
app.get("/", (req, res) => res.send("Hello, world!"));
```

We will discuss routes in more detail in a later lesson, but to summarise the above line, it tells Express: "if a `GET` request comes through to the `/` path, pass the request through the following chain of middleware functions". Here, we only have a single function.

If we had defined multiple routes, Express would pass the request through the first route that matched the requested HTTP verb (e.g. `GET`) and path (`/`). The order of the routes matters!

Express takes the callback function we gave it and passes the request object into the first parameter (conventionally named `req`), and a [response object](https://expressjs.com/en/4x/api.html#res) into the second parameter (`res`). Our callback tells the response object to respond to the request by `.send`ing the string `"Hello, world!"`.

There is no more code to run and the function returns. Since Express has been told to respond to the request, it ends the request-response cycle. Meanwhile, the browser receives our server's response and displays it on screen, which is our `"Hello, world!"` string. We could send nearly anything in our response. We could even [tell Express to send a file](https://expressjs.com/en/api.html#res.sendFile).

### Nodemon

When you run your server with `node app.js`, any changes to any JavaScript and JSON files in your project directory won't be reflected automatically unless you manually interrupt and rerun `node app.js`. To avoid this manual process, you can use [Nodemon](https://www.npmjs.com/package//nodemon) to run your `app.js` file. Nodemon will automatically restart your server any time it detects a change, similar to Webpack and Vite's dev servers.

Our recommendation would be to add Nodemon as a dev dependency and add an npm script that runs `nodemon app.js`.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Spend a few minutes exploring the [Express documentation](https://expressjs.com/en/4x/api.html) to get a feel for things. We will be referencing a lot of content from the docs in the coming lessons.
1. Go back to your [Basic Informational Site project](https://www.theodinproject.com/lessons/nodejs-basic-informational-site), install Express and rewrite the project using it! You should be able to do most of this with just a few `app.get()`s.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is Express?](https://expressjs.com/)
- [What happens when a server receives a request?](#a-requests-journey)
- [What can we use to tell Express to send a file in response to a request?](https://expressjs.com/en/api.html#res.sendFile)
- [What can you use to automatically restart your server when you make changes to a file?](https://www.npmjs.com/package//nodemon)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
