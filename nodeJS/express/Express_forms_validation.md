### Introduction

This lesson will cover how to secure your applications even further, using the express-validator module to perform validation and sanitization.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- HTML Forms and their respective elements and actions.

- The form handling process in a client server application.

- Validation and sanitization using express-validator

- Good form design for data cleanliness.

### HTML forms overview

First, a brief refresher on the actual HTML.

Let's say we have a simple HTML form, with a single text field for collecting a full name, and its associated label element.

The HTML structure for that would look like this:

```html
<form action="/submit-name" method="POST" >
  <label for="fullName">
  <input placeholder="John Doe" type="text" name="fullName" id="fullName">
  <button type="submit">Submit</button>
</form>
```

We have the HTML form element itself, with an action pointing to some resource on our server, and a method defined. Notice how the method corresponds to an HTTP verb (for either a router.get or a router.post action).

The input needs a corresponding label element, which is what the end user actually sees on the page.

Then, we have our input. It has an id and a name attribute, which must match the "for" attribute defined on our label above.

It has a type of "text" which tells the browser what type of widget to display, what values to accept, and is used for JavaScript and CSS selectors.

Finally, it has a default value defined, which the user will see on our page.
The input will also need a submit button, so that we can actually use our form. This is displayed as a button by default, and can be pressed by the user to upload the data entered into all other input elements to the server (in this case there's only one).

The form attributes defined the HTTP method to be used to communicate with the server, and the destination of the data on the server (action)

- action: The resource/URL where data is sent for processing when the form is submitted. If this is not set, or is an empty string, the form will be submitted back to the current page URL

- method: The HTTP method used to send the data, either POST or GET.

- POST is used when changing or creating data in the server's database, such as editing or creating users, because POST can be made more resistant to cross-site forgery attacks.

- The GET method should only be used for a search form.

#### Form handling process

Form handling will use similar techniques to when we learned to display information about our models in our views. The requested action route from the form will point to some endpoint on our server, which will allow our controller functions to handle the request. The controller is what actually communicates with the database to handle the data.
Then we generate a new/updated view with the new information from the form.

With forms, we will need to utilize middleware to process the data provided by our users, then redisplay the form with any errors.

### Validation and sanitization

Before the data from a form is sent off to our server, we must first do two things

- The data must be *validated*, meaning no unacceptable values, including null/empty in required fields.

- *Sanitization* removes and replaces any characters in the data that could potentially be harmful to our server [(such as SQL injection attacks)](https://owasp.org/www-community/attacks/SQL_Injection)

The library we'll be using is called express-validator, which takes care of both these operations for us.

#### Installation

We start as usual by installing the correct package in the *root* folder of our project.

```bash
npm install express-validator
```

Tip: You can shorten that command by typing

```bash
npm i express-validator
```

To get started using the package, we first need to *require* it in our project

```javascript
const { body, validationResult } = require('express-validator');
```

express-validator comes with many functions for just about every form operation you could think of, but for this lesson, we'll be sticking with body and validation result.

### Understanding the 'body' function

The body function allows you to specify which fields in the request body should be validated and sanitized, as well as how to handle it. You can define custom error messages for failed validations.

```javascript
[  
  body("name", "Please enter a name.").trim().isLength({ min: 1 }).escape(),  
];
```

This example checks that the "name" field is not empty, escaped any potentially harmful HTML characters to prevent cross site scripting attacks, and trims and whitespace from the ends.

I would recommend reading at least the section on escaping characters from this page [OWASP.ORG](https://blog.presidentbeef.com/blog/2020/01/14/injection-prevention-sanitizing-vs-escaping/), it will give you a good idea on what it means and why we do it.

### Validating optional fields

Often times, you'll want some input fields to remain optional, meaning they can be left blank withou an error:

```javascript
[
    body("age", "Must be a valid date.")
    .optional({ values: "falsy" })
    .isISO8601()
    .toDate(),  
];
```

### Chaining methods

You can also chain multiple validation methods, with unique errors if the checks fail.

```javascript
[
    body("name")
    .trim()
    .isLength({ min: 1 })
    .withMessage("Name can not be empty.")
    .isAlpha()
    .withMessage("Name must only contain alphabet letters."),  
];
```

This ensures that name is not only present and trimmed, but also only contains alphabet letters.

### Validation results

Once the validation rules are applied, you can use 'validationResult' to handle any validation errors:

```javascript
asyncHandler(async (req, res, next) => {
  const errors = validationResult(req);
  
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  } else {
    res.send('Data is valid, form submitted!')
  }
})
```

This setup checks for any failed validation checks, and if there are any (the errors array is NOT empty), then it sends a 400 code, along with any errors that may be present.

### Forms and Express routes

One final thing to to cover is handling the routes in Express. After all, our form needs somewhere to send the data to.

In your express application, you will want a route such as

```javascript
// The GET request comes FIRST, as we first need to display the form
router.get('/users/create', user_controller.user_create_get) 

// POST request for when the user submits a form
router.post('/users/create', user_controller.user_create_post)
```

And in our form, the action would like like this

```html
<!-- POST method. We would use a GET for a search action for example -->
<form action="/users/create" method="POST" ></form>
```

/users/create will be an *endpoint* we've created on our Express server.

Notice that the above two routes have the same url, but different methods. This is great, since they're both handling the same workflow, just at different steps.

### Putting it together

Let's put it all together in a quick Express application. It's helpful to see how our client actually will send data to the server.

Create a new Express application like you've done before, and open up the app.js file. We'll be using the EJS templating language for this lesson.

We're not going to worry about exploring the rest of the code. We're writing a basic route so we can see how data looks when it's sent over from the client.

Open up a new terminal, and run

```bash
npm i nodemon
```

this will let us reload our server; After this, you can simply run nodemon in your terminal to serve your project!

You can also use your own preferred method for spinning up a live server.

Your new project should look have folders named routes, views, and a file called app.js

Let's open up the routes folder, open the index.js file and add a new simple route below any existing ones.

```javascript
router.get('/form', (req, res) => {
  console.log('hello forms')
})
```

Then, in your terminal, run

```bash
nodemon
```

and open your project in the browser.
In the search bar, navigate to `localhost:(yourport)/form`

Keep an eye on your console, and you should see the message 'hello forms' there.

Now let's make a new form. We're going to piggyback on the existing index.ejs file in our views folder.

Modify the index.ejs file so it looks like this

```ejs
<!DOCTYPE html>
<html>
  <head>
    <title><%= title %></title>
    <link rel='stylesheet' href='/stylesheets/style.css' />
  </head>
  <body>
    <h1><%= title %></h1>
    <p>Welcome to <%= title %></p>
    <!-- Add the form below here -->
        <form action="/form" method="POST">
      <div>
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required>
      </div>
      <div>
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required>
      </div>
      <button type="submit">Submit</button>
    </form>
  </body>
</html>
```

Most of this form should be familiar to you. The only thing to note is that our action is actually just a *relative* route to our server endpoint. We don't need to write out localhost.

Once you've done that, we need to modify the route in our routes/index.js file.

Since our form is POSTING to our server, we need to change our router.get to a router.post.
Let's start with just console.logging our *request body*.

Notice that Express provides us already with a request object to work with.

```javascript
router.post('/form', (req, res) => {
  console.log(req.body);
})
```

(You might need to restart your server by pressing CTRL C and entering nodemon again) Now navigate to localhost/ (remember that our form is at our index, or home route).

You should see our basic form there. If you enter it in with some information, you should see the request body in your console now!

If you wanted to access individual parts of the form body, you can use several methods, like object destructuring:

```javascript
router.post('/form', (req, res) => {
  const { firstName, lastName } = req.body
  res.send(`Received new submission: ${firstName} ${lastName}`)
})
```

Now, when you submit, you should see the information on the page!

Let's add a few methods for validation and sanitization on our form.

In your terminal, stop the server and run

```bash
npm install express-validator
```

In our routes/index.js, let's include the new package at the top of our routes/index.js

```javascript
const {body, validationResult} = require('express-validator')
```

In our router.post, we're going to add some methods to make sure we get the type of data we want.

```javascript
router.post('/form', 
[
  body('firstName').isAlpha().withMessage('First name must contain only letters')
  .isLength({ min: 2, max: 30 }).withMessage('First name must be between 2 and 30 characters'),
  body('lastName').isAlpha().withMessage('First name must contain only letters')
  .isLength({ min: 2, max: 30 }).withMessage('Last name must be between 2 and 30 characters')
]
(req, res) => {
const errors = validationResult(req);
if (!errors.isEmpty()) {
  return res.status(400).json({ errors: errors.array() })
}

// If no errors, proceed as normal
const { firstName, lastName } = req.body;
res.send(`Received new submission: ${firstName} ${lastName}`)
})
```

Explanation: Validation rules: body() functions are used to specify the fields you want to validate. We chose firstName, and lastName. If we had more, you simply define more using the body() function.

isAlpha() makes sure the field contains only letters.
isLength({ min, max }) ensure the filed is a certain length. Pretty self explanatory!

The withMessage() is a very handy little function that allows us to define what to show the user if they didn't fill out the form properly.

Now, if you fill out the form and don't meet any of our criteria, you'll see a page containing all the errors.

We could go much deeper into working safely with forms, but we'll stop there. I'm sure you can already see how helpful express-validator is, and how you can do almost anything you want with the req.body object.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Take a look through the Express documentation on the [request object](https://expressjs.com/en/5x/api.html#req).
1. Continue working with the project we've been working on to actually display the errors on the page nicely for the user, instead of just a json object. You'll need to use the [res.render](https://expressjs.com/en/api.html#res.render) method.

Hint: you'll want to pass the errors down to your view from the /forms route.
Pay special attention in the express docs to this snippet:

```javascript
// send the rendered view to the client
res.render('index')

// if a callback is specified, the rendered HTML string has to be sent explicitly
res.render('index', function (err, html) {
  res.send(html)
})

// pass a local variable to the view
res.render('user', { name: 'Tobi' }, function (err, html) {
  // ...
})
```

Where they pass a *local* variable down to their view to use for rendering.

You'll need to loop through our response in our ejs template for each error: [ejs loops](https://stackoverflow.com/questions/22952044/loop-through-json-in-ejs)

We'll give you this modified code for free, to give you a headstart.

Modify your router.post to look like this:

```javascript
router.post('/form', 
  [
    body('firstName').isAlpha().withMessage('First name must contain only letters')
                     .isLength({ min: 2, max: 30 }).withMessage('First name must be between 2 and 30 characters'),
    body('lastName').isAlpha().withMessage('Last name must contain only letters')
                    .isLength({ min: 2, max: 30 }).withMessage('Last name must be between 2 and 30 characters')
  ], 
  (req, res) => {
    const errors = validationResult(req);
    // if there ARE errors
    if (!errors.isEmpty()) {
      // then send them over to your view using local variables
    }

    const { firstName, lastName } = req.body;
    res.send(`Received new submission: ${firstName} ${lastName}`);
  }
);
```

Don't forget to ask in the Discord if you need help! Refer to the docs, don't forget to use res.render, the *locals* object, and EJS looping. Good luck!

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
