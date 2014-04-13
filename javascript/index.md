# The Best Free Resources for Learning Javascript

## The Path Ahead

Javascript is the future of the web, so in this course we'll be diving deep into it to make sure you come out with a good understanding of how it works.  At this point, what you see below is an outline and a collection of resources which will become the full Javascript course once it's ready.  It's the path forward, just without all the exposition tying it together.  It should be more than helpful to you in its present form.

So how is this going to work? It starts with a deeper look at the basics, just like the [Ruby Programming course](/ruby-programming) did with Ruby.  You don't need to have completed the Ruby Programming course or [the Ruby on Rails course](/ruby-on-rails) to understand this stuff but we won't be focusing deeply on the really basic stuff so it'll move quickly.  You should, however, already have completed the [Web Development 101 course](/web-development-101), specifically the [Front End Section](/web-development-101#section-the-front-end) before starting this course.  

After we've finished going over the basics of Javascript and jQuery, we'll dive deeper into the actual language of Javascript so you can go beyond just playing around with your browser elements.  Again, we won't assume you've completed the Ruby course here but we will be drawing some comparisons to Ruby for those who have just to illustrate the differences between the two languages.

We'll port that newfound knowledge into working with some more complicated games in the browser using the new HTML5 Canvas element.  If you were playing games in the late 80's and 90's, you may get deja vu.

The sections following that *will* require you to have completed the Ruby on Rails course, because you'll be integrating your front ends built with HTML, CSS and Javascript with the back end of your applications built on Rails.  This is the part where it all comes together and you'll find yourself looking at real full stack web applications.  If you're allergic to Rails, you can substitute these back ends for a third-party Backend-as-a-Service (BaaS) providers like [Firebase](http://firebase.com) or [Apigee](http://apigee.com). 

We'll wrap up by diving into using Javascript (instead of Ruby) to run your server with Node.js and how to port most of your application logic to the front end by using front-end frameworks like Backbone.js, Angular.js and Ember.js.  

The last thing you'll do is a final project which integrates everything you've learned in all the courses of this curriculum.  This is the kind of project that you'll be telling employers all about and a great chance to prove that you're now, officially, a serious web developer.  

### This is Just an Outline!

Again, note that this isn't a full course and you're not meant to follow absolutely every link, since we haven't narrowed it all down yet. It's a suggested roadmap of content and the resources that will help you get there.  That said, it's still probably the best and most complete grouping of resources for learning Javascript that you'll find anywhere on the web, so it will be useful to you despite being incomplete.

Because of this, if you do find a resource that is particularly helpful or unhelpful, let us know! We'll be sure to weight it in the final course accordingly.  

Good luck!

******************************************************************************
# SECTION 1: The Basics and the Browser

You've already completed the [Web Development 101 course](/web-development-101/#section-the-front-end), right?  Good, because now we'll be moving at warp speed into new frontiers.  This section will cover a lot of ground and your brain may melt down a few times, but don't worry, that's just a flesh wound.  Patch 'er up and keep going!  When in doubt, build something.

This is also where things get really fun, since you get to immediately see everything you're building in the browser.  You'll create everything from games to browser widgets along the way.  By the end of this section, you'll know everything you need to build fun and interesting front-ends.  But, of course, it's really just the beginning.  The real trick is building *well* and, ultimately, integrating your front-ends with your back ends.  Gogogo!

## Basic Javascript
  
Javascript is here to stay and, if you want to be a full-stack developer, you're going to need to learn more than just simple looping and DOM manipulation with jQuery.  You will need to understand how Javascript actually works in the same way you did with Ruby in order to learn Rails.  It's quite easy to get by hacking together simple browser interactions using a bit of Javascript and a healthy dose of jQuery.  

Your mission, though, is to be able to do a lot more than just hack together simple pages -- you need to feel comfortable building out completely new functionality in Javascript and working within large and established frameworks and code bases.  That means digging deep into what makes the language tick and what patterns get used again and again in the real world.

You should already have completed the [Web Development 101 Javascript lesson](/web-development-101/javascript-basics), and this will really be a deeper coverage of each of those issues (much like Ruby Basics was for Ruby).

### Points to Ponder

* How do you include a Javascript file in your HTML file?
* How do you include Javascript directly in your HTML code?
* How can you write and run your Javascript code using programs like [jsfiddle](http://jsfiddle.net/)?
* How do you create a new object using the "Constructor" method?
* How do you create a new object using the "Literal" method?
* What does JS return if you try to access an object's attribute that doesn't exist?
* How do you add items to or remove items from an array?
* What is the difference between `=`, `==`, and `===`?
* Are these "truthy" or "falsy" in JS: `"0"`,`NaN`,`null`,`"words"`,`""`,`[]`, `undefined`,`{}`, 1, 0?
* How do you get the length of a string?
* How do you find a value within a string?
* How does a "switch" statement work?
* How can you use objects to accomplish the same task?
* How do you set up a `for` loop?  A `for...in` loop?
* How do you set up a `while` loop?  
* How do you break out of a loop or skip to the next iteration?
* What are "reserved words"?
* How do you concatenate two arrays together?
* How do you sort arrays?  Reverse them?
* How do you use the `#forEach` method to print each item in an array?
* How are Javascript objects similar to hashes in Ruby?
* How are functions declared (two ways)?
* What are "anonymous functions"?  How are they similar to blocks in Ruby?
* How can you pass a function arguments?
* What does a function return?
* What are "immediately invoked function expressions (IIFE)"?
* If a function has been saved to a variable `some_var`, what's the difference between how you would pass the function itself around instead of running it immediately when called? (hint: parentheses)
* How do you test what the Type of an object is? (e.g. string, number, function, undefined...)
* What is `this` set to in Javascript?  
* How is `this` similar to and different from Ruby's `self`?
* How to you make a variable in the global scope?  The local scope?
* Why are closures useful?
* How would you use a closure to "close" a value within a function?
* How does `#bind` make your life simpler when thinking about closures and scopes?

### Links

*Everything after Codecademy is supplemental*

* [The entire Codecademy Javascript track](http://www.codecademy.com/tracks/javascript) (you already did up to lesson 5).
* [Javascript is Super Sexy](http://javascriptissexy.com/javascript-is-super-sexy/) is a good post for getting fired up to learn Javascript.
* [Javascript 101 from learn.jquery.com](http://learn.jquery.com/javascript-101/) will fill in gaps in the Codecademy course.  The stuff on scopes and closures will be covered in the later section in more depth.

### Additional Resources

* [Javascript is Sexy](http://javascriptissexy.com/how-to-learn-javascript-properly/) is a blog that covers great technical depth on fundamental JS concepts.  We will use it often in the coming lessons.
* [Javascript and jQuery: The Missing Manual](http://mirror7.meh.or.id/Programming/JavaScript.and.jQuery.The.Missing.Manual.2nd.Edition.pdf) is a great book about JS.
* [Best Javascript Books](http://www.tripwiremagazine.com/2012/11/best-javascript-jquery-books.html)
* [Effective Javascript by David Herman](http://effectivejs.com/) is a concise but in-depth look at the concepts and patterns of Javascript.  It's got some great challenge problems as well.
* [JSNinja by John Resig](http://jsninja.com) covers advanced concepts aimed at the intermediate JS developer
* Stanford's iTunes U Javascript course ([link to find it here](https://itunes.apple.com/us/itunes-u/advanced-topics-in-web-development/id454017618?mt=10), you'll need iTunes to run it)
* [SuperheroJS, A great collection of advanced links](http://superherojs.com/)
* [Javascript-to-Ruby Syntax Comparison Cheat Sheet from AgentCooper](http://agentcooper.github.io/js-ruby-comparison/)
* ["How I Work: Yahoo!'s Doug Crockford On Javascript" by Jacob Cook via Smashing Magazine](http://coding.smashingmagazine.com/2012/04/27/yahoos-doug-crockford-on-javascript/) provides a soft high level look at some industry questions.

## Project: Javascript Basics
  
Drill-style bite-sized challenges, TBD.

* [Tutorials for Javascript and jQuery from Jumpstart Lab](http://tutorials.jumpstartlab.com/)

## jQuery Basics

You should already have completed the [Web Deveploment 101 jQuery lesson](/web-development-101/jquery-basics), and this will really be a deeper coverage of each of those issues (much like Ruby Basics was for Ruby).  jQuery, of course, provides a very easy-to-use model for manipulating the elements on your page.  It also contains lots of helper functions and special libraries for doing things like building widgets or even mobile apps.  You get to benefit from all the lazy programmers before you who build these tools to make their lives easier.  Enjoy!

### Points to Ponder

* What is a selector?
* What does the `$` symbol mean?
* Why is it often important to wait for the Document (DOM) to finish loading?
* How can you select a particular element on the page?
* How can you select only the `<li>` elements inside of `<div>` elements with class `test-div`?
* How are selectors actually pretty similar to the way CSS operates?
* What does a jQuery selector return?
* How can you manipulate the values (e.g. html, width, height...) of a selected element or elements?
* What does it mean that selected elements are "implicitly iterated over"? (Think if you used `$("div")` what would happen)
* How can you create new elements?
* How can you insert new elements into the DOM?
* How can you chain jQuery selectors?
* What happens to the elements you've already selected (e.g. with `$("li")`) if another qualifying element (e.g. a `<li>`gets added to the DOM later?
* What does "traversing the DOM" mean?
* How can you add CSS to a selected element?
* How do you add or remove data attributes from an element?
* What new iterators (including some familiar Ruby ones) does jQuery give you?
* How would you add the class `some-class` to every `<li>` on the page?
* How would you use `#map` to return an array listing the contents of a particular list?
* How is jQuery's `#map` almost identical to Ruby's?
* Where can you look up any selectors you need?

### Links

* Read through [jQuery Fundamentals from jqfundamentals.com](http://jqfundamentals.com)
* Browse [Learning jQuery from jquery.com](http://learn.jquery.com/)(see the "Chapters" below) to fill in any gaps you have and provide alternate explanations for things you're not quite sure on.

### Additional Resources 

* [jQuery docs](http://api.jquery.com) will be your savior again and again.  You'll probably find them via Google most of the time, but get used to the format they present information in because you'll be seeing a lot of it.
* [jQuery Reference Guide from Oscar Otero](http://oscarotero.com/jquery/)
* Watch people code cool stuff with [The Code Player](http://thecodeplayer.com/)
* [Working with the core of jQuery from learn.jquery.com](http://learn.jquery.com/using-jquery-core/)
* [jQuery FAQ from learn.jquery.com](http://learn.jquery.com/using-jquery-core/faq/)

## Project: Messing with the DOM

Generate a full page using just Javascript and jQuery (so your HTML should just be `<html>` and `<body>` tags to begin with).  Once you've actually added some elements to the page, work from the browser's developer tools Javascript console to play with grabbing and changing them dynamically.  

Next, make it a 1-page site which can actually display either page A or page B depending which tab the user selects across the top.  [Look at #7 on this hongkiat post](http://www.hongkiat.com/blog/50-nice-clean-css-tab-based-navigation-scripts/) for visual inspiration.  Keep it simple -- when you click the next tab, your Javascript should automatically replace version A with version B in the content area (no page refresh required).

### Additional Resources

* [How Browsers Work from HTML5Rocks](http://www.html5rocks.com/en/tutorials/internals/howbrowserswork/)

## Working with Events and Effects

Events are at the heart of Javascript -- they are how you turn user interaction with your website into responsive actions.  The key to working with events is just building a model in your head for how the browser "listens" for events by default and how you can use that to your advantage.

Effects are like window-dressing for your user experience.  They represent the neat transitions (like fades or slides) that you can easily apply to elements using jQuery.

### Points to Ponder

* What are Events?
* How do you bind an event to an element?
* How do events "bubble" through the DOM?
* How do you stop the default thing an event would do?
* How do you set up an event so it will also apply to elements created after you created the event listener? (hint: delegate)
* How do you unbind events from an element?
* How would you listen for a keyboard key being pressed?
* How do you make an element fade in or out?
* How do you change the amount of time it takes for an element to fade in or out?
* What happens if you trigger a whole bunch of effects on the same element at the same time (e.g. 12 slide-outs)?

### Links

* [An Introduction to DOM Events](http://coding.smashingmagazine.com/2013/11/12/an-introduction-to-dom-events/)
* [Events from learn.jquery.com](http://learn.jquery.com/events/)
* [Effects from learn.jquery.com](http://learn.jquery.com/effects/)

### Additional Resources

* [jQuery Fundamentals from jqfundamentals.com](http://jqfundamentals.com)
* [A Look at using Javascript Events without jQuery from Smashing Magazine](http://coding.smashingmagazine.com/2012/08/17/javascript-events-responding-user/)

## Project: jQuery and the DOM

Let's build a game that shuffles the DOM all over the place and listens for events -- [Snake!](http://en.wikipedia.org/wiki/Snake_(video_game))  Remember that grid you created in the [Web Dev 101 jQuery project](/web-development-101/javascript-and-jquery)...?  Turn it into a simple Snake game with one player who can control the direction of the snake by typing one of four keys.  You can use timeouts to simulate a game loop.

Not a Snake fan?  Try building [Minesweeper](http://en.wikipedia.org/wiki/Minesweeper_(video_game)) instead (there are many variations -- just use an 8x8 grid of squares with 10 mines).  It isn't quite as realtime but requires you to think logically about how the Minesweeper game functions.

### Additional Resources

* [Play an example Minesweeper game like the old Windows one here](http://www.chezpoor.com/minesweeper/minesweeper.html)
* 

## Building Widgets

Working with jQuery is a whole lot of fun... here's why!  It basically drives all the nifty tooltips, modals, lightboxes, sliders, and other widgets you see on a webpage.  Just about everything you've ever seen on the web can be done with a combination of the Javascript and jQuery you now know.  Let's take a look at some of them in greater depth.

We covered a [section on design in the HTML/CSS Course](/html5-and-css3) which may be useful to check back on if it's been awhile.  Lots of these widgets and effects are best used judiciously -- it's okay to go overboard while you're testing things out but your user doesn't want to have to wait for a whole bunch of fancy-looking stuff to happen on the page so don't go crazy in a production setting.

### Points to Ponder

* What is jQuery UI and why is it particularly useful for you?
* How do you include jQuery UI in your project?
* How do you use jQuery UI?
* Where are the docs for jQuery UI?

* [jQuery UI from learn.jquery.com](http://learn.jquery.com/jquery-ui/)
* [jQuery UI demos let you see all of the effects in action](http://jqueryui.com/demos/) and include the source code.  Think of what you can build!
* [Check out this list of 50 jQuery plugins from tutorialzine](http://tutorialzine.com/2013/04/50-amazing-jquery-plugins/) for inspiration for what you can build (or to just use their plugins for yourself).

### Additional Resources

* [jQuery for Designers from Web Designer Wall](http://www.webdesignerwall.com/demo/jquery/)
* [(2009) A list of jQuery widgets and tutorials that can still make you drool from Smashing Magazine](http://coding.smashingmagazine.com/2009/01/15/45-new-jquery-techniques-for-a-good-user-experience/) (thought some of them use AJAX, which we cover later, and others are a bit dated).
* [jQuery for Designers](http://jqueryfordesigners.com/)

## Project: Widgets

Build a simple website that contains an image carousel / slider like the one seen at [jssor.com](http://www.jssor.com/) (but don't use theirs exactly).  It should contain arrows on each side to advance the image forward or backwards.  It should automatically move forward every 5 seconds.  It should contain the little navigation circles at the bottom that indicate which slide you are on (and they should be clickable to advance to that particular slide).  

Don't spend too much time worrying about getting your images to display at the correct size -- it's more important to get the slider sliding.
  
Advanced additions:  When you hover on the "next" or "previous" arrows, it should actually pop up a little tiny picture preview of the next slide's picture.  Make the slider continuous -- when it gets to the last slide, it should keep going forward to the first slide (without jumping all the way back to it... it should look like the "first" slide is just another "next" slide in the order).  Same is true if you go backwards past the first slide -- it should seamlessly transition to the last slide and back through the order.

*This is a nifty functionality to have on your personal website!*


******************************************************************************
# SECTION 2: Deeper into Javascript

You can do a lot with just basic JS and jQuery and a hacker mindset, as you saw in the last lesson on widgets.  But this section will take you deeper into how Javascript is actually doing things and will give you the tools to produce more advanced functionality for your sites.  The Snake game and the last project on the jQuery image slider probably tested your understanding of how Javascript works and showed you that there's still a lot to understand.

## Javascript Objects and "Classes" and Prototypes

Javascript doesn't really have "classes", per se, like Ruby -- instead they use "prototypes" to DRY up code.  You'll also find Objects used a whole lot.  They're basically containers that can contain anything from variables to functions (or both!).  You'll find them used in standard ways (for logically grouping variables) or ways which may be new to you (to group functions within a particular namespace).  

### Points to Ponder

* How are JS objects similar to Ruby objects?
* Can JS functions be defined inside of objects?
* What is a `ConstructorFunction`?
* What is a prototype?
* How do prototypes allow you to inherit and DRY up code?
* What happens if you take the prototype of the prototype of the prototype etc. of an object?

### Links

* [Understanding Objects in JS from JSIS](http://javascriptissexy.com/javascript-objects-in-detail/)
* [OOP in Javascript from JSIS](http://javascriptissexy.com/oop-in-javascript-what-you-need-to-know/)
* [Javascript Prototypes from JSIS](http://javascriptissexy.com/javascript-prototype-in-plain-detailed-language/)

### Additional Resources

* [Prototypes in Javascript from MSDN](http://msdn.microsoft.com/en-us/magazine/ff852808.aspx)
* [Seven Things I Wish I Knew Much Earlier in My Career (about Javascript) from Smashing Magazine](http://coding.smashingmagazine.com/2010/04/20/seven-javascript-things-i-wish-i-knew-much-earlier-in-my-career/)

## Javascript Scopes and Closures

With all these functions going around, we've got to keep track of scope!  Which variables got set where?  Who can access what? What is this mysterious `this` variable which seems to embody everything strange and complicated-seeming about Javascript scope? 

All this scoping (and using closures) makes a lot of sense when you remember that functions in Javascript can get called at different times and from different places in the code, especially if they are related to events (as callbacks, which you've seen before already and are covered in the next lesson).

### Points to Ponder

* What is `this` equal to? (not a simple question...)
* How do you `bind` variables to a scope?
* Why would you define a `that` variable?
* Why is id naughty to modify or reference variables from outside your scope?
* Why aren't private variables actually private?
* Functions should always return the same thing... or..?
* How does the way you call a function (e.g. function style, method style...) affect its scope (and `this`)?

### Links

* [What you Need To Know About Javascript Scope from Smashing Magazine](http://coding.smashingmagazine.com/2009/08/01/what-you-need-to-know-about-javascript-scope/)
* [Javascript Closures from learn.jquery.com](http://learn.jquery.com/javascript-101/closures/)
* [SO on "How do Javascript Closures Work?"](http://stackoverflow.com/questions/111102/how-do-javascript-closures-work)
* [Understanding Javascript's `this` keyword from JSIS](http://javascriptissexy.com/understand-javascripts-this-with-clarity-and-master-it/)
* [Javascript's `apply` `call` and `bind` methods](http://javascriptissexy.com/javascript-apply-call-and-bind-methods-are-essential-for-javascript-professionals/)
* [Understanding Javascript Function.Prototype.Bind from Smashing Magazine](http://coding.smashingmagazine.com/2014/01/23/understanding-javascript-function-prototype-bind/) will talk about binding in greater depth.  It may be one you need to come back to a bit later.

### Additional Resources

* [Understanding JS Closures Completely from JSIS](http://javascriptissexy.com/understand-javascript-closures-with-ease/)
* [Understanding JS Variable Scope and Hoisting from JSIS](http://javascriptissexy.com/javascript-variable-scope-and-hoisting-explained/)


## Project: Javascript Scopes and Closures

Redo the [Ruby OOP Projects](/ruby-programming/oop), though now make them run in the browser.  You can't use a run loop anymore, though, so you'll have to rely on events!


## Comparing Javascript and Ruby: Going Functional

A very brief look at the similarities and differences between Ruby and Javascript.  Basically, Javascript uses functions eeeeeeverywhere and it has to wait a lot for things to happen.  This will obviously be less helpful for you if you haven't been through the Ruby lessons, but it may be interesting to compare the two regardless so you get an idea of common similarities between languages.

### Points to Ponder

* How are Ruby blocks are like JS anonymous functions?
* How can JS functions be saved to variables (like Ruby Methods) and passed around?
* Where would Ruby's single-threaded nature really hurt it in the browser?
* Think event-driven!
* How are JS objects like Ruby objects?
* How is `this` like `self` in Ruby?  How is it different?

### Links

* [Javascript for Ruby Programmers Video](https://www.youtube.com/watch?v=wWIGEM4E9iw&list=PLxNY6twFc_xCxdSPLlxUS4C0VO3sni2DA)
* [Javascript-to-Ruby Syntax Comparison Cheat Sheet from AgentCooper](http://agentcooper.github.io/js-ruby-comparison/)
* [Ruby vs Javascript Functions, Procs, Blocks, and Lambdas by Skilldrick](http://skilldrick.co.uk/2011/01/ruby-vs-javascript-functions-procs-blocks-and-lambdas/)

## Deep Dive into Functions

We keep coming back to how Javascript loves functions.  Let's dig a little deeper.  One pattern which you'll keep bumping into again and again and again is the "module pattern", which lets you u

### Points to Ponder

* How do you call a function "method-style"?
* How do you call a function "function-style"?
* What do `#apply` and `#call` do?
* When should you use a constructor?
* When are arguments for a function required?
* How can a function take another function as an argument?
* How can a function return another function?  How do you then run that returned function?
* How do you indicate an argument isn't required?
* How might you access overflowing (extra) arguments?
* What are surrogates and why are they used?
* What does it mean to "namespace" your code?
* How do you namespace your code using modules? 

### Links

* [Namespacing and using Modules in JS](http://www.codethinked.com/preparing-yourself-for-modern-javascript-development)
* [Another post on module patterns](http://www.adequatelygood.com/2010/3/JavaScript-Module-Pattern-In-Depth)
* [The Design Of Code: Organizing Javascript from Alistapart](http://alistapart.com/article/the-design-of-code-organizing-javascript)

### Additional Resources

* [Common Javascript "Gotchas" from jbotus.com](http://www.jblotus.com/2013/01/13/common-javascript-gotchas/) is useful review of some of the things we've already covered.

## Project: Not-So-Basic Javscript
  
Build an even more awesome browser game (ideally one that requires lots of passing functions around).

**************************************************************************
# SECTION 3: Advanced Browser Work

There's a whole lot more to using Javascript in the browser than just manipulating simple DOM elements with jQuery.  If you want to grab data from external sites or your own back end, submit forms, or handle more complicated games, you'll need to dig deeper into how Javascript handles callbacks.  

We'll also cover how to build games using HTML5's `<canvas>` element, which let you use Javascript logic to draw shapes.  Once you can do that, you're only limited by your creativity (and maybe your geometry skills if you're building complex ballistics games).

## Taking Javascript to the Browser

A *very* brief look back into the idea that browser loading matters (maybe).

### Points to Ponder

* Why is it important which order you load scripts?
* What does it mean if something "blocks the browser"?
* How can you use Asynchronous loading to reduce user wait times?

### Links

* [SO post on non-blocking Javascript in modern browsers](http://stackoverflow.com/questions/8197072/non-blocking-javascript-and-css-in-modern-browsers-is-it-still-needed)

### Additional Resources

* [Advanced Javascript Loading in the Browser from HTML5Rocks](http://www.html5rocks.com/en/tutorials/speed/script-loading/) is deeper than you need to go now, but a useful reference.

## Living in an Event-Driven World

We've already looked at scopes and functions quite a bit and you've had a chance to play with callbacks already, but here we'll dig deeper.  Events are everywhere in Javascript, and you almost always want to do something when the event has finished running (or if there's been an error).  That's your callback!

### Points to Ponder

* What is a callback?
* What is the scope inside a callback?
* What is `this` in a callback?
* When is a callback called?
* What is `#setTimeout` useful for?
* Why are the return values of event listeners much less important than the callback(s) inside?

### Links
  
* [Understanding Callback Functions in Javascript by Recurial](http://recurial.com/programming/understanding-callback-functions-in-javascript/)
* [Understanding Callback Functions in JS from JSIS](http://javascriptissexy.com/understand-javascript-callback-functions-and-use-them/)
* [Callbacks, Listeners and Promises](http://sporto.github.com/blog/2012/12/09/callbacks-listeners-promises/)

### Additional Resources

* [Using Deferred Functions and Promises (Video)](http://www.youtube.com/watch?v=juRtEEsHI9E)

## Organizing Your Code

Because organization will save you pain:

* [Organizing your Code from learn.jquery.com](http://learn.jquery.com/code-organization/)

## Project: Callback Madness

Build a crazy callback application.  Put Snake here?

## Using Canvas to Draw and More

Canvas is a great tool in HTML5 -- it basically provides a panel in which you can use Javascript and math to draw pretty much anything.  It's useful for everything from gaming to image optimization.  In our case, we'll focus on games because it gives you a chance to flex your pure Javascript muscles creatively.  For the first time so far, you'll get to build games that operate dynamically in 2-D space (not confined to a grid).  Use that power only for good...

### Points to Ponder

* What is Canvas?
* How do you set up a Canvas element?
* How do you draw a 5 pixel black square with a red outline?
* How can you use refreshes to animate things?
* How would you make a ball that bounces off walls?
* How would you make two balls that bounce off walls or each other?
* What happens if you refresh too many calculations or too rapidly?

### Links

*[Canvas Deep Dive book](http://joshondesign.com/p/books/canvasdeepdive/toc.html) is the best explanation I've seen.  Do chapters 1-6.

### Additional Resources

* [Canvas Deep Dive book](http://joshondesign.com/p/books/canvasdeepdive/toc.html) chapters 7-14 get deep into how you can use Canvas as a sweet graphics and gaming tool.  Out of scope for this course, but could be fun if that's your thing.
* [No Tears Guide to HTML5 Games from html5rocks.com](http://www.html5rocks.com/en/tutorials/canvas/notearsgame/)
* [Canvas game tutorial posts from Michal Budzynski](http://michalbe.blogspot.com/2010/09/simple-game-with-html5-canvas-part-1.html)
* [TheCodePlayer's Snake game with HTML5 canvas and jQuery](http://thecodeplayer.com/walkthrough/html5-game-tutorial-make-a-snake-game-using-html5-canvas-jquery)
* [Game Development Using Javascript](http://www.codeproject.com/Articles/563425/Game-Development-Using-JavaScript)

## Project: Browser Arcade Games with Canvas
  
Bring back one of the classics -- [Missile Command](http://en.wikipedia.org/wiki/Missile_Command).


**************************************************************************
# SECTION 4: Linking the Browser to your Back End

A real web app needs a back end in order to persist its data and do sensitive operations.  That's not to say you can't outsource the functionality to a Backend-as-a-Service (BaaS) company like [Firebase](https://www.firebase.com/) or [Apigee](http://apigee.com/), but you've already got the skills yourself! You can link to the back ends you created in the course on Ruby on Rails.  

In order to do this, you'll need to learn more about using forms. That will take us into AJAX, which allows you to submit forms without needing to refresh the page.  You'll end up relying on it more and more as you optimize your front ends for performance.

It'll also be helpful to understand how to integrate an external API with your front-end page, like adding a small Google Map to show where your business is located, so we'll cover that as well.

## Front End Forms

Forms are the user's window into your back end.  You've learned a whole lot about them in previous lessons, but here we'll focus on using jQuery to interact with your forms and in the next lesson we'll look at actually submitting them asynchronously with AJAX.  

You've already got all the tools you need to build the validations, you probably just haven't used them in this way.  This lesson is more focused on *what* you should build than *how* to build it, though we'll introduce you to some helpful tutorials and plugins along the way.

### Points to Ponder

* How do you select a particular form input with jQuery?
* How do you select the currently active (focused) form input?
* How do you activate the next form input?
* How do you determine whether a checkbox or radio button is checked using jQuery?
* How do you run validations on the user's form input in real time?
* Why is front-end form validation not sufficient to protect against malicious users?
* How do you disable a form element?
* How do you cause the erroneous form input to be highlighted and red?
* How do you add an error message directly above the input field that's wrong?
* What is the jQuery Validate plugin and how do you include it in your projec?

### Links

* [Smashing Magazine on Web Form Validation Best Practices and Tutorials](http://www.smashingmagazine.com/2009/07/07/web-form-validation-best-practices-and-tutorials/) contains just about everything you need to know here.
* [Documentation for the jQuery Validation Plugin](http://jqueryvalidation.org/documentation/) will get you up and running with it, saving lots of time and effort.
* [An approach to form validation using jQuery from Scratch](http://www.techliance.com/blog/form-validation-with-jquery-from-scratch/)

### Additional Resources

* [Smashing Magazine on an approach to Form Field Validation Errors](http://uxdesign.smashingmagazine.com/2012/06/27/form-field-validation-errors-only-approach/)
* [SO Answer on How to Improve a Form Validation Script](http://stackoverflow.com/questions/15060292/a-simple-jquery-form-validation-script) (see answers)
* [10 Useful jQuery Form Validation Techniques from speckyboy](http://speckyboy.com/2009/12/17/10-useful-jquery-form-validation-techniques-and-tutorials-2/) (some broken links)
* [An Extensive Guide to Web Form Usability from Smashing Magazine](http://uxdesign.smashingmagazine.com/2011/11/08/extensive-guide-web-form-usability/)

## Project: Front End Forms

Build a browser form that collects name and address information and uses live inline validation to inform the user whether a field is properly filled in or not.  That means highlighting a field red and providing a helpful error message until it has been filled in properly.  It doesn't need to actually submit, but you should give an error message if the button is pushed with any active errors or unfilled required fields.  If all is well and the form is "submitted", give the user a high five.  

Do all this using jQuery's Validate plugin but then try it without any plugins to challenge yourself.  See some of the readings for examples of setting up your own validators.

## Using AJAX to Talk to Your Server

Callbacks are very useful for things like browser events but they're essential when using AJAX (Asynchronous JSON and XML), which sends data (or a request for data) to your server backend without blocking the browser from doing other activities while you wait for a response.  You pass the AJAX function a callback and, when the server response is received, you will activate the callback with whatever has been returned and continue on your way.  

The best part of AJAX is that it doesn't actually require a full page refresh like clicking a hyperlink or a normal form submission would.  The response you get back from the server is simply a JSON data package and not a full HTML document, so you will be able to process it inside your existing page.  That gives you all kinds of power to build apps that only require a single page (which changes content based on where you "navigate" and what data gets returned) and to hide slow network operations from your user by loading the page in pieces.

### Points to Ponder

* What is AJAX?
* What is JSON?
* What does a JSON response actually look like?
* How do you use the basic Javascript AJAX method?
* How do you use jQuery's AJAX method(s)?
* What are the AJAX "convenience" methods good for (e.g. `$.post`)?
* How do you format data to be sent to the server?
* What is the `#serialize` method?
* How do you process data that is sent back from the server?
* How do you handle errors generated during the process?
* How can you use events to "listen" for AJAX operations, for instance if you wanted to create a "loading..." notification that disappears when you're done loading?

### Links

* [AJAX from learn.jquery.com](http://learn.jquery.com/ajax)
* [jQuery's AJAX methods](http://learn.jquery.com/ajax/jquery-ajax-methods/)
* [Submitting a Form as an AJAX Request using jQuery by Matt Lunn](http://www.mattlunn.me.uk/blog/2012/10/submitting-a-form-as-an-ajax-request-using-jquery/)
* [Some Things You Should Know About AJAX (2010) from Smashing Magazine](http://coding.smashingmagazine.com/2010/02/10/some-things-you-should-know-about-ajax/) goes into both the code and the principles of using AJAX.
* [jQuery's Global AJAX Event Handlers docs](http://api.jquery.com/category/ajax/global-ajax-event-handlers/)

### Additional Resources

* [AJAX Loading Icons](http://www.ajaxload.info/) (for fun)
* [HTML5's FormData Object by Matt Lunn](http://www.mattlunn.me.uk/blog/2012/05/sending-formdata-with-jquery-ajax/)
* [Easier AJAX With the HTML5 FormData Interface by Craig Buckler](http://www.sitepoint.com/easier-ajax-html5-formdata-interface/)

## Project: AJAX and Forms
  
Work with [an existing free and open API called OMDB](http://www.omdbapi.com/)) to implement a form submission (with some validations too!) for a new movie.  

Create a "loading..." status while AJAX is processing.

Finally, create an infinite scroll that keeps loading movies using AJAX as you scroll down.  

## Working with Javascript APIs

There are a whole lot of external APIs that you can access using simple Javascript, adding rich content or interesting functionality to your webpages. A few examples include embedding Google Maps in your page or downloading Flickr images.  You'll usually need to register your application with the API provider (and get an API key to identify yourself with when making a request) but most access is totally free.

### Links

* [Learn to use APIs with Javascript from Codecademy](http://www.codecademy.com/tracks/youtube) to access YouTube.
* [Google Maps API Tutorial from W3 Schools](http://www.w3schools.com/googleAPI/default.asp)

### Additional Resources

* [Codecademy's API Track](http://www.codecademy.com/tracks/apis)
* [Using Apigee as a back end for your website](http://www.codecademy.com/tracks/apigee)
* [Embed Google Maps in your site using this jQuery plugin called GoMap](http://www.pittss.lv/jquery/gomap/).  The site has lots of links to example code for implementing different functionality.
* [Designing Better Javascript APIs from Smashing Magazine](http://coding.smashingmagazine.com/2012/10/09/designing-javascript-apis-usability/) is great if you're considering creating your own Javascript APIs and Tools, or if you just want to see life from the perspective of the creators of great tools like jQuery.

## Project: Putting Google Maps Onto Your Site

Create a site that has a Google map on it and forms where the user can place markers based on latitude and longitude entered to the form.  Play around with the different options the Maps API gives you -- you can customize almost everything on a map, from the way the thumbtacks drop down to the colors of each element.

### Additional Resources

* [Entering the Wonderful World of Geo Location from Smashing Magazine](http://coding.smashingmagazine.com/2010/03/08/entering-the-wonderful-world-of-geo-location/)

## Working with a Rails Back End and API

It's finally time to tie all this juicy Javascript back to what you learned in Rails.  In preparation, reread the [Rails lesson on building an API](/ruby-on-rails/apis-and-building-your-own) to refresh how to set up a Rails backend that can handle JSON requests.

At this point, you've got all the tools you need, so it's time to practice allowing your front end Javascript to talk to your Rails backend using AJAX.  We'll cover some best practices for how to pass data from one to another, but otherwise it's just putting together those final pieces of the web development puzzle.

### Points to Ponder

* Refresher -- how do you set up a basic Rails app?
* Refresher -- how to you load custom Javascript in a given Rails view page?
* How does "unobtrusive Javascript" work?
* How can you pass data from your Rails app to your Javascript?
* Why would you want to use AJAX to load large batches of data 

### Links

* [Check out "Using Javascript in your Rails App" from Daniel Kehoe](http://railsapps.github.io/rails-javascript-include-external.html).  It is long and covers a lot of ground, but it's got great content.  Some of the stuff on dependencies can be skimmed, but pay attention to the `content_for` stuff at the bottom.
* [Refresh yourself on Rails AJAX from RailsGuides](http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html) (just skim the top few sections)
*[Bootstrapping JSON data into a Rails View](http://jfire.io/blog/2012/04/30/how-to-securely-bootstrap-json-in-a-rails-view)

### Additional Resources

* [Grabbing your Rails form CSRF token with Javascript so Rails doesn't yell at you with "Warning, can't verify CSRF token authenticity", via SO](http://stackoverflow.com/questions/7203304/warning-cant-verify-csrf-token-authenticity-rails)
* [... and another SO post on the CSRF token](http://stackoverflow.com/questions/8503447/rails-how-to-add-csrf-protection-to-forms-created-in-javascript)

## Project: Where's Waldo (a Photo Tagging App)

Build a [Where's Waldo?](http://en.wikipedia.org/wiki/Where's_Wally%3F) game in the browser with a Rails backend.  You'll need to load up a game board image and then allow your user to click inside it.  When the user clicks, a dropdown menu should pop up which lets you select which character you've just identified.  

Once you select the character, use AJAX to validate that the selected location is within an acceptable distance of the "correct" location for that picture (which should be saved in your database by default).  If so, provide a "congratulations, you've found XYZ" message.  If not, highlight the selection box red and provide a useful error message.  Once the user has found all characters, give her a high five.

## Additional Helpful Stuff

This is a catch-all section for helpful resources like libraries, regular expressions, page loading, Local Storage in the browser and security.

### Points to Ponder

* What is the Underscore library and how does it make Javascript much more Ruby-like?
* How can you make sure not to make repeated and excessive jQuery calls to the DOM (e.g. constantly using `$("body")` or the like)? Hint: Use variables.
* How do you search through a text string with a Regular Expression in Javascript?
* How do you make your Javascript load faster to improve page load times?
* What basic security principles do you need to know?
* What is "LocalStorage" on your browser?
* How do you access this awesome feature?
* What are the limitations of using LocalStorage?

### Links

* [Underscore.js Documentation](http://underscorejs.org)
* ["Thinking Inside the Box with Vanilla Javascript" from Smashing Magazine](http://coding.smashingmagazine.com/2013/10/06/inside-the-box-with-vanilla-javascript/) provides a few helpful JS functions
* [Working with Regular Expressions in Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions)
* [Speeding up Page Load Times in Rails by Jarmo Pertman](http://itreallymatters.net/post/45763483826/speeding-up-page-load-time-in-rails#.UvGCG0JdWUA)
* [Speed up your Rails App page load by Bibliographic Wilderness](http://bibwild.wordpress.com/2012/11/21/speed-up-your-rails-apps-page-load/) talks about async loading (toward the end).
* [(Video) Principles of Security by Douglas Crockford](http://www.youtube.com/watch?v=zKuFu19LgZA)
* [Local Storage and How to Use It On Websites from Smashing Magazine](http://coding.smashingmagazine.com/2010/10/11/local-storage-and-how-to-use-it/)

### Additional Resources

* [Test your regular expressions in JS with RegexPal](http://regexpal.com/)
* [Why Doesn't Rails Include Javascripts at the Bottom of the Page by Default from SO](http://stackoverflow.com/questions/7584717/why-rails-doesnt-include-the-javascript-files-at-the-bottom-of-the-html-page-by)

### Style Guides

* [AirBnB's JS Style Guide](https://github.com/airbnb/javascript) is very readable and helpful
* [Google's JS Style Guide](http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml)
* [Github's JS Style Guide](https://github.com/styleguide/javascript)
* [Contributing to jQuery Style Guide](http://contribute.jquery.org/style-guide/js/)

******************************************************************************
# SECTION 5: Server Side Javascript and Single Page Apps

This is the section where we go beyond using Javascript as a facilitator of great looking and great running pages and into using Javascript as the main tool for creating those pages in the first place.  We'll talk about using Javascript to run your server (instead of Ruby) with Node.js and about the many Javascript MV* Frameworks out there which let you build a full website as a single page run by Javascript for blazing fast user experiences.

Much of the content in this section can be considered "supplemental" to the core needs of getting hired, but also incredibly interesting and helpful if you *do* know it.

## Node.js and Server-Side Javascript

Understanding server-side Javascript is not a requirement for getting hired as a full stack junior developer because your Ruby and Rails skills are more than up to the task and in demand.  If you're short on time, consider this section supplemental.  That said, it's really interesting and useful stuff because Node gives you some advantages that Rails doesn't.  It's worth your time to at least browse through the resources and get an idea of what Node is and what the fuss is about.

If you really love Javascript more than Ruby, you may be about to find your new home.  It's still quite rough around the edges, but Node has a lot going for it.  

As a bonus, your Heroku know-how transfers to Node because they accept Node apps as well.  Cue success kid meme!

### Points to Ponder

* What is Node.js?
* How do you download Node?
* How do you get a Node server running?
* How does Node manage its packages similarly to Ruby?
* What are advantages of Node vs Rails? 
* What are the downsides of Node vs Rails?

### Links

* [Pick up the basics of Node in this quick tutorial from NetTuts](http://net.tutsplus.com/tutorials/javascript-ajax/node-js-for-beginners/)
* [Why I Chose Node.js Over Ruby on Rails by Sagi Isha](https://medium.com/what-i-learned-building/905b0d7d15c3)
* [Learn Node.js Completely from JSIS](http://javascriptissexy.com/learn-node-js-completely-and-with-confidence/)

### Additional Resources

* [The absolute beginner's guide to Node.js](http://blog.modulus.io/absolute-beginners-guide-to-nodejs)
* ["Useful Node.js Tools, Tutorials and Resources" by Luca Degasperi via Smashing Magazine](http://coding.smashingmagazine.com/2011/09/16/useful-node-js-tools-tutorials-and-resources/)
* [Node.js vs Ruby on Rails by Will Nathan](http://willnathan.com/nodejs-vs-ruby-on-rails)
* [Learn Node.js from the command line](https://github.com/rvagg/learnyounode)
* [Node.js Explained](http://kunkle.org/nodejs-explained-pres/)
* [Getting out of Callback Hell in Node.js](http://strongloop.com/strongblog/node-js-callback-hell-promises-generators/)
* [Node for Rails Developers with Compound.js by Sagi Isha](https://medium.com/what-i-learned-building/e490fb9c0c73)
* [HowToNode.org has lots of more advanced articles and tips](http://howtonode.org/)

## Project: Node.js

[Fire up a Node server and try out some file I/O and a web server.](http://blog.modulus.io/absolute-beginners-guide-to-nodejs)

## Javascript Templating

Before we get into frameworks, it's useful to learn about templating tools.  Basically, these will let you set up a template (like a Rails layout/view) and insert basic dynamic elements (like loops) to it with minimal effort and without the need to build out a sophisticated back end to handle it.  You'll find that most templates feel a whole lot like ERB did in Rails views -- a way of passing snippets of dynamic code and variables into your HTML.

Some of the more common templating languages include [Mustache](http://mustache.github.io/) and [Handlebars](http://handlebarsjs.com/) (so named because they typically use curly braces {{to surround}} inserted code).

### Points to Ponder

* What is a client-side template?
* How is this similar to ERB you used in Rails?
* How do you include Mustache.js in your project?
* How do you use Mustache to display a group of `<div>`'s?

### Links

* [Smashing Magazine on Client Side Templating](http://coding.smashingmagazine.com/2012/12/05/client-side-templating/) starts from scratch and gives lots of examples
* [An overview of JS templates from Creative Bloq](http://www.creativebloq.com/web-design/templating-engines-9134396) gives more examples.
* [Introduction to Javascript Templating with Mustache](http://iviewsource.com/codingtutorials/introduction-to-javascript-templating-with-mustache-js/)
* [Learning about Handlebars Templating from JSIS](http://javascriptissexy.com/handlebars-js-tutorial-learn-everything-about-handlebars-js-javascript-templating/)

### Additional Resources

* [Why LinkedIn chose Dust.js for Templating](http://engineering.linkedin.com/frontend/client-side-templating-throwdown-mustache-handlebars-dustjs-and-more) (includes a breakdown of the other popular choices)

## Javascript MV* Frameworks Like Angular.js

Javascript frameworks take the ideas of templating, e.g. moving logic from your server to the client, to the next level.  With these frameworks, you can run your entire web application without ever reloading the page.  The frameworks are all different, but they typically combine templating tools with client-side models that use AJAX to stay current with your back end.

JS Frameworks can be blazing fast in terms of user experience (though they can take longer to load at first because there's a lot more going on than with a simple page).

You should be able to pick up a Javascript framework in a relatively short period of time since you'll be able to build a good mental model for how it works based on your understanding of Rails, but it's not technically required knowledge (yet) for being hired.  That said, being able to work comfortably with Backbone or Angular can make you a much more attractive candidate.

In this lesson, we've laid out resources for learning several different frameworks.  Backbone.js is typically the best for beginners because it's got the best documentation and has been around longest (so more support).  Angular is another well documented framework that's coming on strong.  As with the Ruby/Python Rails/Django conversations, what you should do is pick one and learn it well, and then you'll be able to pick up another much easier.

### Points to Ponder

* What is a Javascript framework good for?
* How do frameworks provide similar functionality to Rails' MVC architecture from the front end?
* How do models stay up do date with your database?
* How does clicking a link to another "page" in a single-page web app actually render a different "page" without making an HTTP request to the server?

### Links

* [A Journey through the Javascript MVC Jungle from Smashing Magazine](http://coding.smashingmagazine.com/2012/07/27/journey-through-the-javascript-mvc-jungle/) provides a good introduction to frameworks.  Don't get lost in the list of all the frameworks -- just understand the high level concepts of a framework and how you might want to make a decision about which one to choose.
* [An Introduction to Full Stack Javascript](http://coding.smashingmagazine.com/2013/11/21/introduction-to-full-stack-javascript/) will give you context for using Javascript all the way through the stack.
* [Seven Frameworks of JS from Steven Anderson](http://blog.stevensanderson.com/2012/08/01/rich-javascript-applications-the-seven-frameworks-throne-of-js-2012/)

#### Backbone.js

* [Learn Backbone Completely from JSIS](http://javascriptissexy.com/learn-backbone-js-completely/)
* [Backbone.js on Ruby on Rails screencasts and example apps](http://www.backbonerails.com/)
* [Backbone.js Tips and Patterns from Smashing Magazine](http://coding.smashingmagazine.com/2013/08/09/backbone-js-tips-patterns/)
* [Backbone.js tutorials](http://backbonetutorials.com/)
* [Building a Wine Cellar with Backbone.js](http://coenraets.org/blog/2011/12/backbone-js-wine-cellar-tutorial-part-1-getting-started/)

#### Angular.js

* [Angular Learning Checklist](http://www.thinkster.io/pick/GtaQ0oMGIl/a-better-way-to-learn-angularjs)
* [Angular.js video training resources](http://www.egghead.io)

#### Ember.js

* [In-Depth Introduction to Ember.js from Smashing Magazine](http://coding.smashingmagazine.com/2013/11/07/an-in-depth-introduction-to-ember-js/)

## Project: Backbone.js or Angular.js

[Do the beginner and intermediate tutorials here](http://backbonetutorials.com/) to learn Backbone and get a great overview of Javascript frameworks.

If you'd prefer to try Angular instead, first glance over the beginner tutorial from the link above to get a feel for how these frameworks operate, then [do this Angular.js tutorial which has you build a real web app](http://docs.angularjs.org/tutorial).


## Javascript Workflow Tools, Tech Stacks and Dependency Management

Very briefly, managing dependencies is something we've had to deal with many times in the past so far -- for example, you can't load jQuery UI before jQuery since it depends on jQuery being there first.  The same applies to packages in Node.  People have built tools to help you get it right.  

You've probably already got all kinds of kinks in your workflow so people have also designed tools to streamline the process.  They allow you to include all the preprocessors, packages, libraries etc. that you need with less manual labor.

You may need these things now, you may not.  At least learn what they are so you'll know where to dig deeper when the time comes.

### Points to Ponder

* What is a dependency?
* What is a build tool?
* Why would you use a package manager?
* What is Grunt?
* What is Yeoman?
* What is Bower?

### Links

* [Overwhelmed by Javascript Dependencies? from Startifact.com](http://blog.startifact.com/posts/overwhelmed-by-javascript-dependencies.html)
* [Grunt.js task runner](http://gruntjs.com/)
* ["Get Up and Running With Grunt" by Mike Cunsolo via Smashing Magazine](http://coding.smashingmagazine.com/2013/10/29/get-up-running-grunt/)
* [Yeoman builds on Grunt](http://yeoman.io/)
* [Bower is a front-end package manager](http://bower.io/)
* ["Can you help me understand the benefit of `require.js`?"](https://gist.github.com/desandro/4686136)
* ["How to manage client-side Javascript dependencies?" from SO](http://stackoverflow.com/questions/12893046/how-to-manage-client-side-javascript-dependencies)

### Additional Resources

* [SO on Javascript Dependency Management](http://stackoverflow.com/questions/3202606/javascript-dependency-management)

## Javascript Testing with Jasmine

We won't get deep into Javascript testing but, suffice it to say, it performs a similarly valuable function as RSpec did in Ruby and Rails.  Without testing, you have no idea when you've broken something important in your app or, as importantly, when exactly it actually stopped working.

### Points to Ponder

* Why should I test my Javascript?
* What tools are out there to test Javascript with?
* What is Jasmine?

### Links

* [Introduction to Javascript Unit Testing from Smashing Magazine](http://coding.smashingmagazine.com/2012/06/27/introduction-to-javascript-unit-testing/) guides you through building your own tests and using the QUnit framework.
* [Testing Javascript using the Jasmine Framework from  HTMLGoodies](http://www.htmlgoodies.com/beyond/javascript/testing-javascript-using-the-jasmine-framework.html) is a high level overview.
* [Testing your Javascript with Jasmine from TutsPlus](http://net.tutsplus.com/tutorials/javascript-ajax/testing-your-javascript-with-jasmine/) gets a bit more into things.
* [Writing Testable Javascript from Alistapart](http://alistapart.com/article/writing-testable-javascript) will help you use testing to make better code design decisions.
* [Jasmine Documentation on Github](https://github.com/pivotal/jasmine)
* [Test-first javascript for testing](http://testfirst.org)(go to the Javascript link on the left after reading about it)

### Additional Resources

* [Writing Testable Frontend JS -- Anti-patterns from Shane Tomlinson](https://shanetomlinson.com/2013/testing-javascript-frontend-part-1-anti-patterns-and-fixes/)
* [Writing Testable JS from Ben Cherry](http://www.adequatelygood.com/2010/7/Writing-Testable-JavaScript)
* [Make Tests Read like a Book from Wolfram Kriesing](http://uxebu.com/blog/2013/01/08/make-tests-read-like-a-book/)
* [(Video) Javascript Testing: The Holy Grail](http://www.youtube.com/watch?v=YdFQ29oK50M)

## Final Project

Copy your favorite website as well as you can.  Seriously -- Pinterest, Facebook, Twitter... Just make sure it's got lots of interesting functionality.  You'll be integrating your full array of Rails and Javascript skills into this one.  You've got all the tools you need to build a website just like the ones you use every day.  You can't copy every single feature and a lot of the user interface will be a bit clunkier, but you can get yourself 80% of the way there.  

Try testing the very high level Javascript and Rails functionality with Jasmine and RSpec respectively.

## Conclusion

This is the end! At this point you should have a deep and nuanced understanding of not just how Javascript works but how you can use it with all the other knowledge you've gained so far to build exceptional web applications. That means great information architectures, smooth-running Rails backends and delightfully useful front-ends.  

If you find something you don't know or aren't quite sure about, you should be a pro by now at Googling your way to an answer, looking at docs, and cruising through Stack Overflow posts.  You've got all the tools you need to be a developer.  And, really, the big secret is that you've been a web developer for a long time already.

So where do you go from here?  BUILD!  Build and build and build and build (see a theme in this curriculum yet?).  Use what you've learned to create great projects.  Get a job so someone else pays you to build.  But focus on creating interesting software and using that to drive your education.  

There's a whole world of additional things you can learn -- jQuery mobile to build mobile apps, D3 for data visualization, other full-stack frameworks or single-page MVC front-end frameworks... all that stuff is best learned when you've got something you want to build that requires "the perfect tool for the job."

And speaking of jobs, if you've made it this far then you've displayed the kind of capability and drive that employers are looking for.  The final step is to show that to the world and get them to pay you to keep learning.  Which just happens to be the subject of the next course...


## Additional Resources

* [jQuery Mobile from learn.jquery.com](http://learn.jquery.com/jquery-mobile/)
* [PAID training webcasts on pretty much anything](https://www.bitcast.io/)
* [Giant meta-list of screencasts by Avdi Grimm](http://devblog.avdi.org/2013/06/21/a-list-of-programming-screencast-series/)
* [appendTo's Javascript track (incomplete)](http://learn.appendto.com/lesson/javascript-101)
* [Front End Programming best practices from betterfrontend](http://betterfrontend.com/)
* [D3 and other visualization tool examples](http://tributary.io)
* [Tips for using AWS](http://wblinks.com/notes/aws-tips-i-wish-id-known-before-i-started/)
* [(Video) Development Workflow of 2013 by Paul Irish](http://www.youtube.com/watch?v=f7AU2Ozu8eo)
* [How To Keep Your Coding Workflow Organized from Smashing Magazine](http://coding.smashingmagazine.com/2011/01/19/cleaning-up-the-mess-how-to-keep-your-coding-workflow-organized/)
* ["My (Simple) Workflow To Design And Develop A Portfolio Website" by Adham Dannaway via Smashing Magazine](http://www.smashingmagazine.com/2013/06/25/workflow-design-develop-modern-portfolio-website/)
* ["Powerful Workflow Tips, Tools And Tricks For Web Designers" by Melanie Lang via Smashing Magazine](http://www.smashingmagazine.com/2013/10/02/powerful-workflow-tips-tools-and-tricks-for-web-designers/)
* [Functional Programming in Javascript from Eloquent Javascript](http://eloquentjavascript.net/chapter6.html)
* [Currying in Javascript from Kristina Brainwave via Medium](https://medium.com/p/ce6da2d324fe)



