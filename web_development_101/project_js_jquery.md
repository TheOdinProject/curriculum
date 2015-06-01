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

* See Nate Bennett's solution here: [source code](https://github.com/n8sb/odin-project/tree/master/sketch-pad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/n8sb/odin-project/blob/master/sketch-pad/index.html)
* See RebootJeff's solution here: [source code](https://github.com/RebootJeff/myLearning/tree/master/odin.js.sketch_pad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/RebootJeff/myLearning/blob/master/odin.js.sketch_pad/index.html)
* See Afshinator's solution here: [source code](https://github.com/afshinator/playground/tree/master/SketchPad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/afshinator/playground/blob/master/SketchPad/index.html)
* See Paul Dariye's solution here: [source code](https://github.com/pauldd91/theodinproject/tree/master/sketch_pad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/pauldd91/theodinproject/master/sketch_pad/index.html)
* See Lamberto Diwa's solution here: [source code](https://github.com/LambertoD/odin_curricullum/blob/master/javascript/js/etch_project.js) or [view it in browser](http://htmlpreview.github.io/?https://github.com/LambertoD/odin_curricullum/blob/master/javascript/index_etch_project.html)
* See Marina Sergeyeva's solution here: [source code](https://github.com/imousterian/OdinProject/tree/master/Project1_2_javascript_jquery) or [view it in browser](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/Project1_2_javascript_jquery/index.html)
* See Aniruddh Agarwal's solution here: [source code](https://github.com/aniruddhagarwal/odin-projects/tree/master/js-project) or [view it in browser](http://htmlpreview.github.io/?https://github.com/aniruddhagarwal/odin-projects/blob/master/js-project/index.html)
* See Jamie's solution (submitted Apr-2, 2014) here: [source code](https://github.com/Jberczel/odin-projects/tree/master/sketchpad) or [view in browser](http://htmlpreview.github.io/?https://github.com/Jberczel/odin-projects/blob/master/sketchpad/index.html)
* See Angel Vargas' solution here: [source code](https://github.com/arioth/the-odin-project/tree/master/sketchpad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/arioth/the-odin-project/blob/master/sketchpad/index.html)
* See Peter Zberg's solution here: [source code](https://github.com/peterzberg/theodinproject/tree/master/sketch_pat) or [view it in browser](http://htmlpreview.github.io/?https://github.com/peterzberg/theodinproject/tree/master/sketch_pat)
* See Abrar Hussain's solution here: [source code](https://github.com/abrarisme/The-Odin-Project/tree/master/grid) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/abrarisme/The-Odin-Project/blob/master/grid/index.html)
* See Sahil Agarwal's solution here: [source code](https://github.com/sahilda/the_odin_project/tree/master/sketchpad) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/sahilda/the_odin_project/blob/master/sketchpad/index.html)
* See Trevor Mahoney's solution here: [source code](https://github.com/ohturbo/Etch-a-Sketch) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/ohturbo/Etch-a-Sketch/blob/master/index.html#)
* See Chris Oldakowski's solution here: [source code](https://github.com/KrzysiekO/theodinproject/tree/master/etch-a-sketch) or [view it in browser](http://htmlpreview.github.io/?https://github.com/KrzysiekO/theodinproject/blob/master/etch-a-sketch/index.html)
* See Joe Barratt's solution here: [source code](https://github.com/Evilbazza/sketch_pad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/Evilbazza/sketch_pad/blob/master/index.html)
* See Jack Doyle's solution here: [source code] (https://github.com/jack-doyle/etch-a-sketch) or [view it in the browser] (http://htmlpreview.github.io/?https://github.com/jack-doyle/etch-a-sketch/blob/master/index.html)
* See Arman Ghassemi's solution here: [source code](https://github.com/ArmanG/Etch-A-Sketchpad) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/ArmanG/Etch-A-Sketchpad/blob/master/index.html).
* See Arman Ghassemi's solution here: [source code](https://github.com/ArmanG/Etch-A-Sketchpad) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/ArmanG/Etch-A-Sketchpad/blob/master/index.html).
* See Arturo Coronel's solution here: [source code](https://github.com/AoiTsu/TheOdinProject/blob/master/Etch-A-Grid-Sketch) or [view it in browser] (http://htmlpreview.github.io/?https://github.com/AoiTsu/TheOdinProject/blob/master/Etch-A-Grid-Sketch/index.html).
* See NerdDiffer's solution here: [source code](https://github.com/NerdDiffer/etch) or [view it in browser] (http://htmlpreview.github.io/?https://github.com/NerdDiffer/etch/blob/master/index.html)
* See Mark Westfall's solution here: [source code](https://github.com/mwestfall88/etch-a-sketch) or [view it in browser](http://mwestfall88.github.io/etch-a-sketch)
* See Donald's solution here: [source code](https://github.com/donaldali/odin-webdev101/tree/master/project_js_jquery) or [view it in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-webdev101/blob/master/project_js_jquery/index.html)
* See Paul's solution here: [source code](https://github.com/tu98/Etch-a-Sketch-) or [view it in browser](http://htmlpreview.github.io/?https://github.com/tu98/Etch-a-Sketch-/blob/master/index.html)
* See Jason Ellis's solution here: [source code](https://github.com/jason-ellis/etch-a-sketch) or [view it in browser](http://htmlpreview.github.io/?https://github.com/jason-ellis/etch-a-sketch/blob/master/etch.html)
* See Mazin Power's solution here: [source code](https://github.com/muzfuz/CodeLessons/tree/master/Sketchpad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/muzfuz/CodeLessons/blob/master/Sketchpad/index.html)
* See Yeon Seo's solution here:  [source code](https://github.com/yseoserious/Etch-A-Sketch) or [view it in browser](http://htmlpreview.github.io/?https://github.com/yseoserious/Etch-A-Sketch/blob/master/index.html)
* See Mateusz's solution here:  [source code](https://github.com/Emnalyeriar/learning_projects/tree/master/the%20odin%20projects/etch-a-sketch%20pure%20javascript) or [view it in browser](http://htmlpreview.github.io/?https://github.com/Emnalyeriar/learning_projects/blob/master/the%20odin%20projects/etch-a-sketch%20pure%20javascript/index.html)
* See Gibran Garcia's solution here: [source code](https://github.com/Satimidus/OdinProject/tree/master/SketchPad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/Satimidus/OdinProject/blob/master/SketchPad/index.html)
* See Cedric Charly's solution here: [source code](https://github.com/Cedricgc/playground/tree/master/The%20Odin%20Project/sketchpad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/Cedricgc/playground/blob/master/The%20Odin%20Project/sketchpad/index.html)
* See Andy Yee's solution here: [source code](https://github.com/ayblu/learning_projects/tree/master/etch) or [view it in browser](http://htmlpreview.github.io/?https://github.com/ayblu/learning_projects/blob/master/etch/index.html)
* See Lisa S's solution here: [source code](https://github.com/lisakstep/OdinProject/tree/master/section2WebDev/etchSketch) or [view it in browser](http://htmlpreview.github.io/?https://github.com/lisakstep/OdinProject/blob/master/section2WebDev/etchSketch/browserSketch.html)
* See Bitvala's solution here: [source code](https://github.com/Bitvala/Etch) or [view it in browser](http://htmlpreview.github.io/?https://github.com/Bitvala/Etch/blob/master/index.html)
* See Michael Alexander's solution here: [source code](https://github.com/betweenparentheses/jquery-sketch-project/) or [view it in browser](http://htmlpreview.github.io/?https://github.com/betweenparentheses/jquery-sketch-project/blob/master/index.html)
* See Steve Mitchell's solution here: [source code](https://github.com/Ixpata/ixpata.github.io) or [view it in browser](http://ixpata.github.io/)
* See Benjamin Ratiarisolo's solution here: [source code](https://github.com/ratiaris/sketchpad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/ratiaris/sketchpad/blob/master/sketchpad.html)
* See Peter Hurford's solution here: [source code](https://github.com/peterhurford/etchsketch)
* See Ingi Kim's solution here: [source code](https://github.com/ingikim/The-Odin-Projects/tree/master/sketchpad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/ingikim/The-Odin-Projects/blob/master/sketchpad/index.html)
* See Mohammed Khalil Ait Brahim's solution here [source code](https://github.com/Khalilw1/Etch-A-Sketch) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/Khalilw1/Etch-A-Sketch/blob/master/index.html)
* See Tomislav's solution here: [source code](https://github.com/MrKindle85/Etch-A-Sketch) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/MrKindle85/Etch-A-Sketch/blob/master/index.html)
* See Cameron Kingsbury's solution here: [source code](https://github.com/Camsbury/etch-a-sketch) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/Camsbury/etch-a-sketch/index.html)
* See Ruben Mendez's solution here: [source code](https://github.com/ruben-socal/sketch-pad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/ruben-socal/sketch-pad/blob/master/index.html)
* See Megan Betz's solution here: [source code](https://github.com/adellt/sketch-pad/tree/small) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/adellt/sketch-pad/blob/small/index.html)
* See John Miller's solution here: [source code](https://github.com/johndrmiller/js-jquery-sketch) or [view it in browser](http://htmlpreview.github.io/?https://github.com/johndrmiller/js-jquery-sketch/blob/master/sketchProject.html)
* See Farkhod Karimov's solution here: [source code](https://github.com/fkarimov/JS-jQuery) or [view it in browser](http://htmlpreview.github.io/?https://github.com/fkarimov/JS-jQuery/blob/master/index.html)
*  See Jorge Acosta's solution here: [source code](https://github.com/JorgEdmundo/javascriptExercises/tree/master/sketchpad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/JorgEdmundo/javascriptExercises/blob/master/sketchpad/index.html)
* See James MacIvor's solution here: [source code](https://github.com/RobotOptimist/Sketch-a-Sketch) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/RobotOptimist/Sketch-a-Sketch/blob/master/index.html)
* See David Ford's solution here: [source code](https://github.com/djfordz/project_js_jquery) or [view it in the browser](http://djfordz.github.io/project_js_jquery)
* See Vincent's solution here: [source code](https://github.com/wingyu/etch_a_sketch) or [view it in browser](http://htmlpreview.github.io/?https://github.com/wingyu/etch_a_sketch/blob/master/index.html)
* See Lezou Dali's solution here: [source code](https://github.com/lezoudali/web-dev-playground/blob/master/doodle.html) or [view it in browser](http://htmlpreview.github.io/?https://github.com/lezoudali/web-dev-playground/blob/master/doodle.html)
* RomanADavis's solution here: [source code](https://github.com/RomanADavis/JQuery-Toy) or [view it in browser](http://htmlpreview.github.io/?https://github.com/RomanADavis/JQuery-Toy)
* Julie De Lorenzo's solution here: [source code](https://github.com/delorenzo/jquery-sketchpad) or [view it in browser](http://htmlpreview.github.io/?https://github.com/delorenzo/jquery-sketchpad/blob/master/index.html)
* See Hunter Ducharme's solution here: [source code](https://github.com/hgducharme/odinProjects/tree/master/webDev101/javascriptSketchPad) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/hgducharme/odinProjects/blob/master/webDev101/javascriptSketchPad/sketch-pad.html)
* See Keith Doyle's solution here: [source code](https://github.com/keithdoyle9/drawing_grid) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/keithdoyle9/drawing_grid/blob/master/index.html)
* See Shouvik Roy's solution here: [source code](https://github.com/royshouvik/etch-a-sketch) or [view it in browser](http://htmlpreview.github.io/?https://github.com/royshouvik/etch-a-sketch/blob/master/index.html)
* See Keith Doyle's solution here: [source code](https://github.com/keithdoyle9/drawing_grid) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/keithdoyle9/drawing_grid/blob/master/index.html)
* See Andrej Dragojevic's solution here: [source code](https://github.com/antrix1/JQuery-Project) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/antrix1/JQuery-Project/blob/master/index.html)
* See Mike Over's solution here: [source code](hhttps://github.com/mikeover/jQuery-Etch-A-Sketch) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/mikeover/jQuery-Etch-A-Sketch/master/index.html)
* See John Quarles' solution here: [source code](https://github.com/johnwquarles/Sketchy-Etch) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/johnwquarles/Sketchy-Etch/blob/master/index.html)
* See Artur Janik's solution here: [source code](https://github.com/ArturJanik/odin-jquery-homework) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ArturJanik/odin-jquery-homework/blob/master/index.html)
* Check out Drew Price's [Heck-A-Sketch](http://drewprice.github.io/study/odin-project/heck-a-sketch/) and read the [source code here](https://github.com/drewprice/study/tree/master/odin-project/projects/heck-a-sketch).
* See Antonio Augusto's solution here: [source code](https://github.com/antoniosb/sketch_pad) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/antoniosb/sketch_pad/blob/master/index.html)
* See Chasmani's solution here: [source code](https://github.com/chasmani/Etch-A-Sketch) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/chasmani/Etch-A-Sketch/blob/master/index.html)
* See Lara Finnegan's solution here: [source code](https://github.com/lcf0285/Etch-A-Sketch) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/lcf0285/Etch-A-Sketch/blob/master/etchsketch.html)
* See Rik's solution here: [source code](https://github.com/frbz/sketchpad) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/frbz/sketchpad/blob/master/index.html)
* See TReiff's solution here: [source code](https://github.com/treiff/Odin-Project-Javascript-Jquery) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/treiff/Odin-Project-Javascript-Jquery/blob/master/sketchpad.html)
* See Vidul's solution here: [source code](https://github.com/viparthasarathy/javascript-jquery) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/viparthasarathy/javascript-jquery/blob/master/index.html)
* See Jatin's solution here: [source code](https://github.com/JatinBhatia/jquery_project/tree/master) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/JatinBhatia/jquery_project/blob/master/index.html)
* See Corien's solution here: [source code](https://github.com/benninkcorien/etcha) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/benninkcorien/etcha/blob/master/etch.html)
* See Vidul's solution here: [source code](https://github.com/viparthasarathy/javascript-jquery) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/viparthasarathy/javascript-jquery/blob/master/index.html)
* See Panagiotis Karatakis' solution here: [source code](https://github.com/BlackSpirit96/the-odin-project_solutions/tree/master/web-101/sketchpad)
* See Vidul's solution here: [source code](https://github.com/viparthasarathy/javascript-jquery) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/viparthasarathy/javascript-jquery/blob/master/index.html)
* See tkbyte's solution here: [source code](https://github.com/tkbyte/JnJTOP) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/tkbyte/JnJTOP/blob/master/index.html)
* See Andy Linteau's solution here: [source code](https://github.com/linteau/sketchPad) or [view it in the browser here](http://htmlpreview.github.io/?https://raw.githubusercontent.com/linteau/sketchPad/master/index.html)
* See Vidul's solution here: [source code](https://github.com/viparthasarathy/javascript-jquery) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/viparthasarathy/javascript-jquery/blob/master/index.html)
* See Alex's solution here: [source code](https://github.com/theloniusmonkey/EtchaSketch)
* See Eric Liu's solution here: [source code](https://github.com/Latiosu/etch-a-sketch) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/Latiosu/etch-a-sketch/blob/master/index.html)
* See Alex's solution here: [source code](https://github.com/theloniusmonkey/EtchaSketch) 
* See insomniacode's solution here: [source code](https://github.com/insomniacode/light-grid) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/insomniacode/light-grid/blob/master/lightgrid.html)
* See Chris Dziewa's solution here: [source code](https://github.com/chrisdziewa/etch-a-sketch) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/chrisdziewa/etch-a-sketch/blob/master/index.html)
* See Scott's solution here: [source code](https://github.com/scootcho/the_odin_project/tree/master/javascript/etch_a_sketch) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/scootcho/the_odin_project/blob/master/javascript/etch_a_sketch/index.html)
* See Steve Gardner's solution here: [source code](https://github.com/stevelikesmusic/etcha_sketch) or [view it in the browser](http://htmlpreview.github.io/?https://github.com/stevelikesmusic/etcha_sketch/blob/master/index.html)
* See Michael Robinson's solution here: [source code](https://github.com/ockytron/etch-a-sketch) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/ockytron/etch-a-sketch/blob/master/index.html)
* See ido lichtenstein's solution here: [source code](https://github.com/idolicht/scatch1) or [view it in the browser 
 here](https://github.com/idolicht/scatch1/blob/master/scatch.html) 
* See Alice Rhomieux's solution here: [source code](https://github.com/arhx/sketchpad) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/arhx/sketchpad/blob/master/index.html)
* See Matias Pan's solution here: [source code](https://github.com/kriox26/odin_project/sketchpad) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/kriox26/odin_project/blob/master/sketchpad/index.html)
* See Syed Aslam's solution here: [source code](https://github.com/saslam4/SketchPad) or [view it in the browser here](http://htmlpreview.github.io/?https://github.com/saslam4/SketchPad/blob/master/index.html) 
* See Asish Prabhakar's solution here: [source code](https://github.com/akottal/sketchpad/blob/master/index.html) or [view it in browser here](http://htmlpreview.github.io/?https://github.com/akottal/sketchpad/blob/master/index.html)
* See Eleanor Weigert's solution here: [souce code](https://github.com/mixophrygian/Etcha-sketch) or [view it in the browser here] (http://htmlpreview.github.io/?https://github.com/mixophrygian/Etcha-sketch/blob/master/index.html)
* See Brandon Eichler's solution here: [Source Code](https://github.com/vdubmastertech/etch-a-sketch) or [view it in the browser here](http://rawgit.com/vdubmastertech/etch-a-sketch/master/index.html)
* hiendinhngoc's solution: [source code](https://github.com/hiendinhngoc/TheOdinProject/tree/master/web101/jquery)or [view in the broser](http://htmlpreview.github.io/?https://github.com/hiendinhngoc/TheOdinProject/blob/master/web101/jquery/html_file.html)
* *Add the link to your solution above this line (do not remove this line)*
