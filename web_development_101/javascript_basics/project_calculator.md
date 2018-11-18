### Introduction
You made it! By now you should have a _really_ firm grasp on the fundamentals of JavaScript.  Of course there's plenty more to learn, but you should be able to create quite a bit at this point.  Our final project is going to try to combine everything you've learned so far.. you're going to be making an on-screen calculator using JavaScript, HTML and CSS.

As usual with these things there are elements of this project that are not going to be trivially easy for you, but if you've been following the course so far you definitely have everything you need to finish it.  We're going to walk you through the various steps you can take, but again, how you actually implement them is up to you!


### Assignment

<div class="lesson-content__panel" markdown="1">
Here are some use cases (abilities your project needs to have):

1. Your calculator is going to contain functions for all of the basic math operators you typically find on simple calculators, so start by creating functions for the following items and testing them in your browser's console.
   1. add
   2. subtract
   3. multiply
   4. divide
2. Create a new function `operate` that takes an operator and 2 numbers and then calls one of the above functions on the numbers.
3. Create a basic HTML calculator with buttons for each digit, each of the above functions and an "Equals" key.
   1. Do not worry about wiring up the JS just yet.
   2. There should also be a display for the calculator, go ahead and fill it with some dummy numbers so you can get it looking right.
   3. Add a "clear" button.
4. Create the functions that populate the display when you click the number buttons... you should be storing the 'display value' in a variable somewhere for use in the next step.
5. Make the calculator work! You'll need to store the first number that is input into the calculator when a user presses an operator, and also save which operation has been chosen and then `operate()` on them when the user presses the "=" key.
   1. You should already have the code that can populate the display, so once `operate()` has been called, update the display with the 'solution' to the operation.
   2. This is the hardest part of the project.  You need to figure out how to store all the values and call the operate function with them.  Don't feel bad if it takes you a while to figure out the logic.
6. Gotchas: watch out for and fix these bugs if they show up in your code:
   1. Users should be able to string together several operations and get the right answer: `12 + 7 - 5 * 3` etc.
   2. You should round answers with long decimals so that they don't overflow the screen.
   2. Pressing `=` before entering all of the numbers or an operator could cause problems!
   3. Pressing "clear" should wipe out any existing data.. make sure the user is really starting fresh after pressing "clear"
   4. Display a snarky error message if the user tries to divide by 0... don't let it crash your calculator!
7. EXTRA CREDIT: Users can get floating point numbers if they do the math required to get one, but they can't type them in yet.  Add a `.` button and let users input decimals!  Make sure you don't let them type more than one though: `12.3.56.5`. It is hard to do math on these numbers. \(disable the decimal button if there's already one in the display\)
8. EXTRA CREDIT: Make it look nice!  This can be a good portfolio project... but not if it's UGLY.  At least make the  operations a different color from the keypad buttons.
9. EXTRA CREDIT: Add a "backspace" button, so the user can undo if they click the wrong number.
10. EXTRA CREDIT: Add keyboard support!
</div>

### Student Solutions
Submit a solution with a pull request to this [file](https://github.com/TheOdinProject/curriculum/blob/master/web_development_101/javascript_basics/project_calculator.md) on the Javascript Curriculum github repository. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.

- Add your solution below this line!
- [jj's Solution](https://github.com/jj-made/calculator) - [View in Browser](https://jj-made.github.io/calculator/)
- [Stefano Merazzi's Solution](https://github.com/ste001/calculator) - [View in Browser](https://ste001.github.io/calculator/)
- [Colton Shaheen's Solution](https://github.com/coltonshaheen/calculator) - [View in Browser](https://coltonshaheen.github.io/calculator/)
- [BeanFeast's Solution](https://github.com/BeanFeast2/calculator-app) - [View in Browser](https://beanfeast2.github.io/calculator-app/)
- [Bojo's Solution](https://github.com/BojoZahariev/Calculator) - [View in Browser](https://bojozahariev.github.io/Calculator/)
- [Wabbajack0's Solution](https://github.com/Wabbajack0/calculator) - [View in Browser](https://wabbajack0.github.io/calculator/)
- [Lucas's Solution](https://github.com/ogdendavis/calculator) - [View in Browser](https://ogdendavis.github.io/calculator/)
- [Waris's Solution](https://github.com/warisz/calculator-gui) - [View in Browser](https://cdn.rawgit.com/warisz/calculator-gui/530cc7dd/index.html)
- [Roman Alenskiy's Solution (responsive, mobile)](https://github.com/Roman-Alenskiy/calculator) - [View in Browser](https://roman-alenskiy.github.io/calculator/)
- [Trevor's Solution](https://github.com/trevorsinnott/calculator) - [View in Browser](https://trevorsinnott.github.io/calculator/)
- [Ochuko's Solution](https://github.com/ochuko56/calculator) - [View in Browser](https://ochuko56.github.io/calculator/)
- [Tobenski's Solution](https://github.com/tobenski/calculator) - [View in Browser](https://tobenski.github.io/calculator/)
- [Chris Wegscheid's Solution](https://github.com/cwegscheid08/calculator.git) - [View in Browser](https://cwegscheid08.github.io)
- [KoutselakisMano's Solution](https://github.com/koutselakismanos/calculator) - [View in Browser](https://koutselakismanos.github.io/calculator/)
- [Hummeldon's Solution](https://github.com/hummeldon/gui-calculator) - [View in Browser](https://hummeldon.github.io/gui-calculator/)
- [Teng Lin's Solution](https://github.com/tenglin2/Calculator) - [View in browser](https://tenglin2.github.io/Calculator)
- [Jacobo Martinez's Solution](https://github.com/cobimr/webdev-101-projects/tree/master/calculator) - [View in Browser](https://cobimr.github.io/webdev-101-projects/calculator/)
- [NatSydenham's Solution](https://github.com/NatSydenham/calculator) - [View in Browser](https://natsydenham.github.io/calculator/)
- [Smetanca52's Solution](https://github.com/Smetanca52/simple_calculator) - [View in browser](https://cdn.rawgit.com/Smetanca52/simple_calculator/a3a21f43/index.html)
- [Mohamed Elattar's Solution](https://github.com/mohamed-elattar/calculator) - [View in browser](https://mohamed-elattar.github.io/calculator/)
- [CraigBlair's Solution](https://github.com/craigandrewblair/odin-javascript-calculator) - [View in browser](https://craigandrewblair.github.io/odin-javascript-calculator)
- [prw001's Solution](https://github.com/prw001/Simple_calculator)
- [Simon Tharby's solution](https://github.com/jinjagit/calculator) - [View in browser](https://jinjagit.github.io/calculator/)
- [Wahaj Javed's Solution](https://github.com/WahajJaved/Calculator) - [View in Browser](https://wahajjaved.github.io/Calculator/)
- [Ajani Stewart's Solution](https://github.com/AjaniStewart/calculator) - [View in Browser](https://ajanistewart.github.io/calculator/)
- [Chris MacSwan's Solution](https://github.com/cmacswan07/calculator) - [View in Browser](https://cmacswan07.github.io/calculator/)
- [ebosi's solution](https://github.com/EBoisseauSierra/calculator) - [View in Browser](https://eboisseausierra.github.io/calculator/)
- [Max Garber's Solution](https://github.com/bubblebooy/TOP-Calculator) - [View in Browser](https://bubblebooy.github.io/TOP-Calculator/)
- [Inuhoo's Solution](https://github.com/inuhoo/calculator) - [View in Browser](https://inuhoo.github.io/calculator/)
- [Chad Kreutzer's Solution](https://github.com/ChadKreutzer/vanilla-calculator) - [View in Browser](https://chadkreutzer.github.io/vanilla-calculator/)
- [Tim Dowd's Solution](https://github.com/timothydowd/iphone-calc) - [View in Browser](https://timothydowd.github.io/iphone-calc/)
- [Kevin Mulhern's Solution](https://github.com/KevinMulhern/js_calculator) - [View in Browser](https://htmlpreview.github.io/?https://github.com/KevinMulhern/js_calculator/blob/master/index.html)
- [ruanha's solution](https://github.com/ruanha/calculator) - [View in Browser](https://ruanha.github.io/calculator/)
- [AlienSjit's solution](https://github.com/aliensjit/Calculator) - [View in Browser](https://aliensjit.github.io/Calculator/)
- [scarey18's solution](https://github.com/scarey18/calculator) - [View in Browser](https://scarey18.github.io/calculator/)
- [jstnlester's Solution](https://github.com/jstnlester/calculator) - [View in Browser](https://jstnlester.github.io/calculator/)
- [SarfrazAnjum's solution](https://github.com/SarfrazAnjum/TOP_JavaScript_Calculator) - [View in Browser](https://sarfrazanjum.github.io/TOP_JavaScript_Calculator/)
- [Ngo Van Huong's Solution](https://github.com/ngovanhuong94/calculator) - [View in Browser](https://ngovanhuong94.github.io/calculator/)
- [Mark Bungeroth's Solution](https://github.com/mbungeroth/calculator) - [View in Browser](https://mbungeroth.github.io/calculator/)
- [autumnchris's Solution](https://github.com/autumnchris/calculator) - [View in Browser](https://autumnchris.github.io/calculator)
- [Douglasbsx Solution](https://github.com/douglasbsx/calculator) - [View in Browser](https://douglasbsx.github.io/calculator/)
- [Ed Magalhaes' solution](https://github.com/EdMagal/TOPcalculator) - [View in browser](https://rawgit.com/EdMagal/TOPcalculator/master/index.html)
- [Tarah's Solution](https://github.com/ErraticCreation/web-calculator) - [View in Browser](https://erraticcreation.github.io/web-calculator/)
- [Alekseev Pavel's Solution](https://github.com/RukkiesMan/calculator) - [View in browser](https://rukkiesman.github.io/calculator/)
- [Adrien Pardo's Solution](https://github.com/Shieboo/calculator) - [View in browser](https://shieboo.github.io/calculator/)
- [Andrew's Solution](https://github.com/andrewr224/calculator) - [View in Browser](https://andrewr224.github.io/calculator/)
- [leosoaivan's solution](https://github.com/leosoaivan/js-calculator) - [View in Browser](http://leosoaivan.com/js-calculator/)
- [Johan Morin's solution](https://github.com/MorrisMalone/Calculator) - [View in Browser](https://morrismalone.github.io/Calculator/)
- [mandimh's solution](https://github.com/mandimh/calculator) - [View in Browser](https://mandimh.github.io/calculator/)
- [Alexander John's solution](https://github.com/alexander-john/project-calculator) - [View in Browser](https://alexander-john.github.io/project-calculator/)
- [Austin Fisher's solutoin](https://github.com/Austin2016/myCalculator-) - [View in Browser](https://austin2016.github.io/myCalculator-)
- [Jonakirke94's solution](https://github.com/jonakirke94/JSCalculator) - [View in Browser](https://jonakirke94.github.io/JSCalculator/)
- [Jon Yoo's solution](https://github.com/jonyoowa/web_calculator) - [View in Browser](https://jonyoowa.github.io/web_calculator)
- [Javier Machin's solution](https://github.com/Javier-Machin/Calculator) - [View in Browser](https://javier-machin.github.io/Calculator/)
- [Ryafl's solution](https://github.com/ryafl/calculator-project) - [View in Browser](https://ryafl.github.io/calculator-project/)
- [Calvin's solution](https://github.com/Calyeefornia/Calculator) - [View in Browser](https://calyeefornia.github.io/Calculator/)
- [Nate Dimock's solution](https://github.com/Flakari/calculator) - [View in Browser](https://flakari.github.io/calculator/)
- [Jonathan Yiv's solution](https://github.com/JonathanYiv/calculator) - [View in Browser (not Mobile)](https://github.com/JonathanYiv/calculator)
- [Jmooree30's solution](https://github.com/jmooree30/calculator) - [View in Browser](https://jmooree30.github.io/calculator/)
- [Mtizim's solution](https://github.com/mtizim/odin_projects/tree/master/calculator) - [View in Browser](https://mtizim.github.io/odin_projects/calculator.html)
- [JocelynOcelyn's solution](https://github.com/jocelynocelyn/calculator) - [View in Browser](https://jocelynocelyn.github.io/calculator/)
- [OthmanAmoudi's solution](https://github.com/OthmanAmoudi/javascript-calculator) - [View in Browser](https://codepen.io/theweeknd/full/GMNdGb/)
- [105ron's solution](https://github.com/105ron/calculator) - [View in browser](https://105ron.github.io/calculator/)
- [codyloyd's solution](https://github.com/codyloyd/odin-calculator) - [View in browser](http://codyloyd.com/odin-calculator/)
- [dejanmijatovic's solution](https://github.com/Anhatel/calculator-project)
- [PongtheGreat's solution](https://github.com/PongtheGreat/simple_calculator) - [View in browser](https://pongthegreat.github.io/simple_calculator/)
- [Alexander Luna's solution](https://github.com/Mycroft1891/my-odin-project/tree/master/web-development-101/calculator) - [View in Browser](https://mycroft1891.github.io/my-odin-project/web-development-101/calculator/index.html)
- [Dareon4's solution](https://github.com/Dareon4/calculator) - [View in Browser](https://dareon4.github.io/calculator/)
- [Niko Caron's solution](https://github.com/ncaron/react-calculator) - [View in Browser](https://ncaron.github.io/react-calculator/)
- [g0-0py's solution](https://github.com/g0-0py/Simple-Calculator) - [View in Browser](https://g0-0py.github.io/Simple-Calculator/)
- [Jakub Cisowski's solution](https://github.com/arashin1337/calculator) - [View in Browser](https://arashin1337.github.io/calculator/)
- [Eduardo Massarani's solution](https://github.com/edmassarani/the-odin-project/tree/master/projects/calculator) - [View in Browser](https://edmassarani.github.io/the-odin-project/projects/calculator/)
- [Naveen M V's solution](https://github.com/naveencode/calculator) - [View in Browser](https://naveencode.github.io/calculator/)
- [AttilaTheHen's solution](https://github.com/AttilaTheHen/calculator) - [View in Browser](https://attilathehen.github.io/calculator/)
- [Laura Ilona's solution](https://github.com/laurailona/calculator) - [View in Browser](https://laurailona.github.io/calculator/)
- [SamJamCul's solution](https://github.com/SamJamCul/calculator) - [View in Browser](https://samjamcul.github.io/calculator/)
- [simplybretterson's solution](https://github.com/simplybretterson/calculator) - [View in Browser](https://simplybretterson.github.io/calculator/)
- [vartanbeno's solution](https://github.com/vartanbeno/calculator) - [View in browser](https://vartanbeno.github.io/calculator/)
- [Zach Coursey's solution](https://github.com/zcoursey22/calculator) - [View in browser](https://zcoursey22.github.io/calculator/)
- [HSaad's solution](https://github.com/HSaad/calculator) - [View in browser](https://hsaad.github.io/calculator/)
- [Josiah's solution](https://github.com/jdonor/calculator) - [View in browser](https://jdonor.github.io/calculator/)
- [Bridget Nyirongo's solution](https://github.com/Bridget12/basiccalculculator) - [View in browser](https://bridget12.github.io/basiccalculculator/)
- [CurmudJim's solution](https://github.com/CurmudJim/JS_Calculator) - [View in Browser](https://curmudjim.github.io/JS_Calculator/)
- [Joe Weston's solution](https://github.com/joeeeeeeeeeeeee/project-calculator) - [View in Browser](https://joeeeeeeeeeeeee.github.io/project-calculator/)
- [Technicolor1's solution](https://github.com/technicolor1/simpleCalculator) - [View in Browser](https://technicolor1.github.io/simpleCalculator/)
- [Encolpius's solution](https://github.com/Encolpius/calculator) - [View in Browser](https://encolpius.github.io/calculator/)
- [Lucas Manzano's solution](https://github.com/lucasmfarias1/calculator) - [View in Browser](https://lucasmfarias1.github.io/calculator/)
- [3lux's solution](https://github.com/3lux/js-calculator) - [View in Browser](https://3lux.github.io/js-calculator/)
- [Punnadittr's solution](https://github.com/punnadittr/calculator) - [View in Browser](https://punnadittr.github.io/calculator/)
- [Fabio's solution](https://github.com/ffabiorj/calculator) - [View in Browser](https://cdn.rawgit.com/ffabiorj/calculator/c359c53b/index.html)
- [Mojotron's solution](https://github.com/mojotron/simple-calculator) - [View in Browser](https://mojotron.github.io/simple-calculator/)
- [Benny's Solution](https://deckins.github.io/Calculator/) - [View in Browser](https://deckins.github.io/Calculator/)
- [Jarred Herrington's Solution](https://github.com/Herringtonjc/calculator) - [View in Browswer](https://herringtonjc.github.io/calculator/)
- [Danie Ortea's Solution](https://github.com/D-Ortea/calculator) - [View in Browser](https://d-ortea.github.io/calculator/)
- [Blake Bryant's solution](https://github.com/Balake/calculator) - [View in Browser](https://balake.github.io/calculator/)
- [Josh Hansen's solution](https://jdhansen41.github.io/calculator/) - [View in Browser](https://jdhansen41.github.io/calculator/)
- [AREEBAISHTIAQ's solution](https://github.com/AREEBAISHTIAQ/calculator)
- [Dima Konoval's Solution](https://github.com/DimaKonoval/Calculator) - [View in Browser](https://cdn.rawgit.com/DimaKonoval/Calculator/256e8690/index.html)
- [Anjali Deshwani's Solution](https://github.com/AnjaliDeshwani/Calculator) - [View in Browser](https://anjalideshwani.github.io/Calculator/)
- [James Thomson's solution](https://github.com/jthomsonx/calculator) - [View in Browser](https://jthomsonx.github.io/calculator/)
- [Caner Sezgin's solution](https://github.com/casedo/calculator) - [View in Browser](http://bit.ly/casedoCALC)
- [Albert Garde's solution](https://github.com/PenguinAgen/calculator) - [View in Browser](https://penguinagen.github.io/calculator/)
- [Mike Smith's solution](https://github.com/MikeSS281986/Calculator) - [View in Browser](https://mikess281986.github.io/Calculator/)
- [Ben Smyth's Solution](https://github.com/benjsmyth/calculator) - [View in Browser](https://benjsmyth.github.io/calculator/)
- [Katineto's Solution](https://github.com/Katineto/calculator) - [View in Browser](https://katineto.github.io/calculator/)
- [00Saad's Solution](https://github.com/00SaadChaudhry/calculator) - [View in Browser](https://00saadchaudhry.github.io/calculator/)
- [Akash's Solution](https://github.com/Akash-sopho/calculator) - [View in Browser](http://htmlpreview.github.io/?https://github.com/Akash-sopho/calculator/blob/master/index.html)
- [Adhithyan's Solution](https://github.com/v-adhithyan/theodinproject/tree/master/calculator) - [View in Browser](http://adhithyan.xyz/theodinproject/calculator)
- [John Piatras' Solution](https://github.com/JohnPiatras/calculator) - [View in Browser](https://johnpiatras.github.io/calculator)
- [Kristap's Solution](https://github.com/narelskristaps/calculator) - [View in Browser](https://narelskristaps.github.io/calculator/)
- [Tyler's Solution](https://github.com/Tyler-Duckworth/top-projects/tree/master/calc) - [View in Browser](https://tyler-duckworth.github.io/top-projects/calc/index.html)
- [spankie's Solution](https://spankie1337.github.io/js-calculator/) - [View in Browser](https://spankie1337.github.io/js-calculator/)
- [Rudi Boshoff's Solution](https://github.com/RudiBoshoff/calculator) - [View in Browser](https://rudiboshoff.github.io/calculator/)
- [thesofakillers' Solution](https://github.com/thesofakillers/calculator) - [View in Browser](https://thesofakillers.github.io/calculator/)
- [Amy Smith's Solution](https://github.com/amicloud/the-odin-project/tree/master/calculator) - [View in Browser](https://amicloud.github.io/the-odin-project/calculator/calculator.html)
- [Brendaneus' Solution](https://github.com/Brendaneus/Calculator) - [View in Browser](https://brendaneus.github.io/Calculator/)
- [MrObele' Solution](https://github.com/MrObele/Calculator) - [View in Browser](https://mrobele.github.io/Calculator/)
- [Vyhn' Solution](https://github.com/Vyhnn/Calculator) - [View in Browser](https://vyhnn.github.io/Calculator/)
- [dmarkiewicz's Solution](https://github.com/dmarkiewicz/the-odin-project/tree/master/calculator)
- [Tommy's Solution](https://github.com/hoangtommy/calculator) - [View in Browser](https://hoangtommy.github.io/calculator/)
- [codyMalcolm's Solution](https://github.com/codyMalcolm/odin-javascript-calculator) - [View in Browser](https://codymalcolm.github.io/odin-javascript-calculator/)
- [Benidzu's Solution](https://github.com/Benidzu/calculator) - [View in Browser](https://benidzu.github.io/calculator/)
-  [Emil Dimitrov's Solution](https://github.com/imemdm/calculator) - [View in Browser](https://imemdm.github.io/calculator)
- [bchalman's Solution](https://github.com/bchalman/calculator) - [View in Browser](https://bchalman.github.io/calculator/)
- [AncherHisogi's Solution](https://github.com/Hisogi/calculator-project) - [View in Browser](https://hisogi.github.io/calculator-project/)
- [Roshan's Solution](https://github.com/roshanrahman/the-odin-project/tree/master/calculator) - [View in Browser](https://roshanrahman.github.io/the-odin-project/calculator/index.html)
- [Mark Bailey's Solution](https://github.com/markbailey0356/calculator) - [View in Browser](https://markbailey0356.github.io/calculator/)
- [Fan's Solution](https://github.com/Komor-RP/calculator-odin-project) - [View in Browser](https://komor-rp.github.io/calculator-odin-project/)
- [HanJosmer's Solution](https://github.com/HanJosmer/calculator) - [View in Browser](https://hanjosmer.github.io/calculator/)
- [Franklyn Afeso's Solution](https://github.com/afedo/calculator) - [View in Browser](https://afeso.github.io/calculator/)
- [Halkim44's material Design Solution](https://github.com/halkim44/project-calculator) - [View in Browser](https://halkim44.github.io/project-calculator/)
- [themetar's solution](https://github.com/themetar/calculator) - [View in browser](https://themetar.github.io/calculator/)
- [aznafro's solution](https://github.com/aznafro/calc) - [View in browser](https://aznafro.github.io/calc/)
- [RTViner's solution](https://github.com/rtviner/JScalculator) - [View in browser](https://rtviner.github.io/JScalculator/)
- [IvanaGoSt's Solution](https://github.com/IvanaGoSt/Calculator-2) - [View in Browser](https://ivanagost.github.io/Calculator-2/)
- [Edgar Miranda's Solution](https://github.com/ejmiranda/calculator) - [View in Browser](https://ejmiranda.github.io/calculator/)
- [Alexfuro's Solution](https://github.com/alexfuro/TOPcalculator) - [View in Browser](https://topcalculator.netlify.com/)
- [Slaven Karamatic's Solution](https://github.com/Everdrought/js-calculator) - [View in Browser](https://everdrought.github.io/js-calculator/)
- [Ghassan's Solution](https://github.com/GT001/TheOdinProject-Calculator) - [View in Browser](https://gt001.github.io/TheOdinProject-Calculator/)
- [mwk913's Solution](https://github.com/mwk913/Calculator) - [View in Browser](https://mwk913.github.io/Calculator/)
- [Jeff's solution](https://github.com/JeffFromParis/calculator-project) - [View in browser](https://jefffromparis.github.io/calculator-project/)
