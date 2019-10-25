### Introduction
We're making a Tic Tac Toe game you can play in your browser!

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Set up your project with a HTML, CSS and Javascript files and get the Git repo all set up.
2. You're going to store the gameboard as an array inside of a Gameboard object, so start there!  Your players are also going to be stored in objects... and you're probably going to want an object to control the flow of the game itself.
   1. Your main goal here is to have as little global code as possible.  Try tucking everything away inside of a module or factory.  Rule of thumb: if you only ever need ONE of something (gameBoard, displayController), use a module.  If you need multiples of something (players!), create them with factories.
3. Set up your HTML and write a JavaScript function that will render the contents of the gameboard array to the webpage (for now you can just manually fill in the array with `"X"`s and `"O"`s)
4. Build the functions that allow players to add marks to a specific spot on the board, and then tie it to the DOM, letting players click on the gameboard to place their marker. Don't forget the logic that keeps players from playing in spots that are already taken!
   1. Think carefully about where each bit of logic should reside. Each little piece of functionality should be able to fit in the game, player or gameboard objects.. but take care to put them in "logical" places.  Spending a little time brainstorming here can make your life much easier later!
5. Build the logic that checks for when the game is over!  Should check for 3-in-a-row and a tie.
6. Clean up the interface to allow players to put in their names, include a button to start/restart the game and add a display element that congratulates the winning player!
7. Optional - If you're feeling ambitious create an AI so that a player can play against the computer!
   1. Start by just getting the computer to make a random legal move.
   2. Once you've gotten that, work on making the computer smart.  It is possible to create an unbeatable AI using the minimax algorithm (read about it [here](https://en.wikipedia.org/wiki/Minimax), some googling will help you out with this one)
   3. If you get this running _definitely_ come show it off in the chatroom.  It's quite an accomplishment!
</div>

### Student Solutions
To add your solution to the list below, edit this [file](https://github.com/TheOdinProject/curriculum/blob/master/javascript/organizing-js/tic-tac-toe-project.md) (located on The Odin Project's "curriculum" github repository). See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for more instructions.

<details markdown="block">
  <summary> Show Student Solutions </summary>

- Add your solution below this line!
- [Saad Tarhi's Solution (AI: Alpha-Beta Pruning (Improved Mini-Max) & Great UI/UX design)](https://github.com/tarhi-saad/tic-tac-toe) - [Play in Browser](https://tarhi-saad.github.io/tic-tac-toe/)
- [Luky's Solution](https://github.com/lcyne/tic-tac-toe) - [View in Browser](https://lcyne.github.io/tic-tac-toe/)
- [Anmol's Solution](https://github.com/6point022/tic-tac-toe) - [View in Browser](https://6point022.github.io/tic-tac-toe/)
- [Andrew M's Solution](https://github.com/a6macleod/js_tictactoe) - [View in Browser](https://a6macleod.github.io/js_tictactoe/)
- [Leticia's solution](https://github.com/gradiva/odin-fullstack-javascript/tree/master/02-JavaScript/01-Organizing_JavaScript_Code/02-Factory_Functions_and_Module_Pattern/tic-tac-toe) - [View in Browser](https://hidden-castle-05197.herokuapp.com/)
- [Esteban's Solution](https://github.com/estebanmoroy/tic-tac-toe) - [View in Browser](https://estebanmoroy.github.io/tic-tac-toe/)
- [Igorashs's Solution](https://github.com/igorashs/tic-tac-toe) - [View in Browser](https://igorashs.github.io/tic-tac-toe/)
- [Jacavena's Solution](https://github.com/Jacavena/tic-tac-toe) - [View in Browser](https://jacavena.github.io/tic-tac-toe/)
- [Bollinca's Solution](https://github.com/bollinca/tic-tac-toe) - [View in Browser](https://bollinca.github.io/tic-tac-toe/)
- [JB's Solution](https://github.com/ugSh7hbY/tictactoe) - [View in Browser](https://ugsh7hby.github.io/tictactoe/)
- [Vedat Aydin's Solution](https://github.com/mvedataydin/tic-tac-toe) - [View in Browser](https://mvedataydin.github.io/tic-tac-toe/)
- [Kai's Solution](https://github.com/KaiVandivier/tic-tac-toe-js) - [View in Browser](https://kaivandivier.github.io/tic-tac-toe-js/)
- [Joey Van Lierop's Solution](https://github.com/joeyvanlierop/tic-tac-toe) - [View in Browser](https://joeyvanlierop.github.io/tic-tac-toe/)
- [Evan's Solution](https://github.com/evan-kapantais/tic-tac-toe) - [View in Browser](https://evan-kapantais.github.io/tic-tac-toe/)
- [Eljoey's Solution](https://github.com/eljoey/Tic-Tac-Toe) - [View in Browser](https://eljoey.github.io/Tic-Tac-Toe/)
- [Vollantre's solution](https://github.com/vollantre/tic_tac_toeJS) - [View in Browser](https://vollantre.github.io/tic_tac_toeJS/)
- [Henry Kirya's solution](https://github.com/harrika/tictac) - [View in Browser](https://harrika.github.io/tictac/)
- [Bojo's solution](https://github.com/BojoZahariev/TicTacToe) - [View in Browser](https://bojozahariev.github.io/TicTacToe/)
- [Daniel Ryu's solution](https://github.com/dryu99/tic-tac-toe) - [View in Browser](https://dryu99.github.io/tic-tac-toe/)
- [ARaut9's solution](https://github.com/ARaut9/Tic-Tac-Toe) - [View in Browser](https://araut9.github.io/Tic-Tac-Toe/)
- [Jason McKee's solution](https://github.com/jttmckee/odin-tic-tac-toe) - [View in Browser](https://jttmckee.github.io/odin-tic-tac-toe/)
- [Simon Tharby's solution](https://github.com/jinjagit/ticTacToe) - [View in browser](https://jinjagit.github.io/ticTacToe/)
- [Ricala's Solution](https://github.com/Ricala/tic-tac-toe) - [View in Browser](https://ricala.github.io/tic-tac-toe/)
- [Djo1e's Solution](https://github.com/Djo1e/tic-tac-toe) - [View in Browser](https://djo1e.github.io/tic-tac-toe/)
- [balowulf's Solution](https://github.com/balowulf/ticTacToe) - [View in Browser](https://balowulf.github.io/ticTacToe/)
- [Aggy's Solution](https://github.com/atarsa/tic-tac-toe-js) - [View in Browser](https://atarsa.github.io/tic-tac-toe-js/)
- [Hammad Ahmed's Solution](https://github.com/shammadahmed/tic-tac-toe) - [View in Browser](https://shammadahmed.github.io/tic-tac-toe/)
- [Chris MacSwan's Solution](https://github.com/cmacswan07/tic_tac_toe) - [View in Browser](https://cmacswan07.github.io/tic_tac_toe/)
- [Max Garber's Solution](https://github.com/bubblebooy/Odin-Javascript) - [View in Browser](https://bubblebooy.github.io/Odin-Javascript/ticTacToe.html)
- [Nate Dimock's Solution](https://github.com/Flakari/tic-tac-toe) - [View in Browser](https://flakari.github.io/tic-tac-toe/)
- [scarey18's solution (with unbeatable ai)](https://github.com/scarey18/unbeatable-tic-tac-toe) - [View in Browser](https://scarey18.github.io/unbeatable-tic-tac-toe/)
- [Javier Machin's solution](https://github.com/Javier-Machin/js-tic-tac-toe) - [View in browser](https://javier-machin.github.io/js-tic-tac-toe/)
- [Qin's solution](https://github.com/hyathynth/TicTacToe) - [View in browser](https://hyathynth.github.io/TicTacToe/)
- [leosoaivan's solution](https://github.com/leosoaivan/js-tictactoe) - [View in browser](http://leosoaivan.com/js-tictactoe)
- [nmac's solution (with minimax)](https://github.com/nmacawile/js-tic-tac-toe) - [Game](https://htmlpreview.github.io/?https://github.com/nmacawile/js-tic-tac-toe/blob/master/index.html)
- [Johan Morin's Solution](https://github.com/MorrisMalone/tic-tac-toe) - [View in Browser](https://morrismalone.github.io/tic-tac-toe/)
- [brxck's solution](https://github.com/brxck/tic-tac-toe-js) - [View in Browser](http://brockmcelroy.com/tic-tac-toe-js/)
- [theghall's solution](https://github.com/theghall/odin-tic-tac-toe) - [View in Browser](https://theghall.github.io/odin-tic-tac-toe/)
- [Andrew's Solution](https://github.com/andrewr224/Tic-Tac-Toe-JS) - [View in Browser](https://andrewr224.github.io/Tic-Tac-Toe-JS/)
- [mindovermiles262's Solution](https://github.com/mindovermiles262/tictactoejs) - [View in Browser](https://mindovermiles262.github.io/tictactoejs/)
- [Jonathan Yiv's solution](https://github.com/JonathanYiv/web-tic-tac-toe) - [View in browser](https://jonathanyiv.github.io/web-tic-tac-toe/)
- [Rob Hitt's solution](https://github.com/robhitt/tic-tac-toe-js) - [View in browser](https://robhitt.github.io/tic-tac-toe-js/)
- [walnutdust's solution](https://github.com/walnutdust/tic-tac-toe) - [View in browser](https://walnutdust.github.io/tic-tac-toe/)
- [Jmoore30's solution](https://github.com/jmooree30/JS-Tic-Tac-Toe) - [View in browser](https://jmooree30.github.io/JS-Tic-Tac-Toe/)
- [Ezequiel Espinoza's solution](https://github.com/ezeaspie/tictactoe) - [View in browser](https://ezeaspie.github.io/tictactoe/index.html)
- [codyloyd's solution](https://github.com/codyloyd/plainJS-tic-tac-toe) - [View in browser](http://codyloyd.com/plainJS-tic-tac-toe/)
- [Rémy's solution](https://codepen.io/beumsk/pen/ZevLbx) - [View in browser](https://codepen.io/beumsk/full/ZevLbx)
- [Nick's solution](https://sinclairnick.github.io/tictactoe/) - [View in browser](https://sinclairnick.github.io/tictactoe/)
- [Caner Sezgin's solution](https://github.com/casedo/Tic-Tac-Toe) - [View in browser](http://bit.ly/ticTacToe)
- [Katineto's solution](https://github.com/Katineto/tic-tac-toe) - [View in browser](https://katineto.github.io/tic-tac-toe/)
- [sampsonmao's solution](https://github.com/sampsonmao/tic-tac-toe) - [View in browser](https://sampsonmao.github.io/tic-tac-toe/)
- [Uy Bình's solution](https://github.com/uybinh/tic_tac_toe_web) - [View in browser](https://uybinh.github.io/tic_tac_toe_web/)
- [Punnadittr's solution](https://github.com/punnadittr/js_tictactoe) - [View in browser](https://punnadittr.github.io/js_tictactoe/)
- [Heyalvaro's solution](https://github.com/heyalvaro/tictactoe.js) - [View in browser](http://heyalvaro.com/tictactoe.js)
- [Francisco Carlos's solution](https://github.com/fcarlosdev/the_odin_project/tree/master/js_tic_tac_toe) - [View in browser](http://htmlpreview.github.io/?https://github.com/fcarlosdev/the_odin_project/blob/master/js_tic_tac_toe/index.html)
- [Alexfuro's Solution](https://github.com/alexfuro/odin_tic_tac_toe) - [View in Browser](https://alfuro-tic-tac-toe.netlify.com/)
- [aznafro's Solution](https://github.com/aznafro/tictactoe) - [View in Browser](https://aznafro.github.io/tictactoe/)
- [Areeba's Solution](https://github.com/AREEBAISHTIAQ/tic-tac-toe-js) - [View in browser](https://areebaishtiaq.github.io/tic-tac-toe-js/)
- [Taylor J's Solution](https://github.com/taylorjohannsen/tictactoe) - [View in browser](https://taylorjohannsen.github.io/tictactoe/)
- [Halkim44's game (PvP and P vs unbeatable CPU)](https://github.com/halkim44/tic-tac-toe-TOP) - [play Tic-Tac-Toe](https://halkim44.github.io/tic-tac-toe-TOP/)
- [Valentino Valenti's solution (p1 vs p2 - minimax)](https://github.com/1ba1/tic-tac-toe) - [Play it in browser](https://1ba1.github.io/tic-tac-toe/)
- [Ubaid Manzoor Wani](https://github.com/Ubaid-Manzoor/Tic-Tac-To) - [View in Browser](https://ubaid-manzoor.github.io/Tic-Tac-To/)
- [JamCry's Solution](https://github.com/jamcry/js-tictactoe) - [View in Browser](https://jamcry.github.io/js-tictactoe/)
- [Maxime's Solution](https://github.com/Maxime-Beaufils/JS-TicTacToe-PvsAI) - [View in Browser](https://maxime-beaufils.github.io/JS-TicTacToe-PvsAI/)
- [Ousmane's solution](https://kitague.github.io/Tic-Tac-Toe-Game/) - [View in Browser](https://kitague.github.io/Tic-Tac-Toe-Game/) 
- [Gene Mecija's Solution](https://github.com/genemecija/Tic-Tac-Toe) - [View in Browser](https://genemecija.github.io/Tic-Tac-Toe/) 
- [Javier Arias's Solution](https://github.com/jfariasf/TOP-tictactoe) - [View in Browser](https://jfariasf.github.io/TOP-tictactoe/) 
- [Ryan Floyd's Solution](https://github.com/MrRyanFloyd/tictactoe) - [View in Browser](https://mrryanfloyd.github.io/tictactoe/)
- [JoshAubrey's Solution](https://github.com/JoshAubrey/tic-tac-toe) - [View in Browser](https://joshaubrey.github.io/tic-tac-toe/) 
- [Harry Coburn's Solution](https://github.com/mattibun/odin-tic-tac-toe) - [View in Browser](https://mattibun.github.io/odin-tic-tac-toe)
- [Martink-rsa's Solution](https://github.com/martink-rsa/tic_tac_toe/) - [View in Browser](https://martink-rsa.github.io/tic_tac_toe/)
- [Joe Lee's Solution](https://github.com/joedravarol/tic_tac_toe) - [View in Browser](https://joedravarol.github.io/tic_tac_toe/)
- [Brendaneus' Solution](https://github.com/Brendaneus/the_odin_project/tree/master/javascript/tic_tac_toe)
</details>
