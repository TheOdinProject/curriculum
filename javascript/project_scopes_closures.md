### Introduction
If you went through the [Ruby course](/ruby-programming), you had a chance to build Tic Tac Toe to test your OOP skills.  If you did, you'll have a leg up because you'll be building those project now for the browser.

### Tic Tac Toe

Remember Tic Tac Toe? See [Wikipedia](http://en.wikipedia.org/wiki/Tic-tac-toe) if you haven't.  It involves a couple of players, a simple board, checking for victory at each turn... Let's build it!

### Assignment

Build a tic-tac-toe game in the browser where two human players can play against each other.

<div class="lesson-content__panel" markdown="1">
1. Set up a Github Repo for this project.  Follow the instructions atop the [Google Homepage project](/web-development-101/lessons/html-css) if you need help.
2. Set up a blank HTML document
3. Think about how you would set up the different elements within the game.  What objects and functions will you need? A few minutes of thought can save you from wasting an hour of coding.
4. Create a basic 3x3 board object in Javascript that lists the current item in each space on the board (e.g. "X", "O", or " ").
5. Create a `render()` function which cycles through that board object and creates the appropriate HTML elements.  Style them to look like a real tic-tac-toe board.
6. Build the main game logic (we won't give too many hints here).  When the user clicks on a blank square, it should show the current player's symbol.  This can be triggered by listening for a click event on the appropriate div.  It may be helpful to give each div a `data` attribute or `id` based on its position so you can identify it in your JS code.
7. The game logic should then check whether the game is over -- if any player has achieved victory or if there are no more turns available.  In the event of victory or defeat, display an appropriate message on the screen.
8. Optional -- switch out the "X" and "O" letters with appropriate (or funny) images.
9. Push your solution to Github and post the link to it below.
</div>

### Student Solutions
Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.

* Add your solution below this line!
* [Joshua W's solution](https://github.com/jose56wonton/js-tic-tac-toe) - [View in browser](http://joshuawootonn.com/js-tic-tac-toe/)
* [jlo4's solution](https://github.com/jlo4/tic-tac-toe) - [View in browser](https://rawgit.com/jlo4/tic-tac-toe/master/index.html#)
* [Rhys B's solution](https://github.com/105ron/noughts-and-crosses) - [View in browser](https://105ron.github.io/noughts-and-crosses/)
* [Austin's solution](https://github.com/CouchofTomato/js-tictactoe) - [View in browser](https://couchoftomato.github.io/js-tictactoe/)
* [Tom M's solution](https://github.com/tim5046/projectOdin/blob/master/Javascript/tictactoe/) - [View in browser](http://htmlpreview.github.io/?https://github.com/tim5046/projectOdin/blob/master/Javascript/tictactoe/index.html)
* [Donald's solution](https://github.com/donaldali/odin-js-jquery/tree/master/tictactoe) - [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-js-jquery/blob/master/tictactoe/index.html "Tic-tac-toe")
* [John Brock's Three Board Misère Rules Tic Tac Toe](https://github.com/Khanthulhu/tic-tac-toe) - [Play in Browser](https://khanthulhu.github.io/tic-tac-toe/)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project5_5_TicTacToe) - [View in browser](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/Project5_5_TicTacToe/index.html)
* [Steve's solution](https://github.com/beesmart/JS_tictactoe) - [View in browser](http://beesmart.github.io/JS_tictactoe)
* [Ryan Jordan's solution](https://github.com/krjordan/odin-project/tree/master/TicTacToe) - [View in browser](http://htmlpreview.github.io/?https://github.com/krjordan/odin-project/tree/master/TicTacToe/index.html)
* [Rodić's solution](https://github.com/rodic/TOP---js-assignments/tree/master/Project%20-%20Tic%20Tac%20Toe%20in%20Javascript)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPJS/tree/master/Project5) - [View in browser](https://rawgit.com/ArturJanik/TOPJS/master/Project5/index.html)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_js_tictactoe) - [View in browser](http://htmlpreview.github.io/?https://github.com/AtActionPark/odin_js_tictactoe/blob/master/index.html)
* [Voreny's solution](https://github.com/Gelio/tic-tac-toe) - [View in browser](http://gelio.github.io/tic-tac-toe/)
* [Wayne's solution](https://github.com/wayneho/Tic_Tac_Toe) - [View in browser](https://rawgit.com/wayneho/Tic_Tac_Toe/master/index.html)
* [Dan V's solution](https://github.com/vickerdj/tictactoe) - [View in browser](http://vickerdj.github.io/tictactoe/)
* [Gionaufal's solution](https://github.com/gionaufal/tic-tac-toe) - [View in browser](http://htmlpreview.github.io/?https://github.com/gionaufal/tic-tac-toe/blob/master/index.html)
* [Trajanson's solution](https://github.com/Trajanson/js-tic-tac-toe) - [View in browser](http://projects.trajanson.com/jsTicTacToe/)
* [Luke Walker's solution](https://github.com/ubershibs/odin-js-course/tree/master/tictactoe) - [View in browser](http://htmlpreview.github.io/?https://github.com/ubershibs/odin-js-course/blob/master/tictactoe/index.html)
* [Yoshua Elmaryono's solution](https://github.com/dotm/tictactoe/tree/gh-pages) - [View in browser](http://dotm.github.io/tictactoe/)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/javascript/tic-tac-toe) - [View in browser](https://rawgit.com/cdouglass/odin-project-exercises/master/javascript/tic-tac-toe/app/tic-tac-toe.html)
* [Ryan Chang's solution](https://github.com/chang-ryan/javascript-games/tree/master/js-ttt) - [View in browser](https://rawgit.com/chang-ryan/javascript-games/master/js-ttt/index.html)
* [Miguel Herrera's solution](https://github.com/migueloherrera/js-tictactoe) - [View in browser](http://htmlpreview.github.io/?https://github.com/migueloherrera/js-tictactoe/blob/master/index.html)
* [Stefan (Cyprium)'s solution](https://github.com/dev-cyprium/Tic-tac-toe-HTML-) - [View in browser](https://htmlpreview.github.io/?https://github.com/dev-cyprium/Tic-tac-toe-HTML-/blob/master/index.html)
* [David Chapman's Solution](https://github.com/davidchappy/js-tictactoe) - [View in browser](https://davidchappy.github.io/tic-tac-toe/index.html)
* [Lani Huang's solution](https://github.com/laniywh/the-odin-project/tree/master/js/tic-tac-toe) - [View in browser](http://cdn.rawgit.com/laniywh/the-odin-project/master/js/tic-tac-toe/index.html)
* [Pat's solution](https://github.com/Pat878/TicTacToe) - [View in browser](https://pat878.github.io/TicTacToe/)
* [Daunenok's solution](https://github.com/daunenok/tic-tac-toe) - [View in browser](https://daunenok.github.io/tic-tac-toe/)
* [Sophia Wu's solution](https://github.com/SophiaLWu/tic-tac-toe) - [View in browser](https://sophialwu.github.io/tic-tac-toe/)
* [Neil Cudden's solution](https://github.com/ncud4bloc/Tic-Tac-Toe_JS) - [View in browser](https://ncud4bloc.github.io/Tic-Tac-Toe_JS/HTML/index.html)

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Add some!
