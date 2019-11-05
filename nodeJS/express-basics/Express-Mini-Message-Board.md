Let's take a quick break from the main Express tutorial to practice what we've already learned.  At this point you should know enough to use Express to make some fun interactive web apps! We're going to create a super simple message board.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Use `express-generator` to set up a basic project using whichever templating language you prefer. If you prefer you can set it all up manually -- it doesn't really take that much longer.
2. We are going to have 2 routes, the index (`"/"`) and a new-message form (`"/new"`). The generator already created a router for our index so find that file and open it up.  It can be found at `routes/index.js`. There is already an router.get for `"/"` that should be rendering your index view, so lets add some messages to it.
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

4. Next, in your index template (in the `"views"` folder) loop through the messages array using which ever templating language you selected and for each one, display the user, text and the date the message was added. Don't forget to make your messages available to your template by including it in the res.render 'locals' object (e.g. `res.render('index', { title: "Mini Messageboard", messages: messages })`.
5. Next lets set up the new message form.  In the router add an `app.get()` for the `"/new"` route and point it to a template named `"form"`. In the views directory create your `form` template. Add a heading, 2 inputs (one for the author's name and one for the message text) and a submit button. To make the form actually  make a network request you will need to define it with both a method and an action like so:

~~~html
<form method="POST" action="/new">
  put your inputs and buttons in here!
</form>
~~~

6. With your form set up like this, when you click on the submit button it should send a POST request to the url specified by the action attribute, so go back to your index router and add an `app.post()` for `"/new"`.
7. To actually get and use the data from your form you should be able to access the contents of your form inside `app.post()` as an object called `req.body`. The individual fields inside the body object are named according to the `name` attribute on your inputs (the value of `<input name="messageText">` will show up as `req.body.messageText` inside the `app.post` function).
8. In your `app.post()` take the contents of the form submission and push them into the messages array as an object that looks something like this:
~~~javascript
messages.push({text: messageText, user: messageUser, added: new Date()});
~~~

9. At the end of the `app.post()` function use `res.redirect('/')` to send users back to the index page after submitting a new message.
10.  At this point, you should be able to visit `/new` (it might be a good idea to add a link to that route on your index page), fill out the form, submit it and then see it show up on the index page!
11. Now you're almost ready to deploy your application on Heroku, but before doing that you need to specify a couple of things, just to make life easier for your deployment. First, you need to specify the exact version of Node that you're using in your `package.json` file; if you don't remember the version number, just find it using `node -v`. Then, add it to your `package.json` file, so that it will look similar to this:
~~~json
"engines": {
  "node": "10.x.y"
},
~~~
12. Heroku usually requires a `Procfile`, which specifies all the commands that need to run on the startup. With node.js, this file isn't obligatory since Heroku searches in the `package.json` file for a start script, which is already defined in your app, but it's still good practice to add it to your project. Create it in your root directory, and add this single line to it:
```
web: node ./bin/www
```
13. You're finally ready to deploy to Heroku! You can first try it on local, using
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
To add your solution to the list below, edit this [file](https://github.com/TheOdinProject/curriculum/blob/master/nodeJS/express-basics/Express-Mini-Message-Board.md). See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for more instructions.

<details markdown="block">
  <summary> Show Student Solutions </summary>

- Add your solution below this line!
- [Ryan Lewin's Solution](https://github.com/ryan-lewin/mini-message-board) - [View in Browswer](https://morning-stream-91838.herokuapp.com/)
- [Eljoey's Solution](https://github.com/eljoey/message_board) - [View in Browswer](https://salty-river-84330.herokuapp.com/)
- [Vedat's Solution](https://github.com/mvedataydin/express-message-board) - [View in Browser](https://immense-woodland-14248.herokuapp.com/)
- [Henry Kirya](https://github.com/harrika/messakira) - [View in Browser](https://messakira.herokuapp.com/)
- [djolesusername's Solution](https://messages2019.herokuapp.com/) - [View in Browser](https://messages2019.herokuapp.com/)
- [Brian Tuju's Solution](https://github.com/briantuju/odinProject/tree/master/Node_JS/mini_msg_board) - [View in browser](https://minimsgboard--briantuju.repl.co)
- [tbmreza's Solution](https://github.com/tbmreza/odinproject-node2/) - [View in Browser](https://reza-message-board.herokuapp.com)
- [Morgan's Solution](https://github.com/morgando/message-board) - [View in Browser](https://polar-meadow-92800.herokuapp.com/)
- [JamCry's Solution](https://github.com/jamcry/express-message-board) - [View in Browser](https://pacific-beach-38765.herokuapp.com/)
- [Agnieszka's Solution](https://github.com/atarsa/mini-msg-board-express) - [View in Browser](https://quiet-hollows-16705.herokuapp.com)
- [Jake's Solution](https://github.com/jdonahue135/miniMessageBoard) - [View in Browser](https://sheltered-hollows-81080.herokuapp.com/)
- [Andrécio's Solution](https://github.com/andreciobezerra/Messages-board) - [View in Browser](https://safe-wave-54774.herokuapp.com/)
- [Ifeanyichukwu's Solution](https://github.com/Anyitechs/Message_boardApp) - [View in Browser](https://boiling-temple-35917.herokuapp.com/)
- [Ryan Floyd's Solution](https://github.com/MrRyanFloyd/mini-message-board) - [View in Browser](https://odin-mini-message-board.herokuapp.com/)
</details>
