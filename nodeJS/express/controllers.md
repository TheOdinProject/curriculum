### Introduction

The controller's job is really to act as the ultimate middleman. It knows which questions it wants to ask the model, but lets the model do all the heavy lifting for actually solving those questions. It knows which view it wants to render and send back to the browser, but lets the view itself take care of putting all that HTML together. That's why it's a "controller" - it's smart enough to know what to do, then it delegates all the hard work.

Ultimately, the controller is the brains of the operation ensuring that each component plays its part in delivering the final result and is really just a function with well-defined responsibilities as part of the MVC pattern.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explore various response methods.
- Implement error handling middleware to catch and process errors gracefully.
- Describe common use cases for middleware, such as validation and authentication.

### Handling responses

When it comes to sending responses from our controllers, we have several methods at our disposal. Let's explore some of the commonly used methods and their use cases.

- [res.send](https://expressjs.com/en/api.html#res.send) - A general-purpose method for sending a response, it is flexible with what data we can send since it will automatically set the `Content-Type` header based on what data you pass it. For example, if we pass in an object, it will stringify it as JSON and set the `Content-Type` header to `application/json`.
- [res.json](https://expressjs.com/en/api.html#res.json) - This is a more explicit way to respond to a request with JSON. This always sets the `Content-Type` header to `application/json` and sends the data as JSON.
- [res.redirect](https://expressjs.com/en/api.html#res.redirect) - When we want to redirect the client to a different URL, this method allows for that capability.
- [res.render](https://expressjs.com/en/api.html#res.render) - `res.render` lets you render a view template and send the resulting HTML as the response. We'll cover this in a later lesson.

There is also a useful method that we can use to set the status code manually.

- [res.status](https://expressjs.com/en/api.html#res.status) - This sets the response's status code **but does not end the request-response cycle by itself**. We can chain other methods through this (e.g. `res.status(404).send(...)` but note that we can't do `res.send(...).status(404)`). We can omit this if we wish to use the default status code of `200`.

<div class="lesson-note" markdown="1">

#### res.send and res.json

If `res.send` automatically sets the `Content-Type` based on the data passed, why would we still use `res.json`? `res.json` enforces JSON and will automatically convert non-object values to JSON, but `res.send` will not. `res.json` is just a convenient method that also internally calls `res.send`. `res.send` will only handle things as JSON when dealing with booleans and objects (which includes arrays).

So for convenience it's more appropriate to use `res.json` instead of `res.send`, and if we're sending JSON, we might as well use a method that's literally named "json". It's like the perfect match!

</div>

We also need to take note that these response methods only end the request-response cycle. They do not end the function execution. For example if we do this:

```javascript
app.use((req, res) => {
  // This works and this ends the request-response cycle
  res.send("Hello");

  // However, it does not exit the function so this will still run
  console.log('will still run!!');

  // This will then throw an error that we cannot send again after sending to the client already
  res.send("Bye");
});
```

### Middleware

Middleware functions are a core concept in Express and play a crucial role in handling requests and responses. They operate between the incoming request and the final intended route handler.

A middleware function typically takes three arguments (however, there is one that we will get into later that has four):

- `req` - The request object, representing the incoming HTTP request.
- `res` - The response object, representing the HTTP response that will be sent back to the client.
- `next` - The function that passes control to the next middleware function in the chain (we'll get to this later). This is optional.

<div class="lesson-note" markdown="1">

#### Naming convention

Names are just convention, we can name them whatever we want, like `req` -> `request`, `res` -> `response`, etc.

</div>

A middleware function can perform various tasks, such as:

- Modifying the request or response objects (some packages for example will do this, like adding a new property in the request object, or setting the `res.locals` that is used in templates rendered with `res.render`).
- Executing additional code (validation middleware functions to validate the request before going to our main logic, authentication middleware functions, and so on).
- Calling the next middleware function in the chain.
- Ending the request-response cycle (meaning no further middleware functions are called, even if there are more in the chain).

Express has a rich ecosystem, so you'll likely find a package that solves the problem you're encountering. For example, some packages provide middleware functions to handle authentication, CORS, rate limiting, sessions, logging, validation, and more! Throughout this lesson (and the course), we'll introduce middlewares needed to build projects in this course, but you’re welcome to explore on your own.

#### Application-level middleware

Application-level middleware are bound to an *instance of Express* using `app.use` or using `app.METHOD` (e.g. `app.get`, `app.post`) functions. Express executes these middleware functions for every incoming request that matches the specified path. If we don't specify a path, Express defaults the path to `/`, matching every incoming request. As with any middleware functions, they will not run if the request-response cycle ends before reaching them. Typically, these middleware functions are placed on top of our application code to ensure they always run first.

Express offers several essential built-in middleware functions that we'll frequently use in our applications. These include:

- Body parsers (e.g. `express.json`, `express.urlencoded`) - These allow us to correctly parse the incoming request's body, so that we can use it through `req.body`.
- Serving static files (e.g. `app.use(express.static('public'))`) - This middleware function serves static files like HTML, CSS, JavaScript, and images. We can pass an argument to specify which directory to serve the static files.

#### Router-level middleware

Router-level middleware works similarly to an application-level middleware, but it's bound to an *instance of Express router* using `router.use` or `router.METHOD` (e.g. router.get) functions. Because of this, Express only executes these middleware when the request matches and goes through that router.

Here is an example of a basic middleware function:

```javascript
function myMiddleware(req, res, next) {
  // Perform some operations
  console.log("Middleware function called");

  // Modify the request object
  req.customProperty = "Hello from myMiddleware";

  // Call the next middleware/route handler
  next();
}

app.use(myMiddleware);
```

In this example, the middleware function logs a message, adds a custom property to the request object, and then calls the `next()` function to pass control to the next middleware function or route handler. We also register the middleware function through the usage of `app.use` which makes this an application-level middleware. Middleware functions following `myMiddleware` in this chain can now access `req.customProperty`, which contains the value `"Hello from myMiddleware"`.

One thing to note is that Express executes middleware functions in the order we define or register them in our application. This means that the sequence in which we define our middleware functions matters, as it determines the order in which they will be invoked during the request-response cycle. So we need to make sure and be aware that our middleware functions are placed in the correct order. As an example, some packages have middleware functions that changes the `Request` object, and as a result, these middleware functions should be placed at the very top of our application in order for us to be able to see their changes in all of your middleware functions below it.

There is also a special type of middleware function that handles errors, which we will discuss shortly.

### Controllers

As said earlier, controllers are just functions. They also classify as a middleware (at least in the Express world) that are used by route handlers. However, it's important to note that controller and middleware are distinct concepts. Controllers are a key component of the MVC (Model-View-Controller) pattern, a design approach for organizing software. Middleware, on the other hand, is a core feature of Express that allows you to run code, modify requests, or end the cycle at specific points in the request-response cycle. So we are using middleware in Express to implement the "Controller" part of the MVC pattern.

A controller comes into play whenever a request hits the server and a route matches the requested HTTP verb and path. The route determines which controller should handle the request based on the defined middleware chain. The appropriate controller then takes over, performing the necessary actions to fulfill the request. This could involve retrieving data from the model, processing the data, making decisions based on business logic, or updating the model with new data.

Once the controller completes its tasks, it passes the processed data to the view. The view then renders this data into a format suitable for sending back to the client. Typically, this would be HTML. Later, when we cover building APIs, we can also send JSON responses like with the APIs that we've previously used e.g. Giphy API.

The naming conventions for these controllers are usually based on the route they will be attached to e.g. `GET` route -> `getSomething`, `POST` route -> `createSomething`, `DELETE` route -> `deleteSomething`, etc. Nonetheless, there is no fixed rule since Express is not opinionated. It will always be based on you or someone else's conventions, and the requirements of the function.

You should already have your application setup in-place from the previous lesson. Previously, we've defined a route for `/authors/:authorId`, but this time we will define a controller for that route and hook it up with sample data. But to make the example produce something, let's first create a mock database with a function that we can use to retrieve an author by their ID.

Create the following file `db.js` at the root of the project, and add the following code:

```javascript
// db.js

const authors = [
  { id: 1, name: "Bryan" },
  { id: 2, name: "Christian" },
  { id: 3, name: "Jason" },
];

async function getAuthorById(authorId) {
  return authors.find(author => author.id === authorId);
};

module.exports = { getAuthorById };
```

The file name, content, and location aren't important here. This is just a quick mock "database" and query function so we can call it in a controller.

Then for the controller, create the following file `authorController.js` within a `controllers` folder:

```javascript
// controllers/authorController.js

const db = require("../db");

async function getAuthorById(req, res) {
  const { authorId } = req.params;

  const author = await db.getAuthorById(Number(authorId));

  if (!author) {
    res.status(404).send("Author not found");
    return;
  }

  res.send(`Author Name: ${author.name}`);
};

module.exports = { getAuthorById };
```

In this example, the `getAuthorById` function is a controller that handles a specific action related to retrieving an author by their ID. We'll use this controller by importing it into the file where we define our routes, and using it like this:

```javascript
// routes/authorRouter.js

const { Router } = require("express");
const { getAuthorById } = require('../controllers/authorController');

const authorRouter = Router();

// ... other route handlers
authorRouter.get("/:authorId", getAuthorById);
```

Let's break down what's happening in this controller:

1. The route path contains a route parameter (`/authors/:authorId`). The controller extracts the `authorId` from `req.params`.
1. It then invokes a database query function `getAuthorById` to retrieve the author data based on the `authorId`.
1. If the controller doesn't find the author, it sends a response with a 404 status code and the message `"Author not found"`, using `res.status(404).send(...)`. It then returns from the controller function to avoid invoking any other logic in the controller, as sending a response doesn't automatically stop the function execution.
1. If the controller finds the author, it sends a response with a 200 status code with the text showing the author name using `res.send(...)`.

Very simple right?

### Handling errors

When building robust applications, it's crucial to handle errors gracefully within our application. Implementing proper error handling allows you to provide meaningful error responses to the client and prevent your application from crashing unexpectedly. And as we know, errors may occur during async operations, and we are not exactly handling that in our previous code snippets. Let's see what we can do to handle these possibilities.

#### try/catch

Using the same code from earlier, we can quickly handle errors by wrapping our controller logic in a `try/catch` block.

```javascript
async function getAuthorById(req, res) {
  const { authorId } = req.params;

  try {
    const author = await db.getAuthorById(Number(authorId));

    if (!author) {
      res.status(404).send("Author not found");
      return;
    }

    res.send(`Author Name: ${author.name}`);
  } catch (error) {
    console.error("Error retrieving author:", error);
    res.status(500).send("Internal Server Error");

    // or we can call next(error) instead of sending a response here
    // Using `next(error)` however will only render an error page in the express' default view and respond with the whole html to the client.
    // So we will need to create a special type of middleware function if we want a different response and we will get to that in a bit.
  }
};
```

However, this is not exactly a clean solution since eventually, we will have to add the same try/catch block to *all* controllers. We can install a package called [express-async-handler](https://www.npmjs.com/package/express-async-handler) to hide this bit of code.

```javascript
const asyncHandler = require("express-async-handler");

// The function will automatically catch any errors thrown and call the next function
const getAuthorById = asyncHandler(async (req, res) => {
  const { authorId } = req.params;

  const author = await db.getAuthorById(Number(authorId));

  if (!author) {
    res.status(404).send("Author not found");
    return;
  }

  res.send(`Author Name: ${author.name}`);
});
```

<div class="lesson-note lesson-note--tip" markdown="1">

The asyncHandler function in the `express-async-handler` library is just 6 lines of code. Try to take a guess on how it's implemented and then do [check out the asyncHandler source code](https://github.com/Abazhenov/express-async-handler/blob/master/index.js) for yourself.

</div>

#### With a middleware

Remember our earlier discussion about a "special type of middleware"? Let's dive into that now. An error middleware function handles all errors in our application that come down from other middleware functions. We want to place this error middleware function at the very end of the application code to ensure it's the last middleware function executed and only handles errors bubbling down from preceding middleware functions.

Add the following code in `app.js` at the end of all middleware functions in our application:

```javascript
// Every thrown error in the application or the previous middleware function calling `next` with an error as an argument will eventually go to this middleware function
app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).send(err);
});
```

However, take note that this is a middleware function that requires *four parameters* that we will need to provide even if they are not used. If for example we exclude one of the parameters, it will not be recognized as an error middleware function. You can try it out yourself ;)

This is an odd one where the error object *must* be the first parameter in the callback.

This middleware function handles the *errors thrown* in other middleware functions or something that is sent by a previous middleware function using the `next` function (e.g. `next(err)`).

So the way Express distinguishes this middleware function is again through adding *four parameters*, not a single one missing. A route middleware function or a middleware function with *less than four parameters* will always be considered as a request middleware function instead of this error middleware function, even if we place it last.

```javascript
app.use((req, res, next) => {
  throw new Error("OH NO!");
  // or next(new Error("OH NO!"));
});

app.use((err, req, res, next) => {
  console.error(err);
  // You will see an OH NO! in the page, with a status code of 500 that can be seen in the network tab of the dev tools
  res.status(500).send(err.message);
});
```

#### Creating custom errors

With the solutions above, the error middleware function can only really respond with a `500` status code no matter what error it is. But what if we actually want to send a `404`? A common way to do this is to create our own custom error by extending the Error object.

Create the following file `CustomNotFoundError.js` within an `errors` folder:

```javascript
// errors/CustomNotFoundError.js

class CustomNotFoundError extends Error {
  constructor(message) {
    super(message);
    this.statusCode = 404;
    // So the error is neat when stringified. NotFoundError: message instead of Error: message
    this.name = "NotFoundError";
  }
}

module.exports = CustomNotFoundError;
```

We can then use this custom error class and refactor the earlier version of `getAuthorById` like so:

```javascript
const CustomNotFoundError = require("../errors/CustomNotFoundError");

const getAuthorById = asyncHandler(async (req, res) => {
  const { authorId } = req.params;

  const author = await db.getAuthorById(Number(authorId));

  if (!author) {
    throw new CustomNotFoundError("Author not found");
  }

  res.send(`Author Name: ${author.name}`);
});
```

Since we are using `express-async-handler`, we don't need to send an error response inside of this function but instead just throw an error. `asyncHandler` automatically catches the thrown error and calls `next()`, passing in the caught error as an argument, which passes control to our custom error handler!

It will eventually end up in the error middleware function where we can also modify:

```javascript
app.use((err, req, res, next) => {
  console.error(err);
  // We can now specify the `err.statusCode` that exists in our custom error class and if it does not exist it's probably an internal server error
  res.status(err.statusCode || 500).send(err.message);
});
```

This is a useful pattern and we can create more custom error classes for different use cases if needed.

#### What is the next function

We've used the `next` function a few times now. But what exactly is it? Well, to put it simply, it is used to pass control to the next middleware function in the application's request-response cycle. To give an example:

```javascript
function middleware1(req, res, next) {
  console.log("Middleware 1");
  next(); // Pass control to the next middleware
};

function middleware2(req, res, next) {
  console.log("Middleware 2");
  res.send("Response from Middleware 2");
  // request-response cycle ends here
};

function middleware3(req, res, next) {
  console.log("Middleware 3");
  res.send("Response from Middleware 3");
};

app.use(middleware1);
app.use(middleware2);
app.use(middleware3);
// will log `Middleware 1` -> `Middleware 2` and send a response with the text "Response from Middleware 2"
```

Here we have `middleware1`, `middleware2`, and `middleware3`. `middleware1` calls the `next` function, and since we are not yet sending a response, we pass the control to the next middleware function - `middleware2` (as indicated by the order of `app.use` calls). In `middleware2`, we send a response which ends the request-response cycle. Since it has ended, the third middleware function (`middleware3`) does not run. But if we somehow did not call the `next` function in `middleware1`, do you know what would happen? Perhaps pop in the [TOP Discord server](https://discord.gg/theodinproject) and let us know what you think!

Also, as we've discussed earlier with regards to calling the `next` function. We have the following arguments that we can pass to it:

1. No argument `next()` - Will pass control to the next middleware function. Very simple and straightforward.
1. With an error argument `next(new Error(...))` - Will pass control directly to the error middleware function.
1. With the string `next('route')` - Will pass control to the next route handler with the same matching path (if there is one). This only works for `app.METHOD` or `router.METHOD`. Potentially, it can also be the same as just calling `next` with no argument.
1. With the string `next('router')` - Will skip all middleware functions attached to the specific router instance and pass control back out of the router instance. Basically, we exit the router and go back to the parent router, e.g. `app` (yes, the Express app is also just a router under the hood).

Out of the four, we will likely only use the first two, unless we have a very specific need that requires the other two.

### Consolidating what we've learned

The following is the folder structure you'd end up with if you had been coding along:

```text
express-app/
├─ errors/
│  ├─ CustomNotFoundError.js
├─ controllers/
│  ├─ authorController.js
├─ routes/
│  ├─ authorRouter.js
│  ├─ ... other routers
├─ app.js
├─ db.js
```

As an exercise, feel free to create more sample data in our `db.js` file and controllers for the other routes we've previously created.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. This article [Express Middlewares, Demystified](https://medium.com/@viral_shah/express-middlewares-demystified-f0c2c37ea6a1) Written by Viral Shah will help understand how middlewares work in a deeper way. The article also encourages you to read the source code of Express which you can likely do by now.
1. Watch this short 10 minutes [video tutorial of the MVC pattern](https://www.youtube.com/watch?v=Cgvopu9zg8Y). There is not much to this other than consolidating what you already know.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the common response methods and their use cases?](#handling-responses)
- [What are the types of middleware?](#middleware)
- [How does a middleware get executed? In which order?](#middleware)
- [What does calling the next function do? What if we pass an error argument?](#what-is-the-next-function)
- [What are the other arguments you can pass to the next function?](#what-is-the-next-function)
- [What is a controller?](#controllers)
- [What is the difference between a controller and a middleware?](#controllers)
- [What happens if you define a middleware function with four parameters?](#with-a-middleware)
- [What would you do to create a custom error?](#creating-custom-errors)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- The Express documentation for [Using Express Middleware](https://expressjs.com/en/guide/using-middleware.html) is a short one with the same information, but has more examples that you can run through.
