### Introduction

The controller’s job is really to act as the ultimate middleman. It knows which questions it wants to ask the model, but lets the model do all the heavy lifting for actually solving those questions. It knows which view it wants to render and send back to the browser, but lets the view itself take care of putting all that HTML together. That’s why it’s a “controller”… smart enough to know what to do and then delegate all the hard work. All it does is collect data for sending over to the view.

A controller comes into play whenever a client sends a request to a specific route. When a request hits the server, the router that you've learned previously determines which controller and action should handle the request based on the defined routes. The controller then takes over and performs the necessary actions to fulfill the request. This could involve retrieving data from the model, processing the data, making decisions based on business logic, or updating the model with new data. Once the controller has completed its tasks, it passes the processed data to the view, which renders the data into a format suitable for sending back to the client, typically HTML but we can also send for example JSON (The API based backends that you've also previously encountered e.g. Giphy API, but we will go deeper into this later).

Ultimately, controllers are pretty much just functions with well-defined responsibilities as part of the MVC pattern, that's it.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explore various response methods
- Implement error handling middleware to catch and process errors gracefully
- Describe common use cases for middleware, such as validation and authentication
- Know basic file structure

### Handling responses

When it comes to sending responses from your controllers, you have several methods at your disposal. Let's explore some of the commonly used methods and their use cases.

- [res.send](https://expressjs.com/en/api.html#res.send) - A general-purpose method for sending a response, it is flexible with what data you can send since it will automatically set the `Content-Type` header based on what data you pass, and yes including setting to an `application/json`.
- [res.json](https://expressjs.com/en/api.html#res.json) - If you want to send a JSON response, `res.json` is the way to go. It automatically sets the `Content-Type` header to `application/json` and sends the data as JSON. We will cover the use-case of this more later.
- [res.redirect](https://expressjs.com/en/api.html#res.redirect) - When you want to redirect the client to a different URL, this method allows for that capability. However, do note that this by itself does not work if you are now creating APIs instead of rendering just the views or sending basic responses that still uses the express application as the view.
- [res.render](https://expressjs.com/en/api.html#res.render) - If you're using a template engine that you will setup in a later lesson, `res.render` allows you to render a view template and send the rendered HTML as the response.

There is also a useful method that you can use to set the status code manually.

- [res.status](https://expressjs.com/en/api.html#res.status) - You can also chain other methods through this (e.g. `res.status(200).send(...)` but note that you can't do `res.send(...).status(200)`). This method does not end the request-response cycle. And also `200` is already the default so you wouldn't necessarily need this for `200`, but for consistency, we'll keep using it.

<div class="lesson-note" markdown="1">

#### res.send and res.json

If `res.send` automatically sets the `Content-Type` based on the data passed. Why still use `res.json`? It's because `res.json` enforces JSON and will automatically convert non-object to JSON but `res.send` will not. But `res.json` is just a convenient method that also internally calls `res.send` but it handles anything JSON related. `res.send` also calls `res.json` internally but you will only see JSON type of `Content-Type` with booleans and objects.

So for convenience it's more appropriate to use `res.json` instead of `res.send`, and if you are sending JSON then you might as well go for a method that is *named "json"*  :)

</div>

We also need to take note that these response methods only ends the request-response cycle, it does not end the function execution. So for example if you somehow do this:

```js
app.use((req, res) => {
  res.send("Hello"); // This works and this ends the request-response cycle

  console.log('will still run!!'); // however it does not exit the function so this will still continue to run
  res.send("Bye"); // This will not work but it will throw an error that you cannot send again after sending it to the client already
})
```

### Middleware

Middleware functions are a core concept in Express and play a crucial role in handling requests and responses. They sit between the incoming request and the final intended route handler.

A middleware function typically takes three parameters (however, there is one that we will get into later that has four):

**NOTE**: Names are just convention, you can name them whatever you want `req -> request, res -> response, etc`

- `req` - The request object, which represents the incoming HTTP request.
- `res` - The response object, which represents the HTTP response that will be sent back to the client.
- `next` - The function that pass the control to the *next* middleware (We'll get to this later).

A middleware can perform various tasks, such as:

- Modifying the request or response objects (some packages for example will do this, like adding a new property in the request object, or setting the `res.locals` that is used in templates rendered with `res.render`)
- Executing additional code (validation middlewares to validate the request before going to your main logic, authentication middlewares, and so on)
- Ending the request-response cycle (this also means that any other middlewares after the middleware that ended the cycle will not execute anymore)
- Calling the next middleware function in the stack (this is also important in validation middlewares, execute some validation code -> pass the control to the next middleware)

Express has a rich ecosystem and you will likely find a package that solves the problem you are encountering. For example, some packages provide middleware to handle authentication, cors, sessions, logging, validation, and more! But we should identify the basic and built-in ones first.

#### Application-level middleware

Application-level middleware are bound to an *instance of Express* using the app.use or using app.METHOD (e.g. app.get, app.post) functions. These are middlewares that are executed in **every incoming requests** to the application with the specified path `/` being the default mount path (mount path can be changed by adding it as the first argument), but if the request-response cycle ends before even getting to the specific middleware then it will of course not run, but typically these middlewares are placed on top of your application code to ensure they always run first. Very common built-in middlewares that you will likely use are:

- Body parsers (e.g. express.json, express.urlencoded) - These allows to correctly parse the incoming request's body, so that you can use it through `req.body`
- Serving static files (e.g. `app.use(express.static('public'))`) -  It is a middleware for serving static files, such as HTML, CSS, JavaScript, and images. You can pass an argument to specify which directory to serve the static files.
- Setting up views (you will learn how in the Views lesson)

#### Router-level middleware

Router-level middleware works similarly to application-level middlewares but is bound to an *instance of Express router* using router.use or router.METHOD (e.g. router.get) functions. This however is only executed when the request matches the specific route as you've probably already learned in the Routes lesson.

Here is an example of a basic middleware:

```js
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

In this example, the middleware function logs a message, adds a custom property to the request object, and then calls the next() function to pass control to the next middleware or route handler. We also register the middleware through the usage of `app.use` which makes this an application-level middleware. Other middlewares below this one will now be able to see a property `customProperty` with the value `Hello from myMiddleware`.

One thing to note about is that middleware functions are executed in the order they are defined or registered in your application. This means that the sequence in which you define your middleware functions matters, as it determines the order in which they will be invoked during the request-response cycle. So you need to make sure and be aware that your middlewares are placed in the correct order. As an example, some packages have middlewares that changes the `Request` object, as a result these middlewares should be placed at the very top of your application in order for you to be able to see their changes in all of your middlewares below it.

### Controllers

As said earlier, controllers are just functions, but they have a well-defined responsibility that encapsulates extracting relevant data from the request, invoking the necessary business logic or database operations, and sending the appropriate response to the client. This controller pattern also helps with keeping your application code organized and maintainable.

The naming conventions for these controllers are usually based on the route handler they will be attached to e.g. get route -> getSomething, post route -> createSomething, delete route -> deleteSomething, etc, but note that some routes for example a post route does not create anything so naming may change based on the requirements. But there is no fixed rule since express is not opinionated, it will always be based on you or someone elses convention.

```js
// user controller file/ controllers/userController.js

const getUserById = async (req, res) => {
  const userId = req.params.id;

  const user = await someDBQueryToGetUser(userId);

  if (!user) {
    res.status(404).send("User not found");
    return;
  }

  res.status(200).send(`User found: ${user.name}`);
};
```

In this example, the `getUserById` function is a controller that handles a specific action related to retrieving a user by their ID. Let's break down what's happening in this controller:

1. The controller extracts the userId from the request parameters (req.params.id). This assumes that the route is defined with a parameter, such as /users/:id.
1. It then invokes a database query function `someDBQueryToGetUser` to retrieve the user data based on the userId.
1. If the user is not found `!user`, the controller sends a response with a 404 status code and the message `User not found` using `res.status(404).send(...)`. It then returns to exit the controller function, in order to not invoke any other logic in the controller, because again sending responses do not stop the function execution.
1. If the user is found, the controller sends a response with a 200 status code and the message `User found: ${user.name}` using `res.status(200).send(...)`. This assumes that the user object has a name property.

Very simple right?

### Handling errors

When building robust applications, it's crucial to handle errors gracefully within your application. By implementing proper error handling, you can provide meaningful error responses to the client and prevent your application from crashing unexpectedly. And as we know errors may occur during async operations and we are not exactly handling that in our previous code snippets. Let's see what we can do to handle these possibilities.

#### try/catch

Using the same code earlier, wrapping your controller logic in a `try/catch` is the quickest way to handle errors.

```js
// user controller file

const getUserById = async (req, res) => {
  const userId = req.params.id;

  try {
    const user = await someDBQueryToGetUser(userId);

    if (!user) {
      res.status(404).send("User not found");
      return;
    }

    res.status(200).send(`User found: ${user.name}`);
  } catch (error) {
    console.error("Error retrieving user:", error);
    res.status(500).send("Internal Server Error");
    // or we can call next(error) instead of sending a response here
    // Using `next(error)` however will require you to add a global error middleware that will be demonstrated below
  }
};
```

However, this is not exactly a clean solution since eventually, we will have to add the same try/catch block to *all* controllers. There is a package called `express-async-handler` that you can install to hide this bit, it essentially just chains a `catch` to "catch" any errors in the function.

```js
const asyncHandler = require("express-async-handler");

// Any errors that is thrown in this function will automatically be caught and call the `next` function
const getUserById = asyncHandler(async (req, res) => {
  const userId = req.params.id;

  const user = await someDBQueryToGetUser(userId);

  if (!user) {
    res.status(404).send("User not found");
    return;
  }

  res.status(200).send(`User found: ${user.name}`);
});
```

#### With a middleware

We can also create a global error middleware to handle all errors in our application coming down from other middlewares and this error middleware is commonly placed at the very end of our application code, to ensure that it is actually the last middleware to be executed and to only handle errors bubbling down from other middlewares before it.

```js
// Every thrown error in the application or the previous middleware calling `next` with an error as an argument will eventually go to this middleware
app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).send(err);
});
```

However, take note that this is a middleware that requires *four parameters* that you will need to provide even if they are not used. If you for example exclude one of the parameters, it will not function as an error middleware. You can try it out yourself ;)

It is the same as the previous middlewares with three parameters but with one new parameter in a different order:

- `err` - The error object. This is an odd one but it *must* be the first parameter in the callback.
- `req` - The request object, which represents the incoming HTTP request.
- `res` - The response object, which represents the HTTP response that will be sent back to the client.
- `next` - The function that pass the control to the *next* middleware (We'll get to this later).

This middleware handles the *errors thrown* in other middlewares or something that is sent by a previous middleware using the `next` function (e.g. `next(err)`).

So the way express distinguishes this middleware is again through adding *four parameters* not a single one missing. A route middleware or a middleware with *less than four parameters* will always be considered as a request middleware instead of this error middleware even if you place it last.

```js
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

With the solutions above, the error middleware can only really respond with a `500` status code no matter what error it is. Because what if we actually want to send a `404`? A common way to do this is to create our own custom error by extending the Error object.

```js
class CustomNotFoundError extends Error {
  constructor(message) {
    super(message);
    this.statusCode = 404;
  }
}
```

We can then use this custom error class and refactor the earlier version of `getUserById` like so:

```js
const getUserById = asyncHandler(async (req, res) => {
  const userId = req.params.id;

  const user = await someDBQueryToGetUser(userId);

  if (!user) {
    throw new CustomNotFoundError("User not found");
  }

  res.status(200).send(`User found: ${user.name}`);
});
```

Since we are using `express-async-handler` that chains the `catch` to "catch" whatever error is thrown inside of this function and with the usage of the error middleware that handles all the errors within all the middlewares. We don't need to send an error response inside of this function but instead just throw an error!

It will eventually end up in the error middleware where we can also modify:

```js
app.use((err, req, res, next) => {
  console.error(err);
  // We can now specify the `err.statusCode` that exists in our custom error class and if it does not exist it's probably an internal server error
  res.status(err.statusCode || 500).send(err.message);
});
```

This is a useful pattern and you will likely create more custom error classes for different use cases.

#### What is the next function

We've used the `next` function a few times now. But what exactly is it? Well, to put it simply, it is used to pass control to the next middleware function in the application's request-response cycle. To give an example:

```js
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

Here we have `middleware1`, `middleware2`, and `middleware3`. Where `middleware1` calls the `next` function, since we are not yet sending a response, we pass the control to the next middleware `middleware2` as indicated by the order of `app.use` calls where we send a response which ends the request-response cycle, since it has ended, the third middleware does not run. But if we somehow did not call the `next` function, do you know what would happen? Perhaps pop in the discord server and let us know what you think ;)

Also, as we've discussed earlier with regards to calling the `next` function with an error as an argument `next(new Error("OH NO!"))`. Calling the `next` function like this (it's also what the express-async-handler does) will skip *all* regular middlewares and will go straight to the error middleware we've created before. But there is also another argument that differs from the error argument, a string with the value `'route'`. Calling `next('route')` will pass the control to the next route middleware, but note that this only works in middlewares loaded by using `app.METHOD` or `router.METHOD` and something you will rarely or not use at all.

### Consolidating what we've learned

A basic example of the file structure would be:

```bash
express-app/
├─ controllers/
│  ├─ userController.js
├─ routes/
│  ├─ userRoutes.js
├─ app.js
```

Creating a user controller file that contains well-defined responsibilities to handle "User".

```js
// user controller file - controllers/userController.js

const asyncHandler = require("express-async-handler");

const getUserById = asyncHandler(async (req, res) => {
  const userId = req.params.id;

  const user = await someDBQueryToGetUser(userId);

  if (!user) {
    throw new CustomNotFoundError("User not found");
  }

  res.status(200).send(`User found: ${user.name}`);
});

const getUsers = asyncHandler(async (req, res) => {
  // code
});

const createUser = asyncHandler(async (req, res) => {
  // code
});

module.exports = { getUserById, getUsers };
```

Route file for the "User"

```js
// route file - routes/userRoutes.js

const express = require('express');
const userController = require('<path-to-user-controller>');

const router = express.Router();

// router-level midlewares

// router.route allows you to chain route handlers on a specified path
// will only execute on `/users/` not `/users/a/b/c` for example unless `router.use` is used
// connect your controllers with the route handlers
router.route('/')
  .get(userController.getUsers)
  .post(userController.createUser);
  // You will likely place your validation/authentication middlewares here or perhaps in the controller file, e.g.
  // .post(validationMiddleware, userController.createUser)

router.route('/:id')
  .get(userController.getUserById);

module.exports = router;
```

The main application file, our entry point.

```js
// app file

const express = require('express');
const morgan = require('morgan');
const userRouter = require('<path-to-user-routes>');

const app = express();

// application-level middlewares, will always execute on every incoming requests, base mount path is `/`

// a nice to have logger, will automatically show logs for every http request
app.use(morgan('dev'));

// parses incoming request's body with JSON payloads(e.g. payloads sent through the network with a JSON.stringify'd body in a fetch call as one example)
// to make it available for use in `req.body`.
app.use(express.json());

// same as above but parses incoming requests with URL-encoded payloads (e.g name=Damon&type=Professional)
// more information on extended in the express documentation
app.use(express.urlencoded({ extended: false }));

app.use((req, res, next) => {
  // You can of course also create your own for your own use-case!
  next(); // Just make sure to call `next`
})

// base mount path is `/users` and will always execute on that specific mount path, and yes including `/users/a/b/c`
app.use('/users', userRouter);
```

### Assignment

<div class="lesson-content__panel" markdown="1">

1. This article [Express Middlewares, Demystified](https://medium.com/@viral_shah/express-middlewares-demystified-f0c2c37ea6a1) Written by Viral Shah will help understand how middlewares work in a depper way. The article also encourages you to read the source code of express which you can likely do by now.
1. Watch this short 10 minutes [video tutorial of the MVC pattern](https://www.youtube.com/watch?v=Cgvopu9zg8Y). There is not much to this other than consolidating what you already know.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the common response methods and their use cases?](#handling-responses)
- [What are the types of middlewares?](#middleware)
- [What does calling next do? What if we pass an error argument? What about when we pass a string of route?](#what-is-the-next-function)
- [What would you do to create a custom error?](#creating-custom-errors)
- [What happens if you pass four parameters to a middleware?](#with-a-middleware)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
