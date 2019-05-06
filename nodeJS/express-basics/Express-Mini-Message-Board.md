Let's take a quick break from the main Express tutorial to practice what we've already learned.  At this point you should know enough to use Express to make some fun interactive web apps! We're going to create a super simple message board.

SHOULD PROBABLY HAVE SOME NEWB GO THROUGH THIS TO MAKE SURE I DIDN'T MISS ANYTHING IMPORTANT LOL

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Use `express-generator` to set up a basic project using whichever templating language you prefer. If you prefer you can set it all up manually -- it doesn't really take that much longer.
2. We are going to have 2 routes, the index (`"/"`) and a new-message form (`"/new"`). The generator already created a router for our index so find that file and open it up.  It can be found at `routes/index.js`. There is already an app.get for `"/"` that should be rendering your index view, so lets add some messages to it.
3. Create an array at the top of your index router called `messages` and put a couple of sample messages inside of it like this:
~~~javascript
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
~~~
4. Next, in your index template loop through that messages array using which ever templating language you selected and for each one, display the user, text and the date the message was added. Remember to pass the `messages` array as an argument in the index template.
5. Next lets set up the new message form.  In the router add an `app.get()` for the `"/new"` route and point it to a template named `"form"`. In the views directory create your `form` template. Add a heading, 2 inputs (one for the author's name and one for the message text) and a submit button. To make the form actually  make a network request you will need to define it with both a method and an action like so:

~~~html
<form method="POST" action="/new">
  put your inputs and buttons in here!
</form>
~~~

5. With your form set up like this, when you click on the submit button it should sent a POST request to the url specified by the action attribute, so go back to your index router and add an `app.post()` for `"/new"`.
6. To actually get and use the data from your form you should be able to access the contents of your form inside `app.post()` as an object called `req.body`. The individual fields inside the body object are named according to the `name` attribute on your inputs (the value of `<input name="message-text">` will show up as `req.body.message-text` inside the `app.post` function).
6. In your `app.post()` take the contents of the form submission and push them into the messages array as an object that looks something like this:
~~~javascript
messages.push({text: messageText, user: messageUser, added: new Date()})
~~~
7. At the end of the `app.post()` function use `res.redirect('/')` to send users back to the index page after submitting a new message.
8.  At this point, you should be able to visit `/new` (it might be a good idea to add a link to that route on your index page), fill out the form, submit it and then see it show up on the index page!
9. Now you're almost ready to deploy your application on Heroku, but before doing that you need to specify a couple of things, just to make life easier for your deployment. First, you need to specify the exact version of Node that you're using in your `package.json` file; if you don't remember the version number, just find it using `node -v`. Then, add it to your `package.json` file, so that it will look similar to this:
~~~json
"engines": {
    "node": "10.x.y"
  },
~~~
10. Heroku usually requires a `Procfile`, which specifies all the commands that need to run on the startup. With node.js, this file isn't obligatory since Heroku searches in the `package.json` file for a start script, which is already defined in your app, but it's still good practice to add it to your project. Create it in your root directory, and add this single line to it:
```
web: node ./bin/www
```
11. You're finally ready to deploy to Heroku! You can first try it on local, using
```bash
heroku local web
```
This will run your app locally using Heroku at http://localhost:5000/. Test it, and if everything works fine, you can finally create it and push it to your Heroku repository with:
```bash
heroku create
git push heroku master
```
</div>

### Student Solutions
To add your solution to the list below, edit this [file](#) (located on The Odin Project's "curriculum" github repository). See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for more instructions.

<details markdown="block">
  <summary> Show Student Solutions </summary>

- Add your solution below this line!

</details>
