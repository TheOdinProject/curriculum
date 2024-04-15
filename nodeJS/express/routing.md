### Introduction

In the previous lesson, we broke down a basic Express app and a request's journey through it. However, in a real app, we'd want to handle many different types of requests for different things.

Routes essentially just match a request's HTTP verb (e.g. `GET` or `POST`) and URL path to the appropriate set of middleware functions - the controllers. We will explore controllers and middleware in more detail in the next lesson. For now, let's dive into how we can use routes.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe how routes are defined.
- Match routes to specific HTTP verbs and paths.
- Explain route parameters and query parameters.
- Extract routes to their own routers.

### The anatomy of a route

Let's return to our sole route in our previous basic Express app.

```javascript
app.get("/", (req, res) => res.send("Hello, world!"));
```

`app.get("/"` tells us that this route will match any requests that go through `app` (our whole server) that have the `GET` HTTP verb and are for the `/` path. If instead we had the following:

```javascript
app.post("/messages", (req, res) => res.send("This is where you can see any messages."));
```

That would tell us the route matches any `POST` requests to the `/messages` path of our `app`. If you sent a `GET` request to the `/messages` path, it would not match this route.

<div class="lesson-note" markdown="1">

#### HTTP verbs

[There are many HTTP verbs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods), but for now, we will primarily be using `GET` (used to retrieve data from the server only) and `POST` (used to send data to the server e.g. forms). Later, when we cover REST APIs, you will often also encounter `PUT` and `DELETE` verbs.

</div>

### Paths

The first argument we pass a route is the path to match, which can either be a string or a regular expression. `/messages` matches that exactly, while `/message/all` only matches if the path is `/messages/all` (not `/messages`, nor `/messages/new`).

With string paths, we can also use certain symbols like `?`, `+`, `*` and `()` to provide some pattern-matching functionality, similar to regular expressions.

```javascript
// ? makes a character optional
// The following path matches both /message and /messages
'/messages?'

// () groups characters together, allowing symbols to act on the group
// The following path matches both / and /messages
'/(messages)?'

// * is a wildcard matching any number of any characters
// The following path can match /foo/barbar and even /foo-FOO/bar3sdjsdfbar
'/foo*/bar*bar'
```

#### Route parameters

What if we wanted to have a route for all messages for any username, for example, `/odin/messages` or `/thor/messages`, or even `/theodinproject79687378/messages`? But instead of just using `*` as a wildcard, we wanted to use the value of a segment in our middleware functions? Just like with React Router, we can use `route parameters`, and a path can contain as many of these parameters as we need.

To denote a route parameter, we start a segment with a `:` followed by the name of parameter (which can only consist of case-sensitive alphanumeric characters, or `_`). Whatever we name that route parameter, Express will automatically populate the `req.params` object in any of the following middleware functions with whatever value the path passed into the parameter, using the parameter name as a key.

```javascript
/**
 * The path /odin/messages will have this log
 * { username: 'odin' }
 *
 * /theodinproject79687378/messages would instead log
 * { username: 'theodinproject79687378' }
 */
app.get('/:username/messages', (req, res) => {
  console.log(req.params);
  res.end();
});

/**
 * The path /odin/messages/79687378 will have this log
 * { username: 'odin', messageId: '79687378' }
 */
app.get('/:username/messages/:messageId', (req, res) => {
  console.log(req.params);
  res.end();
});
```

Now we can easily extract values from the request path for use within our middleware chain!

#### Query parameters

Query parameters are a unique and optional part of a URL that appear at the end following a `?`. They are special as they are not actually considered part of the path itself, but are essentially more like arguments we can pass in to a given path. For example, `/odin/messages?sort=date&direction=ascending` will still match the route with the `/:username/messages` path, but we can access the `sort=date` and `direction=ascending` key-value pairs inside the middleware chain.

Express automatically parses any query parameters in a request and will populate the `req.query` object with any key-value pairs it finds.

```javascript
/**
 * The path /odin/messages?sort=date&direction=ascending will log
 * Params: { username: 'odin' }
 * Query: { sort: 'date', direction: 'ascending' }
 */
app.get('/:username/messages', (req, res) => {
  console.log('Params:', req.params);
  console.log('Query:', req.query);
  res.end();
});
```

You may have already seen this in websites like YouTube, where every YouTube video is given a code. To watch that video, you navigate to `https://www.youtube.com/watch` and pass that video code as a query parameter with the `v` key. So appending `?v=dQw4w9WgXcQ` will [request `/watch` from YouTube using `dQw4w9WgXcQ` as the `v` query parameter](https://www.youtube.com/watch?v=dQw4w9WgXcQ).

### Routers

So far, we've not been using many routes, and all routes we've shown have been attached to `app`, our server itself. In a real application with lots of routes, we'd probably want to organise our routes into groups for better organisation. We'd also probably want our app to skip checking certain groups of routes for a match depending on the incoming request.

Say we were making a library app and we wanted pages that dealt with books, and pages that dealt with authors. That's on top of the homepage and any other miscellaneous pages like "about" or "contact".

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

It'd be nice if we could extract the route groups to their own files. It'd also be nice if the server didn't need to check any routes that didn't start with `/authors` if a request was made to a path that started with `/authors`. We can do that using routers!

```javascript
// app.js
const express = require('express');
const app = express();
const booksRouter = require('routes/booksRouter');
const authorsRouter = require('routes/authorsRouter');
const indexRouter = require('routes/indexRouter');

app.use('/books', booksRouter);
app.use('/authors', authorsRouter);
app.use('/', indexRouter);

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`My first Express app - listening on port ${PORT}!`);
});
```

And what a router might look like:

```javascript
// routes/authorsRouter.js
const { Router } = require('express');

const authorsRouter = Router();

authorsRouter.get('/', (req, res) => res.send('All authors'));
authorsRouter.get('/:authorId', (req, res) => {
  const { authorId } = req.params;
  res.send(`Author ID: ${authorId}`);
});

module.exports = authorsRouter;
```

Now we can avoid having an `app.js` file littered with a million different routes! We can create individual files for routers, and place them neatly in their own directory.

In our `routes/authorsRouter.js` file, we destructure the Express object to get a Router function and use it to create our `authorsRouter`. We can use the same `.get` or `.post` methods on this router instead of on the whole server object. This ties our routes to the router so they will only come into play for requests that end up going through this router.

Back in `app.js`, we specify that any requests with paths starting with `/books` will be passed through `booksRouter` for route matching. If our request starts with `/authors`, it will skip these book routes then check the routes in `authorsRouter` instead. Any other requests that don't start with either of these will run through `indexRouter`.

<div class="lesson-note lesson-note--tip" markdown="1">

#### Paths in routers extend the parent path!

Note that because our routes are now tied to a specific router, the route paths we use *extend* the parent path, that is they all implicitly start with the specified parent path.

Within `authorsRouter.js`:

- `/` will match requests with the path `/authors`
- `/:authorId` will match requests with the path `/authors/:authorId`
- `/authors/:authorId` will match requests with the path `/authors/authors/:authorId`

Don't double up on the parent path!

</div>

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
