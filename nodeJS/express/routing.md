### Introduction

In the previous lesson, we broke down a basic Express app and a request's journey through it. However, in a real app, we'd want to handle many different types of requests for different things.

Routes essentially just match a request's HTTP verb (e.g. GET or POST) and URL path to the appropriate set of middleware functions - the controllers. We will explore controllers and middleware in more detail in the next lesson. For now, let's dive into how we can use routes.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe how routes are defined.
- Explain route parameters and query parameters.
- Setup new routers on a path

### The anatomy of a route

Let's return to our sole route in our previous basic Express app.

```javascript
app.get("/", (req, res) => res.send("Hello, world!"));
```

`app.get("/" ...` tells us that this route will match any GET requests that go through the `app` router (which is our whole server!) to the `/` path. If instead we had the following:

```javascript
app.post("/messages", (req, res) => res.send("This is where you can see any messages."));
```

That would tell us the route matches any POST requests to the `/messages` path of our `app`. If you sent a GET request to the `/messages` path, it would not match this route. Each HTTP verb has its own Express route method, and you can also use [app.all()](https://expressjs.com/en/api.html#app.all) to make a route match all verbs.

<div class="lesson-note" markdown="1">

#### HTTP verbs

[There are many HTTP verbs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods), but for now, we will primarily be using GET (used to retrieve data from the server only) and POST (used to send data to the server e.g. forms). Later, when we cover REST APIs, you will often also encounter verbs like PUT and DELETE.

</div>

### Paths

The first argument we pass a route is the path to match, which can either be a string or a regular expression. `/messages` matches that exactly, while `/message/all` only matches if the path is `/messages/all` (not `/messages`, nor `/messages/new`).

With string paths, we can also use certain symbols like `?`, `+`, `*` and `()` to provide some pattern-matching functionality, similar to regular expressions. For example:

```javascript
// ? makes a character optional
// The following path matches both /message and /messages
"/messages?"

// () groups characters together, allowing symbols to act on the group
// The following path matches both / and /messages
"/(messages)?"

// * is a wildcard matching any number of any characters
// The following path can match /foo/barbar and even /foo-FOO/bar3sdjsdfbar
"/foo*/bar*bar"
```

<div id="order-matters" class="lesson-note lesson-note--warning" markdown="1">

#### Order matters!

Your routes will be set up in your server in the order they are defined.

```javascript
app.get("*", (req, res) => {
  res.send("* is a great way to catch all otherwise unmatched paths, e.g. for custom 404 error handling.");
});
app.get("/messages", (req, res) => {
  res.send("This route will not be reached because the previous route's path matches first.");
});
```

In order for our `GET /messages` request to match the `/messages` route, we will need to reverse the order our routes are defined. Doing so will prevent it from reaching the `*` route, as it will match the `/messages` route first.

</div>

#### Route parameters

What if we wanted to have a route for all messages for any username, for example, `/odin/messages` or `/thor/messages`, or even `/theodinproject79687378/messages`? We could technically use `/*/messages`, but what if we wanted to extract and use the username in our middleware functions? Just like with React Router, we can use `route parameters`, and a path can contain as many of these parameters as we need.

To denote a route parameter, we start a segment with a `:` followed by the name of parameter (which can only consist of case-sensitive alphanumeric characters, or `_`). Whatever we name that route parameter, Express will automatically populate the `req.params` object in any of the following middleware functions with whatever value the path passed into the parameter, using the parameter name as a key.

```javascript
/**
 * GET /odin/messages will have this log
 * { username: 'odin' }
 *
 * GET /theodinproject79687378/messages would instead log
 * { username: 'theodinproject79687378' }
 */
app.get("/:username/messages", (req, res) => {
  console.log(req.params);
  res.end();
});

/**
 * GET /odin/messages/79687378 will have this log
 * { username: "odin", messageId: "79687378" }
 */
app.get("/:username/messages/:messageId", (req, res) => {
  console.log(req.params);
  res.end();
});
```

Now we can easily extract values from the request path for use within our middleware chain!

#### Query parameters

Query parameters are a unique and optional part of a URL that appear at the end. A `?` denotes the start of the query parameters, with each query being a key-value pair with the format `key=value`, and each query separated by an `&`. They are special as they are not actually considered part of the path itself, but are essentially more like arguments we can pass in to a given path. For example, `/odin/messages?sort=date&direction=ascending` will still match the route with the `/:username/messages` path, but we can access the `sort=date` and `direction=ascending` key-value pairs inside the middleware chain.

Express automatically parses any query parameters in a request and will populate the `req.query` object with any key-value pairs it finds. If any keys are repeated, Express will put all values for that key into an array.

```javascript
/**
 * GET /odin/messages?sort=date&direction=ascending will log
 * Params: { username: "odin" }
 * Query: { sort: "date", direction: "ascending" }
 *
 * GET /odin/messages?sort=date&sort=likes&direction=ascending will log
 * Params: { username: "odin" }
 * Query: { sort: ["date", "likes"], direction: "ascending" }
 */
app.get("/:username/messages", (req, res) => {
  console.log("Params:", req.params);
  console.log("Query:", req.query);
  res.end();
});
```

You may have already seen this with websites like YouTube. Every YouTube video is given a code and to watch that video, you navigate to `https://www.youtube.com/watch`, passing that video code as a query parameter with the `v` key. You could even specify at what timestamp in seconds the video should start at via the `t` key. So appending `?v=xm3YgoEiEDc&t=424s` will [request `/watch` from YouTube for the `xm3YgoEiEDc` video starting `424` seconds in](https://www.youtube.com/watch?v=xm3YgoEiEDc&t=424s).

### Routers

So far, we've not been using many routes, and all routes we've shown have been attached to `app`, our server itself. In a real application with lots of routes, we'd probably want to organize our routes into groups and extract each group out to their own file. We could also then more easily write things that affect only the routes in that file, and not any others.

Say we were making a library app and we wanted pages that dealt with books and pages that dealt with authors. That's on top of the homepage and any other miscellaneous pages like "about" or "contact".

We might want our server to handle the following routes:

```text
GET /
GET /about
GET /contact
POST /contact

GET /books
GET /books/:bookId
GET /books/:bookId/reserve
POST /books/:bookId/reserve

GET /authors
GET /authors/:authorId
```

It'd be nice if we could extract the route groups to their own files, and we can do that using routers!

```javascript
// app.js
const express = require("express");
const app = express();
const booksRouter = require("routes/booksRouter");
const authorsRouter = require("routes/authorsRouter");
const indexRouter = require("routes/indexRouter");

app.use("/books", booksRouter);
app.use("/authors", authorsRouter);
app.use("/", indexRouter);

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`My first Express app - listening on port ${PORT}!`);
});
```

And what a router might look like:

```javascript
// routes/authorsRouter.js
const { Router } = require("express");

const authorsRouter = Router();

authorsRouter.get("/", (req, res) => res.send("All authors"));
authorsRouter.get("/:authorId", (req, res) => {
  const { authorId } = req.params;
  res.send(`Author ID: ${authorId}`);
});

module.exports = authorsRouter;
```

Now we can avoid having `app.js` littered with a million different routes! We can create individual files for routers, and place them neatly in their own `routes` directory.

In `routes/authorsRouter.js`, we destructure the Express object to get a Router function and use it to create our `authorsRouter`. We can use the same `.get` or `.post` methods on this router instead of on the whole server object, meaning we can write routes and router-level middleware (we will dive deeper into these in the next lesson)!

Back in `app.js`, we specify that any requests with paths starting with `/books` will be passed through `booksRouter` for route matching. If our request starts with `/authors`, it will skip these book routes and then check the routes in `authorsRouter` instead. Any other requests that don't start with either of these will run through `indexRouter`.

<div id="extend-router-paths" class="lesson-note lesson-note--tip" markdown="1">

#### Paths in routers extend the parent path!

Note that because our routes are now tied to a specific router, the route paths we use *extend* the parent path, that is they all implicitly start with the specified parent path.

Inside `authorsRouter.js`, which extends the `/authors` path:

- `/` will match requests with the path `/authors`
- `/:authorId` will match requests with the path `/authors/:authorId`
- `/authors/:authorId` will match requests with the path `/authors/authors/:authorId`

Don't double up on the parent path!

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read through the Express' [primer on Routing](https://expressjs.com/en/guide/routing.html) for an overview of this lesson's topics. Remember to reference the [Express documentation](https://expressjs.com/en/4x/api.html) for more information on specific methods.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How can you define a route that will only match a specific HTTP verb?](#the-anatomy-of-a-route)
- [How can you define a route that will match all HTTP verbs?](https://expressjs.com/en/api.html#app.all)
- [How can you define path patterns for your routes to match?](#paths)
- [How does the order of your routes affect which routes get matched?](#order-matters)
- [What object gets populated with route parameters?](#route-parameters)
- [How do you access query parameters within routes?](#query-parameters)
- [How do you extract routes to an individual router?](#routers)
- [We have a router for paths starting with `/users`. Inside that router, what path should a GET route have to match a GET request to the `/users/delete` path?](#extend-router-paths)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
