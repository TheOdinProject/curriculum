# Project: Javascript/jQuery

<!-- *Estimated Time: 2-4 hrs* -->

In this project, you'll get a chance to actually build a pretty nifty tool to flex your Javascript and jQuery muscles.  Up until now, you've had your hand held quite a bit by Codecademy.  Now it's time to do it on your own.  You're going to build a browser version of something between a sketchpad and an Etch-A-Sketch.

This should NOT be trivially easy for you.  You'll probably have to Google frequently to get the right jQuery methods or CSS to use.  In fact, that's the point!  You CAN build this, and the resources are out there.  We'll walk through the basic steps but it'll be up to you to find out how to actually implement them.  For instance, where does a `hover` effect come from?

The key is to break it down into little manageable steps and then figure out how to solve each step in turn.

If you get totally stuck, solutions from other students are listed below.  I'd encourage you to struggle for a bit on your own before checking them out.

1. Follow the instructions atop the [Google Homepage project](/web-development-101/html-css) to set up a Github repository for this project (of course you'll need to change the title).
1. Create a web page (or use [JSFiddle](http://jsfiddle.net/)) with a 16x16 grid of square divs.
    1. Create your divs using Javascript/jQuery... don't try making them by hand with copy-pasting!
    2. Best to put your grid squares inside another "container" div.
    2. If you need to [add jQuery to your file](http://www.w3schools.com/jquery/jquery_install.asp), you can grab it directly in your HTML by adding `<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>` inside your `<head>` tag above any other JS files.
    1. There are several different ways to make the divs appear as a grid (versus just one on each line) -- `float`/`clear`, using a `table`, and `inline-block` displays.  Play with each of them.
    2. Careful with your border or margins... they'll add size to the squares!
    3. "OMFG, Why isn't my grid being created???"
        1. Open your browser's developer tools
        2. Check if there are any errors in the Javascript console
        3. Check your "elements" pane to see if the elements have actually shown up but are somehow hidden.
        4. Go willy-nilly and add  `console.log` statements in your javascript to see if it's actually being loaded.
2. Set up a hover effect so it changes the color of the square when your mouse passes over it, leaving a (pixelated) trail through your grid like a pen would.
    1. What happens when you hover?  Well, you're *hover*ing, you need to *enter* the div with your mouse and you need to *leave* the div.  Any of those events should be a useful place to start.
    1. There are again several ways to change the color -- adding a new class (`addClass()`), changing that div's background color individually, etc.
3. Add a button to the top of the screen which will clear the current grid and send the user a popup asking for how many squares per side to make the new grid.  Once entered, the new grid should be generated *in the same total space as before* (e.g. 960px wide) and now you've got a new sketch pad.
    1. Research `button` tags in HTML and how you can make a javascript function run when one is clicked.
    2. You'll also want to check out `prompt`s.
    3. You should be able to enter `64` and have a new 64x64 grid pop up in front of you without changing the total amount of pixels used.
    4. Why is it so slow?? Remember that when you call a jQuery selector like `$(".square")`, it actually returns you ALL the elements that fit the description.  So if you're doing those types of operations hundreds of times inside a loop, it can get very time consuming... try pulling those outside your loops.
    5. See how many grid squares you can get before it becomes unusably slow.
4. (Optional): Instead of just changing the color of your grid from black to white (for example), have each pass through it with the mouse change to a completely random RGB value.  Then try having each pass just add another 10% of black to it, so only after 10 passes is the square completely black.
5. Push your project to Github

## Student Solutions

*Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.*

* [Nate Bennett's solution](https://github.com/n8sb/odin-project/tree/master/sketch-pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/n8sb/odin-project/blob/master/sketch-pad/index.html)
* [RebootJeff's solution](https://github.com/RebootJeff/myLearning/tree/master/odin.js.sketch_pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/RebootJeff/myLearning/blob/master/odin.js.sketch_pad/index.html)
* [Afshinator's solution](https://github.com/afshinator/playground/tree/master/SketchPad) | [View in browser](http://htmlpreview.github.io/?https://github.com/afshinator/playground/blob/master/SketchPad/index.html)
* [Paul Dariye's solution](https://github.com/pauldd91/theodinproject/tree/master/sketch_pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/pauldd91/theodinproject/master/sketch_pad/index.html)
* [Lamberto Diwa's solution](https://github.com/LambertoD/odin_curricullum/blob/master/javascript/js/etch_project.js) | [View in browser](http://htmlpreview.github.io/?https://github.com/LambertoD/odin_curricullum/blob/master/javascript/index_etch_project.html)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project1_2_javascript_jquery) | [View in browser](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/Project1_2_javascript_jquery/index.html)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/Jberczel/odin-projects/blob/master/sketchpad/index.html)
* [Angel Vargas' solution](https://github.com/arioth/the-odin-project/tree/master/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/arioth/the-odin-project/blob/master/sketchpad/index.html)
* [Peter Zberg's solution](https://github.com/peterzberg/theodinproject/tree/master/sketch_pat)
* [Abrar Hussain's solution](https://github.com/abrarisme/The-Odin-Project/tree/master/grid) | [View in browser](http://htmlpreview.github.io/?https://github.com/abrarisme/The-Odin-Project/blob/master/grid/index.html)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/sahilda/the_odin_project/blob/master/sketchpad/index.html)
* [Trevor Mahoney's solution](https://github.com/ohturbo/Etch-a-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/ohturbo/Etch-a-Sketch/blob/master/index.html#)
* [Chris Oldakowski's solution](https://github.com/KrzysiekO/theodinproject/tree/master/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/KrzysiekO/theodinproject/blob/master/etch-a-sketch/index.html)
* [Joe Barratt's solution](https://github.com/Evilbazza/sketch_pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/Evilbazza/sketch_pad/blob/master/index.html)
* [Jack Doyle's solution](https://github.com/jack-doyle/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/jack-doyle/etch-a-sketch/blob/master/index.html)
* [Arman Ghassemi's solution](https://github.com/ArmanG/Etch-A-Sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/ArmanG/Etch-A-Sketchpad/blob/master/index.html)
* [Arturo Coronel's solution](https://github.com/AoiTsu/TheOdinProject/blob/master/Etch-A-Grid-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/AoiTsu/TheOdinProject/blob/master/Etch-A-Grid-Sketch/index.html)
* [NerdDiffer's solution](https://github.com/NerdDiffer/etch)
* [Mark Westfall's solution](https://github.com/mwestfall88/etch-a-sketch) | [View in browser](http://mwestfall88.github.io/etch-a-sketch)
* [Donald's solution](https://github.com/donaldali/odin-webdev101/tree/master/project_js_jquery) | [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-webdev101/blob/master/project_js_jquery/index.html)
* [Paul's solution](https://github.com/tu98/Etch-a-Sketch-) | [View in browser](http://htmlpreview.github.io/?https://github.com/tu98/Etch-a-Sketch-/blob/master/index.html)
* [Jason Ellis's solution](https://github.com/jason-ellis/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/jason-ellis/etch-a-sketch/blob/master/etch.html)
* [Mazin Power's solution](https://github.com/muzfuz/CodeLessons/tree/master/Sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/muzfuz/CodeLessons/blob/master/Sketchpad/index.html)
* [Yeon Seo's solution](https://github.com/yseoserious/Etch-A-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/yseoserious/Etch-A-Sketch/blob/master/index.html)
* [Mateusz's solution](https://github.com/Emnalyeriar/learning_projects/tree/master/the%20odin%20projects/etch-a-sketch%20pure%20javascript) | [View in browser](http://htmlpreview.github.io/?https://github.com/Emnalyeriar/learning_projects/blob/master/the%20odin%20projects/etch-a-sketch%20pure%20javascript/index.html)
* [Cedric Charly's solution](https://github.com/Cedricgc/playground/tree/master/The%20Odin%20Project/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/Cedricgc/playground/blob/master/The%20Odin%20Project/sketchpad/index.html)
* [Lisa S's solution](https://github.com/lisakstep/OdinProject/tree/master/section2WebDev/etchSketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/lisakstep/OdinProject/blob/master/section2WebDev/etchSketch/browserSketch.html)
* [Bitvala's solution](https://github.com/Bitvala/Etch) | [View in browser](http://htmlpreview.github.io/?https://github.com/Bitvala/Etch/blob/master/index.html)
* [Michael Alexander's solution](https://github.com/betweenparentheses/jquery-sketch-project/) | [View in browser](http://htmlpreview.github.io/?https://github.com/betweenparentheses/jquery-sketch-project/blob/master/index.html)
* [Steve Mitchell's solution](https://github.com/Ixpata/ixpata.github.io) | [View in browser](http://ixpata.github.io/)
* [Benjamin Ratiarisolo's solution](https://github.com/ratiaris/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/ratiaris/sketchpad/blob/master/sketchpad.html)
* [Ingi Kim's solution](https://github.com/ingikim/The-Odin-Projects/tree/master/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/ingikim/The-Odin-Projects/blob/master/sketchpad/index.html)
* [Tomislav's solution](https://github.com/MrKindle85/Etch-A-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/MrKindle85/Etch-A-Sketch/blob/master/index.html)
* [Cameron Kingsbury's solution](https://github.com/Camsbury/etch-a-sketch)
* [Ruben Mendez's solution](https://github.com/ruben-socal/sketch-pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/ruben-socal/sketch-pad/blob/master/index.html)
* [Megan Betz's solution](https://github.com/adellt/sketch-pad/tree/small) | [View in browser](http://htmlpreview.github.io/?https://github.com/adellt/sketch-pad/blob/small/index.html)
* [John Miller's solution](https://github.com/johndrmiller/js-jquery-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/johndrmiller/js-jquery-sketch/blob/master/sketchProject.html)
* [Farkhod Karimov's solution](https://github.com/fkarimov/JS-jQuery) | [View in browser](http://htmlpreview.github.io/?https://github.com/fkarimov/JS-jQuery/blob/master/index.html)
* [Jorge Acosta's solution](https://github.com/JorgEdmundo/javascriptExercises/tree/master/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/JorgEdmundo/javascriptExercises/blob/master/sketchpad/index.html)
* [James MacIvor's solution](https://github.com/RobotOptimist/Sketch-a-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/RobotOptimist/Sketch-a-Sketch/blob/master/index.html)
* [David Ford's solution](https://github.com/djfordz/project_js_jquery) | [View in browser](http://djfordz.github.io/project_js_jquery)
* [Vincent's solution](https://github.com/wingyu/etch_a_sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/wingyu/etch_a_sketch/blob/master/index.html)
* [Lezou Dali's solution](https://github.com/lezoudali/web-dev-playground/blob/master/doodle.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/lezoudali/web-dev-playground/blob/master/doodle.html)
* [RomanADavis's solution](https://github.com/RomanADavis/JQuery-Toy)
* [Julie De Lorenzo's solution](https://github.com/delorenzo/jquery-sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/delorenzo/jquery-sketchpad/blob/master/index.html)
* [Shouvik Roy's solution](https://github.com/royshouvik/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/royshouvik/etch-a-sketch/blob/master/index.html)
* [Andrej Dragojevic's solution](https://github.com/antrix1/The-Odin-Project/tree/master/Web%20Development%20101/etch_a_sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/antrix1/The-Odin-Project/blob/master/Web%20Development%20101/etch_a_sketch/index.html)
* [Mike Over's solution](https://github.com/mikeover/jQuery-Etch-A-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/mikeover/jQuery-Etch-A-Sketch/master/index.html)
* [John Quarles' solution](https://github.com/johnwquarles/Sketchy-Etch) | [View in browser](http://htmlpreview.github.io/?https://github.com/johnwquarles/Sketchy-Etch/blob/master/index.html)
* [Artur Janik's solution](https://github.com/ArturJanik/odin-jquery-homework) | [View in browser](http://htmlpreview.github.io/?https://github.com/ArturJanik/odin-jquery-homework/blob/master/index.html)
* [Drew Price's solution](https://github.com/drewprice/study/tree/master/odin-project/projects/heck-a-sketch)
* [Antonio Augusto's solution](https://github.com/antoniosb/sketch_pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/antoniosb/sketch_pad/blob/master/index.html)
* [Chasmani's solution](https://github.com/chasmani/Etch-A-Sketch) | [View in browser](http://www.chasmani.com/portfolio/etch-a-sketch/)
* [Lara Finnegan's solution](https://github.com/lcf0285/Etch-A-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/lcf0285/Etch-A-Sketch/blob/master/etchsketch.html)
* [Rik's solution ](https://github.com/frbz/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/frbz/sketchpad/blob/master/index.html)
* [TReiff's solution](https://github.com/treiff/Odin-Project-Javascript-Jquery) | [View in browser](http://htmlpreview.github.io/?https://github.com/treiff/Odin-Project-Javascript-Jquery/blob/master/sketchpad.html)
* [Vidul's solution](https://github.com/viparthasarathy/javascript-jquery) | [View in browser](http://htmlpreview.github.io/?https://github.com/viparthasarathy/javascript-jquery/blob/master/index.html)
* [Jatin's solution](https://github.com/JatinBhatia/jquery_project/tree/master) | [View in browser](http://htmlpreview.github.io/?https://github.com/JatinBhatia/jquery_project/blob/master/index.html)
* [Corien's solution](https://github.com/benninkcorien/etcha) | [View in browser](http://htmlpreview.github.io/?https://github.com/benninkcorien/etcha/blob/master/etch.html)
* [Panagiotis Karatakis' solution](https://github.com/BlackSpirit96/the-odin-project_solutions/tree/master/web-101/sketchpad)
* [tkbyte's solution](https://github.com/tkbyte/JnJTOP) | [View in browser](http://htmlpreview.github.io/?https://github.com/tkbyte/JnJTOP/blob/master/index.html)
* [Andy Linteau's solution](https://github.com/linteau/sketchPad) | [View in browser](http://htmlpreview.github.io/?https://raw.githubusercontent.com/linteau/sketchPad/master/index.html)
* [Alex's solution](https://github.com/theloniusmonkey/EtchaSketch)
* [Eric Liu's solution](https://github.com/Latiosu/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/Latiosu/etch-a-sketch/blob/master/index.html)
* [insomniacode's solution](https://github.com/insomniacode/light-grid) | [View in browser](http://htmlpreview.github.io/?https://github.com/insomniacode/light-grid/blob/master/lightgrid.html)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/chrisdziewa/etch-a-sketch/blob/master/index.html)
* [Scott's solution](https://github.com/scootcho/the_odin_project/tree/master/javascript/etch_a_sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/scootcho/the_odin_project/blob/master/javascript/etch_a_sketch/index.html)
* [Stevelikesmusic's solution](https://github.com/stevelikesmusic/etcha_sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/stevelikesmusic/etcha_sketch/blob/master/index.html)
* [Michael Robinson's solution](https://github.com/ockytron/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/ockytron/etch-a-sketch/blob/master/index.html)
* [ido lichtenstein's solution](https://github.com/idolicht/scatch1)
* [Alice Rhomieux's solution](https://github.com/arhx/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/arhx/sketchpad/blob/master/index.html)
* [Syed Aslam's solution](https://github.com/saslam4/SketchPad) | [View in browser](http://htmlpreview.github.io/?https://github.com/saslam4/SketchPad/blob/master/index.html) 
* [Asish Prabhakar's solution](https://github.com/akottal/sketchpad/blob/master/index.html) | [View in browser](http://htmlpreview.github.io/?https://github.com/akottal/sketchpad/blob/master/index.html)
* [Eleanor Weigert's solution](https://github.com/mixophrygian/Etcha-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/mixophrygian/Etcha-sketch/blob/master/index.html)
* [Brandon Eichler's solution](https://github.com/vdubmastertech/etch-a-sketch) | [View in browser](http://rawgit.com/vdubmastertech/etch-a-sketch/master/index.html)
* [Tyler Travers' solution](https://github.com/ttravers17/the_odin_project/tree/master/sketch_pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/ttravers17/the_odin_project/blob/master/sketch_pad/index.html)
* [Sami Bashraheel's solution](https://github.com/sami/etch-a-sketch) | [View in browser](https://htmlpreview.github.io/?https://github.com/sami/etch-a-sketch/blob/master/index.html)
* [Andrea Kulbaba's solution](https://github.com/akulbaba/etch-a-sketch/blob/master/javascript.js) | [View in browser](http://htmlpreview.github.io/?https://github.com/akulbaba/etch-a-sketch/blob/master/index.html)
* [Dominik Stodolny's solution](https://github.com/dstodolny/sketchpad) | [View in browser](https://htmlpreview.github.io/?https://github.com/dstodolny/sketchpad/blob/master/index.html)
* [Richard Stewart's solution](https://github.com/rickstewart/Etch-a-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/rickstewart/Etch-a-Sketch/blob/master/index.html)
* [Chris Hall's solution](https://github.com/Concretechris/odin-javascript-jquery) | [View in browser](http://htmlpreview.github.io/?https://github.com/Concretechris/odin-javascript-jquery/blob/master/index.html)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_02-Web_Development_101/etch_a_sketch) | [View in browser](https://cdn.rawgit.com/craftykate/odin-project/master/Chapter_02-Web_Development_101/etch_a_sketch/index.html)
* [Kevin Weir's solution](https://github.com/IDCrisis2/the_odin_project/tree/master/javascript-jQuery)
* [Muhammad Salman's solution](https://github.com/salmanmanekia/sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/salmanmanekia/sketch/blob/master/index.html)
* [Ricardo Villegas' solution](https://github.com/claricardo/SketchPad) | [View in browser](http://htmlpreview.github.io/?https://github.com/claricardo/SketchPad/blob/master/index.html)
* [Aryan Jabbari's solution](https://github.com/BooG690/etch-a-sketch.git) | [View in browser](http://htmlpreview.github.io/?https://github.com/BooG690/etch-a-sketch/blob/master/index.html)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/etch_a_sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/KevinMulhern/etch_a_sketch/blob/master/index.html)
* [Tommy Rodriguez's solution](https://github.com/trodrigu/odinproject/tree/master/jquery/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/trodrigu/odinproject/blob/master/jquery/etch-a-sketch/index.html)
* [John Kotz's solution](https://github.com/jkotz/etchSketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/jkotz/etchSketch/blob/master/index.html)
* [Josh Naughton's solution](https://github.com/ThothLogos/odin-webfront) | [View in browser](http://htmlpreview.github.io/?https://raw.githubusercontent.com/ThothLogos/odin-webfront/master/index.html)
* [Jeremy Faith's solution](https://github.com/JeremyFaith/odin-projects/tree/master/sketcher_fx) | [View in browser](https://rawgit.com/JeremyFaith/odin-projects/master/sketcher_fx/sketcher.html)
* [Greg Park's solution](https://github.com/gregoryjpark/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/gregoryjpark/sketchpad/blob/master/index.html)
* [Meher Chandan's solution](https://github.com/meherchandan/Etch-A-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/meherchandan/Etch-A-Sketch/blob/master/index.html)
* [Benjamin Wilhelm's solution](https://github.com/Nimorgs/js_project_odin) | [View in browser](http://htmlpreview.github.io/?https://github.com/Nimorgs/js_project_odin/blob/master/index.html)
* [Jason Matthews' solution](https://github.com/fo0man/Odin-A-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/fo0man/Odin-A-Sketch/blob/master/index.html)
* [Zane Bilous' solution](https://github.com/Zane-/etchASketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/Zane-/etchASketch/blob/master/index.html)
* [Adam Lecuyer's solution](https://github.com/antisense/supersketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/antisense/supersketch/blob/master/index.html)
* [Gabi O'Connor's solution](https://github.com/GabiOC/sketchpad) | [View in browser](http://gabioc.github.io/sketchpad/)
* [Dorian Iacobescu's solution](https://github.com/iacobson/Odin6-Sketch-JS) | [View in browser](http://sketch-grid.herokuapp.com/)
* [Nick Kessler's solution](https://github.com/nakessler/Project_Javascript_jQuery) | [View in browser](http://htmlpreview.github.io/?https://github.com/nakessler/Project_Javascript_jQuery/blob/master/Project_Javascript_jQuery.html)
* [Psidium's solution](https://github.com/Psidium/jQuery-project) | [View in browser](http://htmlpreview.github.io/?https://raw.githubusercontent.com/Psidium/jQuery-project/master/project.html)
* [Thomas Vaeth's solution](https://github.com/thomasvaeth/the_odin_project/tree/master/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/thomasvaeth/the_odin_project/blob/master/etch-a-sketch/index.html)
* [Matias Pan's solution](https://github.com/kriox26/odin_project/tree/master/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/kriox26/odin_project/blob/master/sketchpad/index.html)
* [Ryan Jordan's solution](https://github.com/krjordan/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/krjordan/etch-a-sketch/blob/master/index.html)
* [Tom Faber's solution](https://github.com/TomFaber88/sketch-pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/TomFaber88/sketch-pad/blob/master/index.html)
* [Taylor Buchheit's solution](https://github.com/7aylor/etch-a-sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/7aylor/etch-a-sketch/blob/master/public.html)
* [Eddie's solution](https://github.com/feek1g/theodinproject/tree/master/jQueryAndJs) | [View in browser](http://htmlpreview.github.io/?https://github.com/feek1g/theodinproject/blob/master/jQueryAndJs/index.html)
* [omokoro's solution](https://github.com/omokoro/javascript-jQuery) | [View in browser](http://htmlpreview.github.io/?https://github.com/omokoro/javascript-jQuery/blob/master/index.html)
* [Steve Dolinsky's solution](https://github.com/stevedolinsky/js_project_odin)| [View In browser](http://htmlpreview.github.io/?https://github.com/stevedolinsky/js_project_odin/blob/master/index.html)
* [Adrian Kelly's solution](https://github.com/adriankelly/etch-a-sketch) | [View in browser](https://adriankelly.net/etch-a-sketch)
* [YuJer's solution](https://github.com/bon22801/The-Odin-Project/tree/master/Sketch-Pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/bon22801/The-Odin-Project/blob/master/Sketch-Pad/index.html)
* [Josh Klein's solution](https://github.com/kleinjoshuaa/SketchPad) | [View in browser](http://htmlpreview.github.io/?https://github.com/kleinjoshuaa/SketchPad/blob/master/index.html)
* [Kxxvc's solution](https://github.com/Kxxvc/sketch-pad) | [View in browser](http://htmlpreview.github.io/?https://github.com/Kxxvc/sketch-pad/blob/master/files/index.html)
* [Rob Pennington's solution](https://github.com/rPen/The.Odin.Project/tree/master/Sketchpad) | [View in browser](https://rawgit.com/rPen/The.Odin.Project/master/Sketchpad/index.html)
* [Alex Perez's solution](https://github.com/alex-perez7/sketchpad) | [View in browser](http://htmlpreview.github.io/?https://github.com/alex-perez7/sketchpad/blob/master/sketch.html)
* [Gb69010p's solution](https://github.com/gb69010p/Etch-A-Sketch) | [View in browser](http://htmlpreview.github.io/?https://github.com/gb69010p/Etch-A-Sketch/blob/master/index.html)
* [wellj's solution](https://github.com/wellsj/jquery-project) | [View in browser](http://htmlpreview.github.io/?https://github.com/wellsj/jquery-project/blob/master/index.html)
* Add your solution above this line!
