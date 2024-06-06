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

`npm install express-validator`

Tip: You can shorten that command by typing

`npm i express-validator`

To get started using the package, we first need to *require* it in our project

`const { body, validationResult } = require('express-validator');`

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
<form action="someurl/users/create" method="POST" ></form>
```

Where "someurl" would be a path to our server, such as `http://localhost:8000` for example.

Notice that the above two routes have the same url, but different methods. This is great, since they're both handling the same workflow, just at different steps.

### Knowledge Check

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

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
