### Introduction

The controller's job is really to act as the ultimate middleman. It knows which questions it wants to ask the model, but lets the model do all the heavy lifting for actually solving those questions. It knows which view it wants to render and send back to the browser, but lets the view itself take care of putting all that HTML together. That's why it's a "controller" - it's smart enough to know what to do, then it delegates all the hard work.

Ultimately, the controller is the brains of the operation ensuring that each component plays its part in delivering the final result and is really just a function with well-defined responsibilities as part of the MVC pattern.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explore various response methods.
- Implement error handling middleware to catch and process errors gracefully.
- Describe common use cases for middleware, such as validation and authentication.

### Handling responses

When it comes to sending responses from your controllers, you have several methods at your disposal. Let's explore some of the commonly used methods and their use cases.

- [res.send](https://expressjs.com/en/api.html#res.send) - A general-purpose method for sending a response, it is flexible with what data you can send since it will automatically set the `Content-Type` header based on what data you pass it. For example, if you pass in an object, it will stringify it as JSON and set the `Content-Type` header to `application/json`.
- [res.json](https://expressjs.com/en/api.html#res.json) - This is a more explicit way to respond to a request with JSON. This always sets the `Content-Type` header to `application/json` and sends the data as JSON.
- [res.redirect](https://expressjs.com/en/api.html#res.redirect) - When you want to redirect the client to a different URL, this method allows for that capability.
- [res.render](https://expressjs.com/en/api.html#res.render) - If you're using a template engine (covered in a later lesson), `res.render` allows you to render a view template and send the rendered HTML as the response.

There is also a useful method that you can use to set the status code manually.

- [res.status](https://expressjs.com/en/api.html#res.status) - This sets the response's status code **but does not end the request-response cycle by itself**. You can chain other methods through this (e.g. `res.status(404).send(...)` but note that you can't do `res.send(...).status(404)`). You can omit this if you wish to use the default status code of `200`.

<div class="lesson-note" markdown="1">

#### res.send and res.json

If `res.send` automatically sets the `Content-Type` based on the data passed, why would we still use `res.json`? `res.json` enforces JSON and will automatically convert non-object values to JSON, but `res.send` will not. `res.json` is just a convenient method that also internally calls `res.send`. `res.send` will only handle things as JSON when dealing with booleans and objects (which includes arrays).

So for convenience it's more appropriate to use `res.json` instead of `res.send`, and if you're sending JSON, you might as well use a method that's literally named "json". It's like the perfect match!

</div>

We also need to take note that these response methods only end the request-response cycle. They do not end the function execution. For example if you somehow do this:

```javascript
app.use((req, res) => {
  // This works and this ends the request-response cycle
  res.send("Hello");

  // However, it does not exit the function so this will still run
  console.log('will still run!!');

  // This will then throw an error that you cannot send again after sending to the client already
  res.send("Bye");
});
```

### Middleware

Middleware functions are a core concept in Express and play a crucial role in handling requests and responses. They sit between the incoming request and the final intended route handler.

A middleware function typically takes three arguments (however, there is one that we will get into later that has four):

- `req` - The request object, which represents the incoming HTTP request.
- `res` - The response object, which represents the HTTP response that will be sent back to the client.
- `next` - The function that pass the control to the next middleware function in the chain (we'll get to this later). This is optional.

<div class="lesson-note" markdown="1">

#### Naming convention

Names are just convention, you can name them whatever you want `req` -> `request`, `res` -> `response`, etc

</div>

A middleware function can perform various tasks, such as:

- Modifying the request or response objects (some packages for example will do this, like adding a new property in the request object, or setting the `res.locals` that is used in templates rendered with `res.render`).
- Executing additional code (validation middleware functions to validate the request before going to your main logic, authentication middleware functions, and so on).
- Calling the next middleware function in the chain.
- Ending the request-response cycle (meaning no further middleware functions are called, even if there are more in the chain).

Express has a rich ecosystem and you will likely find a package that solves the problem you are encountering. For example, some packages provide middleware functions to handle authentication, cors, rate limiting, sessions, logging, validation, and more! Throughout this lesson (and the course), we'll be introducing middlewares that would be required to build projects in this course. Although, you're welcome to explore on your own.

#### Application-level middleware

Application-level middleware are bound to an *instance of Express* using `app.use` or using `app.<METHOD>` (e.g. `app.get`, `app.post`) functions. These are middleware functions that are executed in every incoming request matching the specified path. If you don't specify a path, the path defaults to `/` which will match every incoming request. As with any middleware functions, they will not run if the request-response cycle ends before reaching them. Typically, these middleware functions are placed on top of your application code to ensure they always run first.

Very common built-in middleware functions that you will likely use are the following:

- Body parsers (e.g. `express.json`, `express.urlencoded`) - These allows to correctly parse the incoming request's body, so that you can use it through `req.body`.
- Serving static files (e.g. `app.use(express.static('public'))`) -  It is a middleware function for serving static files, such as HTML, CSS, JavaScript, and images. You can pass an argument to specify which directory to serve the static files.
- Setting up views (you will learn how in the Views lesson).

#### Router-level middleware

Router-level middleware works similarly to application-level middlewares but is bound to an *instance of Express router* using `router.use` or `router.METHOD` (e.g. router.get) functions. This however is only executed when the request matches the specific route as you've probably already learned in the Routes lesson.

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

In this example, the middleware function logs a message, adds a custom property to the request object, and then calls the `next()` function to pass control to the next middleware function or route handler. We also register the middleware function through the usage of `app.use` which makes this an application-level middleware. Middleware functions following `myMiddleware` in this chain can now access `req.customProperty` with the value `"Hello from myMilddleware"`.

One thing to note about is that middleware functions are executed in the order they are defined or registered in your application. This means that the sequence in which you define your middleware functions matters, as it determines the order in which they will be invoked during the request-response cycle. So you need to make sure and be aware that your middleware fnuctions are placed in the correct order. As an example, some packages have middleware functions that changes the `Request` object, and as a result, these middleware functions should be placed at the very top of your application in order for you to be able to see their changes in all of your middleware functions below it.

There is also a special type of middleware function that handles errors, which we will discuss shortly.

### Controllers

As said earlier, controllers are just functions. They also classify as a middleware (at least in the Express world) that are used by route handlers.

A controller comes into play whenever a request hits the server and a route matches the requested HTTP verb and path. The route determines which controller should handle the request based on the defined middleware chain. The appropriate controller then takes over and performs the necessary actions to fulfill the request. This could involve retrieving data from the model, processing the data, making decisions based on business logic, or updating the model with new data.

Once the controller has completed its tasks, it passes the processed data to the view, which renders the data into a format suitable for sending back to the client. Typically, this would be HTML. Later, when we cover building APIs, we can also send JSON responses like with the APIs that you've previously encountered e.g. Giphy API.

The naming conventions for these controllers are usually based on the route they will be attached to e.g. `GET` route -> `getSomething`, `POST` route -> `createSomething`, `DELETE` route -> `deleteSomething`, etc. Nonetheless, there is no fixed rule since Express is not opinionated. It will always be based on you or someone else's conventions, and the requirements of the function.

Let's define our first controller! Create a folder called `controllers` at the root of your Express project. Then create a `userController.js` file within it:

```javascript
// user controller file - controllers/userController.js

const getUserById = async (req, res) => {
  const userId = req.params.id;

  const user = await someDBQueryToGetUser(userId);

  if (!user) {
    res.status(404).send("User not found");
    return;
  }

  res.send(`User found: ${user.name}`);
};
```

In this example, the `getUserById` function is a controller that handles a specific action related to retrieving a user by their ID. You'll use this controller by importing it into file where routes are defined, and using it like so `router.get("/user/:id", getUserById)`. Let's break down what's happening in this controller:

1. The controller extracts the userId from the request parameters (`req.params.id`). This assumes that the parameter is defined with a route, such as `/users/:id`.
1. It then invokes a database query function `someDBQueryToGetUser` to retrieve the user data based on the userId.
1. If the user is not found (`!user`), the controller sends a response with a 404 status code and the message `User not found`, using `res.status(404).send(...)`. It then returns from the controller function in order to not invoke any other logic in the controller, because sending a response does not stop the function execution itself.
1. If the user is found, the controller sends a response with a 200 status code and the message `User found: ${user.name}`, using `res.status(200).send(...)`. This assumes that the user object has a name property.

Very simple right?

### Handling errors

When building robust applications, it's crucial to handle errors gracefully within your application. By implementing proper error handling, you can provide meaningful error responses to the client and prevent your application from crashing unexpectedly. And as we know, errors may occur during async operations, and we are not exactly handling that in our previous code snippets. Let's see what we can do to handle these possibilities.

#### try/catch

Using the same code earlier, wrapping your controller logic in a `try/catch` is the quickest way to handle errors.

```javascript
// user controller file - controllers/userController.js

const getUserById = async (req, res) => {
  const userId = req.params.id;

  try {
    const user = await someDBQueryToGetUser(userId);

    if (!user) {
      res.status(404).send("User not found");
      return;
    }

    res.send(`User found: ${user.name}`);
  } catch (error) {
    console.error("Error retrieving user:", error);
    res.status(500).send("Internal Server Error");

    // or we can call next(error) instead of sending a response here
    // Using `next(error)` however will only render an error page in the express' default view and respond with the whole html to the client.
    // So we will need to create a special type of middleware function if we want a different response and we will get to that in a bit.
  }
};
```

However, this is not exactly a clean solution since eventually, we will have to add the same try/catch block to *all* controllers. There is a package called [express-async-handler](https://www.npmjs.com/package/express-async-handler) that you can install to hide this bit.

```javascript
const asyncHandler = require("express-async-handler");

// Any errors that is thrown in this function will automatically be caught and call the `next` function
const getUserById = asyncHandler(async (req, res) => {
  const userId = req.params.id;

  const user = await someDBQueryToGetUser(userId);

  if (!user) {
    res.status(404).send("User not found");
    return;
  }

  res.send(`User found: ${user.name}`);
});
```

<div class="lesson-note lesson-note--tip" markdown="1">

The asyncHandler function in the express-async-handler function is just 6 lines of code. try to take a guess on how it's implemented and then do [check out the source code](https://github.com/Abazhenov/express-async-handler/blob/master/index.js) for yourself.

</div>

#### With a middleware

Remember what we said earlier regarding a "special type of middleware"? Let's actually look into that now. There is an error middleware function that handles all errors in our application coming down from other middleware functions and this error middleware function is commonly placed at the very end of our application code, to ensure that it is actually the last middleware function to be executed and to only handle errors bubbling down from other middleware functions before it.

```javascript
// Every thrown error in the application or the previous middleware function calling `next` with an error as an argument will eventually go to this middleware function
app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).send(err);
});
```

However, take note that this is a middleware function that requires *four parameters* that you will need to provide even if they are not used. If you for example exclude one of the parameters, it will not be recognized as an error middleware function. You can try it out yourself ;)

It is the same as the previous middleware functions with three parameters but with one new parameter in a different order which is the error object. This is an odd one but the error object *must* be the first parameter in the callback.

This middleware function handles the *errors thrown* in other middleware functions or something that is sent by a previous middleware function using the `next` function (e.g. `next(err)`).

So the way Express distinguishes this middleware function is again through adding *four parameters* not a single one missing. A route middleware function or a middleware function with *less than four parameters* will always be considered as a request middleware function instead of this error middleware function even if you place it last.

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

With the solutions above, the error middleware function can only really respond with a `500` status code no matter what error it is. Because what if we actually want to send a `404`? A common way to do this is to create our own custom error by extending the Error object.

```javascript
class CustomNotFoundError extends Error {
  constructor(message) {
    super(message);
    this.statusCode = 404;
    // So the error is neat when stringified. NotFoundError: message instead of Error: message
    this.name = "NotFoundError";
  }
}
```

We can then use this custom error class and refactor the earlier version of `getUserById` like so:

```javascript
const getUserById = asyncHandler(async (req, res) => {
  const userId = req.params.id;

  const user = await someDBQueryToGetUser(userId);

  if (!user) {
    throw new CustomNotFoundError("User not found");
  }

  res.send(`User found: ${user.name}`);
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

This is a useful pattern and you will likely create more custom error classes for different use cases.

#### What is the next function

We've used the `next` function a few times now. But what exactly is it? Well, to put it simply, it is used to pass control to the next middleware function in the application's request-response cycle. To give an example:

```javascript
const middleware1 = (req, res, next) => {
  console.log("Middleware 1");
  next(); // Pass control to the next middleware
};

const middleware2 = (req, res, next) => {
  console.log("Middleware 2");
  res.send("Response from Middleware 2");
  // request-response cycle ends here
};

const middleware3 = (req, res, next) => {
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

Out of the four, you will likely only use the first two, unless you have a very specific need that requires the other two.

### Consolidating what we've learned

The following is the folder structure you'd end up with if you have been coding along:

```text
express-app/
├─ controllers/
│  ├─ userController.js
├─ routes/
│  ├─ userRoutes.js
├─ app.js
```

Creating a user controller file that contains well-defined responsibilities to handle "User".

```javascript
// user controller file - controllers/userController.js

const asyncHandler = require("express-async-handler");

const getUserById = asyncHandler(async (req, res) => {
  const userId = req.params.id;

  const user = await someDBQueryToGetUser(userId);

  if (!user) {
    throw new CustomNotFoundError("User not found");
  }

  res.send(`User found: ${user.name}`);
});

const getUsers = asyncHandler(async (req, res) => {
  // code
});

const createUser = asyncHandler(async (req, res) => {
  // code
});

module.exports = { getUserById, getUsers, createUser };
```

Route file for the "User"

```javascript
// route file - routes/userRoutes.js

const express = require('express');
const userController = require('<path-to-user-controller>');

const router = express.Router();

// You can for example add a top level middleware function that handles say authentication and only let the request come in if they're authenticated
// This prevents from executing the middleware functions below if the request is not authenticated
// We will learn more about authentication in later lessons
// usually calls either next() or next(error)

// router.use(authMiddleware);

// router-level midlewares

// GET request for getting all the users
router.get('/', userController.getUsers);

// You will likely place your validation/authentication middleware functions here or perhaps in the controller file, e.g.
// router.post(validationMiddleware, userController.createUser)

// POST request for creating a user
router.post('/', userController.createUser);

// GET request for getting the user by id
router.get('/:id', userControoler.getUserById);

module.exports = router;
```

The main application file, our entry point.

```javascript
// app file

const express = require('express');
const userRouter = require('<path-to-user-routes>');

const app = express();

// application-level middlewares, will always execute on every incoming requests

// parses form payloads and sets it to the `req.body`
app.use(express.urlencoded({ extended: false }));

app.use((req, res, next) => {
  // You can of course also create your own for your own use-case!
  // Just make sure to call `next`
  next();
})

// base mount path is `/users` and will always execute on that specific mount path, and yes including `/users/a/b/c`
app.use('/users', userRouter);

const PORT = 3000;
app.listen(PORT, () => console.log(`listening on port ${PORT}!`));
```

### Assignment

<div class="lesson-content__panel" markdown="1">

1. This article [Express Middlewares, Demystified](https://medium.com/@viral_shah/express-middlewares-demystified-f0c2c37ea6a1) Written by Viral Shah will help understand how middlewares work in a deeper way. The article also encourages you to read the source code of Express which you can likely do by now.
1. Watch this short 10 minutes [video tutorial of the MVC pattern](https://www.youtube.com/watch?v=Cgvopu9zg8Y). There is not much to this other than consolidating what you already know.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the common response methods and their use cases?](#handling-responses)
- [What are the types of middlewares?](#middleware)
- [How does a middleware get executed? In which order?](#middleware)
- [What does calling the next function do? What if we pass an error argument?](#what-is-the-next-function)
- [What other arguments you can pass to the next function?](#what-is-the-next-function)
- [What is a controller?](#controllers)
- [What happens if you define a middleware function with four parameters?](#with-a-middleware)
- [What would you do to create a custom error?](#creating-custom-errors)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- The Express documentation for [Using Express Middleware](https://expressjs.com/en/guide/using-middleware.html) is a short one with the same information, but has more examples that you can run through.
