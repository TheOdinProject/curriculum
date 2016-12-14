# Project: Using Canvas to Build Games in the Browser
  
Canvas takes a bit of getting used to because you probably aren't familiar with the steps involved in rendering specific shapes, but once you get the hang of it the sky's the limit on what you can produce.  You'll see in this project, where we bring back one of the classics -- [Missile Command](http://en.wikipedia.org/wiki/Missile_Command).  You can (and should) [play it here](http://my.ign.com/atari/missile-command) to get a feel for the game.

The basic game rules are that you have a finite number of missiles in your base at the bottom of the screen and need to intercept incoming missiles before they hit the ground.  You do this by clicking on the screen where you would like your missiles to detonate.  After clicking, a missile slowly travels to the point of click and then explodes.  Each explosion sets off a chain reaction, blowing up any missiles it touches before fading away.

## Your Task

Build Missile Command in an HTML5 Canvas.  

You'll need to think about how to render each shape (e.g. missile, explosion) as well as how to use 2-dimensional space to place objects on the screen.  You'll need to keep track of where each object is on every refresh of the screen, and you'll need to use some basic geometry to determine how the speed/direction of the missiles changes their position each refresh.

If your game logic gets too complicated or the speed is too fast, you'll probably find that the browser starts getting choppy and unreliable.

1. Set up a Github Repo for this project.  Follow the instructions atop the [Google Homepage project](/web-development-101/html-css) if you need help.
1. Set up a blank HTML document
1. Think about how you would set up the different elements within the game.  What objects and functions will you need? A few minutes of thought can save you from wasting an hour of coding.  The best thing you can do is whiteboard the entire solution before even touching the computer.
2. Set up the Canvas and place a few test missile objects in your base to get some experience with rendering and placement.
3. Build the logic required to fire off the missiles in a given direction and refresh the screen each increment.
4. Build the logic for the explosions, which trigger chain reactions if they overlap with missiles.
5. Start sending incoming missiles.  Play!
6. Push your solution to Github and include it below.


## Student Solutions

*Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.*

* [Donald's solution](https://github.com/donaldali/odin-js-jquery/tree/master/missile_command) | [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-js-jquery/blob/master/missile_command/index.html "Missile Command")
* [AtActionPark's solution](https://github.com/AtActionPark/odin_missile_command) | [View in browser](http://htmlpreview.github.io/?https://github.com/AtActionPark/odin_missile_command/blob/master/index.html)
* Add your solution above this line!


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* *Add some!*
