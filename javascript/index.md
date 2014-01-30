# Javascript

## This section is collecting resources right now

## Path

You've already learned Ruby, so many comparisons will be made with that.  If you haven't, hopefully you will still gain from seeing the two languages compared.  We won't assume you know Ruby, but it will be used for comparisons.  Later in the course, though, the project work will require you to use your Rails backends

Reverse path??? Go to browser ASAP THEN work on fundies?  Probably best to do basic JS, then basic canvas, then deeper dive, then more advanced canvas?  lots of chicken-and-egg problems.

TODO:
* Audit content for high-level completeness
* Points to Ponder for each section
* Links to resources for each section
* Intro for each section with high level coverage
* Overall intro and conclusion
* Check and deploy

## Basic Javascript
  You've already done most of this...  Why you should care about JS.

## Comparing Javascript and Ruby: Going Functional
  Blocks are like anonymous functions, functions can be saved to variables (like Methods) and passed around, functions as "unchained" from their spot in Ruby.  Event-driven high level ideas.

## Javascript Objects and "Classes" and Prototypes
  Similar to Ruby objects, functions can be variables in objects! Classes use ConstructorFunctions, using prototypes to share class methods and inherit and DRY up code, climbing the chain of prototypes until `null`

## Javascript Scopes and Closures
  With all these functions going around, we've got to keep track of scope!  setting `this` and replacing `self` from Ruby, use `that` and `bind`. Getting variables to helper functions that don't take them with implicit scoping.  Be careful of referencing variables outside your scope!  A function should ideally return the same thing all the time... but not in JS.  _privateVars that are not really private.  Another foreshadowing of event_driven/callbacks.  WHEN you call the function (method style or function style) matters for This.
  * [SO on "How do Javascript Closures Work?"](http://stackoverflow.com/questions/111102/how-do-javascript-closures-work)

## Project: Basic Javascript
  Redo the Ruby basic projects using Javascript.  Review running JS code (jsfiddle).  A basic OOP project that makes people define classes and prototypes. Build a simple game (with `prompt` for `gets`).  Note the run environment can't really be browser for a run loop.

## Living in an Event-Driven World
  JS as asynchronous in the browser, the importance of scope, Callbacks using Closures, ability to setTimeouts and why it's actually useful vs Ruby and async, why callbacks are more important than returns, 
  * [Understanding Callback Functions in Javascript by Recurial](http://recurial.com/programming/understanding-callback-functions-in-javascript/)

## Deep Dive into Functions
  Method-style vs function-style vs apply vs call vs constructors, arguments not required or overflowing, more inheritance and surrogates, 

## Project: Not-So-Basic Javscript
  More games and OOP projects that require fun callbacks

## Random Stuff: Functional Programming
  function args via currying

## Taking Javascript to the Browser
  Loading it in, playing nice with jQuery, blocking the browser or going async

## Project: Browser-Based Gaming Intro
  Use callbacks and prompts instead of game loops

## Using Canvas to Draw and More
  Canvas in the browser, Drawing with shapes, Using other canvas functionality
  *[Canvas Deep Dive book](http://joshondesign.com/p/books/canvasdeepdive/toc.html) is the best explanation I've seen.  Do chapters 1-6.

## Project: Browser Games with Canvas
  Bring back one of the classics.  Find a tutorial ideally.

## jQuery Basics
  Overview, Selectors review, $, Document ready, selecting elements and implicit iteration of that, what's returned by DOM searches, creating elements, DOM traversal, getters and setters for attributes, chaining methods, using data attributes, 

  * [jQuery Fundamentals from jqfundamentals.com](http://jqfundamentals.com) 
  * [jQuery docs](http://api.jquery.com) will be your savior again and again.  You'll probably find them via Google most of the time, but get used to the format they present information in because you'll be seeing a lot of it.
  * [jQuery Reference Guide from Oscar Otero](http://oscarotero.com/jquery/)

## Working with Events and Effects and AJAX
  events binding, namespacing events, bubbling, default actions, browser effects like fade(), using good CSS selectors and attributes,  delegating events for the DOM to listen to instead (for new element creation), building a model in your head of the order of operations for the browser loading and doing stuff

  * [jQuery Fundamentals from jqfundamentals.com](http://jqfundamentals.com)

## Project: jQuery and the DOM

  Build a game that shuffles the DOM all over the place...  SNAKE!!!!  Remember that grid you created in Web dev 101...?

## AJAX and Forms
  AJAX, Async and JSON, convenience methods, working with forms (esp inputs), maybe-Async functions,

## Additional Helpful Stuff
  The Underscore library to make JS more Ruby-like, the jQuery methods that operate similarly, Rails' CSRF token grabbing, templating using underscore (ERB!)
  * [Underscore.js Documentation](http://underscorejs.org)

## Passing Data to the DOM
  Saving page loads using Async data AJAX-style

  *[Bootstrapping JSON data into a Rails View](http://jfire.io/blog/2012/04/30/how-to-securely-bootstrap-json-in-a-rails-view)

## Project: AJAX and Forms
  work with a form-heavy project passing data back to... a Rails backend? hmm...

## Node.js and Server-Side Javascript

## Working with a Rails Backend and API

## Project: Working with Rails
  Build a simple Rails API to pass data to your app.  Something like that photo tagging app we did way back.

## Javascript MVC Frameworks
  The basics of JS MVC's, should we even bother with Backbone or Angular?? Probably not, that's a crazy amount of additional scope.

## Final Project
  It's big, whatever it is.

## Conclusion


### Learning Resources and Tutorials
* [Codecademy's Javascript track](http://www.codecademy.com/tracks/javascript)
* [Javascript is Sexy](http://javascriptissexy.com/how-to-learn-javascript-properly/)
* [Javascript for Ruby Programmers Video](https://www.youtube.com/watch?v=wWIGEM4E9iw&list=PLxNY6twFc_xCxdSPLlxUS4C0VO3sni2DA)
* Stanford's iTunes U Javascript course ([link to find it here](http://itunes.stanford.edu/content/quickstart.html))
* Watch people code cool stuff with [The Code Player](http://thecodeplayer.com/)
* [Tutorials for Javascript and jQuery from Jumpstart Lab](http://tutorials.jumpstartlab.com/)
* [Superhero JS listing of great specific resources](http://superherojs.com/)
* [jQuery for Designers](http://jqueryfordesigners.com/)
* [AirBnB's Javascript Style Guide](https://github.com/airbnb/javascript)
* [An Introduction to DOM Events](http://coding.smashingmagazine.com/2013/11/12/an-introduction-to-dom-events/)
* [An Introduction to Full Stack Javascript](http://coding.smashingmagazine.com/2013/11/21/introduction-to-full-stack-javascript/)
* [Thinking Inside the Box with Vanilla Javascript from Smashing Magazine](http://coding.smashingmagazine.com/2013/10/06/inside-the-box-with-vanilla-javascript/)
* Test-first javascript for testing
* [Angular Learning Checklist](http://www.thinkster.io/pick/GtaQ0oMGIl/a-better-way-to-learn-angularjs)

### Books and Blogs
* [Best Javascript Books](http://cwebbdesign.tumblr.com/post/22508060129/4-best-javascript-books)
* [JavascriptIsSexy blog](http://javascriptissexy.com) has some great ongoing content.
* [Effective Javascript by David Herman](http://effectivejs.com/) is a concise but in-depth look at the concepts and patterns of Javascript.  It's got some great challenge problems as well.
* [JSNinja by John Resig](http://jsninja.com) covers advanced concepts aimed at the intermediate JS developer

### Style Guides
* [AirBnB's JS Style Guide](https://github.com/airbnb/javascript) is very readable and helpful
* [Google's JS Style Guide](http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml)
* [Github's JS Style Guide](https://github.com/styleguide/javascript)
* [Contributing to jQuery Style Guide](http://contribute.jquery.org/style-guide/js/)

### Libraries
* [Learn jQuery](http://learn.jquery.com/)
* [TheCodePlayer's Snake game with HTML5 canvas and jQuery](http://thecodeplayer.com/walkthrough/html5-game-tutorial-make-a-snake-game-using-html5-canvas-jquery)

### Frameworks
* [Learn Backbone.js from JavascriptIsSexy](http://javascriptissexy.com/learn-backbone-js-completely/)
* [Backbone.js on Ruby on Rails screencasts and example apps](http://www.backbonerails.com/)
* [Backbone.js tutorials](http://backbonetutorials.com/)
* [Building a Wine Cellar with Backbone.js](http://coenraets.org/blog/2011/12/backbone-js-wine-cellar-tutorial-part-1-getting-started/)
* [Angular.js video training resources](http://www.egghead.io)
* [The absolute beginner's guide to Node.js](http://blog.modulus.io/absolute-beginners-guide-to-nodejs)
* [Learn Node.js from the command line](https://github.com/rvagg/learnyounode)
* [Node.js Explained](http://kunkle.org/nodejs-explained-pres/)
* [Introduction to Full Stack Javascript from Smashing Magazine](http://coding.smashingmagazine.com/2013/11/21/introduction-to-full-stack-javascript/)
* [In-Depth Introduction to Ember.js from Smashing Magazine](http://coding.smashingmagazine.com/2013/11/07/an-in-depth-introduction-to-ember-js/)

### Screencasts
* [PAID training webcasts on pretty much anything](https://www.bitcast.io/)
* [Giant meta-list of screencasts by Avdi Grimm](http://devblog.avdi.org/2013/06/21/a-list-of-programming-screencast-series/)

### Projects
* Rebuild interactive features like a dropdown... start by building the tools, then use them, then abstract further.
* Build a slideshow then make it continuous

### Additional Resources
* [appendTo's Javascript track (incomplete)](http://learn.appendto.com/lesson/javascript-101)
* [Front End Programming best practices from betterfrontend](http://betterfrontend.com/)
* [D3 and other visualization tool examples](http://tributary.io)
* [Canvas Deep Dive book](http://joshondesign.com/p/books/canvasdeepdive/toc.html) chapters 7-14 get deep into how you can use Canvas as a sweet graphics and gaming tool.





