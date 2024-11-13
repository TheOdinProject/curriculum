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
npm install express express-session ejs dotenv pg connect-pg-simple
```

Now our initial `index.ejs` view:

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

And our `app.js`:

```javascript
// app.js
require("dotenv").config();
const path = require("node:path");
const { Pool } = require("pg");
const express = require("express");
const session = require("express-session");
const pgSession = require("connect-pg-simple")(session);

const pool = new Pool({
  // add your db configuration
});

const app = express();
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(session({
  store: new pgSession({ pool: pool }),
  resave: false,
  saveUninitialized: false,
  secret: process.env.SESSION_SECRET,
  cookie: {
    httpOnly: true,
    maxAge: 2 * 24 * 60 * 60 * 1000, // 2 days
  },
}));
app.use(express.urlencoded({ extended: false }));

app.get("/", (req, res) => {
  res.render("index");
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}!`);
});
```

Let's talk about our session config which we apply to every incoming request (by mounting it on `app`). Firstly, we use the [connect-pg-simple](https://www.npmjs.com/package/connect-pg-simple) library to make express-session store session data in our database (creating a "session" table if it does not already exist). Without this, sessions would be stored in memory by default which would not persist through any server restarts!

Then we turn off `resave` and `saveUninitialized`. For every request, express-session will automatically check if a valid session cookie is attached. If a valid session cookie is attached then it deserializes the session data, populating `req.session` with it - we will make use of this later. If no valid session cookie is attached to the request, it will instead create a brand new session object in `req.session`. At the end of the request-response cycle, if the session object has been modified in any way, the session will be saved to the database. Turning off `resave` and `saveUninitialized` makes sure we don't save any unmodified session objects to the database.

We then set a **session secret**, which we define in our `.env` file since it's, well, a secret. This should be some string that's hard to guess - you can use a random key generator online for this - and is used by express-session alongside the session ID to generate a hash and sign the resulting session cookie. Then if an attacker tries to tamper with a session cookie, the signature would no longer match and the server can invalidate it.

Lastly, we pass in options for the cookies that will be created by express-session. In our example, we make it inaccessible to JavaScript on the front-end and set a 2-day expiry. You can always use environment variables to set values or even conditionally set them (e.g. `httpOnly: process.env.NODE_ENV === "prod"` can allow you to access session cookies via front-end JavaScript in development but prevent it in production).

### Creating users

<div class="lesson-note lesson-note--critical" markdown="1">

#### Critical: Validate your user input

For the sake of brevity, we're omitting the server-side validation step in this example. **Do not omit server-side validation in your projects.**

</div>

We will need a way for a user to create an account, so let's create a sign up form view:

```ejs
<!-- views/signup.ejs -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign up</title>
</head>
<body>
  <h1>Sign up</h1>
  <form action="/signup" method="POST">
    <label for="username">Username</label>
    <input id="username" name="username" type="text" />
    <label for="password">Password</label>
    <input id="password" name="password" type="password" />
    <button>Sign Up</button>
  </form>
</body>
</html>
```

And corresponding `GET` and `POST` routes:

```javascript
app.get("/signup", (req, res) => {
  res.render("signup");
});

// or use express-async-handler to ditch the try/catch
app.post("/signup", async (req, res, next) => {
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

Remember, we're omitting the validation step as well as storing the raw password - this is of course unsafe and is solely for demonstration purposes. Password hashing will be introduced later in this lesson. We have also not done anything to prevent duplicate usernames, so that's something for you to handle yourself in your projects. For now, you should be able to serve your app and visit `/signup`, submit the form and be redirected to the home view. Open your database in `psql` and query the users table to see your first user!

### Logging in

Now we have the ability to put users in our database, let's allow them to log in to see a special greeting instead of the generic "Hello world!". We will need the following steps to occur:

1. Check if the submitted username and password match a user in our users table in our database.
1. If no match is found, end the request there, rejecting the login. Otherwise, serialize the user's ID to a new session.
1. Set a cookie with that session's ID.
1. Respond to the request with the cookie.

We'll need to start with the login logic itself, so let's create login routes. Remember we're doing everything together for demonstration purposes only; organise and extract code as you see fit.

```javascript
app.get("/login", (req, res) => {
  res.render("login");
});

app.post("/login", async (req, res, next) => {
  try {
    const { rows } = await pool.query(
      "SELECT * FROM users WHERE username = $1",
      [req.body.username],
    );
    const user = rows[0];

    if (user?.password === req.body.password) {
      req.session.userId = user.id;
      res.redirect("/");
    } else {
      res.render("login", {
        error: "Incorrect username or password",
      });
    }
  } catch(err) {
    next(err);
  }
});
```

What's going on here? First we have our route for rendering the login page. In our `POST` route, we query our db for the submitted ujername. If the username exists *and* the submitted password matches, we serialize the user ID to the session data then redirect to the homepage (if you've never seen `?.` before, check out [optional chaining](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)). Otherwise if no matching username/password combo, we rerender the login page with an error message. Note that we cannot serialize the user ID to `req.session.id` because [`req.session.id` is already used for the session's own ID](http://expressjs.com/en/resources/middleware/session.html#reqsessionid).

We only need to serialize the user ID as that will never change for a user (unlike a username which could be changed by a user if that feature is implemented). It's the only user info we'll need as later we'll write a middleware that deserializes the user ID from a matching session then query the db with that ID to grab any other user info. This middleware can then be added to the start of any routes that need authenticating.

<div class="lesson-note lesson-note--warning" markdown="1">

#### Warning: Use generic login error messages

Don't specify which form fields are incorrect when providing validation feedback. Providing specific feedback can allow attackers to target accounts if they know a specific username exists, for example. It also means if you misspell your username but it happens to match someone else's username, you're less likely to be misled into thinking the you entered your username correctly.

</div>

Let's create the login page:

```ejs
<!-- views/login.ejs -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
</head>
<body>
  <h1>Please log in</h1>
  <form action="/login" method="POST">
    <label for="username">Username</label>
    <input id="username" name="username" type="text">
    <label for="password">Password</label>
    <input id="password" name="password" type="password">
    <button>Log in</button>
  </form>
  <% if (locals.error) { %>
    <p><%= error %></p>
  <% } %>
</body>
</html>
```

And edit the homepage to show a personalized greeting with a logout button (which we will implement later):

```ejs
<!-- views/index.ejs -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home</title>
</head>
<body>
  <h1>Hello, <%= username %>!</h1>
  <form action="/logout" method="POST">
    <button>Log out</button>
  </form>
</body>
</html>
```

### Handling post-login requests

As of now, our `GET /` route will always display the homepage and will crash if someone has not yet logged in! There would not be a cookie and therefore no session to deserialize, so `req.session` would contain a fresh session object without any user properties. We can write a middleware that checks `req.session` and if it has a user ID in it, we can use it to query the db and grab any user info we need, then continue to the homepage. Otherwise, the user is not authenticated and we can redirect to the login page.

```javascript
async function checkAuthenticated(req, res, next) {
  try {
    if (!req.session.userId) {
      res.redirect("/login");
    } else {
      const { rows } = await pool.query(
        "SELECT * FROM users WHERE id = $1",
        [req.session.userId],
      );
      // add the user details we need to req
      // so we can access it in the next middleware
      req.user = {
        id: rows[0].id,
        username: rows[0].username,
      };
      next();
    }
  } catch (err) {
    next(err);
  }
}
```

Plonk it in our `GET /` route as the first middleware and there we go!

```javascript
app.get("/", checkAuthenticated, (req, res) => {
  res.render("index", { username: req.user.username });
});
```

If you serve your app and go to the site on localhost, you should be redirected to `/login` straightaway since you won't yet have a session cookie. You should already have a user in your database, so log in with your credentials and see your personalized greeting!

We can add our `checkAuthenticated` middleware to any routes that we need authenticate, or even as router-level middleware for example. You can of course customize this function however you wish - the code shown here is just for our example app.

### Storing passwords securely

The most secure way to store passwords? Don't. Offloading that responsibility to others by letting users log in with their Facebook or Google accounts means you won't need to store passwords on your side at all. That being said, that's very much out of scope right now and not particularly helpful with understanding what generally goes on behind the scenes.

By far the worst way we can store passwords is to just store them in plaintext, just as we've done in our example app earlier. Even if we encrypted the passwords, all an attacker would need is the key to decrypt all the passwords and let's face it. If someone has managed to gain access to your database, it probably won't be very hard for them to get the encryption key assuming they don't already have it.

Remember [hash functions](https://www.theodinproject.com/lessons/javascript-hashmap-data-structure#what-is-a-hash-code) from the Hashmap lesson? We want to hash our passwords since they're one-way processes, then store the hash. We also want to [salt](https://en.wikipedia.org/wiki/Salt_(cryptography)) the password when hashing to prevent identical passwords from being stored with identical hashes (after all, someone out there will use `Password123` as their password... tsk tsk). On top of all that, we also want the hash function to be purposely slow - not so slow that a normal user will be waiting ages just to log in but certainly slow enough to minimise the number of attempts an attacker might be able to do in a given amount of time.

All of this can be done for us via the [argon2 npm package](https://www.npmjs.com/package/argon2) (which uses the Argon2id function by default as recommended by the Open Worldwide Application Security Project (OWASP)). Fortunately for us, using it doesn't require that much extra. Going back to our `POST /signup` middleware, let's hash our password before we store it:

```bash
npm install argon2
```

```javascript
const argon2 = require("argon2");

app.post("/signup", async (req, res, next) => {
  try {
    const hashedPassword = await argon2.hash(req.body.password);
    await pool.query(
      "INSERT INTO users (username, password) VALUES ($1, $2)",
      [req.body.username, hashedPassword],
    );
    res.redirect("/");
  } catch(err) {
    return next(err);
  }
});
```

We don't need to set modify any of its options as the defaults are all perfectly sufficient for our use case, including the salt. Now in our `POST /login` middleware, we can also use argon2 to verify the submitted password against the stored salted hash:

```javascript
app.post("/login", async (req, res, next) => {
  try {
    const { rows } = await pool.query(
      "SELECT * FROM users WHERE username = $1",
      [req.body.username],
    );
    const user = rows[0];

    // argon2.verify requires an argon2 hash as the first argument
    // so we must early return if there is no matching user
    if (!user) {
      return res.render("login", {
        error: "Incorrect username or password",
      });
    }

    const isMatchingPassword = await argon2.verify(
      user.password,
      req.body.password
    );
    if (isMatchingPassword) {
      req.session.userId = user.id;
      res.redirect("/");
    } else {
      res.render("login", {
        error: "Incorrect username or password",
      });
    }
  } catch(err) {
    next(err);
  }
});
```

Now when a user signs up, their password is salted and hashed before storage which is then used to verify the password upon login.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [From inside to outside, what is the order of box-model properties?](#the-box-model)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
