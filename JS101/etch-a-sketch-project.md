### Introduction
In this project you'll be creating a pretty neat toy for your portfolio to flex your DOM manipulation skills.  You're going to build a browser version of something between a sketchpad and an Etch-A-Sketch.

This project should _not_ be easy for you.  You'll probably have to Google frequently to get the right JavaScript methods and CSS to use - in fact, that's the point!  You _can_ build this using the tools that you have already learned and there are plenty of resources on the net for learning stuff that we haven't covered yet if you decide you need it.  We'll walk you through the basic steps, but it will be up to you to actually implement them.

If you get totally stuck drop by the chatroom.. someone will be there to point you in the right direction.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. [Follow the instructions atop Odin's Google Homepage project](https://www.theodinproject.com/courses/web-development-101/lessons/html-css) to setup a git repository for this project.
2. Create a webpage with a 16x16 grid of square divs
   1. Create the divs using JavaScript... don't try making them by hand with copy and pasting in your html file!
   2. Best to put your grid squares inside another "container" div \(that one can go directly in your html\)
   3. There are several different ways to make the divs appear as a grid \(verses just one on each line\) feel free to use any or play with each of them:
      1. float/clear
      2. inline-block
      3. flexbox
      4. CSS Grid
   4. Be careful with borders and margins, they can adjust the size of the squares!
   5. "OMG, Why isn't my grid being created???"
      1. Open your browser's developer tools
      2. Check if there are any errors in the JavaScript console
      3. Check your "elements" pane to see if the elements have actually shown up but are somehow hidden.
      4. Go willy-nilly and add  `console.log` statements in your JavaScript to see if it's actually being loaded.
3. Set up a "hover" effect so that the grid divs change color when your mouse passes over them, leaving a \(pixelated\) trail through your grid like a pen would.
   1. Hint: "hovering" is what happens when your mouse enters a div and ends when your mouse leaves it.. you can set up event listeners for either of those events as a starting point.
   2. There are multiple ways to change the color of the divs, including:
      1. adding a new class to the div
      2. changing the div's background color using JavaScript.
4. Add a button to the top of the screen which will clear the current grid and send the user a popup asking for how many squares per side to make the new grid.  Once entered the new grid should be generated _in the same total space as before_ \(e.g. 960px wide\) and now you've got a new sketch pad.
   1. Research `button` tags in HTML and how you can make a JavaScript function run when one is clicked.
   2. Also check out `prompt`s
   3. You should be able to enter `64` and have a brand new 64x64 grid pop up without changing the total amount of pixels used
5. \(Optional\): Instead of just changing the color of your grid from black to white \(for example\) have each pass through it with the mouse change to a completely random RGB value.   Then try having each pass just add another 10% of black to it so that only after 10 passes is the square completely black.
6. Push your project to GitHub!
</div>

### Student Solutions
Submit a solution with a pull request to this [file](https://github.com/TheOdinProject/javascript_curriculum/blob/master/JS101/etch-a-sketch-project.md) on the Javascript Curriculum github repository. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.

- Add your solution below this line!
* [Tobenski's Solution](https://github.com/tobenski/Etch_a_Sketch/) - [Live Version](https://tobenski.github.io/Etch_a_Sketch/)
* [Teng Lin's Solution](https://github.com/tenglin2/Etch-A-Sketch) - [View in browser](https://tenglin2.github.io/Etch-A-Sketch)
* [Bojo's solution](https://github.com/BojoZahariev/Sketch) - [View in browser](https://cdn.rawgit.com/BojoZahariev/Sketch/3717ea60/index.html)
* [Jacobo Martinez's solution](https://github.com/cobimr/webdev-101-projects/tree/master/hover-pixel) - [View in browser](https://cobimr.github.io/webdev-101-projects/hover-pixel/)
* [Jeff Vergne's solution](https://github.com/JeffFromParis/etch-a-sketch-project) - [View in browser](https://jefffromparis.github.io/etch-a-sketch-project/)
* [Hummeldon's solution](https://github.com/hummeldon/etch-a-sketch) - [View in browser](https://hummeldon.github.io/etch-a-sketch/)
* [JoKing's solution](https://github.com/joking3000/etch-a-sketch-project) - [View in Browser](https://joking3000.github.io/etch-a-sketch-project/)
* [Ben Wilde's solution](https://github.com/Spazrock/etch-a-sketch) - [View in browser](https://spazrock.github.io/etch-a-sketch/)
* [Chris Wegschied's solution](https://github.com/cwegscheid08/Etch-a-sketch.git) - [View in browser](https://cwegscheid08.github.io)
* [Gavin Bowen's solution](https://github.com/gavski02/Grid) - [View in browser](https://gavski02.github.io/Grid/)
* [Seth Robinson's solution](https://github.com/petrichor829/etch-a-sketch) - [View in browser](https://petrichor829.github.io/etch-a-sketch/)
* [Super1569's solution](https://github.com/Super1569/etch-a-sketch) - [View in Browser](https://super1569.github.io/etch-a-sketch/)
* [Pietro Verdile's Solution](https://github.com/pverdile/etch-a-sketch-project) - [View in Browser](https://pverdile.github.io/etch-a-sketch-project/)
* [Smetanca52’s Solution](https://github.com/Smetanca52/ETCH-A-SKETCH-PROJECT) - [View in Browser](https://cdn.rawgit.com/Smetanca52/ETCH-A-SKETCH-PROJECT/09dd7b59/index.html)
* [Karen Justo’s Solution](https://github.com/jrkaren9/etch-a-sketch) - [View in Browser](https://jrkaren9.github.io/etch-a-sketch/)
* [Mohamed Elattar's Solution](https://github.com/mohamed-elattar/etch-a-sketch) - [View in Browser](https://mohamed-elattar.github.io/etch-a-sketch/)
* [LeviButcher's Solution](https://github.com/LeviButcher/etch-a-sketch) - [View in Browser](https://levibutcher.github.io/etch-a-sketch/)
* [Dreniak’s Solution](https://github.com/Dreniak/etch-a-sketch) - [View in Browser](https://dreniak.github.io/etch-a-sketch/)
* [Terrance Brown's solution](https://github.com/terrancebee/etch-a-sketch) | [View in broswer](https://terrancebee.github.io/etch-a-sketch/)
* [Simon Tharby's solution](https://github.com/jinjagit/Etch-a-Sketch) | [View in browser](https://jinjagit.github.io/Etch-a-Sketch/)
* [CraigAndrewBlair's Solution](https://github.com/craigandrewblair/etch-a-sketch-odin) - [View in Browser](https://craigandrewblair.github.io/etch-a-sketch-odin/)
* [Monica Gabriel’s Solution](https://github.com/msgabriel/etch-a-sketch) - [View in Browser](https://msgabriel.github.io/etch-a-sketch/)
* [ebosi's solution](https://github.com/EBoisseauSierra/etch-a-sketch) - [View in Browser](https://eboisseausierra.github.io/etch-a-sketch/)
* [Rachel Krupnick's Solution](https://github.com/rkrupnick/top-etch-a-sketch) - [View in Browser](https://rkrupnick.github.io/top-etch-a-sketch/)
* [Kenneth McFetridge's Solution](https://github.com/kmcfetridge/etch-a-sketch) - [View in Browser](https://kmcfetridge.github.io/etch-a-sketch/)
* [Inuhoo's Solution](https://github.com/inuhoo/etch-a-sketch) - [View in Browser](https://inuhoo.github.io/etch-a-sketch/)
* [Chris MacSwan's Solution](https://github.com/cmacswan07/etch-a-sketch) - [View in Browser](https://cmacswan07.github.io/etch-a-sketch/)
* [Ajani Stewart's Solution](https://github.com/AjaniStewart/etch-a-sketch) - [View in Browser](https://ajanistewart.github.io/etch-a-sketch/)
* [Danny Pearson's Solution](https://github.com/dbuzzin/etch-a-sketch) - [View in Browser](https://dbuzzin.github.io/etch-a-sketch/)
* [Reece Pritchard's Solution](https://github.com/rapritchard/ETCH-A-SKETCH) - [View in Browser](https://rapritchard.github.io/ETCH-A-SKETCH/)
* [Chad Kreutzer's Solution](https://github.com/ChadKreutzer/js-etch-a-sketch) - [View in Browser](https://chadkreutzer.github.io/js-etch-a-sketch/)
* [ruanha's Solution](https://github.com/ruanha/etch-a-sketch) - [View in Browser](https://ruanha.github.io/etch-a-sketch/)
* [Kevin Mulherns Solution](https://github.com/KevinMulhern/etch_a_sketch) - [View in Browser](http://htmlpreview.github.io/?https://github.com/KevinMulhern/etch_a_sketch/blob/master/index.html)
* [Ochuko's Solution](https://github.com/ochuko56/etch-a-sketch) - [View in Browser](https://ochuko56.github.io/etch-a-sketch/)
* [scarey18's Solution](https://github.com/scarey18/etch-a-sketch) - [View in Browser](https://scarey18.github.io/etch-a-sketch/)
* [Tronerta's Solution](https://github.com/Tronerta/etch-a-sketch) - [View in Browser](https://tronerta.github.io/etch-a-sketch)
* [Ngo Van Huong's Solution](https://github.com/ngovanhuong94/etch-a-sketch) - [View in Browser](https://ngovanhuong94.github.io/etch-a-sketch/)
* [Typhoon's Solution](https://github.com/typhoon93/etch-a-sketch) - [View in Browser](https://typhoon93.github.io/etch-a-sketch/)
* [Mark Bungeroth's Solution](https://github.com/mbungeroth/etch-a-sketch) - [View in Browser](https://mbungeroth.github.io/etch-a-sketch/)
* [Jimmy's Solution](https://github.com/pty5io/etch_a_sketch) - [View in Browser](https://pty5io.github.io/etch_a_sketch/)
* [jstnlester's Solution](https://github.com/jstnlester/etch-a-sketch) - [View in Browser](https://jstnlester.github.io/etch-a-sketch/)
* [Augusto's solution](https://github.com/hackedwifi/sketchpad) - [View in browser](https://hackedwifi.github.io/sketchpad/)
* [Matt Claghorn's solution](https://github.com/Claggy/etch-a-sketch) - [View in browser](https://claggy.github.io/etch-a-sketch/)
* [Simon Tharby's solution](https://github.com/jinjagit/Etch-a-Sketch) - [View in browser](https://jinjagit.github.io/Etch-a-Sketch/)
* [autumnchris's Solution](https://github.com/autumnchris/sketch-pad) - [View in Browser](https://autumnchris.github.io/sketch-pad)
* [Douglasbsx Solution](https://github.com/douglasbsx/etch-a-sketch) - [View in Browser](https://douglasbsx.github.io/etch-a-sketch/)
* [Tarah's solution](https://github.com/ErraticCreation/etch-a-sketch) - [View in browser](https://erraticcreation.github.io/etch-a-sketch/)
* [mthsgrc's solution](https://github.com/mthsgrc/etch-a-sketch) - [View in browser](https://mthsgrc.github.io/etch-a-sketch/)
* [Rade's solution](https://github.com/fukifuki/etch-a-sketch) - [View in browser](https://fukifuki.github.io/etch-a-sketch)
* [Adrien Pardo's solution](https://github.com/Shieboo/etch-a-sketch) - [View in browser](https://shieboo.github.io/etch-a-sketch/)
* [Andrew's Solution](https://github.com/andrewr224/Etch-A-Sketch) - [View In Browser](https://andrewr224.github.io/Etch-A-Sketch/)
* [Alexander John's solution](https://github.com/alexander-john/etch-a-sketch) - [View in Browser](https://alexander-john.github.io/etch-a-sketch/)
* [Webop's solution](https://github.com/webop/etch-a-sketch) - [View in Browser](https://webop.github.io/etch-a-sketch/)
* [mandimh's solution](https://github.com/mandimh/etch-a-sketch) - [View in browser](https://mandimh.github.io/etch-a-sketch/)
* [hypnagogiasmic's solution](https://github.com/hypnagogiasmic/sketch) - [View in browser](https://rawgit.com/hypnagogiasmic/sketch/master/sketch.html)
* [Johan Morin's solution](https://github.com/MorrisMalone/Etch-a-Sketch-Project) - [View in browser](https://morrismalone.github.io/Etch-a-Sketch-Project/)
* [Balazs Birta's solution](https://github.com/bbalazs92/etch-a-sketch) - [View in browser](https://bbalazs92.github.io/etch-a-sketch/)
* [walnutdust's solution](https://github.com/walnutdust/etch-a-sketch) - [View in browser](https://walnutdust.github.io/etch-a-sketch/)
* [Clifford Minks's solution](https://github.com/xxerror500xx/TOP_Etch-a-Sketch) - [View in browser](https://xxerror500xx.github.io/TOP_Etch-a-Sketch/)
* [Agnieszka's Solution](https://github.com/elPetit69/etch-a-sketch) - [View in browser](https://elpetit69.github.io/etch-a-sketch/)
* [Ryafl's Solution](https://github.com/ryafl/etch-a-sketchProject) - [View in browser](https://ryafl.github.io/etch-a-sketchProject/)
* [James Moore's Solution](https://github.com/James-N-M/etch-a-sketch) - [View in browser](https://rawgit.com/James-N-M/etch-a-sketch/master/index.html)
* [SarfrazAnjum's solution](https://github.com/SarfrazAnjum/etchASketch) - [View in browser](https://github.com/SarfrazAnjum/etchASketch/)
* [Jonathan Yiv's Solution](https://github.com/getify) - [View in Browser](https://jonathanyiv.github.io/etch-a-sketch/)
* [Bojana Karakacev's solution](https://github.com/SarfrazAnjum/etchASketch) - [View in browser](https://github.com/SarfrazAnjum/etchASketch)
* [Calvin's solution](https://github.com/Calyeefornia/etch-a-sketch) - [View in browser](https://calyeefornia.github.io/etch-a-sketch/)
* [Bojana Karakacev's solution](https://github.com/bojana12/project-javascript-jquery) - [View in browser](https://bojana12.github.io/project-javascript-jquery/dist/)
* [Jmooree30's solution](https://github.com/jmooree30/etch-a-sketch-v2) - [View in browser](https://jmooree30.github.io/etch-a-sketch-v2/)
* [Mtizim's solution](https://github.com/mtizim/odin_projects/tree/master/etchasketch) - [View in browser](https://mtizim.github.io/odin_projects/etchasketch.html)
* [Javier Machin's Solution, with optional features](https://github.com/Javier-Machin/EtchSketch-PizarraMagica) - [View in browser](https://javier-machin.github.io/EtchSketch-PizarraMagica/)
* [Nate Dimock's Solution](https://github.com/Flakari/sketchpad) - [View in browser](https://flakari.github.io/sketchpad/)
* [JocelynOcelyn's Solution](https://github.com/jocelynocelyn/etchasketch) - [View in browser](https://jocelynocelyn.github.io/etchasketch/)
* [g0-0py's Solution](https://github.com/g0-0py/EtchASketch) - [View in browser](https://g0-0py.github.io/EtchASketch/)
* [artkol's Solution](https://github.com/artkol/simple-sketchpad) - [View in browser](https://artkol.github.io/simple-sketchpad/index.html)
* [AttilaTheHen's Solution](https://github.com/AttilaTheHen/SketchPad) - [View in browser](https://attilathehen.github.io/SketchPad/)
* [codyloyd's solution](https://github.com/codyloyd/odin-etch-a-sketch) - [View in browser](http://codyloyd.com/odin-etch-a-sketch/)
* [Kimberlee's Solution](https://github.com/KimDube/web-development/tree/master/etch-a-sketch) - [View in Browser](https://kimdube.github.io/web-development/etch-a-sketch/etchasketch.html)
* [PongtheGreat's Solution](https://github.com/PongtheGreat/etch-a-sketch) - [View in browser](https://pongthegreat.github.io/etch-a-sketch/)
* [Jakub Cisowski's Solution](https://github.com/arashin1337/etch-a-sketch) - [View in browser](https://arashin1337.github.io/etch-a-sketch/)
* [Dareon4's Solution](https://github.com/Dareon4/etch-a-sketch) - [View in browser](https://dareon4.github.io/etch-a-sketch/)
* [Alexander Luna's Solution](https://github.com/Mycroft1891/my-odin-project/tree/master/web-development-101/sketch) - [View in Browser](https://mycroft1891.github.io/my-odin-project/web-development-101/sketch/index.html)
* [SamJamCul's Solution](https://github.com/SamJamCul/etch-a-sketch) - [View in Browser](https://samjamcul.github.io/etch-a-sketch/)
* [Niko Caron's Solution](https://github.com/ncaron/etch-a-sketch/) - [View in Browser](https://ncaron.github.io/etch-a-sketch/)
* [Nick Leake's Solution](https://github.com/nleake/etchasketch) - [View in Browser](https://nleake.github.io/etchasketch/)
* [Eduardo Massarani's Solution](https://github.com/edmassarani/the-odin-project/tree/master/projects/etch-a-sketch) - [View in Browser](https://edmassarani.github.io/the-odin-project/projects/etch-a-sketch/)
* [Technicolor1's Solution](https://github.com/technicolor1/odin-etch_sketch) - [View in Browser](https://technicolor1.github.io/odin-etch_sketch/)
* [simplybretterson's Solution](https://github.com/simplybretterson/sketchpad) - [View in Browser](https://simplybretterson.github.io/sketchpad)
* [CTavino's Solution](https://github.com/ctavino/etch-a-sketch) - [View in Browser](https://ctavino.github.io/etch-a-sketch/)
* [Tshepo Mohlamonyane's Solution](https://github.com/blavkboy/Vanilla-JS-Sketchpad) - [View in Browser](https://blavkboy.github.io/Vanilla-JS-Sketchpad/)
* [CurmudJim's Solution](https://github.com/CurmudJim/EtchASketch) - [View in Browser](https://curmudjim.github.io/EtchASketch/)
* [vartanbeno's solution](https://github.com/vartanbeno/sketchpad) - [View in browser](https://vartanbeno.github.io/sketchpad/)
* [Josiah's solution](https://github.com/jdonor/etch-a-sketch) - [View in browser](https://jdonor.github.io/etch-a-sketch/)
* [Ezra's solution](https://github.com/Azhorabai/etch-a-sketch) - [View in browser](https://azhorabai.github.io/etch-a-sketch/)
* [HSaad's solution](https://github.com/HSaad/etch-a-sketch) - [View in browser](https://hsaad.github.io/etch-a-sketch/)
* [Fabio's solution](https://github.com/ffabiorj/etch-a-sketch) - [View in browser](https://cdn.rawgit.com/ffabiorj/etch-a-sketch/5793f5ec/index.html)
* [Cameron's solution](https://github.com/cameronzsmith/etchasketch) - [View in browser](http://czsmith.me/etchasketch)
* [Zach Coursey's solution](https://github.com/zcoursey22/etch-a-sketch) - [View in browser](https://zcoursey22.github.io/etch-a-sketch)
* [axelerleo's solution](https://github.com/axelerleo/Etch-a-scratch) - [View in browser](https://axelerleo.github.io/Etch-a-scratch/)
* [bradabayor's solution](https://github.com/bradabayor/etch-a-sketch) - [View in browser](https://bradabayor.github.io/etch-a-sketch)
* [Encolpius's solution](https://github.com/Encolpius/etch-a-sketch) - [View in browser](http://narrow-activity.surge.sh/)
* [Ryoma's solution](https://github.com/ryozume/drawing_grids) - [View in browser](https://ryozume.github.io/drawing_grids/)
* [Jacob Folley's solution](https://github.com/Jacob-Folley/EtchaSketch) - [View in browser](https://jacob-folley.github.io/EtchaSketch)
* [Joe Weston's solution](https://github.com/joeeeeeeeeeeeee/etch-a-sketch) - [View in browser](https://joeeeeeeeeeeeee.github.io/etch-a-sketch/)
* [Aziz Yakubov's solution](https://github.com/azizyakubov/etchasketch) - [View in browser](https://azizyakubov.github.io/etchasketch/)
* [Uy Binh's solution](https://github.com/uybinh/Etch-a-Sketch) - [View in browser](https://uybinh.github.io/Etch-a-Sketch/)
* [Jamie's solution](https://github.com/Zorafins/etch-a-sketch) - [View in browser](https://zorafins.github.io/etch-a-sketch/)
* [Jonakirke94's solution](https://github.com/jonakirke94/Etch-a-Sketch) - [View in browser](https://jonakirke94.github.io/Etch-a-Sketch/)
* [Balake's solution](https://github.com/Balake/etch-a-sketch) - [View in browser](https://balake.github.io/etch-a-sketch/)
* [Lucas Manzano's solution](https://github.com/lucasmfarias1/etch-a-sketch) - [View in browser](https://lucasmfarias1.github.io/etch-a-sketch/)
* [Shing Wong's solution](https://github.com/ayoshing/etch-a-sketch) - [View in browser](https://ayoshing.github.io/etch-a-sketch/)
* [Punnadittr's solution](https://github.com/punnadittr/EtchASketch) - [View in browser](https://punnadittr.github.io/EtchASketch/)
* [Benny's Solution](https://github.com/Deckins) - [View in brower](https://deckins.github.io/Etch-a-Sketch/)
* [mojotron's Solution](https://github.com/mojotron/etch-a-sketch) - [View in Browser](https://mojotron.github.io/etch-a-sketch/)
* [Onur's Solution](https://github.com/deksudo/JScanvas) - [View in Browser](https://deksudo.github.io/JScanvas/)
* [Jarred Herrington's Solution](https://github.com/Herringtonjc/etch-a-sketch) - [View in Browser](https://herringtonjc.github.io/etch-a-sketch/)
* [Natalie Aldrich's Solution](https://github.com/nataliealdrich/etch-a-sketch) - [View in Browser](https://nataliealdrich.github.io/etch-a-sketch/)
* [Faris Ibrahim's Solution](https://github.com/procusr/etch-a-sketch) - [View in Browser](https://procusr.github.io/etch-a-sketch/)
* [Daniel Ortea's Solution](https://github.com/D-Ortea/etch-a-sketch) - [View in Browser](https://d-ortea.github.io/etch-a-sketch/)
* [John Piatras' Solution](https://github.com/JohnPiatras/sketch) - [View in Browser](https://johnpiatras.github.io/sketch/)
* [Dima Konoval's Solution](https://github.com/DimaKonoval/ETCH-A-SKETCH) - [View in Browser](https://cdn.rawgit.com/DimaKonoval/ETCH-A-SKETCH/cb41f37b/index.html)
* [Anjali Deshwani's Solution](https://github.com/AnjaliDeshwani/etch-a-sketch)
* [Josh Hansen's Solution](https://jdhansen41.github.io/etch_sketch/) - [View in Browser](https://jdhansen41.github.io/etch_sketch/)
* [Caner Sezgin's Solution](https://github.com/casedo/Etch-A-Sketch) - [View in Browser](http://bit.ly/EtchAsketch)
* [Jurek Tomasello's Solution](https://github.com/Ashelf/etch-a-sketch) - [View in Browser](https://ashelf.github.io/etch-a-sketch/)
* [Tobias Johnson's Solution](https://github.com/viviers/sketchpad) - [View in Browser](https://viviers.github.io/sketchpad/)
* [Albert Garde's Solution](https://github.com/PenguinAgen/etch-a-sketch) - [View in Browser](https://penguinagen.github.io/etch-a-sketch/)
* [00Saad's Solution](https://github.com/00SaadChaudhry/Etch-A-Sketch) - [View in Browser](https://00saadchaudhry.github.io/Etch-A-Sketch/)
* [Katineto's Solution](https://github.com/Katineto/etch-a-sketch) - [View in Browser](https://katineto.github.io/etch-a-sketch/)
* [Ben Smyth's Solution](https://github.com/benjsmyth/etch-a-sketch) - [View in Browser](https://benjsmyth.github.io/etch-a-sketch/)
* [Miguel's Solution](https://github.com/MiguelTitus/03_etch_a_sketch) - [View in Browser](https://migueltitus.github.io/03_etch_a_sketch/)
* [Grace Chiamaka's Solution](https://github.com/Amriesgrace/Etch-A-Sketch) - [View in Browser](https://amriesgrace.github.io/Etch-A-Sketch/)
* [Mike Smith's Solution](https://github.com/MikeSS281986/Etch-a-Sketch) - [View in Browser](https://mikess281986.github.io/Etch-a-Sketch/)
* [Akash's Solution](https://github.com/Akash-sopho/etch-a-sketch) - [View a Browser](http://htmlpreview.github.io/?https://github.com/Akash-sopho/etch-a-sketch/blob/master/index.html)
* [Adhithyan's Solution](https://github.com/v-adhithyan/theodinproject/tree/master/etch-a-sketch) - [View in Browser](http://adhithyan.xyz/theodinproject/etch-a-sketch)
* [Max Garber's Solution](https://github.com/bubblebooy/TOP-Etch-A-Sketch) - [View in Browser](https://bubblebooy.github.io/TOP-Etch-A-Sketch/)
* [Eri Kurayami's Solution](https://github.com/EriKuroi/Etch-a-Sketch) - [View in Browser](https://cdn.rawgit.com/EriKuroi/Etch-a-Sketch/67ffae56/index.html)
* [cckl's Solution](https://github.com/cckl/etch) - [View in Browser](https://cckl.github.io/etch/)
* [Kristap's Solution](https://github.com/narelskristaps/Etch-a-Sketch) - [View in Browser](https://narelskristaps.github.io/Etch-a-Sketch/)
* [Rudi Boshoff's Solution](https://github.com/RudiBoshoff/etch-a-sketch) - [View in Browser](https://rudiboshoff.github.io/etch-a-sketch/)
* [Tyler Duckworth's Solution](https://github.com/Tyler-Duckworth/top-projects/tree/master/ttt) - [View in Browser](https://tyler-duckworth.github.io/top-projects/ttt/index.html)
* [Calstream's Solution](https://github.com/Calstream/etch-a-sketch) - [View in Browser](https://calstream.github.io/etch-a-sketch/)
* [thesofakillers's Solution](https://github.com/thesofakillers/etch-a-sketch) - [View in Browser](https://thesofakillers.github.io/etch-a-sketch/)
* [spankie's Solution](https://spankie1337.github.io/etch-a-sketch/) - [View in Browser](https://spankie1337.github.io/etch-a-sketch/)
* [Vyhn's Solution](https://github.com/Vyhnn/Etch-a-Sketch) - [View in Browser](https://vyhnn.github.io/Etch-a-Sketch/)
* [Tommy's Solution](https://github.com/hoangtommy/etchysketchy) - [View in Browser](https://hoangtommy.github.io/etchysketchy/)
* [Brendaneus' Solution](https://github.com/Brendaneus/Etch-a-Sketch) - [View in Browser](https://brendaneus.github.io/Etch-a-Sketch)
* [Kern's Solution](https://github.com/Kelel1/Etch-A-Sketch) - [View in Browser](https://kelel1.github.io/Etch-A-Sketch/)
* [Amy Smith's Solution](https://github.com/amicloud/the-odin-project/tree/master/sketchpad) - [View in Browser](https://amicloud.github.io/the-odin-project/sketchpad/sketchpad.html)
* [ramon15749's Solution](https://github.com/ramon15749/etch-a-sketch) - [View in Browser](https://ramon15749.github.io/etch-a-sketch/)
* [Yousof77's Solution](https://github.com/Yousof77/etch-a-sketch) - [View in Browser](https://yousof77.github.io/etch-a-sketch/)
* [MrObele's Solution](https://github.com/MrObele/Etch-a-Sketch) - [View in Browser](https://mrobele.github.io/Etch-a-Sketch/)
* [dmarkiewicz's Solution](https://github.com/dmarkiewicz/the-odin-project/tree/master/etch-a-sketch)
* [IvanaGoSt's Solution](https://github.com/IvanaGoSt/Etch-a-Sketch) - [View in Browser](https://cdn.rawgit.com/IvanaGoSt/Etch-a-Sketch/0aef0525/index.html)
* [NatSydenham's Solution](https://github.com/NatSydenham/etchasketch) - [View in Browser](https://natsydenham.github.io/etchasketch/)
* [bchalman's Solution](https://github.com/bchalman/etch-a-sketch) - [View in Browser](https://bchalman.github.io/etch-a-sketch/)
* [codyMalcolm's Solution](https://github.com/codyMalcolm/odin-etch-a-sketch) - [View in Browser](https://codymalcolm.github.io/odin-etch-a-sketch/)
* [Emil Dimitrov's Solution](https://github.com/imemdm/sketch-pad) - [View in Browser](https://imemdm.github.io/sketch-pad/)
* [AncherHisogi's Solution](https://github.com/Hisogi/etchi-sketchi) - [View in Browser](https://hisogi.github.io/etchi-sketchi/)
* [Eren Cataltepe's Solution](https://github.com/erencataltepe/etch-a-sketch/) - [View in Browser](https://erencataltepe.github.io/etch-a-sketch/)
* [Malaika's Solution](https://github.com/malaikaMI/Etch-A-Sketch_project) - [view on codepen](https://codepen.io/MalaikaMI/pen/dKMLLW)
* [Sam C's Solution](https://github.com/JimmyNeutron8/etch-a-sketch) - [View in Browser](https://jimmyneutron8.github.io/etch-a-sketch/)
* [Hassan's Solution](https://github.com/husseyexplores/husseyexplores.etch-a-sketch) - [View in Browser](https://husseyexplores.github.io/husseyexplores.etch-a-sketch/)
* [RossTrang's solution](https://github.com/RossTrang/etch-a-sketch) - [View in browser](https://cdn.rawgit.com/RossTrang/etch-a-sketch/f7f84edf/index.html)
* [Roshan's solution](https://github.com/roshanrahman/the-odin-project/tree/master/sketch) - [View in browser](https://roshanrahman.github.io/the-odin-project/sketch/index.html)
* [Casey's solution](https://github.com/DevCasey/Etch-a-Sketch) 
* [Anatolii's solution](https://github.com/Nt444/sketch_test) -[View in browser](https://nt444.github.io/sketch_test/)
