### Introduction

Now that we've been introduced to cookies and their various uses and properties, let's use them to help us implement something. We want to allow someone to log in once and let the server "remember" them, automatically recognising any future requests from them.

The basic login process (with a username and password) is rather straightforward. The user submits a form with their username and password, then the server checks the database if that username/password combo exists. If it does, great - it knows who the requester is and can continue with the rest of the request. If it does not exist, it does not know who the requester is so it can end the request there and then.

So if someone does successfully "log in", how does the server recognize that the next request that user sends is coming from them? Without a system to persist the login, it'd just be a plain ol' request like any other and could have come from anyone. To handle this, we will use **sessions**.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what sessions are.
- Explain how sessions and cookies can be used together to persist logins.
- Implement authentication with sessions.
- Use a database as a session store.
- Explain how and why passwords are hashed before being stored.

### Sessions

When a user successfully logs in, we can store (serialize) some information about that user, such as their user ID in a database table, somewhere server-side like another database table. That data will have its own ID and may also have an expiry time. We can then store that session's ID in a cookie (it doesn't need anything else stored in it) and send it back to the user in the server response.

The client now has that cookie with the session ID and can then attach it to any future requests. The server can then check the database for a valid session with the same ID it found in the cookie. If there is a matching session, great - it can extract the serialized user information (deserialize) and continue with the request now it knows who made it. If there is no matching or valid session, like with logging in, we don't know who the user is so we can end the request there.

This is exactly like having a name badge or access pass at work or some event. The cookie is like an access pass which you (the client) give to a machine or security (the server) and it checks who you are and if you're allowed in or not. You can go home and come back the next day, reusing that pass as many times as you need so long as you still have it and your details are still in the system.

### Implementing sessions

Let's use [express-session](https://expressjs.com/en/resources/middleware/session.html) to implement a basic session authentication system. For the purpose of streamlining our example, we'll put all of the JavaScript in `app.js` and start with hardcoding a few things. When it comes to your own projects, separate different parts like routes, controllers etc. to their own files and folders as you'll have done before. The same can be done for any config for auth features.

#### Setup

First, make a new database within `psql`. We will start by setting up a `users` table:

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  username VARCHAR ( 255 ),
  password VARCHAR ( 255 )
);
```

Now we'll set up a minimal express app. We'll need the following dependencies installed first:

```bash
npm install express express-session pg ejs
```

Now our `app.js`:

```javascript
// app.js
const path = require("node:path");
const { Pool } = require("pg");
const express = require("express");
const session = require("express-session");

const pool = new Pool({
  // add your db configuration
});

const app = express();
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(session({
  secret: "we will explain and change this secret later",
  resave: false,
  saveUninitialized: false,
  cookie: {
    httpOnly: true,
    maxAge: 2 * 24 * 60 * 60 * 1000, // 2 days
  },
}));
app.use(express.urlencoded({ extended: false }));

app.get("/", (req, res) => res.render("index"));

app.listen(3000, () => {
  console.log("App listening on port 3000!");
});
```

And our initial `index.ejs` view:

```ejs
<!-- views/index.ejs -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home</title>
</head>
<body>
  <h1>Hello world!</h1>
</body>
</html>
```

### Creating users

<div class="lesson-note lesson-note--critical" markdown="1">

#### Critical: Validate your user input

For the sake of brevity, we're omitting the server-side validation step in this example. **Do not omit server-side validation in your projects.**

</div>

We will need a way for a user to create an account, so let's create a sign up form view:

```ejs
<!-- views/signUp.ejs -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign up</title>
</head>
<body>
  <h1>Sign Up</h1>
  <form action="/sign-up" method="POST">
    <label for="username">Username</label>
    <input id="username" name="username" placeholder="username" type="text" />
    <label for="password">Password</label>
    <input id="password" name="password" type="password" />
    <button>Sign Up</button>
  </form>
</body>
</html>
```

And corresponding `GET` and `POST` routes:

```javascript
app.get("/sign-up", (req, res) => {
  res.render("signUp");
});

// or use express-async-handler to ditch the try/catch
app.post("/sign-up", async (req, res, next) => {
  try {
    await pool.query(
      "INSERT INTO users (username, password) VALUES ($1, $2)",
      [req.body.username, req.body.password],
    );
    res.redirect("/");
  } catch(err) {
    return next(err);
  }
});
```

Remember, we're omitting the validation step as well as storing the raw password - this is of course unsafe but is just for demonstration purposes. We have also not implemented a way to prevent duplicate usernames, so that's something for you to handle yourself in your projects. Password hashing will be introduced later in this lesson. For now, you should be able to serve your app and visit `/sign-up`, submit the form and be redirected to the home view. Open your database in `psql` and query the users table to see your first user!

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [From inside to outside, what is the order of box-model properties?](#the-box-model)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
