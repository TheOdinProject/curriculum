### Introduction

Creating users and allowing them to log in and out of your web apps is a crucial functionality that we are finally ready to learn! There is quite a bit of setup involved here, but thankfully none of it is too tricky. You'll be up and running in no time! In this lesson, we're going to be using [passportJS](https://www.passportjs.org), an excellent middleware to handle our authentication and sessions for us.

We're going to be building a very minimal express app that will allow users to sign up, log in, and log out. For now, we're just going to keep everything except the views in one file to make for easier demonstration, but in a real-world project, it is best practice to split our concerns and functionality into separate modules.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand the use order for the required middleware for PassportJS.
- Describe what PassportJS Strategies are.
- Use the LocalStrategy to authenticate users.
- Explain the purpose of cookies in authentication.
- Review prior learning material (routes, templates, middleware, async/await, and promises).
- Use PassportJS to set up user authentication with Express.
- Describe what bcrypt is and its use.
- Describe what a hash is and explain the importance of password hashing.
- Describe bcrypt's `compare` function.

### Set up

We're going to be using another Mongo database, so before we begin log in to your mongo provider and create a new database and save its URL string somewhere handy.

To begin, let's set up a very minimal express app with a single MongoDB model for our users. Create a new directory and use `npm init` to start the package.json file then run the following to install all the dependencies we need:

```bash
npm install express express-session mongoose passport passport-local ejs
```

**Mongoose Update**: With the new 7.0.1 version of Mongoose callbacks are no longer supported when querying a database. A promise will be returned instead, meaning that you will now have to use async/await or promises to achieve the same results. If you need a refresher on async/await you can find it in the [Async And Await lesson](https://www.theodinproject.com/lessons/node-path-javascript-async-and-await) from the JavaScript Course. As you progress through this lesson you will see a blend of using async/await with try/catch blocks as well as other functions that use callbacks, which you've seen as you've progressed through the NodeJS course. You can [read more about the v7.0.1 change on the Mongoose website](https://mongoosejs.com/docs/migrating_to_7.html#dropped-callback-support).

Next, let's create our `app.js`:

**IMPORTANT NOTE**: For the moment we are saving our users with just a plain text password.  This is a *really* bad idea for any real-world project. At the end of this lesson, you will learn how to properly secure these passwords using bcrypt. Don't skip that part.

```javascript
/////// app.js

const express = require("express");
const path = require("path");
const session = require("express-session");
const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const mongoDb = "YOUR MONGO URL HERE";
mongoose.connect(mongoDb);
const db = mongoose.connection;
db.on("error", console.error.bind(console, "mongo connection error"));

const User = mongoose.model(
  "User",
  new Schema({
    username: { type: String, required: true },
    password: { type: String, required: true }
  })
);

const app = express();
app.set("views", __dirname);
app.set("view engine", "ejs");

app.use(session({ secret: "cats", resave: false, saveUninitialized: true }));
app.use(passport.session());
app.use(express.urlencoded({ extended: false }));

app.get("/", (req, res) => res.render("index"));

app.listen(3000, () => console.log("app listening on port 3000!"));
```

Most of this should look familiar to you by now, except for the new imported middleware for express-session and passport. We are not actually going to be using express-session directly, it is a dependency that is used in the background by passport.js. You can [take a look at what the express-session package does in the Express docs](https://github.com/expressjs/session).

Our view engine is set up to just look in the main directory, and it's looking for a template called `index.ejs` so go ahead and create that:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
</head>
<body>
  <h1>hello world!</h1>
</body>
</html>
```

### Creating users

The first thing we need is a sign up form so we can actually create users to authenticate! In the Library Tutorial website, you learned about validating and sanitizing inputs. This is a *really good idea*, but for the sake of brevity, we're going to leave that out here. Don't forget to include sanitation and validation when you get to the project.

Create a new template called `sign-up-form`, and a route for `/sign-up` that points to it:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
</head>
<body>
  <h1>Sign Up</h1>
  <form action="" method="POST">
    <label for="username">Username</label>
    <input name="username" placeholder="username" type="text" />
    <label for="password">Password</label>
    <input name="password" type="password" />
    <button>Sign Up</button>
  </form>
</body>
</html>
```

```javascript
//// app.js

app.get("/sign-up", (req, res) => res.render("sign-up-form"));
```

Next, create an `app.post` for the sign up form so that we can add users to our database (remember our notes about sanitation, and using plain text to store passwords...).

```javascript
app.post("/sign-up", async (req, res, next) => {
  try {
    const user = new User({
      username: req.body.username,
      password: req.body.password
    });
    const result = await user.save();
    res.redirect("/");
  } catch(err) {
    return next(err);
  };
});
```

Let's reiterate: this is not a particularly safe way to create users in your database... BUT you should now be able to visit `/sign-up`, and submit the form. If all goes well it'll redirect you to the index and you will be able to go see your newly created user inside your database.

### Authentication

Now that we have the ability to put users in our database, let's allow them to log-in to see a special message on our home page! We're going to step through the process one piece at a time, but first, take a minute to glance at the [passportJS website](http://www.passportjs.org/) the documentation here has pretty much everything you need to get set up. You're going to want to refer back to this when you're working on your project.

<span id='strategy'>PassportJS uses what they call *Strategies* to authenticate users</span>. They have over 500 of these strategies, but we're going to focus on the most basic (and most common), the username-and-password, or what they call the `LocalStrategy` ([documentation for the LocalStrategy](http://www.passportjs.org/docs/username-password/)). We have already installed and required the appropriate modules so let's set it up!

We need to add 3 functions to our app.js file, and then add an app.post for our `/log-in` path.

#### Function one : setting up the LocalStrategy

```javascript
passport.use(
  new LocalStrategy(async (username, password, done) => {
    try {
      const user = await User.findOne({ username: username });
      if (!user) {
        return done(null, false, { message: "Incorrect username" });
      };
      if (user.password !== password) {
        return done(null, false, { message: "Incorrect password" });
      };
      return done(null, user);
    } catch(err) {
      return done(err);
    };
  })
);
```

This function is what will be called when we use the `passport.authenticate()` function later.  Basically, it takes a username and password, tries to find the user in our DB, and then makes sure that the user's password matches the given password. If all of that works out (there's a user in the DB, and the passwords match) then it authenticates our user and moves on! We will not be calling this function directly, so you won't have to supply the `done` function.  This function acts a bit like a middleware and will be called for us when we ask passport to do the authentication later.

### Functions two and three: sessions and serialization

<span id='cookie'>To make sure our user is logged in, and to allow them to *stay* logged in as they move around our app, passport will use some data to create a cookie which is stored in the user's browser</span>. These next two functions define what bit of information passport is looking for when it creates and then decodes the cookie. The reason they require us to define these functions is so that we can make sure that whatever bit of data it’s looking for actually exists in our Database! `passport.serializeUser` takes a callback which contains the information we wish to store in the session data. `passport.deserializeUser` is called when retrieving a session, where it will extract the data we "serialized" in it then ultimately attach something to the `.user` property of the request object (`req.user`) for use in the rest of the request.

For our purposes, the functions that are listed in the passport docs will work just fine:

```javascript
passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
  try {
    const user = await User.findById(id);
    done(null, user);
  } catch(err) {
    done(err);
  };
});
```

<div class="lesson-note" markdown="1">
  `user.id` is a virtual getter provided by mongoose which returns the document's _id field cast to a string.  [Documentation](#strategy)
</div>

When a session is created, passport.serializeUser will receive the user object found from a successful login and store its .id property in the session data. Upon some other request, if it finds a matching session for that request, passport.deserializeUser will retrieve the id we stored in the session data. We then use that id to query our database for the specified user, then done(null, user) attaches that user object to req.user. Now in the rest of the request, we have access to that user object via req.user.

Again, we aren’t going to be calling these functions on our own, they’re used in the background by passport.

### Log in form

Let's go ahead and add the login form directly to our index template. The form will look just like our sign-up form, but instead of `POST`ing to `/sign-up` we'll add an `action` to it so that it `POST`s to `/log-in` instead. Add the following to your index template:

```html
<h1>please log in</h1>
<form action="/log-in" method="POST">
  <label for="username">Username</label>
  <input name="username" placeholder="username" type="text" />
  <label for="password">Password</label>
  <input name="password" type="password" />
  <button>Log In</button>
</form>
```

... and now for the magical part! Add this route to your app.js file:

```javascript
app.post(
  "/log-in",
  passport.authenticate("local", {
    successRedirect: "/",
    failureRedirect: "/"
  })
);
```

As you can see, all we have to do is call `passport.authenticate()`. This middleware performs numerous functions behind the scenes. Among other things, it looks at the request body for parameters named `username` and `password` then runs the `LocalStrategy` function that we defined earlier to see if the username and password are in the database. It then creates a session cookie that gets stored in the user's browser, and that we can access in all future requests to see whether or not that user is logged in.  It can also redirect you to different routes based on whether the login is a success or a failure.  If we had a separate login page we might want to go back to that if the login failed, or we might want to take the user to their user dashboard if the login is successful.  Since we're keeping everything in the index we want to go back to "/" no matter what.

If you fill out and submit the form now, everything should technically work, but you won't actually SEE anything different on the page... let's fix that.

The passport middleware checks to see if there is a user logged in (by checking the cookies that come in with the `req` object) and if there is, it adds that user to the request object for us.  So, all we need to do is check for `req.user` to change our view depending on whether or not a user is logged in.

Edit your `app.get("/")` to send the user object to our view like so:

```javascript
app.get("/", (req, res) => {
  res.render("index", { user: req.user });
});
```

and then edit your view to make use of that object like this:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
</head>
<body>
  <% if (user) {%>
    <h1>WELCOME BACK <%= user.username %></h1>
    <a href="/log-out">LOG OUT</a>
  <% } else { %>
    <h1>please log in</h1>
    <form action="/log-in" method="POST">
      <label for="username">Username</label>
      <input name="username" placeholder="username" type="text" />
      <label for="password">Password</label>
      <input name="password" type="password" />
      <button>Log In</button>
    </form>
  <%}%>
</body>
</html>
```

So, this code checks to see if there is a user defined... if so it offers a welcome message, and if NOT then it shows the login form.  Neat!

As one last step... let's make that log out link actually work for us. As you can see it's sending us to `/log-out` so all we need to do is add a route for that in our app.js.  Conveniently, the passport middleware adds a logout function to the `req` object, so logging out is as easy as this:

```javascript
app.get("/log-out", (req, res, next) => {
  req.logout((err) => {
    if (err) {
      return next(err);
    }
    res.redirect("/");
  });
});
```

You should now be able to visit `/sign-up` to create a new user, then log-in using that user's username and password, and then log out by clicking the log out button!

#### A quick tip

In express, you can set and access various local variables throughout your entire app (even in views) with the `locals` object. We can use this knowledge to write ourselves a custom middleware that will simplify how we access our current user in our views.

Middleware functions are functions that take the `req` and `res` objects, manipulate them, and pass them on through the rest of the app.

```javascript
app.use((req, res, next) => {
  res.locals.currentUser = req.user;
  next();
});
```

If you insert this code somewhere between where you instantiate the passport middleware and before you render your views, you will have access to the `currentUser` variable in all of your views, and you won't have to manually pass it into all of the controllers in which you need it.

### Securing passwords with bcrypt

Now, let's go back and learn how to securely store user passwords so that if anything ever goes wrong, or if someone gains access to our database, our user passwords will be safe.  This is *insanely* important, even for the most basic apps.

First `npm install bcryptjs`. There is another module called `bcrypt` that does the same thing, but it is written in C++ and is sometimes a pain to get installed. The C++ `bcrypt` is technically faster, so in the future it might be worth getting it running, but for now, the modules work the same so we can just use `bcryptjs`.

Once it's installed you need to require it at the top of your app.js and then we are going to put it to use where we save our passwords to the DB, and where we compare them inside the LocalStrategy.

#### Storing hashed passwords

Password hashes are the result of passing the user's password through a one-way hash function, which maps variable sized inputs to fixed size pseudo-random outputs.

Edit your `app.post("/sign-up")` to use the bcrypt.hash function which works like this:

```javascript
bcrypt.hash(req.body.password, 10, async (err, hashedPassword) => {
  // if err, do something
  // otherwise, store hashedPassword in DB
});
```

The second argument is the length of the "salt" to use in the hashing function; salting a password means adding extra random characters to it, the password plus the extra random characters are then fed into the hashing function. Salting is used to make a password hash output unique, even for users who use the same password, and to protect against [rainbow tables](https://en.wikipedia.org/wiki/Rainbow_table) and [dictionary attacks](https://en.wikipedia.org/wiki/Dictionary_attack).

Usually, the salt gets stored in the database in the clear next to the hashed value, but in our case, there is no need to do so because the hashing algorithm that `bcryptjs` uses includes the salt automatically with the hash.

The hash function is somewhat slow, so all of the DB storage stuff needs to go inside the callback. Check to see if you've got this working by signing up a new user with a password, then go look at your DB entries to see how it's being stored. If you've done it right, your password should have been transformed into a really long random string.

It's important to note that *how* hashing works, especially in the context of passwords, is beyond the scope of this lesson.

#### Comparing hashed passwords

<span id='compare'>We will use the `bcrypt.compare()` function to validate the password input. The function compares the plain-text password in the request object to the hashed password</span>.

Inside your `LocalStrategy` function we need to replace the `user.password !== password` expression with the `bcrypt.compare()` function.

```javascript
const match = await bcrypt.compare(password, user.password);
if (!match) {
  // passwords do not match!
  return done(null, false, { message: "Incorrect password" })
}
```

You should now be able to log in using the new user you've created (the one with a hashed password).  <span id='bcrypt'>Unfortunately, users that were saved BEFORE you added bcrypt will no longer work, but that's a small price to pay for security</span>! (and a good reason to include bcrypt from the start on your next project)

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Watch videos 1, 2, 3, 5 and 6 of this [Youtube Playlist on sessions in Express and local strategy authentication with PassportJS](https://www.youtube.com/playlist?list=PLYQSCk-qyTW2ewJ05f_GKHtTIzjynDgjK).
   - You may notice at some points in the videos, the Express app contains the line `app.use(passport.initialize())`. This line is no longer required to include in current versions of Passport.
   - In [video 5: "Passport Local Configuration (Node + Passport + Express)"](https://www.youtube.com/watch?v=xMEOT9J0IvI&list=PLYQSCk-qyTW2ewJ05f_GKHtTIzjynDgjK&index=5&t=822s), it shows using the `connect-mongo` library to use your MongoDB connection to store sessions, as opposed to storing them in memory. The syntax for creating a new "MongoStore" has changed a little since this video but is very similar. You can view the current syntax for doing this on the [npm page for `connect-mongo`](https://www.npmjs.com/package/connect-mongo).
1. In [Passport: The Hidden Manual](https://github.com/jwalton/passport-api-docs), you can explore more comprehensive explanations of some of Passport's main functions, gaining a deeper understanding of what each function accomplishes.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Which passportJS strategy did we use in the lesson?](#strategy)
- [Why does passportJS create a cookie?](#cookie)
- [What does the `bcrypt.compare()` function do?](#compare)
- [Why should we include bcrypt when we begin a project?](#bcrypt)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- This video provides a broad overview of some of the [different methods to store passwords in databases and possible risks](https://www.youtube.com/watch?v=8ZtInClXe1Q).
- If you would like a little more of a deeper dive into password hashing, read the following Wikipedia article to [learn more about how cryptographic hash functions work](https://en.wikipedia.org/wiki/Cryptographic_hash_function).
