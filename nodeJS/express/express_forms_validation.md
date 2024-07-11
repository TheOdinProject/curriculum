### Introduction

This lesson will cover how to secure your Node.js / Express applications by using the `express-validator` module to perform validation and sanitization.
Proper form handling is how we maintain data integrity and prevent security vulnerabilities in our web applications.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understanding HTML form elements and their actions.

- The form handling process in a client-server application.

- Using `express-validator` for validation and sanitization.

- Best practices for form design and data integrity.

### HTML forms overview

First, a brief refresher on the actual HTML.

Let's create a simple HTML form, with a single text field for collecting a full name, and its associated label element.

The HTML structure would look something like this:

```html
<!-- The action /users/create corresponds to a route you'll define in your Express application -->
<form action="/users/create" method="POST" >
  <label for="fullName">Full Name:</label>
  <input placeholder="John Doe" type="text" name="fullName" id="fullName">
  <button type="submit">Submit</button>
</form>
```

We have the HTML form element itself, with an action pointing to some resource on our server, and a method defined. 
Notice how the method corresponds to an HTTP verb, typically either `GET` or `POST`.

The input needs a corresponding label element, which is what the end user actually sees on the page.

Then, we have our input. 
It has an `id` and a `name` attribute, which must match the `for` attribute defined on our label above.
The `name` attribute is especially important, as it defines how our input will be identified in the form data sent to our server.

It has a type of `text` which tells the browser what type of widget to display, what values to accept, and is used for JavaScript and CSS selectors.

The `type="submit"` button can be pressed by the user to upload the data entered into all other input elements to the server (in this case there's only one).

The `form` attributes define how to communicate with the server:

- `action`: The resource/URL where data is sent for processing when the form is submitted. If this is not set, or is an empty string, the form will be submitted back to the current page URL

- `method`: Defines the HTTP method to use (`POST` or `GET`).

`POST` is more secure for sensitive information, and is used when changing or creating data in the server's database.
`GET` is for forms that don't modify data, such as search forms, or when you want the form submission to be bookmarkable or shareable via URL.

#### Form handling process

The form's `action` will point to some endpoint on our server, which will allow our controller the request. The controller then communicates with the database to handle the data.
We then generate a new or updated view with the controller's response and redirect the client. This is known as the [Post/Redirect/Get (PRG)](https://en.wikipedia.org/wiki/Post/Redirect/Get) design pattern which helps prevent duplicate `POST` requests.

It might help to visualize what this entire process looks like:

<pre class="mermaid">
graph TD
    A[Client] -->|1. POST /users/create| B(Server)
    B -->|2. Process Data| C[(Database)]
    B -->|"3. Redirect (302)"| D[Client]
    D -->|4. GET /users| E(Server)
    E -->|5. Fetch Data| F[(Database)]
    E -->|"6. Render view (200 OK)"| G[Client]
</pre>

### Validation and sanitization

Before the data from a form is sent off to our server, we must first do two things

- *Validation* ensures user input meets the specified criteria (e.g. required fields, correct format).

- *Sanitization* cleans user input to prevent malicious data from being processed by removing or encoding potentially malicious characters.

The library we'll be using is called `express-validator`. While it simplifies both of these processes for us, 
it's important to understand the underlying concepts of these two operations.

#### Installation

We start as usual by installing the correct package in the *root* folder of our project.

```bash
npm i express-validator
```

To get started using the package, we first need to *require* it in our project

```javascript
const { body, validationResult } = require('express-validator');
```

`express-validator` comes with many functions for just about every form operation you could think of, but for this lesson, we'll be sticking with `body()` and `validationResult()`.

### Understanding the body() function

The `body()` function allows you to specify which fields in the request body should be validated and sanitized, as well as how to handle it.

```javascript
[
  body("birthdate", "Must be a valid date.")
          .optional({ values: "falsy" })
          .isISO8601() // Enforce a YYYY-MM-DD format.
];
```

This example marks `birthdate` field as optional, 
but still enforces the ISO8601 date format on inputs. This is because `{ values: "falsy }"` means values that aren't `undefined`, `null`, `false`, or `0` will still be validated.

### Chaining validations

You can also chain multiple validation methods, with unique error messages if the checks fail.

```javascript
[
    body("name")
    .escape()
    .trim()
    .isLength({ min: 1 })
    .withMessage("Name can not be empty.")
    .isAlpha()
    .withMessage("Name must only contain alphabet letters."),  
];
```

This ensures that name is not only present and trimmed, but also only contains alphabet letters.

Reading [OWASP.ORG](https://blog.presidentbeef.com/blog/2020/01/14/injection-prevention-sanitizing-vs-escaping/) will give you a good idea on what escaping means and why we do it.

### Validation results

Once the validation rules are applied, you can use 'validationResult' to handle any validation errors.
We use `asyncHandler` to automatically catch these errors in our async route handlers and pass them to the middleware:

```javascript
// asyncHandler lets us wrap async express routes to handle errors.
asyncHandler(async (req, res, next) => {
  const errors = validationResult(req);
  
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  } else {
    res.send("Data is valid, form submitted!");
  }
});
```

This setup checks for any failed validation checks, and if there are any (the errors array is NOT empty), 
then it sends a 400 code, along with any errors that may be present.

### Forms and Express routes

One final thing to cover is how to handle routes in Express. 
After all, our form needs somewhere to send the data to.

Since we don't want our routes handling logic, we instead use a controller.

```javascript
const asyncHandler = require("express-async-handler");

exports.user_update_get = asyncHandler(async (req, res, next) => {});
exports.user_update_post = asyncHandler(async (req, res, next) => {});
```

Inside our router, we can then assign routes which correspond to the controller's functions:

```javascript
const { Router } = require("express");
const usersRouter = Router();
const usersController = require("../controllers/usersController");

// User update routes
usersRouter.get("/users/:id/update", usersController.user_update_get);
usersRouter.post("/users/:id/update", usersController.user_update_post);

module.exports = usersRouter;
```

You'll notice there's a respective `GET` and `POST` route.
* `GET` routes typically display forms or confirmation pages.
* `POST` routes handle form submissions and data processing.

You may also notice the `:id` parameter in the route.
This lets us pass a value to those routes that we can use to tell the controller which `User` object
we're referencing.

And in our form, the action would look something like this:

```html
<!-- Example using EJS with POST to submit an update to our Express server. -->
<form action="/users/<%= user.userId %>/update" method="POST"></form>
```

`/users/:id/update` is an *endpoint* we've created on our Express server.

### Handling errors

What happens if we don't give our route a valid `:id` to delete or update? We need a way to tell our users an error occurred.

```javascript
// Handles POST requests for the /users/:id/delete route.
// Status code 400 can indicate malformed request syntax, or a missing :id in our case.
exports.user_delete_post = asyncHandler(async (req, res, next) => {
  if (!req.params.id) {
    return res.status(400).send("No user id provided.");
  }
});
```

By responding with a status code and a message, we give the client a way to both handle the error code,
and a way to display an appropriate error message. We could also render a new or updated view which we'll see below.

### Putting it together

Let's create a quick Express application to demonstrate how clients send data to servers with forms.

Set up a new Express app with EJS templating:

```bash
npm init -y
npm i express ejs express-async-handler express-validator
```

Create folders for `routes`, `views`, `controllers`, and an `app.js` file:

```javascript
// app.js
const express = require("express");
const app = express();
const usersRouter = require("./routes/usersRouter");

app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));
app.use("/users", usersRouter);
app.get("/", (req, res) => res.render("index", { title: "Userbase" }));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Express app listening on port ${PORT}!`));
```

Then create a new router called `usersRouter.js` in the routes folder:

```javascript
// routes/usersRouter.js
const { Router } = require("express");
const usersController = require("../controllers/usersController");
const usersRouter = Router();

usersRouter.get("/", usersController.users_list);
usersRouter.post("/create", usersController.users_create_post);

module.exports = usersRouter;
```

Next we'll create two views:
* `index.ejs` will display our main form.
* `users.ejs` will list all the users we've created.

```html
<!-- views/index.ejs -->
<!DOCTYPE html>
<html>
  <head>
    <title><%= title %></title>
  </head>
  <body>
    <h1><%= title %></h1>
    <form action="/users/create" method="POST">
      <label for="firstName">First Name: </label>
      <input type="text" name="firstName" required>
      <label for="lastName">Last Name: </label>
      <input type="text" name="lastName" required>
      <button type="submit">Submit</button>
    </form>
    <a href="/users">View all users</a>
  </body>
</html>
```

```html
<!-- views/users.ejs -->
<!DOCTYPE html>
<html>
  <body>
    <h1><%= title %></h1>
    <ul>
      <% users.forEach(user => { %>
        <li>
          ID: <%= user.userId %>, Name: <%= user.firstName %> <%= user.lastName %> 
        </li>
      <% }); %> 
    </ul>
    <a href="/">Back to Home</a>
  </body>
</html>
```

And we'll finally add the logic for this router in our controller:

```javascript
// controllers/usersController.js
// User is a factory function which lets us model what we would see in a database.
// We will explore this concept more as we dive deeper into databases.
const User = (userId, firstName, lastName) => ({ userId, firstName, lastName });
const asyncHandler = require("express-async-handler");

let userStorage = {};
let userId = 0;

exports.users_list = asyncHandler(async (req, res) => {
  res.render("users", { title: "User List", users: Object.values(userStorage) });
});

exports.users_create_post = asyncHandler(async (req, res) => {
  const { firstName, lastName } = req.body;
  userStorage[userId] = User(userId, firstName, lastName);
  userId++;
  res.redirect("/users");
});
```

We can test our server with: `node --watch app.js`.

You'll see we're able to add new users at `http://localhost:3000`, as well as list all existing users at `http://localhost:3000/users`.

Let's add a few methods to our controller for validating and sanitizing our form to get the type of data we want.

```javascript
const {body, validationResult} = require("express-validator")

const validate_user = [
  body("firstName").trim().isAlpha().isLength({ min: 1, max: 10 }).escape(),
  body("lastName").trim().isAlpha().isLength({ min: 1, max: 10 }).escape(),
];

// We can pass an entire array of middleware validations to our controller.
exports.users_create_post = [
  validate_user,
  asyncHandler(async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).render("index", { title: "Userbase", errors: errors.array() });
    } else {
      // Original logic
    }
  })
];
```

And we need to update our `index.ejs` view to render these errors. Let's create a new partial: `errors.ejs`:

```html
<!-- views/partials/errors.ejs -->
<% if (locals.errors) {%>
  <ul>
    <% errors.forEach(function(error) { %>
    <li><%= error.msg %></li>
    <% }); %>
  </ul>
<% } %>
```

And we'll include the partial just above our form in `index.ejs`.

```html
<%- include('partials/errors.ejs') %>
```

If the form is filled out incorrectly, you'll see a page containing all the errors.

Now that we can create users, we also need a way to modify them.
Let's create a form that lets us specify an ID and the values we want to update by making a new view: `update.ejs`.

```html
<!-- views/edit.ejs -->
<%- include('partials/errors.ejs') %>
<form action="/users/<%= user.userId %>/update" method="POST">
  <input type="text" name="firstName" value="<%= user.firstName %>" required>
  <input type="text" name="lastName" value="<%= user.lastName %>" required>
  <button type="submit">Update User</button>
</form>
```

We'll modify `users.ejs` to include a new "Update" button to make our `GET` request to the route:

```html
<li>
  ID: <%= user.userId %>, Name: <%= user.firstName %><%= user.lastName %>
  <a href="/users/<%= user.userId %>/update">Update</a>
</li>
```

Just like how we added a route for creating users, we'll add routes for updating them:

```javascript
usersRouter.get("/:userId/update", usersController.users_update_get);
usersRouter.post("/:userId/update", usersController.users_update_post);
```

Then we'll add the logic for the `GET` request into our controller:

```javascript
exports.users_update_get = asyncHandler(async (req, res) => {
  const user = userStorage[req.params.userId];
  if (!user) return res.status(404).send("User not found.");
  res.render("update", { user, errors: [] });
});

exports.users_update_post = [
  validate_user,
  asyncHandler(async (req, res) => {
    const { userId } = req.params;
    const errors = validationResult(req);
    if (!userStorage[userId]) return res.status(404).send("User not found.");
    if (!errors.isEmpty()) return res.status(400).render("update", { 
        errors: errors.array(), user: userStorage[userId] 
    });
    
    const { firstName, lastName } = req.body;
    userStorage[userId] = User(parseInt(userId), firstName, lastName);
    res.redirect("/users");
  })
];
```

You'll see you're now able to update users, and this looks very similar to how we create our users.

Finally, let's add a way to delete users as well by starting with another form inside our `users.ejs` view:

```html
<!-- In views/users.ejs -->
<ul>
  <% users.forEach(function(user) { %>
  <li>ID: <%= user.userId %>, Name: <%= user.firstName %> <%= user.lastName %></li>
  <a href="/users/<%= user.userId %>/update">Update</a>
  <!-- This time we're sending a POST request to our route, so we need a form. -->
  <form action="/users/<%= user.userId %>/delete" method="POST" style="display:inline;">
    <button type="submit" onclick="return confirm('Are you sure you want to delete this user?');">Delete</button>
  </form>
  <% }); %>
</ul>
```

Then we add the logic to handle the request into our controller:

```javascript
// Tell the server to delete a matching user, if any. Otherwise, respond with an error.
exports.users_delete_post = asyncHandler(async (req, res) => {
  const userId = req.params.userId;
  if (!userStorage[userId]) return res.status(404).send("User not found.");
  delete userStorage[userId];
  res.redirect("/users");
});
```

Don't forget to add the new route to your router!

```javascript
usersRouter.post("/:userId/delete", usersController.users_delete_post);
```

You'll notice we didn't need a `GET` route here since we're already redirecting to `/users`.

We could go much deeper into working safely with forms, but we'll stop there. 
By now you can already see how helpful `express-validator` is,
and how you can do almost anything you want with the `req.body` object.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Add user details

Expand the `User` model we created to include more details. Implement the following fields and validations to your model:
* Email (required, must be formatted properly)
* Age (optional, must be a number between 18 and 120)
* Bio (optional, maximum 200 characters)

Don't forget to update the view to display these new fields!

#### Implement searching

What if we want to search for a specific user in a list of thousands?
We'll need a new route and view that lets clients search our list of users.
1. Add a form (in `users.ejs` or another view) which accepts a `name` or `email` (or both!)
1. Create a new route `/users/search` which accepts `GET` and `POST` requests.
1. Add the search logic to your controller which searches your list for a matching user.
   * Your `POST` request should handle searching for the user.
   * Your `GET` request should then render the search result.
1. Display the search results in a new view: `search.ejs`.
</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the attributes of a form element and what do they do?](#html-forms-overview)

- [How do you install and import express-validator in your project?](#validation-and-sanitization)

- [How do you validate and sanitize form input using express-validator?](#understanding-the-body-function)

- [What is the difference between validation and sanitization?](#validation-and-sanitization)

- [How do you handle validation errors in Express routes?](#validation-results)

- [What methods can you chain with the body function to validate form fields?](#chaining-methods)

- [What is the importance of escaping HTML characters in a form?](https://owasp.org/www-community/attacks/SQL_Injection)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Express request object](https://expressjs.com/en/api.html#req)
- [Express response object](https://expressjs.com/en/api.html#res)
  It's certainly not required viewing, but web dev simplified makes some of the best tutorials on Express. Take a watch if you need a refresher.
- [Web dev simplified](https://youtu.be/SccSCuHhOw0?si=2dZ5Y4dvxyh7jpcy)
