Let's give you a chance to dive deeply into working with events by building a Snake game.  If you never played it (likely many years ago in your childhood), check out the [Wikipedia Page for Snake](http://en.wikipedia.org/wiki/Snake_(video_game)).  Basically, it's a snake that you have to move around the board and which grows longer with each piece of food it eats.  You lose if it gets so big it hits itself or if it goes off the board.

If you think about what's required to make a game like this work, it's all well within your grasp -- you'll have to set up a grid and listen for user input events to determine where to turn the snake, then add some logic around how it gets larger by "feeding".  This is where things start getting really fun!

### Your Task

### Setup

1. Set up a Github Repo for this project.  Follow the instructions atop the [Google Homepage project](/web-development-101/html-css) if you need help.
1. Set up a blank HTML document
2. Think about what kinds of objects and functions you'll probably need in order to make this snake work.
2. Create a javascript object that represents a grid of 40x40 squares that all start out containing just a space `" "`.  
3. Create a `render()` function which cycles through the grid and turns it into a grid of divs on the screen.  Having a simple border around each will make it easier to see (just remember the border increases the box size).  This should be pretty easy with Javascript and a bit of CSS wrangling.  Remember the grid you created in the [Web Dev 101 jQuery project](/web-development-101/javascript-and-jquery)...?
3. Make one of the center squares an "O" to represent your snake.  Run the `render()` function on page load.
4. Create a Javascript object to represent your snake.  Give it an initial position of `[20,20]` and an initial direction to the right (`r`).  Also include a variable to represent the current snake, which will be an array of coordinate pairs (so an array of arrays, e.g. `[[20,20]]` to start)

### Bring it to Life

5. Listen for keyboard input from the arrow keys (see the [keypress() docs](http://api.jquery.com/keypress/)) and change the snake's current direction if a different arrow is pressed.  It's probably helpful to use `console.log()` to track this so you know you're doing it right.
5. Now bring the snake to life by running a game loop that uses `setTimeout()` to perform a new "turn".
6. Each turn, invoke a `move()` function which moves the snake one square in the current direction of travel for each turn.
6. Create logic which ends the game if the snake head goes off the board.
7. Now create a Javascript object representing "food".  Randomly place a food on the board.
8. Create the functionality to eat food, which causes the snake to grow one unit of length on the next turn.
9. Modify your `move()` function (if you need to) to account for a snake of multiple units length.  This is why you need to think of the snake as an array of coordinate pairs.
10. Create the logic which ends the game if your snake moves onto itself.
11. Play!

### The Fun Stuff

1. Instead of a boring old "O", make your snake consist of images from the web.
2. Keep score -- each food is worth more points the longer your snake is.
3. Speed up -- speed up the game slightly with each food consumed.
4. Play!
12. Upload your snake to Github and put your code down below.


### Student Solutions

*Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.*

* Add your solution below this line!
* [jlo4's solution](https://github.com/jlo4/snake-game) | [View in browser](https://rawgit.com/jlo4/snake-game/master/index.html)
* [John Brock's solution](https://github.com/Khanthulhu/snakeGame) | [View in browser](https://khanthulhu.github.io/snakeGame/)
* [Rhys B's solution](https://github.com/105ron/snake) | [View in browser](https://105ron.github.io/snake/)
* [Austin's solution](https://github.com/CouchofTomato/snake) | [View in browser](https://couchoftomato.github.io/snake/)
* [Afshin M.'s solution](https://github.com/afshinator/js-snake)
* [jamie's solution](https://github.com/Jberczel/odin-javascript/tree/master/snake) | [View in browser](http://jsfiddle.net/Jberczel/xvEt5/)
* [Tom M's solution](https://github.com/tim5046/projectOdin/tree/master/Javascript/Snake) | [View in browser](http://htmlpreview.github.io/?https://github.com/tim5046/projectOdin/blob/master/Javascript/Snake/index.html)
* [Mazin's solution](https://github.com/muzfuz/JS_Snake)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project5_3_Snake) | [View in browser](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/Project5_3_Snake/index.html)
* [Donald's solution](https://github.com/donaldali/odin-js-jquery/tree/master/snake) | [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-js-jquery/blob/master/snake/index.html)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_06-JavaScript_and_jQuery/snake) | [View in browser](http://katemcfaul.com/snake)
*  [Meher Chandan's solution](https://github.com/meherchandan/Snake) | [View in browser](http://htmlpreview.github.io/?https://github.com/meherchandan/Snake/blob/master/index.html)
*  [Jason Matthews' solution](https://jsfiddle.net/e2zhssyj/13/)
*  [Aleksandar Rodić's solution](https://github.com/rodic/TOP---js-assignments/tree/master/Project%20-%20jQuery%20and%20the%20DOM)
*  [Ryan Jordan's solution](https://github.com/krjordan/odin-project/tree/master/snake-clone) | [View in browser](http://htmlpreview.github.io/?https://github.com/krjordan/odin-project/tree/master/snake-clone/index.html)
*  [Frank Peelen's solution](https://github.com/FrankPeelen/Snake-Browser-JS) | [View in browser](http://rawgit.com/FrankPeelen/Snake-Browser-JS/master/index.html)
*  [Artur Janik's solution](https://github.com/ArturJanik/TOPJS/tree/master/Project3) | [View in browser](https://rawgit.com/ArturJanik/TOPJS/master/Project3/index.html)
*  [AtActionPark's solution](https://github.com/AtActionPark/odin_jquery_and_the_dom) | [View in browser](http://htmlpreview.github.io/?https://github.com/AtActionPark/odin_jquery_and_the_dom/blob/master/index.html)
*  [eternal's solution](https://github.com/3ternal/snake) | [View in browser](http://htmlpreview.github.io/?https://github.com/3ternal/snake/blob/master/index.html)
*  [Wayne's solution](https://github.com/wayneho/snake) | [View in browser](https://rawgit.com/wayneho/snake/master/index.html)
*  [Dan's solution](https://github.com/vickerdj/snake) | [View in browser](http://vickerdj.github.io/snake/)
*  [Trajanson's solution](https://github.com/Trajanson/snake-js) | [View in browser](http://projects.trajanson.com/js-snake/)
*  [Luke Walker's solution](https://github.com/ubershibs/odin-js-course/tree/master/snake) | [View in browser](https://htmlpreview.github.io/?https://github.com/ubershibs/odin-js-course/blob/master/snake/index.html)
*  [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/javascript/snake) | [View in browser](https://rawgit.com/cdouglass/odin-project-exercises/master/javascript/snake/app/snake.html)
*  [Ryan Chang's solution](https://github.com/chang-ryan/javascript-fun/tree/master/js-snake) | [View in Browser](https://rawgit.com/chang-ryan/javascript-fun/master/js-snake/index.html)
*  [Miguel Herrera's solution](https://github.com/migueloherrera/jquery-snake) | [View in browser](http://htmlpreview.github.io/?https://github.com/migueloherrera/jquery-snake/blob/master/index.html)
*  [Stefan (Cyprium)'s solution](https://github.com/dev-cyprium/snake/blob/master/index.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/dev-cyprium/snake/blob/master/index.html)
* [Cody Loyd's solution](https://github.com/codyloyd/javascriptSnake) | [View in browser](http://codyloyd.com/javascriptSnake/)
* [Priyanka Saigal's solution](https://github.com/psaigal/Snake) | [View in browser](http://htmlpreview.github.io/?https://github.com/psaigal/Snake/blob/master/snake.html)
* [chrisnorwood's solution](https://github.com/chrisnorwood/js-snake) | [View in browser](https://chrisnorwood.github.io/js-snake/)
* [David Chapman's solution](https://github.com/davidchappy/snake) | [View in browser](https://davidchappy.github.io/snake/snake.html)
* [Lani Huang's solution](https://github.com/laniywh/the-odin-project/tree/master/js/snake) | [View in browser](http://cdn.rawgit.com/laniywh/the-odin-project/master/js/snake/index.html)
* [Sophia Wu's solution](https://github.com/SophiaLWu/snake-game) | [View in browser](https://sophialwu.github.io/snake-game/)
* [Axel's solution](https://github.com/afuh/snake-game) | [View in browser](https://afuh.github.io/snake-game/)
* [Daunenok's solution](https://github.com/daunenok/snake) | [View in browser](https://daunenok.github.io/snake/)
* [Pat's solution](https://github.com/Pat878) | [View in browser](https://pat878.github.io/JS_Snake/)
* [Neil Cudden's solution](https://github.com/ncud4bloc/Snakes) | [View in browser](https://ncud4bloc.github.io/Snakes/HTML/index.html)


### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*
