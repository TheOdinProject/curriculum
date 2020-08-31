### Introduction
This project will finally give you a chance to tie together everything you've learned so far.  It's a project with a lot of complexity so take it one step at a time.  Working with Rails as a back end is pretty straightforward but you'll be juggling some of the front end functionality too.  This is entirely within the realm of the kind of thing you might be asked to build on the job (though of course not exactly).  Are you ready???

Hopefully you got a chance to play "Where's Waldo" ([see here if unfamiliar](http://en.wikipedia.org/wiki/Where's_Wally%3F)) as a kid.  You're given a photograph with tons of stuff going on and you're meant to locate several familiar characters

### Assignment

Here, you'll build an app that feels a whole lot like a photo tagging app.  You'll start with a large photograph which contains several elements the user is meant to find, e.g. Waldo, The Wizard, Wilma etc... name your own if you'd like to use your own photos.  The user will make selections for each character and they will get feedback on whether they are correct or not.

To start with, you'll need to choose a photo and identify where exactly each person is to start with and save that to your database.  When the user clicks the photo, it should place a targeting box around the portion of the photo where the user has clicked.  That box should contain a list of possible characters.

When the user selects one of these characters, you should check with your Rails Backend to see if that character is actually within the targeting box.  Provide the user with appropriate feedback (e.g. if wrong, an error message).  If correct, place a marker on the photo in the character's location.  In either case, remove the targeting box until the user clicks again.

Keep track of how long it takes between when the photo is first loaded and when the user finally identifies all characters (do this on the server side otherwise the user could hack their score).  Once a round is complete, ask the user for his/her name and record that time.  This will get a bit tricky since you'll have anonymous users you need to keep track of!

<div class="lesson-content__panel" markdown="1">
1. Set up a GitHub Repo for this project.  Follow the instructions atop the [Google Homepage project](/courses/web-development-101/lessons/html-css) if you need help.
2. Think about what you'll need to do to get this all working together.  This is where it's really helpful to think it completely through on paper or whiteboard ahead of time!  A few minutes of thought can save you from wasting an hour of coding.
3. Create a new Rails application with just the bare bones required to load your HTML page for now.
4. Build the front end functionality without actually using any calls to the back end yet.  Specifically, that means creating the Javascript functionality which pops the targeting box and dropdown menu on the screen when the user clicks on the photo and removes it when the user clicks away.
5. Now hook up the functionality for validating with your back end whether the user has clicked in the right place for that character.
6. Tie it into your front end so you can seamlessly select characters, validate them, and place the appropriate markers on the map if the selection was correct.
7. Add in the ability to time the user from when they first load the page and then display their "score" (time) when they successfully identify all characters.  Create a popup that asks them to enter their name for the high scores table if they have earned it.
8. Play with it!
9. Push your solution to GitHub and submit it below.  This is a serious project, congratulations!

#### Optional Extensions:

1. Load many images into your database and allow your use to select from among them before starting the game.
</div>

### Student Solutions
Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.

* Add your solution below this line!
* [Phil's solution](https://github.com/pip36/wheres_wally) - [View in browser](https://floating-everglades-97160.herokuapp.com/)
* [Jack Wong's solution](https://github.com/iamjackslayer/odin-waldo) - [View in browser](https://afternoon-mesa-65847.herokuapp.com/)
* [Donald's solution](https://github.com/donaldali/wheres-waldo) - [View in browser](http://dna-wheres-waldo.herokuapp.com/ "Where's Waldo")
* [AtActionPark's solution](https://github.com/AtActionPark/odin_waldo) - [View in browser](https://hidden-sierra-6699.herokuapp.com/)
* [Luke Walker's solution](https://github.com/ubershibs/odin-js-course/tree/master/waldo) - [View in browser](https://damp-plateau-96949.herokuapp.com)
* [Cody Loyd's solution](https://github.com/codyloyd/wheres_waldo) - [View in browser](https://weeping-walleye.herokuapp.com)
* [Miguel Herrera's solution](https://github.com/migueloherrera/js-findwaldo)
* [David Chapman's solution](https://github.com/davidchappy/wheres-waldo) - [View in browser](https://dac-wheres-waldo.herokuapp.com/)
* [Sophia Wu's solution](https://github.com/SophiaLWu/wheres-waldo) - [View in browser](https://frozen-stream-95035.herokuapp.com/)
* [Austin's solution](https://github.com/CouchofTomato/wheres-wally) - [View in browser](https://couch-waldo.herokuapp.com/)

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something

* Add some!
