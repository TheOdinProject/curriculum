### Introduction

At this point you should know enough to use Express to make some fun interactive web apps! We're going to create a message board.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Set up a basic Express app by installing Express and EJS. Set up a basic index route and run your server. Create the required folders and files as discussed in the previous lessons.
1. We are going to have 2 routes, the index (`"/"`) and a "new message" form (`"/new"`). How you organize these routes is up to you.
1. Create a module called `db.js`. This is where all your messages will live:

   ```javascript
   const messages = [
     {
       text: "Hi there!",
       user: "Amando",
       added: new Date()
     },
     {
       text: "Hello World!",
       user: "Charles",
       added: new Date()
     }
   ];
   ```

1. First, let's add a controller to load all messages to your index view! Create a controller for the index (`"/"`) endpoint and call `res.render` (e.g. `res.render("index", { title: "Mini Messageboard", messages: messages })`).
1. Next, in your index view, loop through the messages array and for each one, display the author name, text, and the date the message was added.
1. Next, let's set up the new message form. For the `"/new"` route, render a form to post your messages. In the views directory, create your `form` template. Add a heading, 2 inputs (one for the author's name and one for the message text) and a submit button. To have the form make a network request you will need to define it with both a method and an action like so (we will learn more about how to handle forms in a later lesson):

   ```html
   <form method="POST" action="/new">
      <!-- put your inputs and buttons in here! -->
   </form>
   ```

1. With your form set up like this, when you click on the submit button it should send a POST request to the url specified by the action attribute. This is where you might want to consider adding a controller to the `/new` route to handle your form submission.
1. In order to get and use the data from your form, you'll need to use an app level Express middleware called `express.urlencoded()` to parse the form data into `req.body`. You can set this up by adding the following line to your app setup:

   ```javascript
   app.use(express.urlencoded({ extended: true }));
   ```

1. Then, inside any middleware after it, you can access any property that you need from the `req.body` object to obtain the submitted values. For example, if we want to extract the author's name, we can do so by accessing `req.body.author`.
1. To handle the form submission, add a controller to the `POST /new` route. In it, push a new message object into the `messages` array with the form data submitted. Once you have successfully added a new message, redirect users back to the index route so that they can see all the current messages.
1. At this point, you should be able to visit `/new` (it might be a good idea to add a link to that route on your index page), fill out the form, submit it and then see it show up on the index page!
1. Add an "open" button or link next to every message to open a new page with the message details.
1. Push your project to GitHub.
1. You'll learn how to deploy your app to the web in the next lesson, don't forget to come back and submit it to the submissions below once you're done!

</div>
