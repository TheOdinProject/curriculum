You've done a lot of Codecademy lately and so it's time to wean yourself off their super-friendly environment and create some Javascript on your own computer.

In this project, you'll be building many simple exercises to drill in your understanding of the language.  You can write them in a script file in your text editor and then run them by copy-pasting into [JS Fiddle](http://jsfiddle.net).  You can run your functions (e.g. `my_max()` below) by console logging their output with something like `console.log(my_max([1,56,2,3,-1,0]))` (which would output 56).

Save your solutions to Github and submit them for inclusion here when you're finished!

### Warmup

1. Build a function `my_max()` which takes an array and returns the maximum number.
2. Build a function `vowel_count()` which takes a string and returns the number of vowels (AEIOUY).
3. Build a function `reverse()` which takes a string and returns all the characters in the opposite position, e.g. `reverse("this is a string") // "gnirts a si siht"`

### Calculator

It's time to build an on-screen calculator

1. Build a function `add()` which takes two numbers and adds them together.
2. Build `multiply`, `divide` and `subtract` functions in a similar fashion.
3. Build a grid of `<div>`s in the browser that are labeled with the numbers 0-9.
4. Set up a listener so when the user clicks on one of these squares, it displays that number in the console log.  This can be done by assigning a function to the `onclick()` property of the div (use this if you haven't been introduced to jQuery listeners before).  It's okay to hard-code them in for now (e.g. `onclick(function(){ console.log "1" })`)
5. Now add "buttons" (more divs) to your calculator which represent "+", "-", "*", "/", "=" and "clear".
6. Make your calculator work!  This means that you'll need to "save" the first number that is pressed (to a variable or array) and you'll also need to "save" which operation has been chosen (e.g. addition).  Once the equals sign is pressed, it should run a function which evaluates the expression by calling the simple functions you created earlier and outputting the result to the command line.  It may take some practice to be able to pass the values from your "buttons" to your main calculator function.  It's a bit tricky, but you can do it.
7. Pressing "=" or "clear" should clear any saved variables or operations so you can start over.
8. Push your project to Github and share the solution below.
8. Extra credit: If you're comfortable with jQuery, create a "screen" for your calculator -- another `<div>` which displays the numbers and the results like a normal calculator would.
9. Extra credit: Create a "parent filter" which checks if the user has inputted any immature numbers "e.g. 80085" and scolds the user if so.


## Student Solutions

*Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.*

* Add your solution below this line!
* [Austin's solution](https://github.com/CouchofTomato/js-calculator) | [View in browser](https://couchoftomato.github.io/js-calculator/) - Without jquery
* [Rhys B's solution](https://github.com/105ron/calculator) | [View in browser](https://105ron.github.io/calculator/) - Without jquery
* [Serboteiu Cosmin's solution](https://github.com/Annno/Calculator-VanillaJS) | [View in browser](https://annno.github.io/Calculator-VanillaJS/) - Without jquery
* [Pawel R's solution](https://github.com/PawelRokosz/Calculator) | [View in browser](https://htmlpreview.github.io/?https://github.com/PawelRokosz/Calculator/blob/master/index.html)
* [mahimahi42's solution](https://github.com/mahimahi42/js-calc.git)
* [NerdDiffer's solution](https://github.com/NerdDiffer/simpleCalculator)
* [jamie's solution](https://github.com/Jberczel/odin-javascript/tree/master/calculator) | [View in browser](http://jsfiddle.net/Jberczel/3f3SG/)
* [Afshin M's solution](https://github.com/afshinator/js-calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/afshinator/js-calculator/blob/master/index.html)
* [jiangscript's solution](https://github.com/jiangscript/jscalc) | [View in browser](http://jiangscript.github.io/jscalc/)
* [TomTom's solution](https://github.com/tim5046/projectOdin/tree/master/Javascript/Project1) | [View in browser](http://jsfiddle.net/thomasmclaughlin/88cJL/)
* [raystation's solution](http://jsfiddle.net/k28ppt26/)
* [Siromivel's solution](https://github.com/siromivel/purecalc) | [View in browser](http://htmlpreview.github.io/?https://github.com/siromivel/purecalc/blob/master/jscalc.html)
* [Mazin Power's solution](https://github.com/muzfuz/JS_Calculator)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project5_1_Calculator)
* [Donald's solution](https://github.com/donaldali/odin-js-jquery/tree/master/calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-js-jquery/blob/master/calculator/index.html)
* [Vincent's solution](https://github.com/wingyu/Javascript-Calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/wingyu/Javascript-Calculator/blob/master/index.html)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_06-JavaScript_and_jQuery/calculator) | [View in browser](http://jsfiddle.net/craftykate/k9ewcpvr/embedded/result/)
* [Meher Chandan's solution](https://github.com/meherchandan/Calculator.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/meherchandan/Calculator/blob/master/calculator.html)
* [Rodić's solution](https://github.com/rodic/TOP---js-assignments/tree/master/Project%20-%20Building%20An%20On%20Screen%20Calculator%20Using%20Javascript)
* [Jason Matthews' solution](https://jsfiddle.net/o9jmrnf9/)
* [Nikola Čvorović's solution](https://github.com/cvorak/calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/cvorak/calculator/blob/master/index.html)
* [Trump's solution](https://github.com/trump812/OdinProject/tree/master/Javascript_and_jQuery/Calculator)
* [Ryan Jordan's solution](https://github.com/krjordan/odin-project/tree/master/calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/krjordan/odin-project/tree/master/calculator/index.html)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPJS/tree/master/Project1) | [View in browser](https://rawgit.com/ArturJanik/TOPJS/master/Project1/jq-index.html)
* [Jon Yorg's solution](https://github.com/Yorgg/Javascript/tree/master/calculator) | [View in browser](htmlpreview.github.io/?https://github.com/Yorgg/Javascript/blob/master/calculator/calculator.html)
* [Greg Park's solution](https://github.com/gregoryjpark/js-calculator) | [View in browser](https://htmlpreview.github.io/?https://github.com/gregoryjpark/js-calculator/blob/master/index.html)
* [Hutton's Solution](https://github.com/Hutbytheton/js_calculator) | [View in browser](http://hutbytheton.github.io/js_calculator/)
* [AtActionPark's Solution](https://github.com/AtActionPark/odin_calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/AtActionPark/odin_calculator/blob/master/main.html)
* [dchen71's Solution](https://github.com/dchen71/calculator) | [View in browser](https://htmlpreview.github.io/?https://github.com/dchen71/calculator/blob/master/Index.html)
* [Kevin Mulhern's Solution](https://github.com/KevinMulhern/js_calculator) | [View in browser](https://htmlpreview.github.io/?https://github.com/KevinMulhern/js_calculator/blob/master/index.html)
* [Voreny's solution](https://github.com/Gelio/js-calculator) | [View in browser](http://gelio.github.io/js-calculator/)
* [Dan's solution](https://github.com/vickerdj/calculator) | [View in browser](http://vickerdj.github.io/calculator/)
* [Wayne's solution](https://github.com/wayneho/On-Screen-Calculator) | [View in browswer](https://rawgit.com/wayneho/On-Screen-Calculator/master/index.html)
* [Ryan Chang's solution](https://github.com/chang-ryan/javascript-calculator) | [View in browser](https://rawgit.com/chang-ryan/javascript-calculator/master/index.html)
* [Skye Free's solution](https://github.com/swfree/the-odin-project/tree/master/javascript-and-jquery/calculator) | [View in browser](http://rawgit.com/swfree/the-odin-project/master/javascript-and-jquery/calculator/index.html)
* [Pauline Judge's solution](https://github.com/chumswap/calculator.git) | [View in browser](https://htmlpreview.github.io/?https://github.com/chumswap/calculator/blob/master/calculator.html)
* [Priyanka Saigal's solution](https://github.com/psaigal/JavaScript-Calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/psaigal/JavaScript-Calculator/blob/master/calculator.html)
* [Cameron Kelley's solution](https://github.com/cameronjkelley/the_odin_project/tree/master/calculator) | [View in browser](https://htmlpreview.github.io/?https://github.com/cameronjkelley/the_odin_project/blob/master/calculator/calc/index.html)
* [Trajanson's Solution](https://github.com/Trajanson/scientific-calculator-js) | [View in browser](http://projects.trajanson.com/js-calculator/)
* [Yoshua Elmaryono's Solution](https://github.com/dotm/calc) | [View in browser](http://dotm.github.io/calc/)
* [Luke Walker's solution](https://github.com/ubershibs/odin-js-course/tree/master/js-calc) | [View in browser](https://htmlpreview.github.io/?https://github.com/ubershibs/odin-js-course/blob/master/js-calc/index.html)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/blob/master/javascript/calculator/calculator.html) | [View in browser](https://rawgit.com/cdouglass/odin-project-exercises/master/javascript/calculator/app/calculator.html)
* [James Brooks's solution](https://github.com/jhbrooks/js-calc) | [View in browser](https://agile-dawn-60299.herokuapp.com/)
* [J-kaizen's solution](https://github.com/J-kaizen/TheOdinProject/tree/master/JS/jscalc) | [View in browser](https://htmlpreview.github.io/?https://github.com/J-kaizen/TheOdinProject/blob/master/JS/jscalc/index.html)
* [Artur Okonski's solution](https://github.com/cloudtemplar/js-calculator) | [View in browser](https://jsfiddle.net/c3x67ayp/1/)
* [Miguel Herrera's solution](https://github.com/migueloherrera/js-calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/migueloherrera/js-calculator/blob/master/index.html)
* [Marco the Phoenix's solution](https://github.com/marcsanmi/Learning/tree/master/Calculator) | [View in browser](https://htmlpreview.github.io/?https://github.com/marcsanmi/Learning/blob/master/Calculator/index.html)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/onscreen_calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/ShalaQweghen/onscreen_calculator/blob/master/main.html)
* [Mayowa Pitan's solution](https://github.com/andela-mpitan/js-calculator) | [View in browser](https://andela-mpitan.github.io/js-calculator/)
* [David Chapman's solution](https://github.com/davidchappy/calculator) | [View in browser](http://codepen.io/davidchappy/pen/vyXMvQ)
* [chrisnorwood's solution](https://github.com/chrisnorwood/js-calculator/blob/master/index.html) | [View in browser](https://htmlpreview.github.io/?https://github.com/chrisnorwood/js-calculator/blob/master/index.html)
* [Lani Huang's solution](https://github.com/laniywh/the-odin-project/tree/master/js/calculator) | [View in browser](http://cdn.rawgit.com/laniywh/the-odin-project/master/js/calculator/index.html)
* [Kamron Morgan's solution](https://github.com/normak/calculator) | [View in browser](https://normak.github.io/calculator/)
* [Axel's solution](https://github.com/afuh/calculator) | [View in browser](https://afuh.github.io/calculator/)
* [Pat's solution](https://github.com/Pat878/Calculator) | [View in browser](https://pat878.github.io/Calculator/)
* [Sophia Wu's solution](https://github.com/SophiaLWu/on-screen-calculator) | [View in browser](https://sophialwu.github.io/on-screen-calculator/)
* [Daunenok's solution](https://github.com/daunenok/calculator) | [View in browser](https://daunenok.github.io/calculator/)
* [smilesr's solution](https://github.com/smilesr/op-jj-bb-25-calculator) | [View in browser](http://htmlpreview.github.io/?https://github.com/smilesr/op-jj-bb-25-calculator/blob/master/index.html)
* [Eric's solution](https://github.com/Twinpair/Web_Calculator) | [View in browser](https://twinpair.github.io/Web_Calculator)
* [John's Solution](https://github.com/Khanthulhu/onScreenCalculator) | [View in breowser](https://khanthulhu.github.io/onScreenCalculator/) - without JQuery
* [Neil Cudden's solution](https://github.com/ncud4bloc/Calculator) | [View in browser](https://ncud4bloc.github.io/Calculator/HTML/index.html)

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [Tutorials for Javascript and jQuery from Jumpstart Lab](http://tutorials.jumpstartlab.com/)
* *Add some!*
