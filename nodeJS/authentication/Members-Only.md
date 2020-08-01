In this project you'll be building an exclusive clubhouse where your members can write embarrassing posts about non-members. Inside the clubhouse, members can see who the author of a post is, but outside they can only see the story and wonder who wrote it.

This will be a chance for you to use the authentication skills we learned in the last project, you also be practicing your database skills so buckle up!

### Assignment 

<div class="lesson-content__panel" markdown="1">

1. Begin by thinking about how to set up the database models you are going to need to accomplish your goal. You will need users with full-names (first and last), usernames (you can use email for this) passwords and membership-status. Users should be able to create messages that have a title, a timestamp and some text.  Your database should keep track of who created each message.
2. Setup your database on Mongo and generate or otherwise create your project skeleton, including the models you designed in the last step.
3. Start with a sign-up form so you can get some users into your DB!  Don't forget to sanitize and validate the form fields and secure the passwords with `bcrypt`.  You should add a `confirmPassword` field to your sign-up form and then validate it using a custom validator. Read how to do that [here](https://express-validator.github.io/docs/validation-chain-api.html).
4. When users sign up, they should not be automatically given membership status! What fun is a private club if just anyone can join? Add a page where members can "join the club" by entering a secret passcode. If they enter the passcode correctly then update their membership status.
5. Create a login-form using passport.js like we did in the last assignment.
6. When a user is logged in give them a link to "Create a new message" (but only show it if they're logged in!).  Create the new-message form.
7. Display all member messages on the home page, but only show the author and date of the messages to other club-members.
8. Add an optional field to the user model called Admin and then add the ability to delete messages, but only allow users who have `admin == true` to see the delete-button and delete messages.  You'll need to add a way to actually mark a user as an 'admin' so either add another secret pass-code page, or just put an "is admin" checkbox on the sign-up form.
9. By this point, anyone who comes to the site should be able to see a list of all messages, with the author's name hidden. Users should be able to sign-up and create messages, but ONLY users that are members should be able to see the author of each message. Finally, you should have an Admin user that is able to see everything and also has the ability to delete messages. Obviously this is a simple and silly little app, but the things you are practicing (creating and authenticating users and giving users different abilities and permissions) are things that will be _very_ useful to you!
10.  When you're satisfied with your work, deploy your project to heroku and share it below!

</div>

### Student Solutions
To add your solution to the list below, edit this [file](https://github.com/TheOdinProject/curriculum/blob/master/nodeJS/authentication/Members-Only.md) (located on The Odin Project's "curriculum" github repository). See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for more instructions.

<details markdown="block">
  <summary> Show Student Solutions </summary>

- Add your solution below this line!
* [Morgan Bonhomme's Solution](https://github.com/morganbonhomme/secret_messages) - [View in Browser](https://fatidique-croissant-99694.herokuapp.com/)
* [yldrmali's Solution](https://github.com/yldrmali/myblog) - [View in Browser](https://sheltered-dusk-63801.herokuapp.com/)
* [Katarzyna Kaswen-Wilk's Solution](https://github.com/kikupiku/members-club) - [View in Browser](https://whisper-campaign.herokuapp.com/)
* [Julio's solution](https://github.com/julio22b/members-only) - [View in Browser](https://members-only-odin.herokuapp.com/home)
* [Henrique Sousa's Solution](https://github.com/Henrique-Sousa/members-only) - [View in Browser](https://henriquesousa-members-only.herokuapp.com/)
* [Igorashs's Solution](https://github.com/igorashs/members-only) - [View in Browser](https://enigmatic-harbor-15560.herokuapp.com/)
* [Simon Fraipont's Solution](https://github.com/Sim-frpt/members-only) - [View in Browser](https://calm-castle-28467.herokuapp.com/)
* [Braxton Lemmon's Solution](https://github.com/braxtonlemmon/members-only-node) - [View in browser](https://still-crag-16430.herokuapp.com/)
* [Abhishek Khale's Solution](https://github.com/abkhale17/Members-only) - [View in browser](https://roast-non-club-members.herokuapp.com/)
* [Zakariye Yusuf's Solution](https://github.com/ZYusuf10/exclusiveOrg) - [View in browser](https://exclusiveorg.herokuapp.com/)
* [Jayhawkfan8484's Solution](https://github.com/jayhawkfan8484/members-only) - [View in browser](https://damp-harbor-79847.herokuapp.com/messages)
* [Vollantre's Solution](https://github.com/vollantre/members-only) - [View in browser](https://infinite-fortress-12352.herokuapp.com)
* [tracy2811's Solution](https://github.com/tracy2811/members-only) - [View in browser](https://nameless-hollows-72372.herokuapp.com/)
* [Eljoey's solution](https://github.com/eljoey/Members-Only-MsgBoard) - [View in browser](https://warm-garden-53847.herokuapp.com)
* [Saif Mode's solution](https://saifmode.github.io/secret-club-house) - [View in browser](https://secret-club-house.herokuapp.com)
* [Jdonahue135's solution](https://github.com/jdonahue135/members-only) - [View in browser](https://desolate-reef-04961.herokuapp.com/)
* [Ryan Floyd's solution](https://github.com/MrRyanFloyd/odin-members-only) - [View in browser](https://odin-members-only.herokuapp.com/)
* [Halkim's solution](https://github.com/halkim44/members_only) - [View in browser](https://aqueous-meadow-62293.herokuapp.com/)
* [Tayfun Sur's solution](https://github.com/0xtaf/members-only) - [View in browser](https://secret-members.herokuapp.com/)
* [barrysweeney's solution](https://github.com/barrysweeney/MembersOnlyMessageBoard) - [View in browser](https://cryptic-earth-60552.herokuapp.com/)
* [ranmaru22's Solution](https://github.com/ranmaru22/members-only) - [View in Browser](https://secure-stream-16381.herokuapp.com)
* [ultrawide's Solution](https://github.com/ultrawide/members-only-messageboard) - [View in Browser](https://fast-fortress-23524.herokuapp.com/)
* [Vorelli's Solution](https://github.com/Vorelli/members-only) - [View in Browser](https://immense-meadow-04242.herokuapp.com/messageboard/)
</details>


