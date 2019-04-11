Throughout this course we are going to be stepping through the MDN express tutorial, one lesson at a time, occasionally supplementing with a little deeper explanation, or side projects to help you deepen your understanding of the material.  The introductory lesson you followed previously set the stage by explaining quite a bit of the background info you'll need to really understand what you're doing. This lesson will actually start you on the project that you'll be completing as you follow the tutorial.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Use `express-generator` to generate a basic express site.
 - Understand the basic parts of an express project.
 - Understand what Middleware is.
 - Understand `req`, `res` and `next` in the context of middleware.

### Templating Engines

A templating engine is a tool that allows you to insert variables and simple logic into your views. So, for instance on your home page you could have a header that says "Hello USERNAME" that updates with the actual user's name once they've logged in, something that is not possible with plain HTML. As the lesson mentions, there are several templating languages available for JavaScript.  The tutorial uses Pug (formerly known as Jade, it had to change it's name because of legal issues) which has a bit of a learning curve because it looks and feels dramatically different from regular HTML. If you've ever worked with Ruby on Rails you might be more comfortable with `ejs`, which is _very_ similar to `erb` or `hbs` (handlebars), which also looks and feels a lot like html, and inserts the dynamic bits inside of double curly brackets. It's up to you which you choose! If you choose not to use Pug you will still be able to follow the tutorial just fine.

### Middleware

This step of the MDN tutorial mentions middleware, but does not define it. Middleware is a complicated seeming word, for a simple concept. A middleware is just a function that Express will call for you between the time it receives a network request and the time it fires off a response. You can, and usually will use several of these functions, that will run in a specific sequence for every request, for instance you might have a logger (that prints details of the request to the console), an authenticator (that checks to see if the user is logged in, or otherwise has permission to access whatever they're requesting), a static-file server (if the user is requesting a static file then it will send it to them). All of these functions will be called in the order you specify every time there's a request on the way to your `app.get("/")` function.

It is possible, and common to write your own middleware functions, though you won't be doing much of that for now. Even so, it is useful to take a minute to demystify what they're actually doing. Middleware function are just plain javascript functions with a specific function signature (that is, it takes a specific set of arguments in a specific order). This pattern is incredibly common in express, and you've almost definitely already run into it. 

The three middleware function arguments are: `req`, `res`, and `next`. You will see these _everywhere_ while you're working on an express project so let's take a minute to explain what they actually are. Technically, these are just variables, so you could call them anything, but convention (and the express documentation) almost always gives them these names.

#### A middleware function:

~~~javascript
function(req, res, next) {
  // do stuff!
}
~~~

 When someone visits your site, their web-browser sends a request to your server, which is picked up by Express and passed through all of the middleware functions that you have defined and used in your project.  Each function is defined similarly with these parameters.. which might seem familiar to you from the plain Node tutorial that you went through in the 'Getting Started' lesson.  Technically, `req` and `res` are _almost_ the same here as they are in vanilla Node, but Express enhances them by adding a few useful properties and methods to them.
 
 `req` or `request` is an object that has data about the incoming request such as the exact URL they visited, any parameters in the URL, the `body` of the request (useful if the user is submitting a form with some data in it) and many other things.

 - You can see everything it includes in the [express docs](https://expressjs.com/en/4x/api.html#req).

 `res` or `response` is an object that represents the response that Express is going to send back to the user. Typically you use the information in the `req` to determine what you're going to do with the `res` by calling `res.send()` or another method on the object.

 - Checkout the documentation for the response object [here!](https://expressjs.com/en/4x/api.html#res)

`next` is a function that you see a little less often, but is _very_ important to the functioning of your app. If you are writing or using some middleware that does not send a response back to the user's client then you _must_ call the `next` function at the end of your middleware function.  The next function simply tells express to move to the next middleware in the stack, but if you forget to call it then your app will pause and nothing will happen!

#### An example middleware

As a quick example, if you wanted to create a simple logging middleware you could write a function like this:

~~~javascript
const myLogger = function(req, res, next) {
  console.log("Request IP: " + req.ip);
  console.log("Request Method: " + req.method);
  console.log("Request date: " + new Date());
  
  next(); // THIS IS IMPORTANT!
}

app.use(myLogger)
~~~

`app.use` is how you load your middleware function into Express so that it knows to use it. If you stick this bit of code in any express application near the beginning of your `app.js` (after the part where you define `app = express()`) then it will write all of those details to your console every time you get a network request. When the logging is complete we call the `next()` function so that our app can continue.

As a final detail, the order that middleware gets executed in your app matters!  Middleware functions will always run in the order that they are instantiated using `app.use()`.

### Using git

if you choose to use git when completing this tutorial (you should!) then you will want to add a  `.gitignore` file to make sure you do not commit/upload your `node_modules` folder to github. `node_modules` is the directory where all of your project's dependencies are installed (it's where the code for express is downloaded) and it can get quite large. References to all of these dependencies are stored in the `package.json` file anyway, so anyone that wants to clone and work on the project simply has to run `npm install` to download and install all those dependencies anyway, so uploading them to github is a waste of time and space.

- [This article](https://www.atlassian.com/git/tutorials/saving-changes/gitignore) explains the process pretty simply. You just need to create a file called `.gitignore` and put `node_modules` on a line inside that file.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read this [intro article](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Tutorial_local_library_website) on MDN.
2. Begin the project by following [this lesson](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/skeleton_website).  Be sure to read everything carefully! There's quite a bit of important information in this article.
3. For a little more detail on the nature of middleware read the official documentation [here](http://expressjs.com/en/guide/using-middleware.html).
</div>
