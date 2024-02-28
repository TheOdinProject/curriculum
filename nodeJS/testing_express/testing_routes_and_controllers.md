### Introduction
Unit Testing is important for many reasons that we probably don't need to cover right now. If you've already taken our basic JavaScript course you've already encountered Unit Testing, and the point of _this_ lesson is not to teach you the philosophy or mechanics of writing tests, but how they apply to our Express applications and APIs.

If you haven't finished our [front-end JavaScript course](https://www.theodinproject.com/paths/full-stack-javascript/courses/javascript), go back and take a look at those lessons before progressing.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Use the `supertest` module to test Express routes/controllers.
- Describe how SuperTest handles our express application.
- Explain the functionality `superagent` provides to SuperTest.
- Describe what the `done` parameter is used for.
- Explain and have a firm understanding of `.expect()` method's functionality.
- Have familiarity with `supertest`'s documentation and methods.

### Routes testing with supertest

The most important, basic requirement for testing something in your code is that it must be in an exported module. This is true for both custom middleware and your routes/controllers, so the very first thing you need to do is separate those things into their own modules, if they aren't already.

In the case of routes, you already know how to do this using Express.Router. Below is a very basic example.

```javascript
//// app.js
const express = require("express");
const app = express();

app.use(express.urlencoded({ extended: false }));

const indexRouter = require("./index");
app.use("/", indexRouter);

app.listen(3000, () => console.log("running"));
```

```javascript
//// index.js
const express = require("express");
const index = express.Router();

const array = [];

index.get("/", (req, res) => {
  res.json({ name: "frodo" });
});

index.get("/test", (req, res) => res.json({ array }));

index.post("/test", (req, res) => {
  array.push(req.body.item);
  res.send('success!');
});

module.exports = index;
```

These two files, `app.js` and `index.js` define a couple of routes and then set up and start our express app. For the moment we do _not_ need to test `app.js` because it only contains code that starts and runs an express app! It doesn't include any of our own logic so we don't need to test it. `index.js` however _does_ include some things that we want to test.

To facilitate actually testing these routes we're going to use a library called [SuperTest](https://github.com/visionmedia/supertest), so go ahead and `npm install supertest --save-dev` and while it's installing take a few minutes to look through the readme on their git repo (linked above).

In the examples below we're going to use SuperTest inside of a Jest style describe/test block, but the syntax and use of these are common among most testing libraries, so the concepts should be easily replicated in Mocha with Chai or Jasmine or Tape or whatever testing library you prefer.

Here's our test file:

```javascript
const index = require("../index");

const request = require("supertest");
const express = require("express");
const app = express();

app.use(express.urlencoded({ extended: false }));
app.use("/", index);

test("index route works", done => {
  request(app)
    .get("/")
    .expect("Content-Type", /json/)
    .expect({ name: "frodo" })
    .expect(200, done);
});

test("testing route works", done => {
  request(app)
    .post("/test")
    .type("form")
    .send({ item: "hey" })
    .then(() => {
      request(app)
        .get("/test")
        .expect({ array: ["hey"] }, done);
    });
});
```

Let's step through it piece by piece.

To begin, we have to import the module we're testing, in this case it's the file `index.js` from above.

```javascript
const index = require("../index");
```

Next, we include both `supertest` and `express`.  We're setting up a new Express app and then using the index router that we imported previously. The reason we have to do this setup here is because we are not actually touching our original `app.js` file. The main reason that we're doing it this way is so that we can avoid calling the app.listen command and starting our server, but it's also useful because, in larger apps, we can skip some of the optional configuration steps and only include the bits that we need for our testing purposes.  In a larger test suite, it would probably be useful to abstract this part out to its own file that gets imported into each test file.

```javascript
const request = require("supertest");
const express = require("express");
const app = express();

app.use(express.urlencoded({ extended: false }));
app.use("/", index);
```

The tests themselves are relatively straightforward, thanks to the SuperTest library! Remember that we imported supertest as the function `request` which we use as seen below. We call it on our freshly created express app, pass it our route, and then use it to make sure that the responses match the types and content that we expect. 

Notice the parameter <span id="done">`done`</span> that is passed into the test callback.  Most testing libraries use this to signal that the test is complete in the case of asynchronous operations. In this case, SuperTest allows us to pass it into the last `.expect` and calls it for us.  Thanks, SuperTest!

```javascript
test("index route works", done => {
  request(app)
    .get("/")
    .expect("Content-Type", /json/)
    .expect({ name: "frodo" })
    .expect(200, done);
});
```

Our second test is very similar to the first one, but tests the `post` method. You can (and should) read about all the possible functions on the SuperTest readme, so we won't go into the details of every step here. The last bit however is important to us. By this point in your JavaScript career, you should be familiar with Promises, so the `.then()` syntax should be familiar. In this case we wait for the POST request to finish and then we call the GET request when that promise resolves to check if that item has been pushed into the array.

```javascript
test("testing route works", done => {
  request(app)
    .post("/test")
    .type("form")
    .send({ item: "hey" })
    .then(() => {
      request(app)
        .get("/test")
        .expect({ array: ["hey"] }, done);
    });
});
```

If we were using a real database here, then we would want to do something similar using either a test or a mock database. We'll talk about setting something like that up in a separate lesson. Suffice it to say for now that you do not want to run test code on your production database!

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Make sure that you read through the [SuperTest docs](https://github.com/visionmedia/supertest) 
2. SuperTest actually pulls from another related project called SuperAgent.  Any method that you can call in SuperAgent you can also call from SuperTest, so you'll need to take a look through the [SuperAgent docs](https://ladjs.github.io/superagent/) as well.
</div>

### Knowledge checks
 
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class='knowledge-check-link' href='https://github.com/visionmedia/supertest#about'>What is the motivation behind SuperTest?</a>
- <a class='knowledge-check-link' href='#done'>What is the purpose of `done`? What convenience does SuperTest provide concerning it?</a>
- <a class='knowledge-check-link' href='https://github.com/visionmedia/supertest#example'>What is the difference in handling errors when using .end() method in conjunction with .expect() provided by SuperTest?</a>
- <a class='knowledge-check-link' href='https://ladjs.github.io/superagent/#multipart-requests'>What are the methods provided by SuperAgent to handle multipart requests and how to use them?</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
