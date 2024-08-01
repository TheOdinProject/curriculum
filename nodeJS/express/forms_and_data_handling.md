### Introduction

In this lesson, we'll dive into forms and how to manage them using Express. We'll explore ways to secure your Node.js / Express applications by using `express-validator` for validation and sanitization. Understanding proper form handling is crucial for maintaining data integrity and protecting your web applications from security risks.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understanding HTML form elements and their actions.
- Using `express-validator` for validation and sanitization.
- Best practices for form design and data integrity.

### HTML forms overview

First, a brief refresher on the actual HTML.

Let's create a simple HTML form, with a single text field for collecting a full name, and its associated label element.

The HTML structure would look something like this:

```html
<form action="/create" method="POST" >
  <label for="fullName">Full Name:</label>
  <input placeholder="John Doe" type="text" name="fullName" id="fullName">
  <button type="submit">Submit</button>
</form>
```

We have the HTML form element itself, with an action pointing to some resource on our server, and a method defined. Notice how the method corresponds to an HTTP verb, typically either `GET` or `POST`.

The form consists of a text input with an associated label and a submit button.

The input's `name` attribute plays a key role, as it defines how our input will be identified in the form data sent to our server. This is especially important when handling form submissions on the backend.

The `type="submit"` button then allows the user to upload the entered data to the server.

The `form` attributes define how to communicate with the server:

- `action`: The resource/URL where data is sent for processing when the form is submitted. If this is not set, or is an empty string, the form will be submitted back to the current page URL
- `method`: Defines the HTTP method to use (`POST` or `GET`).

`POST` is generally more secure because it keeps sensitive information out of the URL, which means they won't show up in server logs, and is the standard choice for creating or updating data on the server side. `GET` is for forms that don't modify data, such as search forms, or when you want the form submission to be bookmarkable or shareable via URL.

#### Form handling process

The form's `action` will point to some endpoint on our server, which will allow our controller to handle the request. The controller then communicates with the database to handle the data.

We then generate a new or updated view with the controller's response and redirect the client. This is known as the [Post/Redirect/Get (PRG)](https://en.wikipedia.org/wiki/Post/Redirect/Get) design pattern which helps prevent duplicate `POST` requests.

### Validation and sanitization

Before the data from a form is sent off to our server, we should consider two important steps:

- *Validation* ensures user input meets the specified criteria (e.g. required fields, correct format).
- *Sanitization* cleans user input to prevent malicious data from being processed by removing or encoding potentially malicious characters.

We don't always have to sanitize data right when we get it - sometimes it makes sense to sanitize just before we use it instead.

We'll be using a library called `express-validator` to help us out with both of these. While it makes these processes much simpler, it's important to understand the underlying concepts of these two operations.

#### Installing express-validator

We start as usual by installing the correct package in the *root* folder of our project.

```bash
npm install express-validator
```

To get started using the package, we first need to `require` it in our project

```javascript
const { body, validationResult } = require("express-validator");
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

This example marks `birthdate` field as optional, but still enforces the ISO8601 date format on inputs. This is because `{ values: "falsy" }` means values that aren't `undefined`, `null`, `false`, or `0` will still be validated.

### Chaining validations

You can also chain multiple validation methods, with unique error messages if the checks fail.

```javascript
[
  body("name")
    .trim()
    .notEmpty()
    .withMessage("Name can not be empty.")
    .isAlpha()
    .withMessage("Name must only contain alphabet letters."),  
];
```

This ensures that `name` is not only present and trimmed, but also only contains alphabet letters.

### Escaping user input

While this might work for outputs we know won't have special characters, like names or ages, we also have to consider situations that do allow those characters. For example, when writing their "About Me" description, what would happen if the client decides to inject JavaScript code instead?

```ejs
<div>
  About Me: <%- description %>
</div>

// The client then inputs the following as their page's About Me:
<script>alert("Hacked!");</script>
```

When unescaped, this would be rendered into HTML as:

```html
<div>
  About Me: <script>alert("Hacked!");</script>!
</div>
```

To prevent this [cross-site scripting (XSS) attack](https://en.wikipedia.org/wiki/Cross-site_scripting), we can *escape* the output (you may also see this referred to as *encoding*). Escaped HTML replaces special characters, like `<`, with their respective HTML entities, in this case `&lt;`. In EJS, we can escape the output using `<%= %>`.

```ejs
<div>
  About Me: <%= username %>!
</div>

// The escaped output is now rendered harmless:
// About Me: &lt;script&gt;alert(&quot;Hacked!&quot;);&lt;/script&gt;!
```

So why not escape the data when we receive it by adding .escape() to the end of our body() validation chain instead? "Dangerous characters" are only dangerous at the point of use, and also only in certain contexts. What's "dangerous" for HTML may not be dangerous for SQL and vice versa, and they won't pose risks until they get used in those contexts.

Also, if we have data with HTML entities after escaping them, if we used escaped output with (`<%= %>`), then `&lt;` wouldn't become `<` but output literally as the text `&lt;`. We'd need to either unescape them then re-escape them via escaped output, or end up using unescaped output (`<%- %>`), which, like using `.innerHTML`, is undesirable as shown above.

### Validation results

Once the validation rules are applied, you can use `validationResult` to handle any validation errors. We use `asyncHandler` to automatically catch these errors in our async route handlers and pass them to the middleware:

```javascript
// asyncHandler lets us wrap async express routes to handle errors.
asyncHandler(async (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).render("index", {
      errors: errors.array(),
    });
  }

  res.redirect("/success");
});
```

This setup checks for any failed validation checks, and if there are any (the errors array is NOT empty), then the server sends a [400 status code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400), along with any errors that may be present, to our `index` view. Otherwise, we're redirected to the `/success` route in our router.

### Forms and Express routes

One final thing to cover is how to handle routes in Express. After all, our form needs somewhere to send the data to.

```javascript
const asyncHandler = require("express-async-handler");

exports.userUpdateGet = asyncHandler(async (req, res, next) => {});
exports.userUpdatePost = asyncHandler(async (req, res, next) => {});
```

Inside our router, we can then assign routes which correspond to the controller's functions:

```javascript
const { Router } = require("express");
const usersRouter = Router();
const usersController = require("../controllers/usersController");

// User update routes
usersRouter.get("/:id/update", usersController.userUpdateGet);
usersRouter.post("/:id/update", usersController.userUpdatePost);

module.exports = usersRouter;
```

In our form, the action would look something like this:

```ejs
<!-- Example using EJS with POST to submit an update to our Express server. -->
<form action="/users/<%= user.userId %>/update" method="POST"></form>
```

`/users/:id/update` is an *endpoint* we've created on our Express server.

### Putting it together

Let's create a quick Express application to demonstrate how clients send data to servers with forms.

Set up a new Express app with EJS templating:

```bash
npm init -y
npm install express ejs express-async-handler express-validator
```

Create folders for `routes`, `views`, `controllers`, `storages`, and an `app.js` file:

```javascript
// app.js
const express = require("express");
const app = express();
const usersRouter = require("./routes/usersRouter");

app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));
app.use("/", usersRouter);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Express app listening on port ${PORT}!`));
```

Most simple forms will use the `Content-Type: application/x-www-form-urlencoded` HTTP header when sending data to the server. Express, however, can't natively parse that data. We can use the `express.urlencoded()` middleware to handle this for us and automatically set form's data to the `req.body` field. When `extended` is `false`,  our server will only accept a `string` or an array of data, so we set it to `true` for some added flexibility. Note that if the `Content-Type` doesn't match `application/x-www-form-urlencoded`, then your server will show the data as an empty object `{}`.

Let's create a new router called `usersRouter.js` in the routes folder:

```javascript
// routes/usersRouter.js
const { Router } = require("express");
const usersController = require("../controllers/usersController");
const usersRouter = Router();

usersRouter.get("/", usersController.usersListGet);
usersRouter.get("/create", usersController.usersCreateGet);
usersRouter.post("/create", usersController.usersCreatePost);

module.exports = usersRouter;
```

Next we'll create two views:

- `index.ejs` will list all the users we've created.
- `createUser.ejs` will display our user creation form.

```ejs
<!-- views/index.ejs -->
<!DOCTYPE html>
<html>
<head>
  <title><%= title %></title>
</head>
<body>
  <h1><%= title %></h1>
  <ul>
    <% if (locals.users) {%>
      <% users.forEach(user => { %>
        <li>
          ID: <%= user.id %>, Name: <%= user.firstName %> <%= user.lastName %>
        </li>
      <% }); %>
    <% } %>
  </ul>
  <a href="/create">Create a user</a>
</body>
</html>
```

```ejs
<!-- views/createUser.ejs -->
<!DOCTYPE html>
<html>
  <head>
    <title><%= title %></title>
  </head>
<body>
  <h1><%= title %></h1>
  <form action="/create" method="POST">
    <label for="firstName">First Name: </label>
    <input type="text" name="firstName" id="firstName" required>
    <label for="lastName">Last Name: </label>
    <input type="text" name="lastName" id="lastName" required>
    <button type="submit">Submit</button>
  </form>
  <a href="/">Back to home</a>
</body>
</html>
```

The logic for this router will go inside of our controller:

```javascript
// controllers/usersController.js
const asyncHandler = require("express-async-handler");
const usersStorage = require("../storages/usersStorage");

exports.usersListGet = asyncHandler(async (req, res) => {
  res.render("index", {
    title: "User list",
    users: usersStorage.getUsers(),
  });
});

exports.usersCreateGet = asyncHandler(async (req, res) => {
  res.render("createUser", {
    title: "Create user",
  });
});

exports.usersCreatePost = asyncHandler(async (req, res) => {
  const { firstName, lastName } = req.body;
  usersStorage.addUser({ firstName, lastName });
  res.redirect("/");
});
```

And we'll use a storage class to hold the users we create. In real-world scenarios, you would almost certainly be using a database for this, which you'll explore further in upcoming lessons. This class is just for demonstration purposes before we get there.

```javascript
// storages/usersStorage.js
// This class lets us simulate interacting with a database.
class UsersStorage {
  constructor() {
    this.storage = {};
    this.id = 0;
  }

  addUser({ firstName, lastName }) {
    const id = this.id;
    this.storage[id] = { id, firstName, lastName };
    this.id++;
  }

  getUsers() {
    return Object.values(this.storage);
  }

  getUser(id) {
    return this.storage[id];
  }

  updateUser(id, { firstName, lastName }) {
    this.storage[id] = { id, firstName, lastName };
  }

  deleteUser(id) {
    delete this.storage[id];
  }
}
// Rather than exporting the class, we can export an instance of the class by instantiating it.
// This ensures only one instance of this class can exist, also known as the "singleton" pattern.
module.exports = new UsersStorage();
```

We can test our server with: `node --watch app.js`.

You'll see we're able to add new users at `http://localhost:3000/create`, as well as list all existing users at `http://localhost:3000/`.

Let's add a few methods to our `usersController.js` for validating and sanitizing our form to get the type of data we want.

```javascript
// This just shows the new stuff we're adding to the existing contents
const { body, validationResult } = require("express-validator");

const alphaErr = "must only contain letters.";
const lengthErr = "must be between 1 and 10 characters.";

const validateUser = [
  body("firstName").trim()
    .isAlpha().withMessage(`First name ${alphaErr}`)
    .isLength({ min: 1, max: 10 }).withMessage(`First name ${lengthErr}`),
  body("lastName").trim()
    .isAlpha().withMessage(`Last name ${alphaErr}`)
    .isLength({ min: 1, max: 10 }).withMessage(`Last name ${lengthErr}`),
];

// We can pass an entire array of middleware validations to our controller.
exports.usersCreatePost = [
  validateUser,
  asyncHandler(async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).render("createUser", {
        title: "Create user",
        errors: errors.array(),
      });
    }
    const { firstName, lastName } = req.body;
    usersStorage.addUser({ firstName, lastName });
    res.redirect("/");
  })
];
```

And we need to update our `createUser.ejs` view to render these errors. Let's create a new partial. Inside the `views` folder, create a new folder called `partials` and inside it, create `errors.ejs`:

```ejs
<!-- views/partials/errors.ejs -->
<% if (locals.errors) {%>
  <ul>
    <% errors.forEach(function(error) { %>
      <li><%= error.msg %></li>
    <% }); %>
  </ul>
<% } %>
```

And we'll include the partial just above our form in `createUser.ejs`.

```ejs
<%- include("partials/errors.ejs") %>
```

If the form is filled out incorrectly, you'll see the page contains all the errors.

Now that we can create users, we also need a way to modify them. Let's create a form that lets us specify an ID and the values we want to update by making a new view: `updateUser.ejs`.

```ejs
<!-- views/updateUser.ejs -->
<!DOCTYPE html>
<html>
  <head>
    <title><%= title %></title>
  </head>
<body>
  <h1><%= title %></h1>
  <%- include("partials/errors.ejs") %>
  <form action="/<%= user.id %>/update" method="POST">
    <input type="text" name="firstName" value="<%= user.firstName %>" required>
    <input type="text" name="lastName" value="<%= user.lastName %>" required>
    <button type="submit">Update User</button>
  </form>
  <a href="/">Back to home</a>
</body>
</html>
```

We'll modify `index.ejs` to include a new "Update" button next to each user to make our `GET` request to the route:

```ejs
<li>
  ID: <%= user.id %>, Name: <%= user.firstName %> <%= user.lastName %>
  <a href="/<%= user.id %>/update">Update</a>
</li>
```

Just like how we added a route for creating users, we'll add routes for updating them:

```javascript
usersRouter.get("/:id/update", usersController.usersUpdateGet);
usersRouter.post("/:id/update", usersController.usersUpdatePost);
```

Then we'll add the logic for the requests into our controller:

```javascript
exports.usersUpdateGet = asyncHandler(async (req, res) => {
  const user = usersStorage.getUser(req.params.id);
  res.render("updateUser", {
    title: "Update user",
    user: user,
  });
});

exports.usersUpdatePost = [
  validateUser,
  asyncHandler(async (req, res) => {
    const user = usersStorage.getUser(req.params.id);
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).render("updateUser", {
        title: "Update user",
        user: user,
        errors: errors.array(),
      });
    }
    const { firstName, lastName } = req.body;
    usersStorage.updateUser(req.params.id, { firstName, lastName });
    res.redirect("/");
  })
];
```

You'll see you're now able to update users, and this looks very similar to how we create our users.

Finally, let's add a way to delete users as well by starting with another form inside our `index.ejs` view:

```ejs
<!-- In views/index.ejs -->
<ul>
  <% if (locals.users) {%>
    <% users.forEach(function(user) { %>
      <li>ID: <%= user.id %>, Name: <%= user.firstName %> <%= user.lastName %></li>
      <a href="/<%= user.id %>/update">Update</a>
      <!-- This time we're sending a POST request to our route, so we need a form. -->
      <form action="/<%= user.id %>/delete" method="POST" style="display:inline;">
        <button type="submit" onclick="return confirm('Are you sure you want to delete this user?');">Delete</button>
      </form>
    <% }); %>
  <% } %>
</ul>
```

Then we add the logic to handle the request into our controller:

```javascript
// Tell the server to delete a matching user, if any. Otherwise, respond with an error.
exports.usersDeletePost = asyncHandler(async (req, res) => {
  usersStorage.deleteUser(req.params.id);
  res.redirect("/");
});
```

Don't forget to add the new route to your router!

```javascript
usersRouter.post("/:id/delete", usersController.usersDeletePost);
```

You'll notice we didn't need a `GET` route here since we're already redirecting to `/`.

We could go much deeper into working safely with forms, but we'll stop there. By now you can already see how helpful `express-validator` is, and how you can do almost anything you want with the `req.body` object.

To give you an overview of what this entire flow looks like visually, here's an example courtesy of MDN:

![A diagram showing an outline of how a form interacts with a server using GET and POST requests.](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/forms/web_server_form_handling.png)

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Add user details

Expand the `User` model we created to include more details. Implement the following fields and validations to your model:

- Email (required, must be formatted properly)
- Age (optional, must be a number between 18 and 120)
- Bio (optional, maximum 200 characters)

Don't forget to update the view to display these new fields!

#### Implement searching

What if we want to search for a specific user in a list of thousands? We'll need a new route and view that lets clients search our list of users.

1. Add a form (in `createUser.ejs` or another view) which accepts a `name` or `email` (or both!)
1. Create a new route `/search` which accepts `GET` and `POST` requests.
1. Add the search logic to your controller which searches your list for a matching user.
   - Your `POST` request should handle searching for the user.
   - Your `GET` request should then render the search result.
1. Display the search results in a new view: `search.ejs`.

#### Further Reading

- This article expands on [what sanitizing and escaping means, and how they can help further secure your web applications](https://blog.presidentbeef.com/blog/2020/01/14/injection-prevention-sanitizing-vs-escaping/).
- [express-validator](https://express-validator.github.io/docs/) contains the full documentation for `validator`, with some important sections being:
  - [Getting Started with express-validator](https://express-validator.github.io/docs/guides/getting-started)
  - [Validation Chains](https://express-validator.github.io/docs/guides/validation-chain)

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the attributes of a form element and what do they do?](#html-forms-overview)
- [How do you install and import express-validator in your project?](#validation-and-sanitization)
- [How do you validate and sanitize form input using express-validator?](#understanding-the-body-function)
- [What is the difference between validation and sanitization?](#validation-and-sanitization)
- [How do you handle validation errors in Express routes?](#validation-results)
- [What is the importance of escaping HTML characters in a form?](https://owasp.org/www-community/attacks/SQL_Injection)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Web Dev Simplified has a [tutorial on submitting forms and parsing form data in Express](https://youtu.be/SccSCuHhOw0?si=2dZ5Y4dvxyh7jpcy) if you want a refresher.
- express-validator's docs has a good write-up on [implementing a custom validator in Express](https://express-validator.github.io/docs/guides/customizing#implementing-a-custom-validator).
